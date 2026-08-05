#!/usr/bin/env python3
"""Fetch the Our Long Walk Substack feed and write a static JSON snapshot.

Writes the newest non-podcast posts to data/substack.json (source of truth,
survives a quarto render) and docs/data/substack.json (live site, updates
without a render). On any failure, exits non-zero without touching either
file so the last good snapshot stays live.

Run from the repo root: python code/fetch_substack.py
Stdlib only - no dependencies.
"""

import json
import re
import sys
import urllib.request
import xml.etree.ElementTree as ET
from datetime import datetime, timezone
from email.utils import parsedate_to_datetime
from html import unescape
from pathlib import Path

FEED_URL = "https://www.ourlongwalk.com/feed"
NUM_POSTS = 6
DESC_MAX = 180
USER_AGENT = (
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 "
    "(KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36"
)

REPO_ROOT = Path(__file__).resolve().parent.parent
OUT_FILES = [
    REPO_ROOT / "data" / "substack.json",
    REPO_ROOT / "docs" / "data" / "substack.json",
]


def strip_html(text):
    text = re.sub(r"<[^>]+>", " ", text)
    text = unescape(text)
    return re.sub(r"\s+", " ", text).strip()


def truncate(text, limit):
    if len(text) <= limit:
        return text
    return text[: limit - 1].rsplit(" ", 1)[0].rstrip(",;:") + "…"


def parse_posts(xml_bytes):
    root = ET.fromstring(xml_bytes)
    posts = []
    for item in root.iter("item"):
        enclosure = item.find("enclosure")
        enc_type = enclosure.get("type", "") if enclosure is not None else ""
        if enc_type.startswith("audio"):
            continue  # podcast episode

        title = strip_html(item.findtext("title", ""))
        link = (item.findtext("link") or "").strip()
        if not title or not link:
            continue

        pub = (item.findtext("pubDate") or "").strip()
        try:
            date = parsedate_to_datetime(pub).date().isoformat()
        except (TypeError, ValueError):
            date = None

        posts.append(
            {
                "title": title,
                "link": link,
                "description": truncate(
                    strip_html(item.findtext("description", "")), DESC_MAX
                ),
                "date": date,
                "image": enclosure.get("url") if enclosure is not None else None,
            }
        )
        if len(posts) >= NUM_POSTS:
            break
    return posts


def main():
    req = urllib.request.Request(FEED_URL, headers={"User-Agent": USER_AGENT})
    with urllib.request.urlopen(req, timeout=30) as resp:
        xml_bytes = resp.read()

    posts = parse_posts(xml_bytes)
    if not posts:
        print("No posts parsed from feed; leaving existing JSON untouched.")
        return 1

    # Skip the write when nothing changed, so the timestamp stays put and
    # the CI workflow does not commit an identical feed every run.
    try:
        existing = json.loads(OUT_FILES[0].read_text(encoding="utf-8"))
        if existing.get("posts") == posts:
            print("Feed unchanged; leaving existing JSON untouched.")
            return 0
    except (OSError, ValueError):
        pass

    payload = {
        "updated": datetime.now(timezone.utc).isoformat(timespec="seconds"),
        "posts": posts,
    }
    text = json.dumps(payload, indent=2, ensure_ascii=False) + "\n"
    for path in OUT_FILES:
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(text, encoding="utf-8")
        print(f"Wrote {len(posts)} posts to {path.relative_to(REPO_ROOT)}")
    return 0


if __name__ == "__main__":
    try:
        sys.exit(main())
    except Exception as exc:  # keep the last good snapshot on any failure
        print(f"Feed refresh failed: {exc}", file=sys.stderr)
        sys.exit(1)
