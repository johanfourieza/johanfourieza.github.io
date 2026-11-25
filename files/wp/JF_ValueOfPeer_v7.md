---
abstract: |
  Journals cannot referee every paper they receive. When submissions exceed referee capacity, experts assess a fixed random share without error, and the journal rejects the remaining papers or tests them with a faster, less accurate artificial-intelligence screen. Expert approval and a screen pass earn the same public stamp, so readers cannot distinguish the two routes and price each paper at its expected quality. I ask which rule makes the stamp more valuable. Rejecting unread papers certifies only high-quality work, giving higher average stamped quality whenever the screen passes some low-quality papers. But rejection can lower the stamp’s premium: unread good papers enter the unstamped pool and raise the unstamped price. Which rule gives the larger premium depends on how common good work is, with an exact switching point when one exists. Under blind review, the overflow rule can also change the price gap between unstamped papers from different pedigree groups. Once authors can use the screen, whenever some papers with failing marks are repaired and others are not, the common stamp’s premium under scalable evaluation equals the display fee plus the repair cost divided by the chance of reaching the screen. Expert judgment allows no such gaming.
author:
- Johan Fourie[^1]
bibliography: references.bib
reference-section-title: References
title: The Value of Peer Review and the Reward to Reputation[^2]
---

> Figures and typeset tables are omitted from this Markdown version.
> The complete paper, with all figures, is in JF_ValueOfPeer_v7.pdf.


**Keywords:** certification; peer review; pedigree; expert judgment; artificial intelligence

**JEL codes:** D82; D83; I23; L15; O33

# Introduction

Journals faced a shortage of referee time before generative artificial intelligence (AI) tools appeared. Between 1990 and 2012, annual submissions to the top five economics journals nearly doubled as those journals published fewer articles, lowering acceptance rates from about 15% to about 6% (Card and DellaVigna 2013). Referees are paid little or nothing, so price adjustments do not bring submissions within review capacity (Engers and Gans 1998), and a small share of biomedical researchers do most of the reviewing (Kovanis et al. 2016). Generative AI has increased submissions even as referee time has remained scarce: after ChatGPT appeared, submissions to *Organization Science* rose sharply and measured writing quality fell in both submissions and reviews (Gartenberg et al. 2026). Similar crowding occurs outside journals: when more working papers are released in the same week, each paper receives fewer downloads and less attention on average, and is less likely to be published and receives fewer citations later (Lusher et al. 2023). Recent work on AI divides tasks into codifiable work, which follows explicit rules a machine can execute at scale, and messy work, which still requires human judgment (Garicano et al. 2026). AI has continued to expand the set of codifiable research tasks – writing a plausible manuscript is now largely rule-based (Fourie 2026b), and journals have begun applying rule-based AI checks to evaluation itself – whereas expert judgment has remained scarce and has not become cheaper (Agrawal et al. 2026). The two changes share one feature: whatever part of writing can be reduced to rules, anyone can produce, and whatever part of evaluation can be reduced to rules, anyone can pass. Existing certification theory studies certifiers that choose what to disclose about work they have already examined, taking the screening tool as fixed. A crowded journal faces two earlier problems: what to do with submissions its referees never reach, and what a rule-based screen is worth once authors also have access to the tool. Fourie (2026a) applies the codifiable–messy division to certification and argues that the journal’s stamp retains value only if the journal rejects every paper it cannot read.

I examine these choices in a small theoretical model and answer three questions: which rule for unreviewed papers produces the more valuable journal stamp, how that rule changes the market price of an author’s visible pedigree, and what a rule-based screen’s stamp is worth once authors can run the screen themselves. In the model, a fixed batch of completed papers contains both high-quality papers (which would pass careful expert review) and low-quality papers. Expert referees reach only a fixed random share of submissions, say one in four, and judge quality without error. For the remaining unreviewed papers, the journal chooses between two rules. Under *strict verification*, it rejects every unreviewed paper. Under *scalable evaluation*, it tests unreviewed papers with a rule-based screen that passes a high-quality paper with probability $\alpha$ (the true-positive rate, say three in four) and a low-quality paper with probability $\beta$ (the false-positive rate, say one in five). The two review technologies correspond to the two kinds of work: intensive review is the messy input, the judgment that does not scale, and the scalable screen is the part of evaluation that has been reduced to rules. Both routes award the same public stamp, so readers observe whether a paper has the stamp but not how it earned it. A competitive market pays each paper its expected quality given what readers observe – its posterior belief – and the value of the stamp is its certification premium: the price of a stamped paper minus the price of an unstamped paper, which also equals the highest display fee an author is willing to pay. To study reputation, I divide authors into two visible pedigree groups that differ in their prior probability of producing high-quality work. Review stays blind to the author’s group, but readers observe both the stamp and the author’s pedigree.

Rejecting unread papers need not give the larger stamp premium. One might naturally guess that it does, because strict verification withholds approval from every paper the journal has not examined. Strict verification certifies only high-quality papers, so its stamped papers have higher average quality than those under scalable evaluation whenever the screen passes some low-quality papers ($\beta>0$). But that natural guess can be wrong. A stamp’s value is a difference between two prices: readers compare a stamped paper with the pool of unstamped papers. Holding the stamped price fixed, a higher unstamped price lowers the premium; across review rules, both prices can change. Good papers rejected only because no referee reached them enter the unstamped pool and raise its average quality, which narrows the price gain from holding the stamp. Suppose the screen passes some low-quality papers ($\beta>0$) and passes high-quality papers at a higher rate than low-quality ones ($\alpha>\beta$). As the share of high-quality papers in the batch rises, the premiums of the two rules cross at most once, at a threshold given in closed form. When that crossing lies strictly between zero and one, strict verification yields the larger premium when high-quality papers are scarce, and scalable evaluation yields the larger premium when high-quality papers are common. If the screen passes too few good papers compared with the bad ones it passes, strict verification yields the larger premium at every share. With expert reviewers reaching one paper in four and the screen passing three good papers in four and one bad paper in five, the crossing occurs at a high-quality share of 0.410. The rule with higher average stamped quality can therefore have the smaller stamp premium.

A second threshold determines how the overflow rule changes the market reward to an author’s pedigree among unstamped papers under blind review when the screen separates quality without passing every high-quality paper ($0\leq\beta<\alpha<1$). Because scalable evaluation screens every unreviewed paper whereas strict verification leaves unreviewed papers unread, lacking a stamp is stronger evidence of low quality under scalable evaluation. A missing stamp therefore lowers an author’s expected price by more under scalable evaluation than under strict verification, for both pedigree groups. Whether this widens or narrows the price gap between the two groups depends on their starting quality shares. When both groups have low shares of good work, that stronger evidence of low quality lowers both unstamped prices towards zero and narrows the gap between them. When both groups have high shares of good work, unstamped prices are more sensitive to differences in prior quality under scalable evaluation, which widens the gap. One summary of the two groups – their logit midpoint, defined in Section 5 – separates these two cases across a threshold: strict verification yields the wider unstamped price gap when the groups’ logit midpoint lies below that threshold, and scalable evaluation yields the wider gap when it lies above. Because the premium comparison uses each group’s prior and the pedigree comparison uses the pair’s logit midpoint, different rules can rank first in the two comparisons. When the two groups lie on opposite sides of an interior premium crossing, authors in the weaker group value the stamp more under strict verification, whereas authors in the stronger group value it more under scalable evaluation. These are statements about posterior prices, not claims that either rule changes how much pedigree tells a reader about quality.

A third result makes the screen’s pass rates endogenous by giving authors the same rule-based tool before submission. An author whose paper fails the screen can pay a fixed cost to repair the rule-checkable flaws and obtain a passing mark. Repair changes only what the screen reads, not the paper’s underlying quality as assessed by an expert, so strict verification is unaffected. Under scalable evaluation, in every equilibrium in which positive masses of failing-mark papers are repaired and left unrepaired, the stamp’s premium equals the display fee plus the repair cost divided by the probability $1-p$ of reaching the screen. What determines the stamp’s value is then the display fee and that scaled repair cost, rather than the screen’s detection accuracy. At full repair, every paper sent to the screen passes, and the comparison reduces to the unfiltered-overflow benchmark: strict verification yields the larger premium if and only if fewer than half of all papers are high quality. The model gives a sufficient cost condition under which full repair is the unique equilibrium.

This paper contributes to three literatures: the economics of science, certification theory, and the economics of AI and the division of labour. First, it links journal certification to how attention and status are distributed in science. Hanson et al. (2024) show that indexed article numbers have grown faster than the number of available referees, and the authors warn that this shortage can make journal publication less informative. I take that shortage as given and show how the overflow rule changes both the value of the stamp and the price of reputation. Research on peer review has long documented that assessments depend in part on who wrote a paper (Lee et al. 2013): author prominence affects peer evaluations in a controlled experiment (Huber et al. 2022), editors place more weight on reports from heavily published referees (Card and DellaVigna 2020), and reputation alters how credit is split between teams reaching near-identical findings (Hill and Stein 2025b). Across 110,303 submissions to *Science* and *Science Advances*, institutional prestige was more strongly associated with success at the editorial stage than in external peer review, although these records cannot separate a response to prestige from differences in quality (Zhang et al. 2026). Top-journal publications strongly predict tenure in economics, and the standing of an author’s training department predicts where the author is hired (Heckman and Moktan 2020; Clauset et al. 2015). These associations make the value of a stamp and access to certification questions about careers as well as prices. Publication patterns also differ with authors’ financial resources: authors at less-resourced institutions and in poorer countries publish more often in lower-fee journals, whereas better-resourced institutions publish in higher-charge venues (Oldford et al. 2023; Klebel and Ross-Hellauer 2023). The price differences I analyse require no fees and persist under blind review. The *American Economic Review* found in a double-blind experiment that hiding author names lowered acceptance rates for some groups (Blank 1991). But the overflow rule affects unstamped prices even under blind review, because it still changes what a missing stamp implies. Recent experiments show that AI evaluations of economics papers react directly to affiliation, prominence, and gender (Pataranutaporn et al. 2025). My blind-review model isolates an indirect price effect that persists even when the evaluator cannot see who wrote the paper.

