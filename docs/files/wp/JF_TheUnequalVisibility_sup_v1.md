---
author:
- Johan Fourie[^1]
reference-section-title: References
title: |
  *The Unequal Visibility of Epidemic Death:\
  Smallpox at the Cape, 1713*:\
  online appendix[^2]
---

> This is the Markdown version of JF_TheUnequalVisibility_sup_v1.pdf, for automated readers.
> Figures are not reproduced here; the complete typeset paper is in JF_TheUnequalVisibility_sup_v1.pdf.

This supplement accompanies the research note and reports source decisions, model derivations, sensitivity checks and record-continuation diagnostics. References to numbered tables and equations in the research note are identified explicitly.

# Source decisions and reproducibility

The replication register identifies every male-name row in the 1712 transcription by linked-panel `hhobs`, source number, district, folio and workbook row. The source methodology is described by Fourie et al. (2024). The source is the Stellenbosch--Drakenstein transcription of the Hague and Cape archives, June 2022 version, sheet 1712; the archival reference is NL-HaNA, VOC 1.04.02, inventory 4068, pages 220--243. Inclusion is determined by the complete name and baseline source context rather than the presence of a death link.

The excluded unresolved pairs are Anthony Meerhoff (rows 5744 and 5817) and Dirk Bakhuysen (5858 and 6029). Each has the same complete name, no recorded wife and closely corresponding entries; the supplied sources do not establish whether each pair contains one person or two. Both rows of each pair are excluded from the primary cohort. Row 5819 names the representative of Samuel Elsevier rather than a resident man. Row 6000 combines Frans and Casper Badenhorst and counts two men. These entries cannot supply a single person's death outcome against independently measured resources.

The death ledger preserves every accepted, rejected and unresolved source-person link considered during the review. Probate references contain filename, document identifier and date, because an identifier is not always unique within a volume. Widow references contain the original roll-row identifier. Explicit incidental death references are distinguished from the deceased's own estate documents. All 90 probate documents and 33 widow entries have screening dispositions, including those that yield no accepted baseline link. A negative screening disposition means no death confirmation was established for this cohort, not that the document contains no death or the man survived.

Reading a document's subject as its deceased person can change the result. Jasper Raats lists property he possessed after his wife's death and signs the account: the document does not establish his own death. Conversely, Henning Viljon's death appears in a document headed with his widow's name. These cases show why documentary roles enter the classification alongside names.

The review uses the complete document and family sequence. For example, Sophia is recorded with Pieter Robbertsz as Sophia Schalk in 1708--09, Sophia Willemsz van der Merwe in 1710--11, and Sophia Willemse Schalk in 1712; the 1713 widow entry names Sophia van der Merwe. These intermediate observations establish the alias directly. Daniel Zaayman's estate names a son Daniel, but the children's names in the estate and the surviving estate accounts and the younger son's subsequent orphan record distinguish the baseline husband of Pieternella Meerhoff from that son. The ledger records the corroborating references. Source ambiguities that cannot be resolved remain outside confirmed counts.

The replication pipeline rebuilds the MOOC8 cache from all supplied XML volumes, then generates the event series, source-adjudicated static results, panel diagnostics, tables and repeated manuscript numbers. It checks original row identifiers, accepted source references, unique widow assignments, union counts and invariance to reordering rows. The panel comparison is checked against a separately constructed saturated Poisson model and clustered covariance matrix. The manuscript's empirical values and table rows are imported from generated files. The v6 audit additionally reconstructs the static results from the original workbook and XML in Python and checks panel contrasts and their covariance independently.

The name parser preserves complete given names and suffixes such as *de jonge*, *de oude* and *Janszoon*, distinguishing them from inverted "surname, given name" entries. The two Ary van Wyk men have different named wives and remain separate; Hans Jurgen and Hans Harmen Potgieter likewise remain distinct. Family sequence also prevents false deaths: Jan Jansz Swart's widow appears before 1712 alongside a surviving son of the same name. Her later entry cannot establish a new death for that son.

Ferdinandus Appel has an inconsistent wife's name in the 1713 widow entry, but separate evidence confirms his death by 1714. This affects the shorter documentary search rather than the main total. Men without an accepted death link are not classified as survivors.

# The recording model