Second, the paper extends certification theory to capacity-rationed certifiers and endogenous screening tools. The closest predecessor is Farhi et al. (2013), where a selective certifier reads every submission it rejects: rejection follows an adverse assessment, lowers the market’s assessment of the rejected applicant, and lowers the average quality of the rejected pool. Capacity rationing changes this mechanism. Assignment to the unread overflow is independent of quality, so an unread good paper can enter the unstamped pool without receiving an adverse assessment. Readers observe only that the paper lacks a stamp, so they price unread papers together with papers that failed review; unread good papers can therefore raise the average quality of the unstamped pool and lower the stamp’s premium. Much of the certification literature analyses certifiers that choose disclosure rules, fees, transparency, or grading scales (Lizzeri 1999; Stahl and Strausz 2017; Zapechelnyuk 2020; Pollrich and Strausz 2024), and work on grading shows that any grade is read against the other grades in the same scheme (Dranove and Jin 2010; Daley and Green 2014; Harbaugh and Rasmusen 2018). Celik and Strausz (2026) study a certifier that both screens what sellers already know and acquires new evidence about quality; the profit-maximising menu screens sellers fully but limits how much new evidence the certifier acquires. In my model, expert capacity fixes how much the journal examines, and the question is what happens to the papers it does not examine. Other studies treat standards as evolving referee norms (Ellison 2002) or as a journal’s optimal response to its own aims that can make lax review worthwhile (Zollman et al. 2024). Separate work studies how editors select referees and combine their reports (Bayar and Chemmanur 2021). A further literature examines how gaming affects what a score reveals and how the designer should respond (Frankel and Kartik 2019; Ball 2025). I hold both evaluation tools fixed under one public stamp without modelling the journal’s objective, compare the two overflow rules under the same shortage of expert time, and then let authors have access to the screening tool itself. Once authors have access to the tool, their repair choices determine the screen’s effective pass rates, and the gaming cost then pins the scalable premium in partial-repair equilibria (Section 6).

Third, the paper extends the economics of AI and the division of labour to certifying institutions. In that literature, machines can perform the codifiable tasks, whereas people perform the tasks requiring judgment (Garicano et al. 2026). Empirical evidence already documents this split in writing: employers on a large freelancing platform stopped paying a wage premium for well-written applications after large language models arrived, because fluent prose no longer separated strong applicants from weak ones (Galdin and Silbert 2025), and scientific output has grown fastest among scholars writing outside their first language, a group that previously faced higher costs in preparing manuscripts (Kusumegi et al. 2025). Applying the same division to evaluation produces an additional effect: any check a journal can execute by rule at scale is a check an author can pass by rule before submitting. The gaming cost then pins the scalable premium in partial-repair equilibria (Section 6), whereas repair cannot change the outcome of expert review. The distinction between codifiable and messy work therefore determines both who performs a task and what determines a certificate’s market value once everyone has access to the tools.

These findings also inform a broader debate about AI and the production of knowledge. Algorithms are expected to reorganise scientific work rather than merely accelerate it (Mullainathan and Rambachan 2025), and formal models show that substituting machine output for human effort can reduce what researchers collectively know even when individual decisions improve (Acemoglu et al. 2026). Related studies find that competition lowers measured quality when evaluation is rough (Hill and Stein 2025a), that generative AI makes applicants harder for employers and investors to evaluate (Cowgill et al. 2026), and that editorial discretion changes what gets published less than is often assumed (Krieger et al. 2025). These studies devote less attention to certification itself, the conversion of private assessments into public certificates. Recent models of AI and publishing study submission volume, review costs, capacity, and fees (Atasu 2026; Lopez-Lira and Seyfi 2026), as well as the design of review when authors and referees both use AI (Hakobyan 2026). Bhargava et al. (2026) propose that an AI system give every submission a first review, which authors can contest before human review begins, and identify conditions under which this shortens review times and improves decision accuracy. Gans (2026b) examines AI assistance inside expert review – asking which referees should see an AI report – and shows that a common AI report can improve each referee’s assessment yet leave the editor less informed because the referees’ errors become correlated. I examine the premium of one common stamp under limited expert review and how that premium changes when authors gain access to the screen.

The rest of the paper is structured as follows. Section 2 sets out the model of crowded peer review. Section 3 derives the certification premium and shows that it equals an author’s maximum willingness to pay for the stamp. Section 4 compares strict verification with scalable evaluation and proves the single-crossing result. Section 5 examines how the choice of rule changes unstamped prices across author pedigree groups. Section 6 lets authors access the screening tool in equilibrium and identifies which model parameters AI can change. Section 7 concludes. Appendix A contains the proofs, and Appendix B extends the model to two noisy screens, targeted expert review, continuous paper quality, and costly submission.

# Model of crowded peer review

## Papers and review rules

Consider a fixed batch of completed papers, normalised to a unit mass so that a share of papers equals a probability. Each paper $i$ has a hidden quality $q_i\in\{0,1\}$ that matters for certification: $q_i=1$ means the paper would pass a careful expert review (high quality), and $q_i=0$ means it would not (low quality). Write
$$
\pi=\mathop{\mathrm{Pr}}(q_i=1)\in(0,1)
$$
for the prior share of high-quality papers in the batch.

The model holds fixed everything a reader can already observe about a manuscript, such as its topic or how polished its prose is. Hidden quality $q$ therefore represents only the soundness or importance that evaluation can reveal and that the market cannot see on its own. Among manuscripts that look identical beforehand, the journal cannot rank them before evaluating them. Sections 2–4 analyse one such pool of look-alike papers; Section 5 compares two pools distinguished by the author’s visible pedigree.

The journal announces one of two review rules. Under either rule, each paper receives intensive review with a fixed probability $p\in(0,1)$, and intensive review judges quality without error: it certifies every high-quality paper it reaches and rejects every low-quality one. I treat the review coverage $p$ as exogenous. A journal could in principle pay for more refereeing, but referees receive little or no pay and supply much of their time for non-monetary reasons, so intensive-review capacity responds little to what journals spend on refereeing (Engers and Gans 1998). Posted submission fees are far below any market-clearing level: among the 600 highest-ranked economics journals, only 118 charge a submission fee, the median charge among those 118 is 125 dollars, and posted fees amount to about 1% of a central estimate of what an acceptance is worth to an author – far below the fee that would bring submissions within review capacity and fund referee pay (Fourie and Macdonald 2026). Whereas that companion study prices submission to the journal, this paper prices the certificate the journal awards. When $p=1$, referees examine every paper and the two rules coincide, so the relevant case is rationed review ($p<1$).

The two rules differ in how they handle the overflow – the fraction $1-p$ of papers that intensive review does not reach. Under *strict verification*, the journal rejects every unreviewed paper. Under *scalable evaluation*, the journal passes each unreviewed paper through an imperfect rule-based screen with acceptance probabilities
$$
\alpha=\mathop{\mathrm{Pr}}(C\mid q=1,\text{ scalable}),\qquad
 \beta=\mathop{\mathrm{Pr}}(C\mid q=0,\text{ scalable}),
 \qquad 1\geq\alpha\geq\beta\geq0.
$$
Here $C$ denotes certification, $\alpha$ is the true-positive rate (the probability that a high-quality paper passes the screen), and $\beta$ is the false-positive rate (the probability that a low-quality paper passes it). The running numerical example sets $p=0.25$, $\alpha=0.75$, and $\beta=0.20$: expert reviewers reach one paper in four, and the screen passes three high-quality papers in four and one low-quality paper in five. Both figures use these illustrative values.

## Market prices and the stamp premium

The journal issues one common public stamp, so readers see whether a paper is certified ($C$) or uncertified ($N$), not which route produced the verdict. This pooling is necessary for the findings that follow: if the journal disclosed whether a paper was intensively reviewed or screened, readers would price the two routes separately and the single-stamp comparison would disappear.

Submissions and rejections remain private, so the market observes only the presence or absence of the stamp, not whether an unstamped paper was submitted and rejected. A competitive market pays each paper its posterior expected quality – the probability that the paper is high quality updated by Bayes’ rule from whether it holds the stamp. An author who qualifies for the stamp may display it by paying a fixed display fee $f\geq0$, taken as given. Varying this display fee identifies the supremum fee an eligible author strictly prefers to pay; it is not a proposal that journals should charge for acceptance. Submitting a completed paper is free in the baseline model. The timing is straightforward: the journal announces its review rule and display fee $f$; authors decide whether to submit; the journal evaluates submissions; qualified authors decide whether to pay $f$ and display the stamp; and the market pays each paper its expected quality.

For either rule, let
$$
x_H=\mathop{\mathrm{Pr}}(C\mid q=1),\qquad x_L=\mathop{\mathrm{Pr}}(C\mid q=0),
$$
denote the overall probabilities that a high-quality paper and a low-quality paper end up certified, and let the total certified share of the batch be
$$
m=\pi x_H+(1-\pi)x_L.
$$
Write the two competitive market prices as
$$
P_C=\mathop{\mathrm{\mathbb E}}[q\mid C],\qquad P_N=\mathop{\mathrm{\mathbb E}}[q\mid N],
$$
where $N$ denotes the pool of papers without a stamp. The certification premium is $\Pi=P_C-P_N$, the price gain from holding the stamp. The uncertified pool $N$ is terminal: because the model has a single certification stage, a paper rejected for lack of reviewer capacity remains in the publicly unstamped pool $N$ and earns no other stamp that readers observe. Good papers turned away unread therefore stay in $N$ and raise its average quality $P_N$, which explains why the unstamped price rises under strict verification.

# The certification premium and author demand

## The premium formula

Readers observe only whether a paper carries the journal’s stamp or not. Updating the prior probability $\pi$ through Bayes’ rule – revising beliefs using the probability of observing or not observing the stamp – reduces the certification premium to a single formula.

**Lemma 1** (Certification premium). *For any $0<m<1$,
$$
\begin{equation}
 \Pi(x_H,x_L)=
 \frac{\pi(1-\pi)(x_H-x_L)}{m(1-m)}.
 \label{eq:premium}
\end{equation}
$$*