For a correctly linked record within the stated interval, the event "confirmed death" is a subset of "death". Thus $$D_w=\Pr(\text{confirmed}\mid w)
=\Pr(\text{confirmed}\mid\text{died},w)\Pr(\text{died}\mid w)=C_wM_w.$$ For $D_L,D_H>0$, capture restricted only to $(0,1]$ implies independently $M_L\in[D_L,1]$ and $M_H\in[D_H,1]$. The mortality ratio ranges from $D_L$, attained when $M_L=D_L$ and $M_H=1$, to $1/D_H$, attained at $M_L=1$ and $M_H=D_H$. Every intermediate ratio is feasible.

Writing $r=D_L/D_H$ and $\kappa=C_L/C_H$ gives $\theta=r/\kappa$. When $r<1$, as here, imposing $\kappa\leq1$ gives the sharp set $[r,1/D_H]$. The lower endpoint is feasible at equal capture; the upper endpoint satisfies the ordering because $\kappa=D_L\leq1$. More generally, a stipulated capture interval $[\underline\kappa,\overline\kappa]$ gives $[r/\overline\kappa,r/\underline\kappa]$ intersected with the unrestricted set. These are population statements conditional on correct identities and genuine baseline presence. A tax entry carried forward after death would violate that baseline condition; document dates alone cannot rule it out. Substituting observed rates gives plug-in endpoints, not a confidence region for the entire identified set.

The table intervals use the Wilson formula for a binomial reference model. For the observed risk ratio, the reported log-scale standard error is $$\widehat{\operatorname{se}}(\log\hat r)=
\sqrt{\frac1{x_L}-\frac1{n_L}+\frac1{x_H}-\frac1{n_H}},$$ where $x_w$ is the number of confirmed deaths and $n_w$ the cohort count. The interval exponentiates $\log\hat r\pm1.96\widehat{\operatorname{se}}$. It conditions on accepted historical identities and treats group events as independent binomial observations. It does not measure uncertainty about lost records or provide a formal confidence region under arbitrary household dependence.

An erroneous death flag changes the identity. If $F_w=\Pr(\text{flagged and did not die}\mid w)$, then $D_w=M_wC_w+F_w$. If instead $f_w=\Pr(\text{flagged}\mid\text{did not die},w)$, the corresponding expression is $D_w=M_wC_w+(1-M_w)f_w$. The two false-positive quantities should not be confused. Source review addresses observed identity and role errors; the reported ambiguity check varies unresolved candidate assignments separately from capture.

# Resource and source sensitivities

The alternative resource index is adult slaves plus one-half of recorded cattle and horses plus one-tenth of sheep. It is a scale index, not an estimate of market wealth. Empirical one-third and two-thirds cut points define three groups, leaving equal values together. Their sizes are 151, 84 and 113; the corresponding union rates are 1.3, 13.1 and 17.7 per cent, giving a low-to-high ratio of 0.07.

Table S1 varies the documentary search and inclusion rule. The first row includes accepted evidence dated in 1713, not every death that actually occurred that year. The final row excludes incidental references in other estates while retaining a man's own estate evidence and accepted widow entries. Removing such references changes coverage; it does not overturn their documentary content.

<div id="tab:timing">

| Source rule | 0 recorded | 1--4 | 5+ |
|:---|:--:|:--:|:--:|
| Records dated 1713 | 9/243 (3.7) | 6/60 (10.0) | 9/45 (20.0) |
| Records dated 1713--14 | 16/243 (6.6) | 7/60 (11.7) | 10/45 (22.2) |
| 1713--14 excluding incidental mentions | 12/243 (4.9) | 7/60 (11.7) | 10/45 (22.2) |

: Union of accepted death records under alternative source rules

</div>

Notes: Count/denominator, with percentage in parentheses. All rows use the same individually reviewed 1712 cohort. The shorter search measures earlier recovery of evidence, not precisely dated smallpox mortality.

The unresolved widow entry for Pieter Lombart the elder can add one potential death. Its attribution is suggested by the adjoining living Anthony Lombart entry and later widow Maria Couteau, but the 1714 widow's own name is absent. The accepted and possible assignments are therefore both reported in the replication output. The repeated-name denominator check separately adds either one or two people for each unresolved baseline pair. None of those four entries has an accepted or proposed death link. Joint and representative entries remain excluded because their resources and exposure cannot be assigned to a single resident man.

The 1714 entry "wed Roemond" (row 6350) names neither the widow nor her husband's given name. Its recorded resources match the 1713 return of the older Michiel Romont and his wife (row 6050), making baseline Michiel Romond (5688) a candidate. Resource continuity cannot itself establish identity. Another baseline Michiel Romond, qualified "de jonge" (5691), has no wife named; that blank does not prove he was unmarried. Table S2 therefore leaves the entry unassigned or assigns it to either man, never both. Gerrit Romond (5689) is a living declarant in MOOC8/2.111 and appears in later rolls; the inventory records his wife's death. These conservative identity scenarios retain the primary cohort and all confirmed links.

<div id="tab:identity">

| Roemond assignment        | 0 recorded | 1--4 |    5+ | Ratio | Threshold |
|:--------------------------|-----------:|-----:|------:|------:|----------:|
| Unassigned                |     16/243 | 7/60 | 10/45 | 0.296 |      3.37 |
| Unassigned + Lombart      |     16/243 | 8/60 | 10/45 | 0.296 |      3.37 |
| Older Michiel             |     16/243 | 7/60 | 11/45 | 0.269 |      3.71 |
| Older Michiel + Lombart   |     16/243 | 8/60 | 11/45 | 0.269 |      3.71 |
| Younger Michiel           |     17/243 | 7/60 | 10/45 | 0.315 |      3.18 |
| Younger Michiel + Lombart |     17/243 | 8/60 | 10/45 | 0.315 |      3.18 |

: Unresolved widow assignments

</div>

Notes: Cells give combined death counts/cohort denominators. Ratio is the low-to-high recorded-death ratio. Threshold is the higher-to-lower recovery advantage required for equal mortality. "+ Lombart" also assigns the unresolved widow to Pieter Lombart the elder. Assigning the Roemond entry to the two Michiels simultaneously is inadmissible. These are identity scenarios, not confidence limits or estimates of missing deaths.

Across these assignments the recorded-death ratio ranges from 0.269 to 0.315, and the equal-mortality threshold from 3.18 to 3.71. The primary estimate is unchanged. The source register records the uncertainty instead of interpreting an unassigned widow as proof that no baseline candidate exists.

Figure S1 displays the death-channel and genealogical rates from Table 2 in the research note. Their intervals concern recorded outcomes, conditional on the cohort and accepted links.

*\[Figure not reproduced here --- see JF_TheUnequalVisibility_sup_v1.pdf\]*

Linked record rates by adult slaveholding in 1712. Bars show 95 per cent Wilson intervals under the conditional binomial reference model. Genealogical presence measures representation rather than mortality.

Figure S2 applies equation (2) in the research note to each death channel and their combined record. Each curve concerns its own assumed recovery ratio; the sources need not share a common ratio.

*\[Figure not reproduced here --- see JF_TheUnequalVisibility_sup_v1.pdf\]*

Mortality comparisons under source-specific recovery assumptions. Each curve divides its observed low-to-high recorded-death ratio by the assumed relative probability of recovering a death through that source or combination of sources. The curves do not estimate those probabilities.

# Continuation rules and common-weight inference

The panel asks whether an apparent change in the social gradient of disappearance is stable across continuation rules. For windows beginning in 1709, 1710, 1713, 1718 and 1721, I take the latest available preceding roll and search the first two calendar years of the window. Each search contains two observed rolls. The 1721 baseline is 1719 because the 1720 roll is absent. These are cohorts of named source entries, preserving unresolved repeated names as records; the 1713 cohort therefore has 352 entries rather than the 348 individually reviewed men in the static comparison.

The guarded-name rule finds a continuation when a later eligible male name or widow-of name meets the specified name thresholds. A permissive rule additionally accepts a similar first name with adult slaveholding within two of the baseline count. A third rule requires exactly one distinct candidate name. These rules deliberately vary the evidence sufficient for continuation. They do not certify survival, widowhood or household dissolution. The permissive fallback changes 99 classifications in the 1713 cohort; 85 of these have more than one distinct candidate name. The thresholds and cell counts follow below.

For each rule, I calculate the log difference in flag rates between entries with no adult slaves recorded and entries with at least one, comparing 1713 with an equally weighted average of the four other windows. This grouping differs from the low-versus-high comparison in the static analysis. The weights are identical across rules. Standard errors allow the same full-name key to recur across windows and account for the paired classifications of each entry.

<div id="tab:panel">