The numerator of equation [\[eq:premium\]](#eq:premium) contains two factors: the prior variance of paper quality, $\pi(1-\pi)$ – which measures how uncertain quality is before review – and the difference between the two certification probabilities, $x_H-x_L$. Because $\pi$ also enters the denominator through $m$, greater prior uncertainty does not by itself raise the premium. At a fixed prior $\pi$, the premium rises if the rule certifies more high-quality papers with its low-quality certification rate held fixed, or certifies fewer low-quality papers with its high-quality rate held fixed. The denominator $m(1-m)$ records how the rule divides the batch between the stamped pool (share $m$) and the unstamped pool (share $1-m$). This division produces the paper’s main result: a rule that certifies more papers leaves fewer in the unstamped comparison pool, and that change in the unstamped pool – rather than the average quality of stamped papers alone – can raise or lower the premium.

## Authors’ willingness to pay

The premium $\Pi$ is both a difference in posterior prices and the supremum of the display fees an eligible author strictly prefers to pay. Authors have private information about their own manuscripts: author $i$ privately believes her paper is high quality with probability $\theta_i\in(0,1)$, where private beliefs average out to the market prior, $\mathop{\mathrm{\mathbb E}}[\theta_i]=\pi$. Her subjective probability of qualifying for the stamp is
$$
s(\theta_i)=x_L+(x_H-x_L)\theta_i.
$$
Checking participation requires a two-step equilibrium argument: first compute $\Pi$ assuming every author submits, and then verify that every author wants to submit given that $\Pi$. In equilibrium, authors’ submission choices are optimal given market prices, and market prices equal the actual average quality produced by those choices.

**Lemma 2** (Private demand). *Fix a regime and calculate $\Pi$ in the all-submission outcome. For every $f\in[0,\Pi)$, all authors strictly submit and every eligible author strictly displays the stamp. The supremum price consistent with strict participation and display is $\Pi$.*

An author who qualifies for the stamp gains $P_C-f-P_N=\Pi-f$ by paying $f$ and displaying it, and she qualifies with probability $s(\theta_i)$. Submitting therefore yields a strictly positive expected gain of $s(\theta_i)(\Pi-f)>0$ whenever $f<\Pi$. Varying the display fee $f$ identifies the supremum fee an eligible author strictly prefers to pay without modelling the journal’s objective. Whichever review rule produces the larger premium is the rule whose stamp authors value more.

# Strict versus scalable review

## The single-crossing threshold

I now compute and compare the certification premiums of strict verification and scalable evaluation. Throughout, a superscript $R$ denotes strict verification (rejecting the overflow) and a superscript $S$ denotes scalable evaluation (screening it). Under strict verification, a high-quality paper is certified only when intensive review reaches it, and no low-quality paper is ever certified, so $x_H^R=p$ and $x_L^R=0$. Substituting these rates into equation [\[eq:premium\]](#eq:premium) yields
$$
\begin{equation}
 \Pi_R=\frac{1-\pi}{1-\pi p}.
 \label{eq:strict}
\end{equation}
$$
For scalable evaluation, define
$$
c=(1-p)\beta,\qquad
 d=p+(1-p)(\alpha-\beta),
$$
where $c$ is a low-quality paper’s overall probability of certification and $d$ is the additional certification probability for a high-quality paper. Then $x_L^S=c$, $x_H^S=c+d$, and equation [\[eq:premium\]](#eq:premium) gives
$$
\begin{equation}
 \Pi_S=
 \frac{\pi(1-\pi)d}
 {(c+\pi d)(1-c-\pi d)}.
 \label{eq:scale}
\end{equation}
$$

Proposition [1](#prop:strictness) states when each rule yields the larger premium. With positive stamped and unstamped masses – interior pools – both posterior prices are well defined and the sign of the quadratic $K$ ranks the premiums.

**Proposition 1** (The value of strictness). *For interior certified and uncertified pools,
$$
\begin{equation}
 \operatorname{sign}(\Pi_R-\Pi_S)
 =\operatorname{sign}K(\pi;p,\alpha,\beta),
 \label{eq:sign}
\end{equation}
$$
where
$$
\begin{equation}
 K(\pi;p,\alpha,\beta)
 =c(1-c)-2cd\pi-d(d-p)\pi^2.
 \label{eq:K}
\end{equation}
$$
If $\beta>0$ and $\alpha>\beta$, $K$ is strictly decreasing in $\pi$, so the premiums cross at most once. If the positive root is interior, it is
$$
\begin{equation}
 \pi^*=\frac{c(1-c)}
 {\sqrt{c^2d^2+d(d-p)c(1-c)}+cd}.
 \label{eq:root}
\end{equation}
$$
Strict verification has the larger premium below $\pi^*$; scalable evaluation has the larger premium above it. If $\beta=0<\alpha$, scalable evaluation has the larger premium for every $\pi\in(0,1)$.*

With interior pools, which rule yields the larger premium depends solely on the sign of the quadratic $K(\pi;p,\alpha,\beta)$. When $\beta>0$ and $\alpha>\beta$, $K$ is strictly decreasing in $\pi$, so the ranking changes at most once. If its positive root $\pi^*$ lies strictly between zero and one, strict verification gives the larger premium when high-quality papers are scarce (low $\pi$), scalable evaluation gives the larger premium when high-quality papers are common (high $\pi$), and the ranking switches exactly once at $\pi^*$. When $\beta=0<\alpha$, scalable evaluation gives the larger premium at every $\pi\in(0,1)$; at $\alpha=\beta=0$, the rules coincide and $K$ is constant at zero. The running numerical example ($p=0.25$, $\alpha=0.75$, and $\beta=0.20$) illustrates the switch. Here the crossing occurs at $\pi^*=0.410$. When one paper in five is high quality ($\pi=0.20$), the strict premium is 0.842 and the scalable premium is 0.523. At the crossing, both premiums equal 0.657. When three papers in five are high quality ($\pi=0.60$), the strict premium is 0.471 and the scalable premium is 0.642.

Even when $\beta>0$ and $\alpha>\beta$, the crossing $\pi^*$ need not lie inside $(0,1)$. Because $K(0)>0$ and $K$ is strictly decreasing in $\pi$, the positive root lies below one if and only if $K(1)<0$, which simplifies to
$$
\begin{equation}
 \alpha[p+(1-p)\alpha]>(1-p)\beta.
 \label{eq:attainability}
\end{equation}
$$
If inequality [\[eq:attainability\]](#eq:attainability) fails, the screen is too noisy for any crossing to occur, and strict verification yields the larger premium at every share of high-quality work.

The zero-false-positive case ($\beta=0<\alpha$) has a direct interpretation using the Blackwell ordering from statistical decision theory (Blackwell’s comparison of experiments). One information system Blackwell-dominates another if it gives a weakly higher attainable expected payoff in every decision problem. When $\beta=0<\alpha$, scalable evaluation certifies no low-quality papers – just as strict verification does – and certifies strictly more high-quality papers, so it Blackwell-dominates strict verification and yields a larger premium at every $\pi\in(0,1)$. When $\beta>0$ and $\alpha>\beta$, strict verification excludes low-quality papers more effectively, whereas scalable evaluation certifies more high-quality papers, so neither rule Blackwell-dominates the other. An interior switch still requires inequality [\[eq:attainability\]](#eq:attainability); when that condition holds, the ranking reverses as the share of high-quality work $\pi$ increases.

Comparing the two pools explains this reversal. Strict verification never certifies a low-quality paper, so its stamped price is always $P_C^R=1$. But every high-quality paper that misses intensive review enters the unstamped pool. When high-quality papers are common, these unread rejections raise the unstamped price $P_N^R$ enough to shrink the premium $\Pi_R$. Scalable evaluation passes some low-quality papers, lowering its stamped price $P_C^S$, but it certifies enough high-quality overflow papers that its unstamped price $P_N^S$ can drop by more than $P_C^S$ does. The scalable stamp then has lower average quality among stamped papers yet a larger price premium.

## Screen accuracy and stamped quality

The position of the single crossing depends directly on how well the rule-based screen separates high-quality papers from low-quality ones. Improving the screen’s accuracy shifts $\pi^*$ in predictable directions.

**Corollary 1** (Performance of scalable evaluation). *Suppose $\pi^*$ is interior. Holding $p$ and $\beta$ fixed, $\partial\pi^*/\partial\alpha<0$. Holding $p$ and $\alpha$ fixed, $\partial\pi^*/\partial\beta>0$.*

A higher true-positive rate $\alpha$ widens the range of quality shares where scalable evaluation yields the larger premium, whereas a higher false-positive rate $\beta$ narrows it. This comparative static follows from a general property of the premium formula: for a fixed prior $\pi$,
$$
\begin{align}
 \frac{\partial\Pi}{\partial x_H}
 &=\pi(1-\pi)\left\{\frac{x_L}{m^2}
 +\frac{1-x_L}{(1-m)^2}\right\}>0, \label{eq:dxh}\\
 \frac{\partial\Pi}{\partial x_L}
 &=-\pi(1-\pi)\left\{\frac{x_H}{m^2}
 +\frac{1-x_H}{(1-m)^2}\right\}<0. \label{eq:dxl}
\end{align}
$$
Any rule’s premium increases when it certifies high-quality papers more often and decreases when it certifies low-quality papers more often. Because $x_H^S=p+(1-p)\alpha$, $x_L^S=(1-p)\beta$, and $\Pi_R-\Pi_S$ crosses zero from above at $\pi^*$, raising $\alpha$ lowers $\pi^*$ and raising $\beta$ raises $\pi^*$.

*[Figure not reproduced here — see JF_ValueOfPeer_v7.pdf]*
Higher average stamped quality need not produce a larger premium. Panel (a) shows the certification premium under strict verification and scalable evaluation against the share of high-quality papers. Panel (b) shows the average quality of stamped papers. The illustrative, uncalibrated parameters are $p=0.25$, $\alpha=0.75$, and $\beta=0.20$, which give $\pi^*=0.410$.

Figure [1](#fig:wedge) shows the divergence between the average quality of stamped papers and the certification premium. In panel (b), strict verification yields higher average quality among stamped papers at every share ($P_C^R=1>P_C^S$). In panel (a), however, scalable evaluation yields the larger premium for every share above $\pi^*=0.410$. Average stamped quality alone therefore does not determine how much a common stamp is worth to the author who holds it.

## The unfiltered-overflow benchmark

Consider the limiting case in which the journal stamps every unreviewed paper without screening it at all, so $\alpha=\beta=1$. Equation [\[eq:K\]](#eq:K) then simplifies to
$$
\begin{equation}
 \operatorname{sign}(\Pi_R-\Pi_S)=\operatorname{sign}(1-2\pi).
 \label{eq:half}
\end{equation}
$$
Strict verification then yields the larger premium if and only if fewer than half of all papers are high quality ($\pi<1/2$). Even when a journal stamps its entire overflow unread – the least selective rule possible – rejecting unreviewed papers yields a higher premium only when high-quality papers are in the minority. For a sorting screen ($\alpha>\beta$) with $\beta>0$ that satisfies inequality [\[eq:attainability\]](#eq:attainability), the crossing $\pi^*$ is interior and Corollary [1](#cor:performance) gives the change in $\pi^*$: raising $\alpha$ lowers $\pi^*$ and raising $\beta$ raises it, so the crossing can lie on either side of one half depending on the screen’s pass rates. (When $\beta=0<\alpha$, no crossing occurs and scalable evaluation gives the larger premium throughout.)

## Scope of the premium comparison

Proposition [1](#prop:strictness) has two qualifications. The premium $\Pi$ is a difference in posterior prices: the private price gain from holding the stamp. It is not social welfare, total informativeness, average stamped quality, or the journal’s operating cost, and the model does not assume that a journal aims to maximise $\Pi$. Nor does $\Pi$ measure total fee revenue. As the display fee $f$ approaches the premium $\Pi$ from below, every certified author strictly displays the stamp and potential fee revenue approaches $m\Pi$ (attaining $m\Pi$ at $f=\Pi$ requires indifferent authors to display). Let $m_R$ and $m_S$ denote the certified shares under the two rules. Because scalable evaluation certifies at least as large a share of both types ($m_S\geq m_R$) and separates types at least as sharply ($d\geq p$), equation [\[eq:premium\]](#eq:premium) implies that $m\Pi=\pi(1-\pi)(x_H-x_L)/(1-m)$ is weakly larger under scalable evaluation on both counts: a larger $m$ shrinks the denominator $1-m$, and a larger $x_H-x_L$ raises the numerator. This potential revenue limit is therefore at least as high under scalable evaluation as under strict verification at every share $\pi$. The crossing $\pi^*$ compares the value of one stamp, not total fee revenue.

Proposition [1](#prop:strictness) also holds the batch of completed papers fixed. When submitting a paper incurs a positive cost and a positive net premium is held fixed, strict verification gives a weakly higher submission cutoff because authors with lower private quality assessments face a weakly smaller probability of certification. Near the zero-cost crossing $\pi^*$, this change in who submits can reverse which rule yields the larger premium, as Appendix [9](#app:extensions) shows.

# Author pedigree and unstamped prices

## Pedigree gaps among unstamped papers

When review is blind, how does the overflow rule change the market prices of authors with different visible reputations? To answer this incidence question – how the overflow rule changes the market prices paid for papers from each group – let the market observe an author’s pedigree alongside the journal’s stamp. Suppose authors belong to two visible pedigree groups $b\in\{B,0\}$, where a share $\pi_0$ of group $0$ and a strictly larger share $\pi_B$ of group $B$ produce high-quality work ($0<\pi_0<\pi_B<1$). Pedigree may represent an author’s university, membership in a research network, or an established publication record. Posting in a prominent working-paper series is a concrete example, and crowding in such a series measurably reduces the attention each paper receives (Lusher et al. 2023). Here the difference between groups is a statistical difference in prior quality, not a taste for or against either group. Review itself is completely blind: neither the intensive-review probability $p$ nor the screen’s pass rates $(\alpha,\beta)$ depend on $b$. Some journals have adopted and tested double-blind review (Blank 1991), and this section shows that blind review does not remove the effect of the overflow rule on unstamped prices. Because readers observe the author’s group, every price formula derived earlier applies separately within each group, with $\pi$ replaced by the group’s own prior share $\pi_g$.

How a review rule updates readers’ beliefs about an unstamped paper depends on a single likelihood ratio $\ell$: the probability that a high-quality paper goes unstamped divided by the probability that a low-quality paper goes unstamped,
$$
\begin{equation}
 \ell=\frac{\mathop{\mathrm{Pr}}(N\mid q=1)}{\mathop{\mathrm{Pr}}(N\mid q=0)}
 =\frac{1-x_H}{1-x_L}.
 \label{eq:ell}
\end{equation}
$$
For a group with prior share $\pi$, Bayes’ rule gives the competitive market price of an unstamped paper as
$$
\begin{equation}
 U(\pi;\ell)=\mathop{\mathrm{\mathbb E}}[q\mid N;\pi]
 =\frac{\ell\pi}{1-\pi+\ell\pi}.
 \label{eq:unstamped}
\end{equation}
$$
The two review rules generate the likelihood ratios
$$
\begin{equation}
 \ell_R=1-p,
 \qquad
 \ell_S=\frac{(1-p)(1-\alpha)}{1-(1-p)\beta}.
 \label{eq:ells}
\end{equation}
$$
Whenever $0\leq\beta<\alpha<1$, the likelihood ratios satisfy $0<\ell_S<\ell_R<1$. A smaller likelihood ratio means that lacking a stamp is stronger evidence of low quality, so going unstamped lowers the posterior price by more under scalable evaluation than under strict verification. Scalable evaluation screens every overflow paper, whereas strict verification rejects overflow papers unread.

Define the pedigree price gap among unstamped papers under rule $r\in\{R,S\}$ as the difference between the two groups’ unstamped prices,
$$
W_r=U(\pi_B;\ell_r)-U(\pi_0;\ell_r).
$$
Because the two groups’ prior shares need not be close together, comparing $W_R$ and $W_S$ uses one summary of the pair: their logit midpoint $\widetilde\pi$. The logit transformation converts a probability $\pi\in(0,1)$ into its log-odds, $\ln[\pi/(1-\pi)]$; the logit midpoint is the probability whose log-odds lie exactly halfway between the two groups’ log-odds (so its odds equal the geometric mean of the two groups’ odds),
$$
\widetilde\pi=
 \operatorname{logit}^{-1}\left\{
 \frac{\operatorname{logit}\pi_0+\operatorname{logit}\pi_B}{2}
 \right\}.
$$

**Proposition 2** (Pedigree and uncertified work). *Under blind review with $0<\pi_0<\pi_B<1$ and $0\leq\beta<\alpha<1$,
$$
\begin{equation}
 \operatorname{sign}(W_R-W_S)
 =\operatorname{sign}(\widehat\pi-\widetilde\pi),
 \label{eq:pedigreesign}
\end{equation}
$$
where
$$
\begin{equation}
 \widehat\pi=
 \frac{1}{1+\sqrt{\ell_R\ell_S}}
 =\frac{1}{1+(1-p)
 \sqrt{(1-\alpha)/[1-(1-p)\beta]}}\in(1/2,1).
 \label{eq:pedigreethreshold}
\end{equation}
$$
Strict verification produces the larger pedigree-related price gap among uncertified papers exactly when $\widetilde\pi<\widehat\pi$. Moreover,
$$
\begin{equation}
 \frac{\partial\widehat\pi}{\partial\alpha}>0,
 \qquad
 \frac{\partial\widehat\pi}{\partial\beta}<0,
 \qquad
 \frac{\partial\widehat\pi}{\partial p}>0.
 \label{eq:pedigreecomparative}
\end{equation}
$$*

At the boundary $\alpha=1$ excluded by Proposition [2](#prop:pedigree), strict verification produces the wider price gap everywhere. When $\alpha=1$, scalable evaluation passes every high-quality overflow paper, so any unstamped paper is certainly low quality, both groups’ unstamped prices equal zero, and strict verification produces the larger price gap for every pair of groups. This matches the limit of equation [\[eq:pedigreethreshold\]](#eq:pedigreethreshold), because $\widehat\pi\to1$ as $\alpha\to1$.

Because $\widehat\pi$ exceeds one half for every allowed parameter combination, strict verification always yields the wider unstamped price gap when both groups’ prior shares are low. Specifically, if $\pi_0+\pi_B<1$, then the product of the two groups’ odds is less than one, their logit midpoint $\widetilde\pi$ lies below one half, and therefore $\widetilde\pi<\widehat\pi$. This condition depends on the sum of the two group shares rather than on whether high-quality papers are a minority of the entire population (which would also depend on how many authors belong to each group). Whenever $\pi_0+\pi_B<1$, rejecting unreviewed papers keeps the strict stamped pool entirely high quality (giving higher average stamped quality than scalable evaluation whenever $\beta>0$) and, at the same time, widens the pedigree price gap among unstamped papers. Scalable evaluation produces the wider unstamped price gap only when the pair’s logit midpoint $\widetilde\pi$ exceeds $\widehat\pi$.

## Odds invariance and price gaps

Proposition [2](#prop:pedigree) compares posterior prices in levels, not how informative pedigree is in odds terms. Because blind review multiplies both groups’ prior odds by the exact same likelihood ratio $\ell_r$, the ratio of the two groups’ posterior odds among unstamped papers is identical under both rules:
$$
\begin{equation}
 \frac{\operatorname{odds}(q=1\mid N,B)}
 {\operatorname{odds}(q=1\mid N,0)}
 =\frac{\pi_B/(1-\pi_B)}{\pi_0/(1-\pi_0)}
 \label{eq:oddsinvariance}
\end{equation}
$$
under either rule. The difference in log-odds between the two groups does not change across rules. Nor does the rule change either group’s average price: by the law of iterated expectations, averaging a group’s stamped and unstamped prices weighted by their probabilities returns its prior $\pi_g$. What the review rule changes is the spread between stamped and unstamped prices, and with it the unstamped price gap $W_r$.

Prices in levels respond differently from odds because converting odds to probabilities is nonlinear. A smaller likelihood ratio $\ell$ makes lacking a stamp stronger evidence of low quality. For two weak groups, the smaller likelihood ratio lowers both unstamped prices close to zero and narrows the gap between them. At sufficiently high priors, the unstamped price is more sensitive to the prior under scalable evaluation, so a small difference in prior quality produces a larger difference in unstamped price. Mathematically, the slope of the unstamped price with respect to $\pi$ is $\ell/[1-(1-\ell)\pi]^2$: a smaller $\ell$ flattens this curve at low $\pi$ and steepens it at high $\pi$. The threshold $\widehat\pi$ is the exact share at which the two slopes are equal.

*[Figure not reproduced here — see JF_ValueOfPeer_v7.pdf]*
How the choice of rule changes unstamped prices across pedigree groups. Panel (a) shows the price of an unstamped paper against a group’s share of high-quality work under strict verification and scalable evaluation, using the parameters of Figure [1](#fig:wedge). The marked pairs are groups at $(0.20,0.30)$ and $(0.80,0.90)$; the segment joining each pair shows the gap between their unstamped prices. Panel (b) shades, for every pair of group shares with $\pi_B>\pi_0$, the rule that produces the larger gap. The solid curve marks the boundary $\widetilde\pi=\widehat\pi$, the dashed lines mark the premium crossing $\pi^*$ from Proposition [1](#prop:strictness), and the gold point marks the pair $(0.50,0.60)$. The parameter values are illustrative, not calibrated.

Figure [2](#fig:incidence) shows both parts of Proposition [2](#prop:pedigree). In panel (a), the scalable-evaluation price curve lies below the strict-verification curve everywhere, flatter at low shares and steeper at high shares, with the two slopes crossing at $\widehat\pi=0.711$. For groups at prior shares 0.20 and 0.30, the unstamped price gap is 0.085 under strict verification and 0.034 under scalable evaluation. For groups at 0.80 and 0.90, the gap is 0.121 under strict verification and 0.196 under scalable evaluation. Panel (b) covers every possible pair of group shares: strict verification produces the wider gap over most of the region, reflecting $\widehat\pi>1/2$.

Pedigree prices also differ among stamped papers. Under strict verification, intensive review makes no errors, so $\mathop{\mathrm{\mathbb E}}[q\mid C,b]=1$ for both groups and the pedigree price gap among stamped papers is zero. Under scalable evaluation, the pedigree price gap among stamped papers is strictly positive if and only if $\beta>0$. The zero gap under strict verification depends on perfect intensive review and can differ from zero if intensive review itself makes errors.

## Group disagreement across rules

The premium crossing $\pi^*$ from Proposition [1](#prop:strictness) also determines whether authors in different pedigree groups rank the two rules’ premiums in the same order.

**Corollary 2** (Regime disagreement). *Suppose the crossing $\pi^*$ in Proposition [1](#prop:strictness) is interior. If $\pi_0<\pi^*<\pi_B$, then
$$
\begin{equation}
 \Pi_R(\pi_0)>\Pi_S(\pi_0),
 \qquad
 \Pi_S(\pi_B)>\Pi_R(\pi_B).
 \label{eq:groupdisagreement}
\end{equation}
$$*

When one group’s prior is below $\pi^*$ and the other’s is above it, an author in the weaker group will pay more to display the stamp under strict verification, whereas an author in the stronger group will pay more under scalable evaluation. This ranks willingness to pay for a stamp already earned (Lemma [2](#lem:demand)), not which rule an author prefers overall. When $f<\Pi$, an author’s expected gain from submitting equals $s(\theta_i)(\Pi-f)$, her net gain from displaying the stamp multiplied by her probability of earning it, and strict verification lowers that probability by rejecting overflow papers. A weaker author can therefore value the stamp more under strict verification yet obtain a higher expected payoff under scalable evaluation. At the running parameters with a zero display fee ($f=0$), an author in a group with $\pi_0=0.20$ who privately rates her own paper at 0.20 expects a gain of 0.042 from submitting under strict verification compared with 0.148 under scalable evaluation, even though the strict premium of 0.842 exceeds the scalable premium of 0.523. Under a single display fee $f$ for both groups, all authors continue to submit as long as $f$ lies below the smaller of the two groups’ premiums.

The two thresholds $\pi^*$ and $\widehat\pi$ answer separate questions and need not agree. The premium crossing $\pi^*$ compares one group’s share against the threshold to rank stamp premiums; the pedigree threshold $\widehat\pi$ compares a pair’s logit midpoint against the threshold to rank unstamped price gaps. The rankings coincide at the extremes. If both groups lie below $\pi^*$ and their midpoint lies below $\widehat\pi$, strict verification yields both the larger stamp premium and the wider unstamped price gap: under these conditions, the weaker-group author values an earned stamp more under strict verification, and among unstamped papers her price lies further below the stronger group’s price. If both groups lie above $\pi^*$ and their midpoint lies above $\widehat\pi$, scalable evaluation yields both the larger premium and the wider unstamped price gap.

Between those extremes, one rule can give the larger premium whereas the other gives the wider unstamped gap. The gold point in Figure [2](#fig:incidence), representing groups at 0.50 and 0.60, has a logit midpoint of 0.55 – below $\widehat\pi=0.711$, so strict verification produces the wider unstamped price gap – yet both shares exceed $\pi^*=0.410$, so scalable evaluation yields the larger stamp premium for both groups. Which threshold is larger depends on the parameters, and the two rankings can differ. Every comparison here concerns posterior prices, not welfare.

# Authors gaming a codified screen

## Repair costs and equilibrium premiums

The scalable screen is no longer hypothetical. In August 2026, Refine – an AI referee built by economists to run scalable technical checks (Golub 2026) – announced partnerships with two leading publishers in economics. Where a journal places such a tool determines which part of the model it affects. Used after acceptance as a final technical audit, it checks only papers that expert judgment has already approved and changes none of the price comparisons studied so far. Used on the overflow, it acts exactly as the scalable screen in this model. What is a rule-based screen’s verdict worth once the authors it screens can run the tool themselves?

Gans (2026a) studies a related problem: authors can insert hidden prompts that bias an AI referee. When detection is moderately likely, only authors of low-quality papers manipulate, detection itself becomes informative, and referees combine manual and AI review. In the model below, repair is not observed, and every author whose paper fails the screen can choose it.

To model author access, let the screen evaluate a rule-checkable mark on each manuscript. Before repair, a high-quality paper has a passing mark with probability $\alpha$, and a low-quality paper has a passing mark with probability $\beta$; the screen certifies an unreviewed paper if and only if its mark passes. Suppose authors can run the same screening tool before submitting: an author learns her paper’s initial mark only from the tool’s report and, if the mark fails, may pay a fixed repair cost $\kappa>0$ to fix the rule-checkable flaws and turn the mark into a pass. Repairing changes only the mark, not the paper’s underlying quality $q$ as assessed by an expert, which no rule evaluates. Readers observe neither the mark nor whether repair occurred, only the public stamp, and they set competitive prices consistent with authors’ equilibrium repair choices. Two assumptions keep the screen well defined: it does not already pass every paper, and conditional on quality $q$, the initial mark is independent of any other private information the author holds.

Under strict verification, repairing is worthless. An unreviewed paper is rejected regardless of its mark, and a reviewed paper is judged solely on hidden quality $q$, which repair does not alter. Under scalable evaluation, however, a repaired paper passes the screen whenever it reaches the overflow. For every author with a failing mark, the expected benefit of choosing repair, gross of its cost $\kappa$, is $(1-p)\max\{\Pi-f,0\}$: the net value of displaying the stamp multiplied by the probability $1-p$ that the paper reaches the screen, which is the only case where repair changes the certification outcome. Because that expected benefit is identical for high-quality and low-quality papers, a common repair cost gives every failing-mark author the same incentive to repair; at indifference, however, repair choices can still correlate with quality through authors’ private information.

**Proposition 3** (Erosion of the codified screen). *Under scalable evaluation with repair cost $\kappa>0$:*

1.  *The strict-verification premium is unaffected at every $\kappa$.*

2.  *In every equilibrium in which a positive mass of failing-mark papers is repaired and a positive mass is not, the scalable premium equals
    $$
    \Pi_S=f+\frac{\kappa}{1-p}.
    ```*

3.  *Let $\Pi^{\min}$ be the premium when repair reaches every failing-mark low-quality paper and no high-quality one, given in closed form in the appendix. If $\kappa<(1-p)\bigl(\Pi^{\min}-f\bigr)$, the unique equilibrium is full repair: the screen passes everything it reads, scalable evaluation certifies the overflow unfiltered, and $\operatorname{sign}(\Pi_R-\Pi_S)=\operatorname{sign}(1-2\pi)$.*

Part (ii) pins the scalable premium in every partial-repair equilibrium to the display fee $f$ plus the repair cost $\kappa$ divided by $1-p$. A failing-mark author pays $\kappa$ for certain, whereas repair changes the certification outcome only in the fraction $1-p$ of submissions that reach the screen, so the repair cost enters divided by $1-p$. The proof is a no-arbitrage condition: if $\Pi_S$ exceeded $f+\kappa/(1-p)$, every failing-mark author would repair; if $\Pi_S$ fell below $f+\kappa/(1-p)$, no failing-mark author would repair. Any equilibrium in which positive masses of failing-mark papers are repaired and left unrepaired must therefore satisfy $\Pi_S=f+\kappa/(1-p)$ exactly. The premium identity does not determine which authors repair. When authors hold private beliefs about their own quality, repair can concentrate among low-quality papers until the screen’s effective pass rates for high- and low-quality papers become equal and it ceases to distinguish the two qualities, even though the premium stays fixed at $f+\kappa/(1-p)$.

No repair is an equilibrium when repairing does not pay at the intact-screen premium, and full repair is an equilibrium when repairing pays at the full-repair premium. These two conditions can overlap – both no repair and full repair can be equilibria at the same cost $\kappa$ – and every partial-repair equilibrium satisfies the pinning equation of part (ii). That identity relies on every failing-mark author facing the same repair cost $\kappa$, which gives every failing-mark author the same incentive to repair. At indifference, repair choices can still be associated with quality through authors’ private information. If repair costs differed by quality, that cost difference could also affect which authors repair and the exact identity need not hold; whether effective separation rises or falls would then depend on which papers cost less to repair.

## When gaming lowers or raises the premium

Part (iii) gives the unfiltered limit. At full repair, every paper sent to the screen passes, and comparing the two rules reduces to equation [\[eq:half\]](#eq:half): strict verification yields the larger premium if and only if fewer than half of all papers are high quality. Full repair is an equilibrium whenever repairing pays for itself at the full-repair premium net of the display fee – that is, whenever $\kappa$ is at most $1-p$ times the net full-repair premium (subtracting $f$ before multiplying by $1-p$). Part (iii) gives a stronger, sufficient condition for full repair to be the unique equilibrium: $\kappa<(1-p)(\Pi^{\min}-f)$, where $\Pi^{\min}$ is the worst-case premium over all repair patterns. For this sufficient bound to admit any positive repair cost $\kappa$, $\Pi^{\min}$ must exceed $f$. At $f=0$, that requires intensive-review coverage $p$ to exceed $(1-p)(1-\alpha)$, the share of high-quality papers that reach the overflow and fail the intact screen (at the running parameters, one quarter exceeds three sixteenths). If $\Pi^{\min}\leq f$, the sufficient bound is unavailable; full repair can still be an equilibrium, and whether it is unique depends on which repair patterns authors’ private information lets them implement.

Full repair can raise or lower the scalable premium compared with the intact screen. When high-quality work is common, the intact screen rejects some high-quality overflow papers and raises the average quality of the unstamped pool. Making the screen pass every overflow paper eliminates those false rejections. Comparing the intact screen against unfiltered overflow is therefore another single-crossing problem. When the overflow passes unfiltered, the scalable premium is $\pi/[1-p(1-\pi)]$. Whenever the quadratic derived in Appendix A changes sign inside $(0,1)$, this unfiltered premium exceeds the intact screen’s premium above a third threshold $\pi^u$. At the running parameters, $\pi^u=0.580$. Below the interior threshold $\pi^u$, moving from the intact screen to full repair lowers the scalable premium: at $\pi=0.20$ it falls from 0.523 to 0.250. Above $\pi^u$, the same shift to full repair raises the scalable premium: at $\pi=0.60$ it rises from 0.642 to 0.667. At these parameters the paper’s three thresholds stand in the order $\pi^*=0.410$, $\pi^u=0.580$, and $\widehat\pi=0.711$, though their ordering varies with the parameters.

Suppose the screening tool is instead sold per manuscript as a bundle, so an author buys the report and the repair together before seeing her paper’s mark. When $\Pi_S>f$ and $\alpha>\beta$, willingness to buy decreases with the author’s private quality assessment $\theta_i$, because less confident authors are more likely to fail the screen. Authors with $\theta_i$ below an interior cutoff buy, those above it decline, and those at the cutoff are indifferent. Purchases by the buying group raise the low-quality pass rate at least as much as the high-quality pass rate, and whenever a positive mass of authors buys, those purchases reduce the difference between the two pass rates. This matches experimental evidence that generative AI makes applicants harder for employers and investors to evaluate (Cowgill et al. 2026). None of this denies that fixing rule-checkable flaws improves manuscripts on codifiable dimensions, but the model is silent on that direct benefit. What full repair eliminates is information: a passing mark anyone can purchase separates no one, whereas the underlying messy quality remains unchanged.

Fourie (2026a) obtains the one-half threshold differently, through an increase in submissions when a journal stamps its overflow unread. Full repair gives the same one-half threshold for a fixed batch of papers by eliminating the screen’s sorting instead. After Refine announced its publisher partnerships, Garicano noted that authors will run the tool before submitting, so in equilibrium papers ‘will have passed by it beforehand and the AI referee will find nothing new’ (Garicano 2026). In this model, Garicano’s description applies at full repair. In any partial-repair equilibrium, indifference among failing-mark authors instead pins the scalable premium to $f+\kappa/(1-p)$.

## Artificial intelligence and model parameters

Identifying which model parameters AI can change shows how each effect enters the comparison without forcing an unconditional prediction. Let $a$ denote AI capability, $n(a)$ the volume of completed papers, and $A(a)$ intensive-review capacity. Under random rationing,
$$ math
p(a)=\min\{1,A(a)/n(a)\},
```
where at $p=1$ every paper receives intensive review and the two rules coincide. AI may also change the share of high-quality work $\pi(a)$ and the screen’s pass rates $(\alpha(a),\beta(a))$. For given effective pass rates, the boundary separating the two premium rankings is then
$$
K\bigl(\pi(a);p(a),\alpha(a),\beta(a)\bigr)=0.
$$
This representation accommodates both an increase in submissions caused by AI use, which lowers coverage $p$ when capacity $A$ is fixed and binding, and AI-assisted reviewing, which raises $A$ or changes the pass rates $(\alpha,\beta)$.

The division between codifiable and messy work distinguishes changes in review capacity from changes in screen pass rates. A tool may raise $\alpha$ at a given $\beta$ when it codifies more evaluation checks – the aim of verification-first proposals (You et al. 2026). Under Proposition [3](#prop:erosion), authors’ repair choices may also alter the effective pass rates. AI raises intensive-review capacity $A$ when it saves referees time on codifiable tasks. Even inside expert review, a design trade-off remains outside this model: Gans (2026b) shows that giving every referee the same AI report can leave the editor less informed by correlating referees’ remaining errors, so the report may be better kept by the editor or assigned to one referee alone. That result applies to papers experts review, whereas Proposition [3](#prop:erosion) applies to the overflow they do not reach. In both expert review and overflow screening, messy expert judgment stays the scarce input. AI can make papers harder to screen, and it may also raise or lower the high-quality share $\pi(a)$, depending on which additional papers authors submit – for instance, by helping them finish sound projects they previously lacked the technical means to complete. Whether a given AI tool raises or lowers the relative value of strict verification is therefore an empirical question settled by these parameters.

Blindness is an additional editorial choice. If a scalable screen observes author identity and responds directly to affiliation or prominence, as recent AI experiments indicate (Pataranutaporn et al. 2025), its pass rates become group-specific, $(\alpha_g,\beta_g)$. Section 5 isolates how the overflow rule affects unstamped prices even when the journal hides pedigree from both expert referees and the scalable screen. Direct evaluator bias can also change group-specific pass rates.

# Conclusion

Rejecting unreviewed submissions does not always give a crowded journal’s stamp the larger premium. Strict verification certifies only high-quality papers, keeping its stamped pool entirely high quality, so its stamped papers have higher average quality than those under scalable evaluation whenever the screen passes some low-quality papers ($\beta>0$). But once a rule-based screen sorts accurately enough and high-quality work is common enough, scalable evaluation yields the larger certification premium: unread high-quality papers rejected under strict verification raise the average quality of the unstamped pool and narrow the price gain from certification. A single closed-form threshold $\pi^*$ in the share of high-quality work separates the two rules whenever the crossing is interior. Under blind review with $0\leq\beta<\alpha<1$, the overflow rule also determines the unstamped price gap between author pedigree groups: strict verification gives the wider gap when the pair’s logit midpoint lies below $\widehat\pi$, and scalable evaluation gives the wider gap when it lies above. Because the premium comparison uses each group’s prior whereas the pedigree comparison uses the pair’s logit midpoint, different rules can rank first in the two comparisons, and authors from groups on opposite sides of an interior premium crossing value the stamp more under opposite rules. Once authors can run the same rule-based screen before submitting, every equilibrium in which positive masses of failing-mark papers are repaired and left unrepaired pins the scalable premium to the display fee plus the repair cost divided by the probability of reaching the screen. At full repair, every overflow paper passes and strict verification yields the larger premium if and only if fewer than half of all papers are high quality; the model gives a sufficient cost condition under which full repair is the unique equilibrium.

These findings revise three common assumptions about peer review and certification. Rejecting what a journal cannot read keeps its stamped pool free of low-quality papers, but it can lower the stamp’s market premium whenever the crossing is interior. Blind review does not remove the effect of the overflow rule on the market reward to an author’s pedigree, because the overflow rule still changes what lacking a stamp implies about quality. A rule-based screen’s pass rates can change after adoption: the high- and low-quality pass rates measured in a trial can each change once authors gain access to the tool. The certification premium can also change, and in partial-repair equilibria the gaming cost pins the premium (Section 6). The paper’s three thresholds answer separate questions: $\pi^*$ ranks the strict and scalable premiums, $\pi^u$ ranks the intact and full-repair scalable premiums, and $\widehat\pi$ ranks the unstamped pedigree price gaps, whereas strict verification certifies only high-quality papers throughout. At the illustrative parameters, the thresholds are approximately $\pi^*=0.410$, $\pi^u=0.580$, and $\widehat\pi=0.711$. For two groups whose priors lie strictly above $\pi^*$ and below $\pi^u$, the three rankings hold at once: the intact scalable screen gives both groups a larger premium than strict verification, full repair lowers that scalable premium, and their logit midpoint lies below $\widehat\pi$, so strict verification gives the wider unstamped pedigree gap. Messy expert judgment remains the scarce input: it does not scale across the overflow, and authors cannot change expert assessments by paying to repair a failing mark.

The same structure applies beyond economics journals to grant panels, hiring committees, accreditation bodies, and rating agencies that issue one pooled public stamp, ration scarce expert attention, and leave uncertified applicants in a common comparison pool. These institutions can reject or screen applications their experts cannot reach. The public often judges them by the average quality of approved applications, but that criterion can rank their credentials differently from the market premium. Whenever evaluation relies on codified rules that applicants can eventually access, the gaming cost pins the credential’s premium in partial-repair equilibria (Section 6). Under blind evaluation, the overflow rule can still change the price gap between uncertified applicants from different affiliations.

The results assume a fixed batch of completed papers, one pooled public stamp, competitive posterior pricing, and a terminal uncertified pool. The pedigree comparison also assumes review is blind to the author’s group. If a journal discloses whether a paper received intensive review or scalable screening, readers price the two routes separately and the pooling effect disappears. At a common positive net premium with costly submission, strict verification gives a weakly higher submission cutoff; when authors with beliefs between the two cutoffs submit only under scalable evaluation, that change in who submits can reverse the baseline premium ranking near the crossing. Direct evaluator bias can also change group-specific pass rates alongside blind-review pricing, and public certification at another venue changes the outside comparison pool and limits the institutions to which the results apply. These posterior-price comparisons establish neither a welfare ranking nor a fairness ranking.

Paired assessments and editorial coverage records would locate a journal against the baseline premium and pedigree thresholds. Running the same sample of manuscripts – drawn, for instance, from RePEc – through both a scalable screen and an independent expert review treated as the reference assessment would measure $(\pi_g,\alpha,\beta)$ within each pedigree group, and editorial records would establish intensive-review coverage $p$. Publication outcomes alone cannot identify these parameters, because papers rejected for lack of referee capacity do not reveal how experts would have judged them. Measuring $(\pi_g,\alpha,\beta)$ and $p$ would still leave two further empirical steps: tracking where capacity-rejected papers end up so researchers can observe how they enter the market’s unstamped comparison group, and gathering evidence on repair behaviour to establish how author access changes the scalable premium.

# Proofs

*Proof of Lemma [1](#lem:premium).* Bayes’ rule gives
$$
P_C=\frac{\pi x_H}{m},\qquad
 P_N=\frac{\pi(1-x_H)}{1-m}.
$$
Subtracting and using $m=\pi x_H+(1-\pi)x_L$ yields equation [\[eq:premium\]](#eq:premium). ◻

*Proof of Lemma [2](#lem:demand).* A stamp-eligible author earns $P_C-f$ by displaying and $P_N$ by declining, so she strictly displays when $f<\Pi$. Not submitting also yields $P_N$ because applications are private. Submission followed by optimal display has expected gain $s(\theta_i)(\Pi-f)>0$. Under strict review $s(\theta_i)=p\theta_i>0$; under scalable evaluation it is weakly larger. At $f=\Pi$, the relevant choices are weak, making $\Pi$ the supremum strictly sustainable price. ◻

*Proof of Proposition [1](#prop:strictness).* Substitute equations [\[eq:strict\]](#eq:strict) and [\[eq:scale\]](#eq:scale), multiply by their positive denominators, and collect terms. The sign of the difference is the sign of $K$. If $\alpha>\beta$, then $d>p$, and
$$
K_\pi=-2cd-2d(d-p)\pi<0
$$
when $\beta>0$. Solving the quadratic and rationalising its positive root gives equation [\[eq:root\]](#eq:root). If $\beta=0$, then $c=0$ and $K=-d(d-p)\pi^2<0$. For attainability, observe that $K(0)=c(1-c)>0$ and
$$
K(1)=(1-p)\{(1-p)\beta-\alpha[p+(1-p)\alpha]\}.
$$
The decreasing function therefore crosses inside $(0,1)$ exactly when equation [\[eq:attainability\]](#eq:attainability) holds. ◻

*Proof of Corollary [1](#cor:performance).* Equations [\[eq:dxh\]](#eq:dxh) and [\[eq:dxl\]](#eq:dxl) follow by differentiating the two posterior means. Increasing $\alpha$ raises $x_H^S$ and therefore $\Pi_S$ at every prior; increasing $\beta$ raises $x_L^S$ and lowers $\Pi_S$. At an interior crossing, Proposition [1](#prop:strictness) implies that $\Pi_R-\Pi_S$ crosses zero from above. The implicit-function theorem gives the two signs. ◻

*Proof of Proposition [2](#prop:pedigree).* Blind review implies $\mathop{\mathrm{Pr}}(C\mid q,b)=\mathop{\mathrm{Pr}}(C\mid q)$, so Bayes’ rule applies separately within each pedigree cell. Equation [\[eq:unstamped\]](#eq:unstamped) gives
$$
U(\pi_B;\ell)-U(\pi_0;\ell)
 =\frac{\ell(\pi_B-\pi_0)}
 {[1-(1-\ell)\pi_0][1-(1-\ell)\pi_B]}.
$$
Multiplying $W_R-W_S$ by its positive denominators leaves the sign of
$$
(\ell_R-\ell_S)
 \{(1-\pi_0)(1-\pi_B)-\ell_R\ell_S\pi_0\pi_B\}.
$$
Because $\ell_R>\ell_S$, the expression is positive exactly when
$$
\sqrt{\frac{\pi_0}{1-\pi_0}
             \frac{\pi_B}{1-\pi_B}}
 <\frac{1}{\sqrt{\ell_R\ell_S}}.
$$
Applying the increasing logistic transformation gives equations [\[eq:pedigreesign\]](#eq:pedigreesign) and [\[eq:pedigreethreshold\]](#eq:pedigreethreshold). The denominator of $\widehat\pi$ is one plus a positive term. Increasing $\alpha$ reduces that term, while increasing $\beta$ raises it. For $p$, set $u=1-p$. The same term becomes $u\sqrt{(1-\alpha)/(1-u\beta)}$, which is strictly increasing in $u$ and therefore strictly decreasing in $p$. This proves equation [\[eq:pedigreecomparative\]](#eq:pedigreecomparative). ◻

*Proof of Corollary [2](#cor:groupdisagreement).* Proposition [1](#prop:strictness) states that $\Pi_R(\pi)>\Pi_S(\pi)$ below an interior $\pi^*$ and that the inequality reverses above it. Evaluating the two group-specific premiums at $\pi_0<\pi^*<\pi_B$ gives equation [\[eq:groupdisagreement\]](#eq:groupdisagreement). ◻

*Proof of Proposition [3](#prop:erosion).* Describe repair behaviour by the pattern $(r_H,r_L)\in[0,1]^2$, the shares of failing-mark high- and low-quality papers repaired. The certification rates are
$$
x_H=p+(1-p)\bigl[\alpha+(1-\alpha)r_H\bigr],\qquad
 x_L=(1-p)\bigl[\beta+(1-\beta)r_L\bigr],
$$
and Lemma [1](#lem:premium) gives the premium $\Pi(r_H,r_L)$. (i) Strict verification rejects every unreviewed paper at every mark, and a reviewed paper is judged on its quality, which repair does not change. (ii) In such an equilibrium some failing-mark author weakly prefers repairing and some weakly prefers not. The gain from repair, $(1-p)\max\{\Pi-f,0\}$, is common to all failing-mark authors, so both weak preferences hold for every one of them: indifference, $\kappa=(1-p)(\Pi-f)$, which rearranges to the identity displayed in part (ii). Reallocations of repair across indifferent authors that hold the premium at this level preserve equilibrium, so which authors repair is not identified, while the premium is. (iii) By equations [\[eq:dxh\]](#eq:dxh) and [\[eq:dxl\]](#eq:dxl), $\Pi$ is strictly increasing in $x_H$ and strictly decreasing in $x_L$, so its minimum over patterns is at $(r_H,r_L)=(0,1)$:
$$
\Pi^{\min}=\frac{\pi(1-\pi)\,d_w}{m_w(1-m_w)},\qquad
 d_w=p-(1-p)(1-\alpha),\qquad
 m_w=\pi\bigl[p+(1-p)\alpha\bigr]+(1-\pi)(1-p).
$$
Suppose $\kappa<(1-p)(\Pi^{\min}-f)$. A no-repair equilibrium requires $\kappa\geq(1-p)[\Pi(0,0)-f]$ and a partial-repair equilibrium requires $\kappa=(1-p)[\Pi(r_H,r_L)-f]$; both right-hand sides are at least $(1-p)(\Pi^{\min}-f)$, which exceeds $\kappa$, a contradiction. Full repair is an equilibrium because $(1-p)[\Pi(1,1)-f]\geq(1-p)(\Pi^{\min}-f)>\kappa$. At full repair every overflow paper is certified, which is the transparent benchmark of Section 4, equation [\[eq:half\]](#eq:half). ◻

The threshold $\pi^u$ of Section 6 compares the intact screen with unfiltered overflow. Applying the argument of Proposition [1](#prop:strictness) to this pair of technologies and dividing the resulting expression by the positive constant $p$ leaves the sign of
$$
J(\pi)=d(1-p)-c(1-c)+2d(c-1+p)\,\pi+d(d-p)\,\pi^2,
$$
whose derivative $2d(1-p)[(\alpha-\beta)\pi-(1-\beta)]$ is strictly negative on $(0,1)$ when the screen is not trivial. Full repair lowers the premium exactly while $J(\pi)>0$. When $J(0)>0>J(1)$, the threshold $\pi^u$ is the unique root of $J$ in $(0,1)$, the smaller root of the quadratic when $\alpha>\beta$; at $p=0.25$, $\alpha=0.75$ and $\beta=0.20$ it equals $0.580$.

# Robustness and extensions

## Two noisy review rules

The posterior premium formula does not require intensive review to be error-free. For any two noisy review rules $j\in\{R,S\}$, write $c_j=x_{Lj}$ for a low-quality paper’s certification probability and $d_j=x_{Hj}-x_{Lj}>0$ for the extra certification probability of a high-quality paper. Comparing their premiums gives
$$
\begin{align}
 \operatorname{sign}(\Pi_R-\Pi_S)=\operatorname{sign}\{&
 d_Rc_S(1-c_S)-d_Sc_R(1-c_R) \notag\\
 &+2d_Rd_S(c_R-c_S)\pi
 +d_Rd_S(d_R-d_S)\pi^2\}. \label{eq:arbitrary}
\end{align}
$$
This expression follows from applying Lemma [1](#lem:premium) with certified share $m_j=c_j+\pi d_j$ and expanding $d_Rm_S(1-m_S)-d_Sm_R(1-m_R)$. Because the right-hand side is quadratic in $\pi$, it gives an immediate upper bound of two isolated interior roots unless the two premiums coincide everywhere. The derivative of that polynomial is $2d_Rd_S(m_R-m_S)$. Identical rules have equal premiums at every prior. For two distinct rules, if the certified shares $m_R$ and $m_S$ keep the same order across $(0,1)$ without coinciding everywhere, the polynomial is strictly monotone on $(0,1)$ and has at most one interior root; if their order reverses inside $(0,1)$, one rule has both the lower false-positive rate and the higher true-positive rate, so equations [\[eq:dxh\]](#eq:dxh) and [\[eq:dxl\]](#eq:dxl) imply its premium is higher at every interior prior. Any two distinct binary rules with positive separation therefore have at most one interior prior at which their premiums are equal; perfect intensive review is not needed for this.

## Targeted expert review

Suppose a pre-review signal assigns intensive review to high-quality papers with probability $r_H$ and to low-quality papers with probability $r_L$. Strict verification then has certification rates $(x_H^R,x_L^R)=(r_H,0)$, whereas scalable evaluation has
$$
x_H^S=r_H+(1-r_H)\alpha,\qquad
 x_L^S=(1-r_L)\beta.
$$
Define $c=(1-r_L)\beta$ and $d=x_H^S-x_L^S$. Direct substitution into Lemma [1](#lem:premium) gives
$$
\begin{equation}
 \operatorname{sign}(\Pi_R-\Pi_S)=\operatorname{sign}
 \{c(1-c)-2cd\pi+d(r_H-d)\pi^2\}. \label{eq:targeted}
\end{equation}
$$
Whenever
$$
(1-r_H)\alpha\geq(1-r_L)\beta,
$$
the separation satisfies $d\geq r_H$, which gives an immediate monotonicity argument: the quadratic in braces is weakly decreasing in $\pi$. That condition is sufficient but not necessary. Writing $a=(1-r_H)\alpha$, so that $d=r_H+a-c$, the derivative of the bracketed polynomial is $-2d[c(1-\pi)+a\pi]\leq 0$ on $(0,1)$, because $d=r_H(1-\alpha)+(\alpha-\beta)+r_L\beta\geq 0$. The bracketed polynomial is therefore weakly decreasing for every $r_H,r_L\in[0,1]$, including when $(1-r_H)\alpha<(1-r_L)\beta$. Wherever both rules have positive stamped and unstamped masses, their premiums can change order at most once.

## Continuous paper quality

The binary quality setup is a special case of a general covariance identity. Let paper quality $q$ follow any distribution with a finite expected value, and let $x(q)=\mathop{\mathrm{Pr}}(C\mid q)$ denote the probability that a paper of quality $q$ is certified, with total certified share $m=\mathop{\mathrm{\mathbb E}}[x(q)]\in(0,1)$. Then the difference between stamped and unstamped expected quality equals
$$
\begin{equation}
 \mathop{\mathrm{\mathbb E}}[q\mid C]-\mathop{\mathrm{\mathbb E}}[q\mid N]
 =\frac{\mathop{\mathrm{Cov}}(q,x(q))}{m(1-m)}. \label{eq:covariance}
\end{equation}
$$
Here $\mathop{\mathrm{Cov}}(q,x(q))$ is the covariance between paper quality and certification probability, measuring how strongly certification tracks quality. The identity follows directly from subtracting $\{\mathop{\mathrm{\mathbb E}}[q]-\mathop{\mathrm{\mathbb E}}[qx(q)]\}/(1-m)$ from $\mathop{\mathrm{\mathbb E}}[qx(q)]/m$. The binary pass–fail model in the main text is simply the two-value version of equation [\[eq:covariance\]](#eq:covariance).

## Costly submission and selective entry

Now suppose submitting a completed paper incurs a positive cost $k>0$, and authors’ private quality beliefs $\theta$ follow a distribution $F$ across the batch. Under a candidate cutoff $t$, every author with $\theta\geq t$ submits and authors below $t$ do not. Define the certified mass $M_C(t)$, the total quality among certified papers $Q_C(t)$, and the population average quality $\bar\theta$ by
$$
M_C(t)=\int_t^1s(\theta)\,dF(\theta),\qquad
 Q_C(t)=x_H\int_t^1\theta\,dF(\theta),\qquad
 \bar\theta=\int_0^1\theta\,dF(\theta).
$$
The certification premium at cutoff $t$ is
$$
\begin{equation}
 \Pi(t)=\frac{Q_C(t)}{M_C(t)}
 -\frac{\bar\theta-Q_C(t)}{1-M_C(t)}, \label{eq:entrypremium}
\end{equation}
$$
and an interior equilibrium cutoff $t$ leaves the marginal author indifferent between submitting and staying out, satisfying
$$
\begin{equation}
 s(t)[\Pi(t)-f]=k. \label{eq:entrycutoff}
\end{equation}
$$
With fixed intensive-review capacity $A$, intensive-review coverage among submitted papers becomes $p(t)=\min\{1,A/[1-F(t)]\}$. Holding a positive net premium $\Pi-f$ fixed, strict verification gives authors with low private beliefs a weakly smaller probability of certification than scalable evaluation does, yielding a weakly higher submission cutoff. This entry-selection effect operates alongside the baseline unstamped-pool effect and can reverse the ranking near the zero-cost crossing. Proposition [1](#prop:strictness) therefore isolates the direct certification effect for a fixed batch of completed papers rather than an unconditional ranking of journal policies.

# Data availability

This theoretical article uses no empirical data. The computational scripts check the analytical results, reproduce the model’s reported numerical examples, and generate the two figures from the closed-form expressions in the text. The scripts are openly available in a public repository, and a persistent identifier will be added before publication.

# References

Acemoglu, Daron, Dingwen Kong, and Asuman Ozdaglar. 2026. *AI, Human Cognition and Knowledge Collapse*. Working Paper No. 34910. National Bureau of Economic Research. <https://doi.org/10.3386/w34910>.

Agrawal, Ajay K., John McHale, and Alexander Oettl. 2026. *AI in Science*. Working Paper No. 34953. National Bureau of Economic Research. <https://doi.org/10.3386/w34953>.

Atasu, Atalay. 2026. *AI and Publication Commons*. Working Paper 2026/11/TOM. INSEAD. <https://doi.org/10.2139/ssrn.6393158>.

Ball, Ian. 2025. “Scoring Strategic Agents.” *American Economic Journal: Microeconomics* 17 (1): 97–129. <https://doi.org/10.1257/mic.20230275>.

Bayar, Onur, and Thomas J. Chemmanur. 2021. “A Model of the Editorial Process in Academic Journals.” *Research Policy* 50: 104339. <https://doi.org/10.1016/j.respol.2021.104339>.

Bhargava, Hemant K., Sarah H. Bana, Zhe Zhang, et al. 2026. “Fighting Fire with Fire: Infusing Artificial Intelligence into Peer Review to Sustain Quality Scholarship.” *Management Science* 72 (9): 7381–93. <https://doi.org/10.1287/mnsc.2026.00184>.

Blank, Rebecca M. 1991. “The Effects of Double-Blind Versus Single-Blind Reviewing: Experimental Evidence from The American Economic Review.” *American Economic Review* 81 (5): 1041–67.

Card, David, and Stefano DellaVigna. 2013. “Nine Facts about Top Journals in Economics.” *Journal of Economic Literature* 51 (1): 144–61. <https://doi.org/10.1257/jel.51.1.144>.

Card, David, and Stefano DellaVigna. 2020. “What Do Editors Maximize? Evidence from Four Economics Journals.” *Review of Economics and Statistics* 102 (1): 195–217. <https://doi.org/10.1162/rest_a_00839>.

Celik, Gorkem, and Roland Strausz. 2026. “Informative Certification: Screening Versus Acquisition.” *Review of Economic Studies*, ahead of print. <https://doi.org/10.1093/restud/rdag083>.

Clauset, Aaron, Samuel Arbesman, and Daniel B. Larremore. 2015. “Systematic Inequality and Hierarchy in Faculty Hiring Networks.” *Science Advances* 1 (1): e1400005. <https://doi.org/10.1126/sciadv.1400005>.

Cowgill, Bo, Pablo Hernández-Lagos, and Nataliya Langburd Wright. 2026. “Does AI Cheapen Talk? Theory and Evidence from Global Entrepreneurship and Hiring.” *Management Science*, ahead of print. <https://doi.org/10.1287/mnsc.2024.07027>.

Daley, Brendan, and Brett Green. 2014. “Market Signaling with Grades.” *Journal of Economic Theory* 151: 114–45.

Dranove, David, and Ginger Zhe Jin. 2010. “Quality Disclosure and Certification: Theory and Practice.” *Journal of Economic Literature* 48 (4): 935–63.

Ellison, Glenn. 2002. “Evolving Standards for Academic Publishing: A $q$-$r$ Theory.” *Journal of Political Economy* 110 (5): 994–1034. <https://doi.org/10.1086/341871>.

Engers, Maxim, and Joshua S. Gans. 1998. “Why Referees Are Not Paid (Enough).” *American Economic Review* 88 (5): 1341–49.

Farhi, Emmanuel, Josh Lerner, and Jean Tirole. 2013. “Fear of Rejection? Tiered Certification and Transparency.” *RAND Journal of Economics* 44 (4): 610–31.

Fourie, Johan. 2026a. “Messy Research, Certification and the Monetization of Science.” Unpublished manuscript.

Fourie, Johan. 2026b. *Writing Is Not Thinking*. Working Paper. Department of Economics, Stellenbosch University.

Fourie, Johan, and Noah Macdonald. 2026. “The Price of Submission.” Unpublished manuscript.

Frankel, Alex, and Navin Kartik. 2019. “Muddled Information.” *Journal of Political Economy* 127 (4): 1739–76. <https://doi.org/10.1086/701604>.

Galdin, Anaïs, and Jesse Silbert. 2025. “Making Talk Cheap: Generative AI and Labor Market Signaling.” Unpublished manuscript.

Gans, Joshua S. 2026a. “Can Author Manipulation of AI Referees Be Welfare Improving?” *Journal of Economic Behavior & Organization* 249: 107699. <https://doi.org/10.1016/j.jebo.2026.107699>.

Gans, Joshua S. 2026b. *Designing AI-Augmented Peer Review*. Working Paper No. 35688. National Bureau of Economic Research. <https://doi.org/10.3386/w35688>.

Garicano, Luis. 2026. *The Introduction of AI Refereeing in the Publication Process Is the Start of a Momentous Change in Science*. Post on X, 6 August 2026, <https://x.com/lugaricano/status/2085352430707855364>.

Garicano, Luis, Jin Li, and Yanhui Wu. 2026. *Messy Jobs: The Work That AI Cannot Reach*. Upriver Press.

Gartenberg, Claudine, Sharique Hasan, Alex Murray, and Lamar Pierce. 2026. “More Versus Better: Artificial Intelligence, Incentives, and the Emerging Crisis in Peer Review.” *Organization Science* 37 (3): 795–812. <https://doi.org/10.1287/orsc.2026.ed.v37.n3>.

Golub, Benjamin. 2026. *Announcement of Refine Partnerships with Two Leading Publishers in Economics*. Post on X, 6 August 2026, <https://x.com/ben_golub/status/2085261590874529905>.

Hakobyan, Zaruhi. 2026. *Buying the Right to Monitor: Editorial Design in AI-Assisted Peer Review*. Working Paper 2604.23645. arXiv. <https://doi.org/10.48550/arXiv.2604.23645>.

Hanson, Mark A., Pablo Gómez Barreiro, Paolo Crosetto, and Dan Brockington. 2024. “The Strain on Scientific Publishing.” *Quantitative Science Studies* 5 (4): 823–43. <https://doi.org/10.1162/qss_a_00327>.

Harbaugh, Rick, and Eric Rasmusen. 2018. “Coarse Grades: Informing the Public by Withholding Information.” *American Economic Journal: Microeconomics* 10 (1): 210–35.

Heckman, James J., and Sidharth Moktan. 2020. “Publishing and Promotion in Economics: The Tyranny of the Top Five.” *Journal of Economic Literature* 58 (2): 419–70. <https://doi.org/10.1257/jel.20191574>.

Hill, Ryan, and Carolyn Stein. 2025a. “Race to the Bottom: Competition and Quality in Science.” *Quarterly Journal of Economics* 140 (2): 1111–85. <https://doi.org/10.1093/qje/qjaf010>.

Hill, Ryan, and Carolyn Stein. 2025b. “Scooped! Estimating Rewards for Priority in Science.” *Journal of Political Economy* 133 (3): 793–845. <https://doi.org/10.1086/733398>.

Huber, Jürgen, Sabiou Inoua, Rudolf Kerschbamer, Christian König-Kersting, Stefan Palan, and Vernon L. Smith. 2022. “Nobel and Novice: Author Prominence Affects Peer Review.” *Proceedings of the National Academy of Sciences* 119 (41): e2205779119. <https://doi.org/10.1073/pnas.2205779119>.

Klebel, Thomas, and Tony Ross-Hellauer. 2023. “The APC-Barrier and Its Effect on Stratification in Open Access Publishing.” *Quantitative Science Studies* 4 (1): 22–43. <https://doi.org/10.1162/qss_a_00245>.

Kovanis, Michail, Raphaël Porcher, Philippe Ravaud, and Ludovic Trinquart. 2016. “The Global Burden of Journal Peer Review in the Biomedical Literature: Strong Imbalance in the Collective Enterprise.” *PLoS ONE* 11 (11): e0166387. <https://doi.org/10.1371/journal.pone.0166387>.

Krieger, Joshua L., Kyle R. Myers, and Ariel D. Stern. 2025. “How Important Is Editorial Gatekeeping? Evidence from Top Biomedical Journals.” *Review of Economics and Statistics* 107 (4): 1159–68.

Kusumegi, Keigo, Xinyu Yang, Paul Ginsparg, Mathijs de Vaan, Toby Stuart, and Yian Yin. 2025. “Scientific Production in the Era of Large Language Models.” *Science* 390 (6779): 1240–43. <https://doi.org/10.1126/science.adw3000>.

Lee, Carole J., Cassidy R. Sugimoto, Guo Zhang, and Blaise Cronin. 2013. “Bias in Peer Review.” *Journal of the American Society for Information Science and Technology* 64 (1): 2–17. <https://doi.org/10.1002/asi.22784>.

Lizzeri, Alessandro. 1999. “Information Revelation and Certification Intermediaries.” *RAND Journal of Economics* 30 (2): 214–31.

Lopez-Lira, Alejandro, and Seyed Mohammad Sina Seyfi. 2026. *One Prompt, One Paper: Optimal Journal Policy and the AI Submission Flood*. Working Paper No. 6337880. SSRN. <https://doi.org/10.2139/ssrn.6337880>.

Lusher, Lester, Wenni Yang, and Scott E. Carrell. 2023. “Congestion on the Information Superhighway: Inefficiencies in Economics Working Papers.” *Journal of Public Economics* 225: 104978. <https://doi.org/10.1016/j.jpubeco.2023.104978>.

Mullainathan, Sendhil, and Ashesh Rambachan. 2025. “Science in the Age of Algorithms.” In *The Economics of Transformative AI*, edited by Ajay K. Agrawal, Erik Brynjolfsson, and Anton Korinek. University of Chicago Press.

Oldford, Erin, John Fiset, and Anahit Armenakyan. 2023. “The Marginalizing Effect of Journal Submission Fees in Accounting and Finance.” *Scientometrics* 128: 4611–50. <https://doi.org/10.1007/s11192-023-04758-7>.

Pataranutaporn, Pat, Nattavudh Powdthavee, and Pattie Maes. 2025. *Can AI Solve the Peer Review Crisis? A Large-Scale Experiment on LLM’s Performance and Biases in Evaluating Economics Papers*. Discussion Paper No. 17659. IZA Institute of Labor Economics.

Pollrich, Martin, and Roland Strausz. 2024. “The Irrelevance of Fee Structures for Certification.” *American Economic Review: Insights* 6 (1): 55–72.

Stahl, Konrad, and Roland Strausz. 2017. “Certification and Market Transparency.” *Review of Economic Studies* 84 (4): 1842–68.

You, Lei, Lele Cao, and Iryna Gurevych. 2026. *Preventing the Collapse of Peer Review Requires Verification-First AI*. Preprint 2601.16909. arXiv. <https://doi.org/10.48550/arXiv.2601.16909>.

Zapechelnyuk, Andriy. 2020. “Optimal Quality Certification.” *American Economic Review: Insights* 2 (2): 161–76.

Zhang, Sam, Nicholas LaBerge, Quinten McElhiney, Daniel B. Larremore, and Aaron Clauset. 2026. “Editorial and Peer Review Dynamics at Elite General Science Journals.” *Science Advances* 12 (29): eaec0494. <https://doi.org/10.1126/sciadv.aec0494>.

Zollman, Kevin J. S., Julian Garcia, and Toby Handfield. 2024. “Academic Journals, Incentives, and the Quality of Peer Review: A Model.” *Philosophy of Science* 91 (1): 186–203. <https://doi.org/10.1017/psa.2023.81>.

[^1]: Department of Economics, Stellenbosch University. Email: <johanf@sun.ac.za>.

[^2]: Many conversations have informed this paper. I particularly appreciate thoughtful discussions with Rulof Burger, Helanya Fourie, Willem Fourie, Jesse Naidoo, Matthew Olckers, Melt van Schoor and Marisa von Fintel, and the many reader comments on ourlongwalk.com on this and related issues. I chose the question, assumptions and argument. Anthropic’s Claude Code and OpenAI’s Codex assisted with derivations, drafting, literature search, computational verification and adversarial review, and Google’s Gemini 4 Neon rewrote the prose of this version in plainer language. I reviewed every claim and remain responsible for all errors. Cite this paper as: Fourie, Johan. 2026. “The Value of Peer Review and the Reward to Reputation.” Working Paper, Department of Economics, Stellenbosch University. Earlier versions circulated as “When Cleaner Certification Is Worth Less: Peer Review and Pedigree” and “Messy Review: Certification Value and the Return to Pedigree.”