| Rule or rule contrast          | Estimate | Standard error |   $p$ |
|:-------------------------------|---------:|---------------:|------:|
| Guarded names                  |   -0.156 |          0.189 | 0.409 |
| Names plus permissive fallback |   -0.410 |          0.376 | 0.275 |
| Unique target name             |    0.050 |          0.126 | 0.695 |
| Permissive minus guarded       |   -0.254 |          0.321 | 0.430 |
| Unique minus guarded           |    0.206 |          0.149 | 0.168 |

: Common-weight comparisons of record-continuation rules

</div>

Notes: The outcome is failure to meet the rule's continuation criterion. Each estimate contrasts the low-to-owner log rate gap in 1713 with the mean gap in 1709, 1710, 1718 and 1721. Owner means at least one adult slave recorded. Standard errors cluster on full-name keys and account for paired outcomes. Neither the outcomes nor the coefficients identify mortality.

The guarded-name estimate is -0.156 and the permissive estimate is -0.410. Their difference is -0.254 (standard error 0.321, $p=0.430$). Requiring one candidate produces an estimate of 0.050; its difference from the guarded-name rule is also imprecise. Extending the search or pooling three baseline years changes the contrasts, with no precise difference in the reported specifications. The panel therefore supplies no independent resolution of the mortality gradient. Its useful result is to show how the classification of missing continuations depends on the information admitted by the rule.

The panel preserves full given names and explicit name qualifiers. Eligible male-name entries exclude recorded widows, explicit joint entries, representatives and documented female-name exceptions in the nominal male field. A guarded continuation requires a Jaro--Winkler distance at most 0.10 on the final surname token and 0.12 on the complete normalised given-name--surname string, with the Winkler parameter 0.1. Two conflicting explicit qualifiers cannot match; an absent qualifier is unspecified. The same rule searches widow-of names. These are candidate matches, and a candidate can serve more than one baseline name.

The permissive fallback admits a later eligible male entry when the first-name token has at least four letters, its Jaro--Winkler distance is at most 0.10, its slave count differs by at most two, and explicit qualifiers do not conflict. It requires no surname match. The unique-target variant accepts guarded continuation only when one distinct target name key is found across the search, grouping repeated observations of the same key. This is a candidate-uniqueness check, not a one-to-one historical identity assignment. Table S4 reports the outcomes directly.

<div id="tab:cells">

<table>
<caption>Entries failing each continuation criterion</caption>
<tbody>
<tr>
<td style="text-align: left;"></td>
<td colspan="2" style="text-align: center;">Guarded names</td>
<td colspan="2" style="text-align: center;">Permissive</td>
<td colspan="2" style="text-align: center;">Unique target</td>
</tr>
<tr>
<td style="text-align: left;">Window</td>
<td style="text-align: right;">Low</td>
<td style="text-align: right;">Owner</td>
<td style="text-align: right;">Low</td>
<td style="text-align: right;">Owner</td>
<td style="text-align: right;">Low</td>
<td style="text-align: right;">Owner</td>
</tr>
<tr>
<td style="text-align: left;">1709</td>
<td style="text-align: right;">71/214</td>
<td style="text-align: right;">12/90</td>
<td style="text-align: right;">17/214</td>
<td style="text-align: right;">3/90</td>
<td style="text-align: right;">110/214</td>
<td style="text-align: right;">45/90</td>
</tr>
<tr>
<td style="text-align: left;">1710</td>
<td style="text-align: right;">149/268</td>
<td style="text-align: right;">30/94</td>
<td style="text-align: right;">67/268</td>
<td style="text-align: right;">11/94</td>
<td style="text-align: right;">173/268</td>
<td style="text-align: right;">47/94</td>
</tr>
<tr>
<td style="text-align: left;">1713</td>
<td style="text-align: right;">109/247</td>
<td style="text-align: right;">31/105</td>
<td style="text-align: right;">29/247</td>
<td style="text-align: right;">12/105</td>
<td style="text-align: right;">149/247</td>
<td style="text-align: right;">52/105</td>
</tr>
<tr>
<td style="text-align: left;">1718</td>
<td style="text-align: right;">67/220</td>
<td style="text-align: right;">24/131</td>
<td style="text-align: right;">22/220</td>
<td style="text-align: right;">13/131</td>
<td style="text-align: right;">124/220</td>
<td style="text-align: right;">61/131</td>
</tr>
<tr>
<td style="text-align: left;">1721</td>
<td style="text-align: right;">81/243</td>
<td style="text-align: right;">34/132</td>
<td style="text-align: right;">35/243</td>
<td style="text-align: right;">17/132</td>
<td style="text-align: right;">120/243</td>
<td style="text-align: right;">58/132</td>
</tr>
</tbody>
</table>

</div>

Notes: Flags/entries. Low means no adult slaves recorded; owner means at least one. Latest available baseline rolls are 1708, 1709, 1712, 1717 and 1719. Each search covers the window year and the next year, with two observed rolls. Same-year repeated names remain source entries and share a full-name-key cluster.

For rule $g$, let $D^g_{w,t}$ denote its population flag rate. The reported contrast uses $$\operatorname{DD}[\log D^g]=(\log D^g_{L,1713}-\log D^g_{O,1713})
-\frac14\sum_{t\in\{1709,1710,1718,1721\}}(\log D^g_{L,t}-\log D^g_{O,t}),$$ where $O$ denotes owners. The rule comparison subtracts these same-weight contrasts. For mortality $M_{w,t}>0$, define the effective proxy factor $B^g_{w,t}=D^g_{w,t}/M_{w,t}$. Then $\operatorname{DD}[\log D^g]=\operatorname{DD}[\log M]+\operatorname{DD}[\log B^g]$. Only under $\operatorname{DD}[\log B^g]=0$ does a rule identify the change in the mortality gap. If this holds for two rules sharing the same mortality target, their population contrasts agree. A difference rejects the joint restriction; agreement cannot establish either rule's validity because the proxy distortions may coincide. Separate pooled regressions need not apply the same weights to heterogeneous window gaps, which is why the empirical comparison uses fixed weights.

For a paired comparison of rules $a$ and $b$, the influence contribution of entry $i$ in cell $(w,t)$ is $$\psi_i=\frac{q_{w,t}}{n_{w,t}}
\left[\frac{Y_i^a-\hat D^a_{w,t}}{\hat D^a_{w,t}}
-\frac{Y_i^b-\hat D^b_{w,t}}{\hat D^b_{w,t}}\right],$$ where $q_{w,t}$ is its signed common weight. Contributions are summed within full-name-key clusters; the variance is $G/(G-1)$ times the sum of squared cluster contributions, with $G$ clusters. The reported uncertainty conditions on these record clusters; it does not make the five historical windows independent experimental replications.

<div id="tab:panelsensitivity">

| Baseline and search                  | Estimate | Standard error |   $p$ |
|:-------------------------------------|---------:|---------------:|------:|
| Latest roll, two-year search         |   -0.254 |          0.321 | 0.430 |
| Three-year baseline, two-year search |    0.059 |          0.202 | 0.772 |
| Latest roll, longer search           |    0.166 |          0.483 | 0.731 |
| Three-year baseline, longer search   |    0.291 |          0.253 | 0.249 |

: Sensitivity of the permissive-minus-guarded contrast

</div>

Notes: The three-year baseline retains the latest observation of each full name within the preceding three calendar years, preserving same-year ties. Longer searches cover the window year and four following years, censored at 1712 for pre-epidemic windows. Those searches therefore differ in calendar length and roll availability. The primary two-year search holds the number of observed search rolls constant.

# References

<div id="refs" class="references csl-bib-body hanging-indent">

<div id="ref-fourie2024" class="csl-entry">

Fourie, Johan, Erik Green, Christiaan Burger, et al. 2024. "'Waar Is Beter Dorp in Zuid Africa Dan Stellenbos?': What the Stellenbosch--Drakenstein Tax Censuses Reveal." *South African Historical Journal* 76 (4): 420--46. <https://doi.org/10.1080/02582473.2025.2500410>.

</div>

</div>

[^1]: Department of Economics, Stellenbosch University. Email: <johanf@sun.ac.za>.

[^2]: This is the online appendix for Fourie, Johan. 2026. "The Unequal Visibility of Epidemic Death: Smallpox at the Cape, 1713." Working Paper, Department of Economics, Stellenbosch University. This paper was created with the help of Anthropic's Claude Code (Opus 4.8 and 5.5) and OpenAI's Codex (GPT-5.5, GPT-5.6 and GPT-6). Cite the paper, not this supplement.
