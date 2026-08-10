---
abstract: |
  Artificial intelligence has made writing largely codifiable; evaluation is becoming partly codifiable. A congested journal applies expert judgment to some submissions and rejects or codifiably screens the overflow under one stamp. With false positives, rejection keeps the certified pool cleaner yet can make the stamp worth less: good papers rejected unread improve its comparison pool. For an informative screen, the premiums cross at most once. Another threshold determines which rule widens the reward to pedigree under blind review. Partial repair pins the net scalable premium at the repair cost grossed up by overflow exposure. No such cost pins judgment’s premium.
author:
- Johan Fourie[^1]
bibliography: references.bib
reference-section-title: References
title: "Messy Review: Certification Value and the Return to Pedigree[^2]"
---

> Figures and typeset tables are omitted from this Markdown version.
> The complete paper, with all figures, is in JF_MessyReviewCertification_v1.pdf.


**Keywords:** certification; peer review; pedigree; expert judgment; artificial intelligence

**JEL codes:** D82; D83; I23; L15; O33

# Introduction

Some research tasks can be reduced to rules, and some cannot. Recent work on AI divides jobs along this line, into codifiable work, which machines now do at scale, and messy work, which still requires a person (Garicano et al. 2026). Generative artificial intelligence has enlarged the set of research tasks that can be reduced to rules. Writing a plausible manuscript has proved largely codifiable (Fourie 2026b), and judging one has not. Expert judgment has not become cheaper, and economists studying AI in science treat it as the input that remains indispensable (Agrawal et al. 2026). The enlargement has now reached evaluation itself: the technical checks a referee once ran by hand can be run by rule, and journals have begun to adopt the tools that run them. This paper derives what that second change does to the value of certification. The two changes share one property: whatever writing can be codified, anyone can produce, and whatever evaluation can be codified, anyone can pass.

Journals were congested before either change. Annual submissions to the top five economics journals nearly doubled between 1990 and 2012 while the journals published fewer articles, so acceptance rates fell from about 15 per cent to about 6 per cent (Card and DellaVigna 2013). The binding constraint is referee time, and it is supplied at a price that does not clear the market (Engers and Gans 1998). AI has now added volume on top of the shortage: after the release of ChatGPT, submissions to *Organization Science* rose sharply while measured writing quality fell, in the submissions and in the reviews (Gartenberg et al. 2026). The crowding reaches beyond journals too: in weeks when more working papers are released, each one receives fewer downloads and less attention, and is eventually published and cited less (Lusher et al. 2023). A journal in this position must decide what to do with the work its referees cannot reach: reject it unread, or screen it with a scalable technology such as AI-assisted review. Certification theory studies certifiers who choose what to reveal about what they have examined. A congested certifier faces an earlier choice, what to examine at all, and the theory has treated the screening technology behind that choice as a fixed instrument rather than as a tool the screened authors also hold. Those are the two gaps this paper fills. The paper asks three questions. Which choice preserves the value of the journal’s stamp? What does each choice do to the worth of an author’s pedigree? And what is a screen’s verdict worth once authors can pass the screen at will? Fourie (2026a) applies the codifiable–messy division to certification and argues that a journal’s stamp survives only if the journal commits to rejecting what it cannot read. The model below shows that this commitment is not always the right one, and says exactly when it is.

I answer all three questions in a deliberately small model of certification. A unit mass of papers is either high or low quality, where high quality means the paper would pass an intensive expert review. The journal’s expert reviewers reach a random fraction of submissions, say one in four, and judge quality perfectly. The journal chooses what happens to the papers they do not reach. Under *strict verification* it rejects them. Under *scalable evaluation* an imperfect technology assesses them: it passes a high-quality paper with probability $\alpha$, say three in four, and a low-quality paper with probability $\beta$, say one in five. The two technologies mirror the two kinds of work. Intensive review is the messy input, judgment that does not scale. The scalable screen is the part of evaluation that has been codified. Both routes issue the same public stamp, so readers see that a paper is certified but not how. A competitive market pays each paper its posterior expected quality: the quality a rational reader infers from the stamp or from its absence. The value of certification is then the premium, the difference between the price of a certified paper and the price of an uncertified one. The premium is also what an author would pay to display the stamp. Last, I compare two publicly observed pedigree groups with different prior probabilities of high quality. Review remains blind to pedigree, but readers see both the stamp and the author’s group.

The comparison has a sharp answer. Suppose the scalable screen lets through some bad work ($\beta>0$) and separates good work from bad at all ($\alpha>\beta$). Then the two premiums cross at most once as the share of high-quality papers rises, and the crossing point has a closed form. When the crossing lies strictly between zero and one, strict verification supports the more valuable stamp while high-quality work is scarce, and scalable evaluation supports it once high-quality work is common. A screen can also be too weak for the crossing to be reached: if its true-positive rate is low enough relative to its false-positive rate, strict verification wins at every prior. With the illustrative numbers above, one in four reviewed and pass rates of three in four and one in five, the crossing is at a high-quality share of 0.410. Yet at every prior, strict verification keeps the higher average quality among certified papers. Cleaner certification and more valuable certification can therefore point to opposite institutions.

The pedigree comparison has its own threshold, and it is a different object. It is compared with a single summary of the pair: a midpoint between the two groups’ priors, defined precisely in Section 5. When that midpoint lies below the threshold, strict verification produces the larger pedigree-related price gap among uncertified papers; when it lies above, scalable evaluation does. Because the two thresholds are distinct, a pair of groups can satisfy one comparison and fail the other. And when the two groups sit on opposite sides of the premium crossing, they value the regimes in opposite orders: no rule gives both groups their more valuable stamp.

The last result makes the screen’s error rates equilibrium objects rather than fixed constants. Section 6 lets authors hold the technology the journal screens with, so an author can repair, at a cost, the codifiable defects the screen would flag. Repair changes what the screen sees, not what the paper contributes, so strict verification is immune: expert judgment reads the quality that repair does not touch. Under scalable evaluation, in every equilibrium in which some flagged papers are repaired and some are not, the premium is pinned: it equals the display price plus the repair cost grossed up by the chance of facing the screen. The stamp is then priced by what evading the screen costs, not by what the screen detects. And repair that is cheap enough can leave the screen certifying everything it reads, which reduces the comparison to a transparent benchmark: strict verification supports the more valuable stamp exactly when fewer than half the papers are high quality.

The mechanism is the outside option. A market values a stamp by comparing certified with uncertified work. Strict review rejects some good papers for no reason other than that scarce expert attention did not reach them. Those papers join the uncertified pool and raise its average quality, and that pool is exactly the benchmark the stamp is priced against. A noisy scalable screen does the opposite. Its false positives dilute the certified pool, but the good papers it certifies are no longer outside. Which effect dominates depends on how common good papers are. When they are rare, false positives are the larger cost. When they are common, the larger cost is the good papers that strict review sends outside.

The same mechanism sets the return to pedigree. Under blind review, having no stamp is worse news under scalable evaluation than under strict verification, because the scalable screen has examined the overflow and strict verification has not. That news reaches both pedigree groups alike, and it lowers both their prices. What it does to the gap between them depends on where they sit. At low priors, stronger bad news flattens the price schedule, so two weak groups are pushed towards zero together and the gap between them narrows. At high priors, the same news steepens the schedule, and the gap widens. A single threshold separates the two cases. This is a price result, not a claim that either regime changes the statistical information pedigree carries.

The paper speaks to three literatures: the theory of certification, the economics of AI and the division of labour, and the economics of science.

The first contribution is to the economics of certification. The closest predecessor is Farhi et al. (2013), where rejection by a selective certifier is bad news: every rejected paper has been examined and found wanting, so rejection lowers the standing of the rejected and the rejected pool deteriorates. Capacity rationing reverses this. A paper rejected for capacity alone carries no adverse information, because no one read it. Rejection without examination creates false negatives without stigma, and it can improve rather than degrade the uncertified pool. That reversal is what allows a cleaner stamp to be worth less, and it is a possibility that does not arise when every rejection is informative. The paper adds a second result of the same kind: the certifier’s screening technology is an equilibrium object. When the authors being screened hold the screening tool, the tool’s price determines the screen’s error rates, and the value of the stamp is pinned by the cost of passing the screen rather than by any property the certifier chose.

The surrounding literature studies certifiers who design the information they reveal, choosing disclosure rules, fees, transparency or certification tiers (Lizzeri 1999; Stahl and Strausz 2017; Zapechelnyuk 2020; Pollrich and Strausz 2024). The grading literature makes a closely related point: a label is read relative to the other categories an information policy creates (Dranove and Jin 2010; Daley and Green 2014; Harbaugh and Rasmusen 2018). A parallel literature endogenises the certifier’s standard, either as an evolving norm about what referees demand (Ellison 2002) or as the solution to a journal’s own objective, which can make deliberately inaccurate review attractive (Zollman et al. 2024). A separate literature studies agents who game a fixed scoring rule and the muddled information that results (Frankel and Kartik 2019; Ball 2025); its object is the score, and the designer’s response to gaming. Here both evaluation technologies are fixed, the single public stamp is held constant and the journal’s objective is left unmodelled; Section 6 introduces gaming into this environment, and the gaming changes which review rule supports the more valuable stamp. The new object is the reputational consequence of capacity rationing: the model compares two rules for the same expert-review bottleneck and derives the exact boundary at which the ranking of their stamps reverses.

The second contribution is to the economics of AI and the division of labour. In that literature the codifiable–messy division sorts tasks: codifiable work is now done by machines at scale, and messy work is still done by people (Garicano et al. 2026). The first of the two changes described above is documented. Employers on a large freelancing platform stopped paying a premium for carefully written applications once large language models arrived, because the writing no longer separated strong applicants from weak ones (Galdin and Silbert 2025), and scientific output now rises fastest among the authors who used to face the highest language costs, those writing outside their first language (Kusumegi et al. 2025). This paper derives what the division does to the institutions that certify the work. Codifying an evaluation task changes more than who performs the task. A check that a journal can run by rule at scale is a check that an author can pass by rule at will, so the same codification that lets a certifier screen its overflow lets the screened authors pass the screen. The boundary between codifiable and messy work therefore appears in prices. Certification built on codified checks can be pinned at the cost of passing them; no such cost pins certification built on judgment, the input that stays messy. In the division-of-labour literature the messy residual is the work machines leave to people. Here it is also the only part of evaluation whose stamp retains its premium when everyone holds the tools, so the boundary has a second economic role: it separates tasks by who performs them, and it separates certificates by whether their premium remains when the tools are widely held.

The third contribution connects certification to the allocation of attention and status in science. Author identity and prominence affect peer assessments in experiments (Huber et al. 2022), editors place extra weight on reports by highly published referees (Card and DellaVigna 2020), and reputation changes how credit is divided between teams that make closely comparable discoveries (Hill and Stein 2025b). Publication in a small set of journals strongly predicts tenure in economics, so what the stamp is worth, and who can obtain it, are questions about careers as well as prices (Heckman and Moktan 2020). Journals have already used blindness as a policy instrument: the *American Economic Review* tested double-blind review experimentally and found that concealing author identity lowered acceptance rates for some groups of authors (Blank 1991). This paper shows that blindness does not settle the matter. Even when the evaluator never sees who wrote a paper, the rule for handling unreviewed work changes the market reward to pedigree, because it changes what an absent stamp implies. Experiments with LLM evaluations of economics papers find direct responses to affiliation, prominence and gender (Pataranutaporn et al. 2025). The blind-screen benchmark isolates a different channel, an indirect one that survives when identity is withheld from the evaluator.

All three results inform a current debate about what AI does to the production of knowledge. Algorithms are expected to reorganise scientific work rather than merely speed it up (Mullainathan and Rambachan 2025), and formal models show that when machine output substitutes for human effort, the shared stock of knowledge can shrink even as individual decisions improve (Acemoglu et al. 2026). Two results from adjacent settings strengthen the concern. Competitive pressure lowers measured quality when evaluation is coarse (Hill and Stein 2025a), and applicants with access to generative AI are harder for employers and investors to screen accurately (Cowgill et al. 2026). Editorial discretion, by contrast, changes published content less than is often assumed (Krieger et al. 2025). The debate has so far said little about certification itself. Certification is how science converts private judgment into a public signal. The results below show that a congested certifier choosing between the two rules faces a trade-off with no dominant answer. The rule it picks sets both how much a stamp is worth and how much an author’s affiliation is worth without one. Recent models of AI and publication study richer problems, including submission volume, review costs, capacity and fees (Atasu 2026; Lopez-Lira and Seyfi 2026), and editorial redesign when authors and reviewers both use AI (Hakobyan 2026). This paper isolates one margin those problems can embed: the posterior price of a common stamp, including what that price becomes when authors hold the screening technology themselves.

The rest of the paper is structured as follows. Section 2 sets out the model. Section 3 derives the value of a certificate and shows that it is an author’s willingness to pay. Section 4 compares the two regimes and states the main result. Section 5 derives the incidence of the two regimes across pedigree groups. Section 6 puts the screen itself in equilibrium, when authors hold the technology it is built from, and maps artificial intelligence into the model’s primitives. Section 7 concludes. Appendix A collects the proofs; Appendix B extends the model to two noisy classifiers, targeted intensive review, continuous quality and selective entry.

# The model

There is a unit mass of completed papers. Paper $i$ has latent certification-relevant quality $q_i\in\{0,1\}$. Quality one means that the paper would pass an intensive expert review; quality zero means that it would not. Let
$$
\pi=\mathop{\mathrm{Pr}}(q_i=1)\in(0,1)
$$
denote the share of high-quality papers.

The model conditions on what a reader can already see. The analysis holds fixed the visible characteristics of a manuscript, such as its topic or the polish of its prose. So $q$ is the part of quality that only evaluation can uncover: the validity or importance not already plain to the downstream market. Among papers that look identical, the journal cannot rank submissions before evaluating them. Sections 2–4 work within one such cell of identical-looking papers. Section 5 compares two cells that differ in publicly observed author pedigree.

The journal announces one of two regimes. Under either regime, a paper receives intensive review with probability $p\in(0,1)$; intensive review certifies a high-quality paper and rejects a low-quality paper. Coverage is taken as given. A journal could in principle buy more of it, but referees are paid little or nothing and supply their time for reasons a fee does not easily displace, so the quantity of intensive review responds weakly to what a journal is willing to spend (Engers and Gans 1998). Prices are also nowhere near the level at which that would be tested. Across the 600 highest-ranked economics journals, 118 charge a submission fee at all, and the median charge among those is 125 dollars. Posted fees extract about one per cent of a central estimate of what an acceptance is worth to an author, and a capacity-clearing calculation puts the required top-journal fee, and the referee payment it would fund, well above current practice (Fourie and Macdonald 2026). Review is therefore rationed rather than priced. That companion paper prices entry to the certification queue; this paper prices what the queue produces, the stamp itself. Treating $p$ as a parameter below the level that would clear the queue is the relevant case, and it is the case in which the two regimes differ at all: at $p=1$ every paper is examined and the choice disappears. The regimes differ in what happens to the overflow, the papers intensive review does not reach. Under *strict verification*, a paper not assigned intensive review is rejected. Under *scalable evaluation*, a paper not assigned intensive review is certified with probabilities
$$
\alpha=\mathop{\mathrm{Pr}}(C\mid q=1,\text{ scalable}),\qquad
 \beta=\mathop{\mathrm{Pr}}(C\mid q=0,\text{ scalable}),
 \qquad 1\geq\alpha\geq\beta\geq0.
$$
Here $\alpha$ is the technology’s true-positive rate, the chance that a good paper passes the scalable screen, and $\beta$ is its false-positive rate, the chance that a bad one does. The running example of the introduction has $p=0.25$, $\alpha=0.75$ and $\beta=0.20$: reviewers reach one paper in four, and the screen passes three good papers in four and one bad paper in five. The figures use these numbers throughout.

The journal issues a common public stamp: observers see certification, not the route that produced it. This pooling is essential to everything that follows. If the journal disclosed the route, readers would price intensively reviewed and scalably reviewed papers separately, and the single-stamp comparison below would not apply.

Applications and rejections are private. The market observes whether a paper carries the stamp, not whether it applied and failed. A competitive downstream market rewards a paper at its posterior expected quality: the probability that the paper is high quality, given what the market observes. An author may display an earned stamp by paying an exogenous, certification-contingent price $f\geq0$. This device measures willingness to pay; it is not a claim that journals should charge acceptance fees. Submitting a completed paper is costless in the baseline. The timing is: the journal announces its regime and $f$; authors submit; the journal evaluates; eligible authors decide whether to display the stamp; and the market pays posterior expected quality.

Some notation completes the setup. For any regime, write
$$
x_H=\mathop{\mathrm{Pr}}(C\mid q=1),\qquad x_L=\mathop{\mathrm{Pr}}(C\mid q=0),
$$
for the overall certification probabilities of high- and low-quality papers, and let the certified share be
$$
m=\pi x_H+(1-\pi)x_L.
$$
Denote posterior rewards by
$$
P_C=\mathop{\mathrm{\mathbb E}}[q\mid C],\qquad P_N=\mathop{\mathrm{\mathbb E}}[q\mid N],
$$
where $N$ is the publicly uncertified pool. The certification premium is $\Pi=P_C-P_N$, the reputational gain from holding the stamp.

# The value of a certificate

Bayes’ rule reduces the value of a certificate to a single expression.

**Lemma 1** (Certification premium). *For any $0<m<1$,
$$
\begin{equation}
 \Pi(x_H,x_L)=
 \frac{\pi(1-\pi)(x_H-x_L)}{m(1-m)}.
 \label{eq:premium}
\end{equation}
$$*

Each piece of equation [\[eq:premium\]](#eq:premium) has a role. The numerator combines prior uncertainty with the technology’s separation of high- and low-quality papers: the stamp is worth more when quality is uncertain and when the rule sorts well. The denominator captures how the rule divides the population between the two posterior pools. This denominator is the source of the result. Changing a certification rule changes the alternative against which the stamp is priced, because every paper the rule does not certify lands in the comparison pool.

The premium is also an author’s willingness to pay, rather than merely a statistical contrast. Authors know more about their own papers than the market does: let author $i$ privately assess her paper as high quality with probability $\theta_i\in(0,1)$, with $\mathop{\mathrm{\mathbb E}}[\theta_i]=\pi$. Her probability of ending up eligible for the stamp is
$$
s(\theta_i)=x_L+(x_H-x_L)\theta_i.
$$
The argument runs in two steps: compute the premium in the outcome where every author submits, then confirm that submitting is what every author wants. The order matters. The premium is computed under a conjecture about behaviour, and the lemma then confirms the conjecture.

**Lemma 2** (Private demand). *Fix a regime and calculate $\Pi$ in the all-submission outcome. For every $f\in[0,\Pi)$, all authors strictly submit and every eligible author strictly displays the stamp. The supremum price consistent with strict participation and display is $\Pi$.*

The logic is short. A successful author gains $P_C-f-P_N=\Pi-f$ from displaying the stamp, and she reaches that position with probability $s(\theta_i)$, so submission has expected gain $s(\theta_i)(\Pi-f)>0$. The contingent price is a measuring device: it turns the premium into demand for the stamp without requiring a model of the journal’s own objective. Whichever regime supports the larger premium is the regime whose stamp authors value more.

# Strict versus scalable evaluation

The two premiums can now be computed and compared. Throughout, a superscript $R$ marks strict verification, where the overflow is rejected, and a superscript $S$ marks scalable evaluation, where the overflow is screened. Under strict verification a good paper is certified only if intensive review reaches it, and no bad paper is ever certified, so $x_H^R=p$ and $x_L^R=0$. Hence
$$
\begin{equation}
 \Pi_R=\frac{1-\pi}{1-\pi p}.
 \label{eq:strict}
\end{equation}
$$
For scalable evaluation define
$$
c=(1-p)\beta,\qquad
 d=p+(1-p)(\alpha-\beta),
$$
where $c$ is a bad paper’s overall chance of certification and $d$ is the amount by which a good paper’s chance exceeds it. Then $x_L^S=c$, $x_H^S=c+d$, and
$$
\begin{equation}
 \Pi_S=
 \frac{\pi(1-\pi)d}
 {(c+\pi d)(1-c-\pi d)}.
 \label{eq:scale}
\end{equation}
$$

The main result states when each regime supports the more valuable stamp. Its hypothesis of interior pools asks only that both the certified and the uncertified pool have positive mass, so that both posteriors exist.

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

In words: the ranking of the two regimes depends only on the sign of a quadratic in the high-quality share, and that quadratic falls as high-quality work becomes more common. When its root is interior, strict verification wins at low $\pi$, scalable evaluation at high $\pi$, and the switch happens exactly once, at $\pi^*$. The running example puts numbers on the switch. Its crossing is $\pi^*=0.410$. When one paper in five is high quality, the strict premium is 0.842 and the scalable premium is 0.523. At the crossing the two premiums are equal, at 0.657. When three papers in five are high quality, the strict premium is 0.471 and the scalable premium is 0.642.

When $\beta>0$ and $\alpha>\beta$, the crossing is not always reachable. Because $K(0)>0$ and $K$ decreases, the positive root lies below one if and only if
$$
\begin{equation}
 \alpha[p+(1-p)\alpha]>(1-p)\beta.
 \label{eq:attainability}
\end{equation}
$$
If this condition fails, strict verification has the larger premium throughout the interior prior range.

The no-false-positive case has a standard information interpretation. One evaluation technology Blackwell-dominates another when it is more informative for every decision-maker who might use it. When $\beta=0<\alpha$, scalable evaluation certifies no bad paper, just as strict verification does, and certifies more good ones, so it Blackwell-dominates strict review. When $\beta>0$ and $\alpha>\beta$, strict review is better at excluding bad papers while scalable evaluation is better at catching good ones. Neither is more informative for every user, so the technologies are not Blackwell ordered and the prior can reverse their ranking.

The result is easiest to see from the two posterior pools. Strict verification never certifies a bad paper, so $P_C^R=1$. But a good paper that is not assigned expert review joins the uncertified pool. When good papers are common, this raises $P_N^R$ enough to compress $\Pi_R$. Scalable evaluation admits some bad papers, which lowers $P_C^S$, but it can certify enough good papers that $P_N^S$ falls by more than $P_C^S$ does. The scalable stamp is then noisier but more valuable.

The comparative statics of the crossing follow the same logic.

**Corollary 1** (Performance of scalable evaluation). *Suppose $\pi^*$ is interior. Holding $p$ and $\beta$ fixed, $\partial\pi^*/\partial\alpha<0$. Holding $p$ and $\alpha$ fixed, $\partial\pi^*/\partial\beta>0$.*

Better true-positive performance expands the set of priors for which scalable evaluation supports the larger premium; more false positives contract it. The logic is general: for fixed $\pi$,
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
Any premium rises when good papers are certified more often and falls when bad papers are. The crossing shifts in the stated directions because $x_H^S=p+(1-p)\alpha$, $x_L^S=(1-p)\beta$ and $\Pi_R-\Pi_S$ crosses zero from above.

*[Figure not reproduced here — see JF_MessyReviewCertification_v1.pdf]*
Certification quality and certification value. Panel (a) plots the certification premium under strict and scalable evaluation against the share of high-quality papers. Panel (b) plots mean quality in the certified pool. The parameters are $p=0.25$, $\alpha=0.75$ and $\beta=0.20$, giving $\pi^*=0.410$. Parameter values are illustrative, not calibrated.

Figure [1](#fig:wedge) displays the wedge between certification quality and certification value. Strict verification produces the cleaner certified pool at every prior: $P_C^R=1>P_C^S$. Above the crossing, however, scalable evaluation produces the larger premium. The claim is therefore not that noisy review is more accurate; it is that accuracy alone does not order the private value of a common stamp.

A useful special case makes the threshold transparent. Suppose the journal certifies every application not assigned intensive review, so $\alpha=\beta=1$. Equation [\[eq:K\]](#eq:K) reduces to
$$
\begin{equation}
 \operatorname{sign}(\Pi_R-\Pi_S)=\operatorname{sign}(1-2\pi).
 \label{eq:half}
\end{equation}
$$
Strict verification is more valuable exactly when fewer than half the completed papers are high quality. This benchmark is worth stating separately. A journal that certifies its overflow without reading it is doing the least discriminating thing available, and even then the strict alternative wins only while good papers are in the minority. Where the boundary sits for a screen that does discriminate is not settled by this case. It is settled by Corollary [1](#cor:performance): raising the true-positive rate lowers the crossing and raising the false-positive rate raises it, so the threshold can lie on either side of one half depending on how well the scalable technology performs.

Two clarifications bound the result. First, $\Pi$ is a private posterior-price difference. Welfare, the amount of information produced, mean certified quality and editorial cost are separate objects, and maximising the premium is not an editorial objective the model endorses. The premium is not the certifier’s income either. Suppose the display fee is pushed towards its supremum $\Pi$; every certified author pays it, so revenue approaches $m\Pi$. Write $m_R$ and $m_S$ for the certified shares under the two regimes. Scalable evaluation certifies a weakly larger share of both quality types, so $m_S\geq m_R$, and it separates the types at least as sharply, so $d\geq p$. By equation [\[eq:premium\]](#eq:premium) the product $m\Pi$ equals $\pi(1-\pi)(x_H-x_L)/(1-m)$, which is weakly larger under scalable evaluation on both counts: the larger certified share shrinks the denominator, and the sharper separation raises the numerator. Its limiting revenue therefore weakly exceeds strict review’s at every prior. The crossing concerns value per certificate, not fee income. Second, the proposition compares regimes for a fixed cohort of completed papers. With a positive submission cost and a fixed net premium, strict review exerts stronger positive selection among authors. Near the crossing, the resulting composition effect can overturn the baseline ranking. Appendix [9](#app:extensions) characterises this extension.

# Pedigree and the incidence of certification

The market may observe author characteristics as well as the journal’s stamp. To study that case, suppose authors belong to two public pedigree groups $b\in\{B,0\}$ with conditional high-quality shares $0<\pi_0<\pi_B<1$. Pedigree may stand for institutional affiliation, membership in a research network or an established name. Release in a prominent working paper series is the clearest example, and congestion within such a series measurably reduces the attention each paper receives (Lusher et al. 2023). The prior difference is a statistical association with quality, not taste-based discrimination. The question is one of incidence, in the sense the word has in tax theory: on whose prices do the consequences of the regime choice fall? Review is blind: intensive-review reach and scalable-screen error rates do not depend on $b$. Blindness is a policy some journals have adopted and tested (Blank 1991), and the results below show what it does not accomplish. Because the market observes pedigree, all previous posterior formulas apply separately within each group after replacing $\pi$ by $\pi_g$.

The effect of review on an uncertified paper is summarised by a likelihood ratio,
$$
\begin{equation}
 \ell=\frac{\mathop{\mathrm{Pr}}(N\mid q=1)}{\mathop{\mathrm{Pr}}(N\mid q=0)}
 =\frac{1-x_H}{1-x_L}.
 \label{eq:ell}
\end{equation}
$$
For a group with prior $\pi$, the market price of an uncertified paper is
$$
\begin{equation}
 U(\pi;\ell)=\mathop{\mathrm{\mathbb E}}[q\mid N;\pi]
 =\frac{\ell\pi}{1-\pi+\ell\pi}.
 \label{eq:unstamped}
\end{equation}
$$
Strict and scalable evaluation generate
$$
\begin{equation}
 \ell_R=1-p,
 \qquad
 \ell_S=\frac{(1-p)(1-\alpha)}{1-(1-p)\beta}.
 \label{eq:ells}
\end{equation}
$$
When $0\leq\beta<\alpha<1$, $0<\ell_S<\ell_R<1$. A smaller likelihood ratio means that lacking the stamp is more strongly associated with low quality, so scalable uncertified status is stronger negative evidence than strict uncertified status. The reason is that the scalable screen evaluates every overflow paper, whereas strict verification leaves the papers it cannot reach unevaluated.

Define the pedigree-related price gap among uncertified papers under regime $r\in\{R,S\}$ as
$$
W_r=U(\pi_B;\ell_r)-U(\pi_0;\ell_r).
$$
Because the two groups need not be close, the comparison uses a single summary of the pair: the logit midpoint, the prior whose odds are the geometric mean of the two groups’ odds,
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

The proposition stops just short of $\alpha=1$, and the boundary case runs in strict verification’s favour. At $\alpha=1$ the screen passes every good overflow paper, so an uncertified paper under scalable evaluation is known to be low quality, both groups’ uncertified prices are zero and strict verification produces the larger gap for every pair. This is the limit of the stated result, since $\widehat\pi\to1$ as $\alpha\to1$.

The threshold lies above one half for every admissible parameter value, and that gives the result a definite direction whenever good work is the minority. Suppose the two group priors sum to less than one. Then their odds product is below one, the logit midpoint is below one half, and one half is below the threshold. Strict verification produces the larger pedigree-related price gap. A congested certifier working where good work is the minority therefore cannot avoid the following combination: rejecting what it cannot examine keeps its certified pool clean and at the same time raises what an author’s affiliation is worth among the papers it turned away. Scalable evaluation reverses the comparison only when both groups are strong enough to put their midpoint above the threshold.

The result compares market rewards, not the statistical information contained in pedigree. In odds terms, pedigree is worth exactly as much under one regime as under the other, because a blind signal multiplies both groups’ prior odds by the same likelihood ratio:
$$
\begin{equation}
 \frac{\operatorname{odds}(q=1\mid N,B)}
 {\operatorname{odds}(q=1\mid N,0)}
 =\frac{\pi_B/(1-\pi_B)}{\pi_0/(1-\pi_0)}
 \label{eq:oddsinvariance}
\end{equation}
$$
under either regime. The log-odds gap is invariant. Prices are another matter, because the market pays expected quality in levels, and the step from odds to levels is not linear. The slope of the uncertified price with respect to the prior is $\ell/[1-(1-\ell)\pi]^2$. At low priors, a smaller $\ell$ makes this slope flatter: both groups’ prices are pushed towards zero, and the gap between them shrinks. At high priors, a smaller $\ell$ makes the slope steeper, and the gap grows. The threshold $\widehat\pi$ is the prior at which the two slopes are equal.

*[Figure not reproduced here — see JF_MessyReviewCertification_v1.pdf]*
Pedigree and the incidence of certification. Panel (a) plots the price of an uncertified paper against a group’s high-quality share under the two regimes, at the parameters of Figure [1](#fig:wedge). The marked pairs are groups at $(0.20,0.30)$ and $(0.80,0.90)$; the chord between each pair shows the pedigree-related price gap. Panel (b) shades, for every pair of group priors with $\pi_B>\pi_0$, the regime that produces the larger gap. The solid curve is the boundary $\widetilde\pi=\widehat\pi$, the dashed lines mark the premium crossing $\pi^*$ of Proposition [1](#prop:strictness) and the gold point is the pair $(0.50,0.60)$ discussed below. Parameter values are illustrative, not calibrated.

Figure [2](#fig:incidence) draws both halves of the result. In panel (a) the scalable price schedule sits below the strict schedule everywhere, flatter at low priors and steeper at high ones, and the ordering of the two slopes reverses at $\widehat\pi=0.711$. The pair of groups at priors 0.20 and 0.30 is separated by 0.085 under strict verification and by 0.034 under scalable evaluation. The pair at 0.80 and 0.90 is separated by 0.121 under strict verification and by 0.196 under scalable evaluation. Panel (b) extends the comparison to every possible pair of group priors. In most of the plane strict verification produces the larger gap, a consequence of $\widehat\pi>1/2$.

Pedigree is also priced differently inside the stamp. Under strict review, $\mathop{\mathrm{\mathbb E}}[q\mid C,b]=1$ for both groups, so the certified pedigree gap is zero. Under scalable evaluation it is positive exactly when $\beta>0$. The zero gap under strict review follows from the assumption that intensive review is perfect; it need not survive noisy intensive review.

The baseline premium crossing generates a further distributional consequence.

**Corollary 2** (Regime disagreement). *Suppose the crossing $\pi^*$ in Proposition [1](#prop:strictness) is interior. If $\pi_0<\pi^*<\pi_B$, then
$$
\begin{equation}
 \Pi_R(\pi_0)>\Pi_S(\pi_0),
 \qquad
 \Pi_S(\pi_B)>\Pi_R(\pi_B).
 \label{eq:groupdisagreement}
\end{equation}
$$*

An author from the lower-prior group is willing to pay more for the stamp under strict verification; an author from the higher-prior group is willing to pay more under scalable evaluation. If one display fee applies to both groups, the all-submission outcome remains strictly sustained whenever the fee is below the smaller of their two group-specific premiums. The regime choice can therefore have opposing incidence across public pedigree cells even though the review rule treats those cells identically.

The two thresholds answer different questions, and the results combine only when both of their conditions hold at once. The premium crossing $\pi^*$ is compared with a single group’s prior and ranks what the stamp is worth to that group. The pedigree threshold $\widehat\pi$ is compared with the logit midpoint of a pair of groups and ranks the price gap between them among uncertified papers. Suppose both group priors lie below $\pi^*$ and the pair’s midpoint lies below $\widehat\pi$. Then strict verification gives both groups the more valuable stamp and also widens the price gap between them among uncertified papers. For an author in the lower-prior group this is the high-stakes regime: it raises what she gains by being certified and raises what she forgoes by not being. Scalable evaluation compresses both differences.

Neither condition implies the other. The gold pair in Figure [2](#fig:incidence), with priors 0.50 and 0.60, has its logit midpoint at 0.55, below $\widehat\pi=0.711$, so strict verification widens the pedigree gap; yet both priors exceed $\pi^*=0.410$, so scalable evaluation supports the more valuable stamp for both groups. Which threshold is the larger depends on the parameters, and nothing in the model forces the two comparisons to rank the regimes the same way. All of this concerns prices and none of it is a welfare ranking.

# The codified screen in equilibrium

The scalable screen is no longer hypothetical. In August 2026, Refine, an AI referee built by economists to run scalable technical checks (Golub 2026), announced partnerships with two leading publishers in economics. The point where such a tool enters the pipeline decides which of the model’s primitives it changes. Run after acceptance, as a final technical audit, it checks papers that expert judgment has already selected; it then arrives after certification and changes nothing in the comparison above. Run on the overflow, it is the scalable technology of this model. This section asks what happens to that technology when authors hold it too.

Let the screen read a codifiable mark on each manuscript, the outcome of the checks it can run by rule. A high-quality paper carries a passing mark with probability $\alpha$, a low-quality paper with probability $\beta$, and the screen certifies an unreviewed paper exactly when its mark passes. These are the same rates as before, now with a mechanism attached. Suppose the tool that runs the screen is also available to authors before submission: an author can learn the paper’s mark from the tool’s report and pay a cost $\kappa>0$ to repair the codifiable defects the screen would flag. Repair changes the mark and not the quality, because quality is the messy residual that no rule reads. The market observes neither the mark nor the repair, only the stamp, and prices using equilibrium behaviour. Two assumptions keep the exercise honest: the screen is not already trivial (it does not pass everything), and the mark is a property of the manuscript, independent of everything else its author knows once quality is accounted for, learned only from the report.

Under strict verification the repair is worthless. An unreviewed paper is rejected whatever its mark, and a reviewed paper is judged on its quality, which repair does not change. Under scalable evaluation a repaired paper is certified in the overflow event instead of rejected, so every author whose mark fails gains the same amount from repairing: the premium net of the price $f$ paid to display the stamp, when that difference is positive and nothing otherwise, times the chance $1-p$ of facing the screen. That the gain is the same for good and bad papers is the crux. Indifference does not sort good papers from bad ones.

**Proposition 3** (Erosion of the codified screen). *Under scalable evaluation with repair cost $\kappa>0$:*

1.  *The strict-verification premium is unaffected at every $\kappa$.*

2.  *In every equilibrium in which a positive mass of failing-mark papers is repaired and a positive mass is not, the scalable premium equals
    $$
    \Pi_S=f+\frac{\kappa}{1-p}.
    ```*

3.  *Let $\Pi^{\min}$ be the premium when repair reaches every failing-mark low-quality paper and no high-quality one, given in closed form in the appendix. If $\kappa<(1-p)\bigl(\Pi^{\min}-f\bigr)$, the unique equilibrium is full repair: the screen passes everything it reads, scalable evaluation certifies the overflow unfiltered, and $\operatorname{sign}(\Pi_R-\Pi_S)=\operatorname{sign}(1-2\pi)$.*

Part (ii) pins the premium, in every partial-repair equilibrium, at the display price plus the grossed-up repair cost. The logic is an arbitrage argument. If the stamp were worth more than that sum, every flagged author would repair; if it were worth less, none would; a premium consistent with positive masses of flagged papers repairing and not repairing must equal it exactly. Which authors repair is not pinned down. At indifference, and when authors’ own assessments of their work are informative, repair can concentrate on the papers the screen would have caught, and the screen’s effective rates can converge towards each other until it separates nothing, all while the premium stays exactly at the pinned level. Equilibrium disciplines the price of the stamp, not the composition of the pool behind it.

Part (iii) is the limit the introduction promised. When repair is cheap enough, the screen certifies everything it reads, and the choice between regimes reduces to the transparent benchmark of Section 4, equation [\[eq:half\]](#eq:half): strict verification supports the more valuable stamp exactly when fewer than half the papers are high quality. The condition on $\kappa$ can bind only when intensive review reaches enough papers. The requirement, at a display price of zero, is that coverage $p$ exceed $(1-p)(1-\alpha)$, the share of good papers that are in the overflow and fail the screen; at the running parameters one quarter exceeds three sixteenths.

Erosion does not always lower the premium. Whether full repair lowers it is itself a single-crossing comparison: the unfiltered premium is $\pi/[1-p(1-\pi)]$, and when the quadratic recorded in the appendix changes sign inside the unit interval, the unfiltered premium exceeds the intact screen’s above a third threshold $\pi^{u}$. At the running parameters $\pi^{u}=0.581$. Below it the intact screen supports the higher premium, and erosion lowers the premium: at a high-quality share of 0.20 it falls from 0.523 to 0.250. Above it the screen’s false negatives place good papers in the uncertified pool, and erosion raises the premium: at 0.60 it rises from 0.642 to 0.667. The three thresholds of the paper are ordered $\pi^*=0.410$, then $\pi^u=0.581$, then $\hat\pi=0.711$ at these parameters, and the ordering is parameter-dependent.

The same tool can also be priced per manuscript, so that an author buys the report and the repair together without knowing the mark. Then, when the stamp is worth displaying and the screen separates at all, willingness to pay is highest for the authors least confident in their work, because their papers are most likely to fail the screen. Adoption by a confidence cutoff raises the false-positive rate by at least as much as the true-positive rate, and any interior cutoff strictly erodes the screen’s separation. This is the pattern experiments already find: applicants with access to generative AI are harder for employers and investors to screen accurately (Cowgill et al. 2026). None of this denies that repair improves manuscripts along the dimensions a rule can check; the model is silent on that value. What full repair removes is information: a pass mark that everyone holds separates nothing, while the messy quality underneath is unchanged.

Fourie (2026a) reaches the one-half benchmark through growth in submissions while the journal certifies its overflow unread. The erosion limit reaches the same boundary for a fixed cohort, by dissolving the filter instead. When the publisher partnerships were announced, Garicano observed that authors will run the tool before submitting, so that in equilibrium papers “will have passed by it beforehand and the AI referee will find nothing new” (Garicano 2026). In the model the observation is exact in the full-repair equilibrium; short of that, author indifference pins the premium instead.

The remaining channels from AI to the model supply a mapping rather than a prediction, because no channel has an unconditional sign. Let AI capability be $a$, completed-paper volume $n(a)$ and intensive-review capacity $A(a)$. Under random rationing,
$$ math
p(a)=\min\{1,A(a)/n(a)\},
```
where at $p=1$ every paper receives intensive review, the two regimes coincide and the comparison is empty. AI may also alter the high-quality share $\pi(a)$ and scalable-review performance $(\alpha(a),\beta(a))$. The policy boundary is simply
$$
K\bigl(\pi(a);p(a),\alpha(a),\beta(a)\bigr)=0.
$$
This formulation permits both an AI submission flood, which lowers $p$, and AI-augmented review, which raises $A$ or improves $(\alpha,\beta)$. The introduction’s division between codifiable and messy work organises these channels. A tool raises $\alpha$ without raising $\beta$ when it codifies more of the evaluation task, as verification-first proposals intend (You et al. 2026), and the proposition above states the terms on which that gain survives author access to the same tool. It raises $A$ when it saves referees time on the codifiable parts of their work. The messy core, the judgment itself, remains the scarce input. The composition term $\pi(a)$ is the one with no settled sign: the same tools that make submissions harder to screen can also let authors complete projects whose ideas were sound and whose execution was constrained, and the two effects have opposite signs. Whether a particular tool succeeds is an empirical question; the model supplies the sufficient statistics rather than assuming the answer.

Blindness is also an institutional choice. If a scalable evaluator observes author identity and responds directly to affiliation or prominence, as recent LLM experiments suggest (Pataranutaporn et al. 2025), its performance must be indexed by group, $(\alpha_g,\beta_g)$. Section 5 instead identifies the indirect price effect that survives when the journal withholds pedigree from both expert and scalable evaluation. Direct evaluator bias would be an additional channel.

# Conclusion

Does a journal that cannot review everything preserve the value of its stamp by rejecting what it cannot examine? Not always. Strict verification keeps the certified pool clean at every prior. Yet when the scalable screen discriminates well enough, and once high-quality work is common enough, the strict certificate is worth less than the certificate of the noisier scalable regime. The boundary between the two cases is a single crossing in the share of high-quality work, given in closed form by the model, and the model also says when the screen is too weak for that boundary to be reached at all. Nor is the screen a fixed alternative. Because scalable evaluation certifies by rule, authors holding the same rule can pass it, and in every equilibrium in which some pay to do so and some do not, the scalable premium equals the display price plus the grossed-up cost of repair. When repair is cheap enough, the screen certifies everything it reads and the comparison reduces to the transparent benchmark: strict verification supports the more valuable stamp exactly when fewer than half the papers are high quality.

The three thresholds are distinct objects. At the illustrative parameters used throughout, review reaching one in four papers and a screen passing three in four good ones and one in five bad ones, they are strictly ordered: the premium crossing at a high-quality share of 0.410, the erosion threshold at 0.581, the pedigree threshold at 0.711. A journal can then support the more valuable stamp under scalable evaluation, have that premium reduced by author-side repair, and still be the regime that narrows the pedigree gap, all at once. The ordering is parameter-dependent; the point is that the three comparisons need not coincide.

The regime also sets how market rewards depend on pedigree. Even when review is blind, strict verification and scalable evaluation create different uncertified pools. A second closed-form threshold states when strict verification widens the pedigree-related price gap among uncertified work and when scalable evaluation does. Groups on opposite sides of the premium crossing can also rank the two regimes differently. Scarce expert attention therefore has distributional incidence even without preferential evaluation.

The results revise three beliefs. A journal that keeps its stamp scarce by rejecting what it cannot read is not thereby protecting the stamp’s value; wherever the crossing is interior, there are priors at which it is lowering it. Blind review does not settle what pedigree is worth; the rule for the overflow does. And a journal that adopts a well-calibrated screen has not bought a technology with fixed error rates; it has entered an equilibrium in which its own authors’ repair decisions set the rates, and in which, whenever some authors game the screen and others do not, its verdict is worth exactly what evading it costs. The third revision matters most for the debate about adopting these tools: the accuracy a screening tool shows in trials need not be the accuracy, or the value, it keeps in equilibrium.

Together, the results separate three properties of a certifier. The accuracy of certification is a property of the certified pool. The value of certification compares the certified and uncertified pools. The market reward to pedigree compares public author groups within those pools. A review rule changes all three objects, and they need not rank institutions in the same way. The scarce input throughout is the messy one. Expert judgment is the resource the journal cannot scale, and it is also the only evaluation an author cannot pass in advance: when some authors game a codified screen and others do not, its stamp is priced by the cost of the gaming, and no gaming cost exists for judgment. The three thresholds state how institutions allocate the consequences of that scarcity.

That separation is why the argument reaches beyond journals. Any institution that certifies more applicants than it can examine faces the same arithmetic: grant panels, hiring committees, accreditation bodies and rating agencies all issue one public stamp and all ration the expert attention behind it. Each has the same two options for the applications it cannot reach, and each is judged in public by the cleanliness of what it approves. The model says that this standard can misrank institutions, because the pool an evaluator turns away is priced as well. It also says that any check an institution can run by rule, applicants can in time pass by rule, and the price of a certificate built on codified checks can then equal the cost of passing them rather than the quality of what passes. It also says that a certifier can meet the strictest possible standard of even-handedness, examining every applicant blind to who they are, and still change what an applicant’s affiliation is worth. Rationing expert attention is therefore not an administrative decision that leaves the market unchanged. It sets what a credential is worth, and it sets what an author’s affiliation is worth to those who do not hold one.

The results hold for a fixed cohort of completed papers, a single public stamp and competitive posterior pricing. The pedigree result also requires review that is blind to public group identity. If the journal discloses the review route, readers price the two routes separately and the pooling mechanism disappears. If submission is costly, the regimes attract different author pools, and near the crossing this composition effect can reverse the ranking. If evaluation responds directly to pedigree, group-specific review rates add a separate channel. None of the posterior-price comparisons is a welfare or fairness ranking.

What would settle where actual institutions stand relative to the crossing is a paired-assessment design. Version-matched manuscripts would receive both a scalable assessment and an independent intensive expert review; under the model’s gold-standard-review assumption, the pairs identify $(\pi_g,\alpha,\beta)$ within public pedigree cells, and editorial statistics anchor review coverage $p$. RePEc could provide an economics-specific population frame. Publication outcomes alone cannot substitute, because a rejection under capacity rationing need not reveal a paper’s expert-review verdict. Until that evidence exists, the model’s implication is conditional but exact: evaluating a congested certifier requires pricing both the pools its rule creates and the groups that occupy them.

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
whose derivative $2d(1-p)[(\alpha-\beta)\pi-(1-\beta)]$ is strictly negative on $(0,1)$ when the screen is not trivial. Full repair lowers the premium exactly while $J(\pi)>0$. When $J(0)>0>J(1)$, the threshold $\pi^u$ is the unique root of $J$ in $(0,1)$, the smaller root of the quadratic when $\alpha>\beta$; at $p=0.25$, $\alpha=0.75$ and $\beta=0.20$ it equals $0.581$.

# Robustness and boundaries

## Two noisy classifiers

Perfect intensive review is useful for the single-crossing result, but the posterior representation does not require it. For regime $j\in\{R,S\}$ write $c_j=x_{Lj}$ and $d_j=x_{Hj}-x_{Lj}>0$. Then
$$
\begin{align}
 \operatorname{sign}(\Pi_R-\Pi_S)=\operatorname{sign}\{&
 d_Rc_S(1-c_S)-d_Sc_R(1-c_R) \notag\\
 &+2d_Rd_S(c_R-c_S)\pi
 +d_Rd_S(d_R-d_S)\pi^2\}. \label{eq:arbitrary}
\end{align}
$$
To obtain this expression, apply Lemma [1](#lem:premium) with $m_j=c_j+\pi d_j$ and expand $d_Rm_S(1-m_S)-d_Sm_R(1-m_R)$. Two arbitrary binary classifiers can generate at most two isolated interior crossings unless their premiums coincide. The assumption that intensive review is perfect sharpens this to at most one isolated crossing.

## Targeted intensive review

Suppose a pre-review signal assigns intensive review with probabilities $r_H$ and $r_L$ for high- and low-quality papers. Strict verification has $(x_H^R,x_L^R)=(r_H,0)$, whereas scalable evaluation has
$$
x_H^S=r_H+(1-r_H)\alpha,\qquad
 x_L^S=(1-r_L)\beta.
$$
Define $c=(1-r_L)\beta$ and $d=x_H^S-x_L^S$. Direct substitution gives
$$
\begin{equation}
 \operatorname{sign}(\Pi_R-\Pi_S)=\operatorname{sign}
 \{c(1-c)-2cd\pi+d(r_H-d)\pi^2\}. \label{eq:targeted}
\end{equation}
$$
If
$$
(1-r_H)\alpha\geq(1-r_L)\beta,
$$
then $d\geq r_H$ and the expression in braces is weakly decreasing in $\pi$. Unless the two regimes coincide, the one-crossing result survives. If the condition fails, a global one-crossing claim is false in general.

## Continuous quality

Let $q$ have any integrable distribution and let $x(q)=\mathop{\mathrm{Pr}}(C\mid q)$, with $m=\mathop{\mathrm{\mathbb E}}[x(q)]\in(0,1)$. Then
$$
\begin{equation}
 \mathop{\mathrm{\mathbb E}}[q\mid C]-\mathop{\mathrm{\mathbb E}}[q\mid N]
 =\frac{\mathop{\mathrm{Cov}}(q,x(q))}{m(1-m)}. \label{eq:covariance}
\end{equation}
$$
Indeed, the difference between $\mathop{\mathrm{\mathbb E}}[qx(q)]/m$ and $\{\mathop{\mathrm{\mathbb E}}[q]-\mathop{\mathrm{\mathbb E}}[qx(q)]\}/(1-m)$ equals the right-hand side. The binary model is therefore the pass–fail version of a general covariance identity.

## Selective entry

Let submitting cost $k>0$ and private assessments have distribution $F$. For a candidate cutoff $t$, authors with $\theta\geq t$ submit. Define
$$
M_C(t)=\int_t^1s(\theta)\,dF(\theta),\qquad
 Q_C(t)=x_H\int_t^1\theta\,dF(\theta),\qquad
 \bar\theta=\int_0^1\theta\,dF(\theta).
$$
The premium is
$$
\begin{equation}
 \Pi(t)=\frac{Q_C(t)}{M_C(t)}
 -\frac{\bar\theta-Q_C(t)}{1-M_C(t)}, \label{eq:entrypremium}
\end{equation}
$$
and an interior cutoff satisfies
$$
\begin{equation}
 s(t)[\Pi(t)-f]=k. \label{eq:entrycutoff}
\end{equation}
$$
With fixed intensive-review capacity $A$, coverage becomes $p(t)=\min\{1,A/[1-F(t)]\}$. Holding the net premium fixed, strict verification gives low-assessment authors a smaller chance of certification and therefore induces stronger positive selection. This composition effect coexists with the baseline outside-pool effect and may reverse its ranking near the zero-cost crossing. The main proposition should consequently be read as the direct certification effect for a fixed completed-paper cohort, not as an unconditional ranking of optimal journal policies.

# References

Acemoglu, Daron, Dingwen Kong, and Asuman Ozdaglar. 2026. *AI, Human Cognition and Knowledge Collapse*. Working Paper No. 34910. National Bureau of Economic Research. <https://doi.org/10.3386/w34910>.

Agrawal, Ajay K., John McHale, and Alexander Oettl. 2026. *AI in Science*. Working Paper No. 34953. National Bureau of Economic Research. <https://doi.org/10.3386/w34953>.

Atasu, Atalay. 2026. *AI and Publication Commons*. Working Paper 2026/11/TOM. INSEAD. <https://doi.org/10.2139/ssrn.6393158>.

Ball, Ian. 2025. “Scoring Strategic Agents.” *American Economic Journal: Microeconomics* 17 (1): 97–129. <https://doi.org/10.1257/mic.20230275>.

Blank, Rebecca M. 1991. “The Effects of Double-Blind Versus Single-Blind Reviewing: Experimental Evidence from The American Economic Review.” *American Economic Review* 81 (5): 1041–67.

Card, David, and Stefano DellaVigna. 2013. “Nine Facts about Top Journals in Economics.” *Journal of Economic Literature* 51 (1): 144–61. <https://doi.org/10.1257/jel.51.1.144>.

Card, David, and Stefano DellaVigna. 2020. “What Do Editors Maximize? Evidence from Four Economics Journals.” *Review of Economics and Statistics* 102 (1): 195–217. <https://doi.org/10.1162/rest_a_00839>.

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

Garicano, Luis. 2026. *The Introduction of AI Refereeing in the Publication Process Is the Start of a Momentous Change in Science*. Post on X, 6 August 2026, <https://x.com/lugaricano/status/2085352430707855364>.

Garicano, Luis, Jin Li, and Yanhui Wu. 2026. *Messy Jobs: The Work That AI Cannot Reach*. Upriver Press.

Gartenberg, Claudine, Sharique Hasan, Alex Murray, and Lamar Pierce. 2026. “More Versus Better: Artificial Intelligence, Incentives, and the Emerging Crisis in Peer Review.” *Organization Science* 37 (3): 795–812. <https://doi.org/10.1287/orsc.2026.ed.v37.n3>.

Golub, Benjamin. 2026. *Announcement of Refine Partnerships with Two Leading Publishers in Economics*. Post on X, 6 August 2026, <https://x.com/ben_golub/status/2085261590874529905>.

Hakobyan, Zaruhi. 2026. *Buying the Right to Monitor: Editorial Design in AI-Assisted Peer Review*. Working Paper 2604.23645. arXiv. <https://doi.org/10.48550/arXiv.2604.23645>.

Harbaugh, Rick, and Eric Rasmusen. 2018. “Coarse Grades: Informing the Public by Withholding Information.” *American Economic Journal: Microeconomics* 10 (1): 210–35.

Heckman, James J., and Sidharth Moktan. 2020. “Publishing and Promotion in Economics: The Tyranny of the Top Five.” *Journal of Economic Literature* 58 (2): 419–70. <https://doi.org/10.1257/jel.20191574>.

Hill, Ryan, and Carolyn Stein. 2025a. “Race to the Bottom: Competition and Quality in Science.” *Quarterly Journal of Economics* 140 (2): 1111–85. <https://doi.org/10.1093/qje/qjaf010>.

Hill, Ryan, and Carolyn Stein. 2025b. “Scooped! Estimating Rewards for Priority in Science.” *Journal of Political Economy* 133 (3): 793–845. <https://doi.org/10.1086/733398>.

Huber, Jürgen, Sabiou Inoua, Rudolf Kerschbamer, Christian König-Kersting, Stefan Palan, and Vernon L. Smith. 2022. “Nobel and Novice: Author Prominence Affects Peer Review.” *Proceedings of the National Academy of Sciences* 119 (41): e2205779119. <https://doi.org/10.1073/pnas.2205779119>.

Krieger, Joshua L., Kyle R. Myers, and Ariel D. Stern. 2025. “How Important Is Editorial Gatekeeping? Evidence from Top Biomedical Journals.” *Review of Economics and Statistics* 107 (4): 1159–68.

Kusumegi, Keigo, Xinyu Yang, Paul Ginsparg, Mathijs de Vaan, Toby Stuart, and Yian Yin. 2025. “Scientific Production in the Era of Large Language Models.” *Science* 390 (6779): 1240–43. <https://doi.org/10.1126/science.adw3000>.

Lizzeri, Alessandro. 1999. “Information Revelation and Certification Intermediaries.” *RAND Journal of Economics* 30 (2): 214–31.

Lopez-Lira, Alejandro, and Seyed Mohammad Sina Seyfi. 2026. *One Prompt, One Paper: Optimal Journal Policy and the AI Submission Flood*. Working Paper No. 6337880. SSRN. <https://doi.org/10.2139/ssrn.6337880>.

Lusher, Lester, Wenni Yang, and Scott E. Carrell. 2023. “Congestion on the Information Superhighway: Inefficiencies in Economics Working Papers.” *Journal of Public Economics* 225: 104978. <https://doi.org/10.1016/j.jpubeco.2023.104978>.

Mullainathan, Sendhil, and Ashesh Rambachan. 2025. “Science in the Age of Algorithms.” In *The Economics of Transformative AI*, edited by Ajay K. Agrawal, Erik Brynjolfsson, and Anton Korinek. University of Chicago Press.

Pataranutaporn, Pat, Nattavudh Powdthavee, and Pattie Maes. 2025. *Can AI Solve the Peer Review Crisis? A Large-Scale Experiment on LLM’s Performance and Biases in Evaluating Economics Papers*. Discussion Paper No. 17659. IZA Institute of Labor Economics.

Pollrich, Martin, and Roland Strausz. 2024. “The Irrelevance of Fee Structures for Certification.” *American Economic Review: Insights* 6 (1): 55–72.

Stahl, Konrad, and Roland Strausz. 2017. “Certification and Market Transparency.” *Review of Economic Studies* 84 (4): 1842–68.

You, Lei, Lele Cao, and Iryna Gurevych. 2026. *Preventing the Collapse of Peer Review Requires Verification-First AI*. Preprint 2601.16909. arXiv. <https://doi.org/10.48550/arXiv.2601.16909>.

Zapechelnyuk, Andriy. 2020. “Optimal Quality Certification.” *American Economic Review: Insights* 2 (2): 161–76.

Zollman, Kevin J. S., Julian Garcia, and Toby Handfield. 2024. “Academic Journals, Incentives, and the Quality of Peer Review: A Model.” *Philosophy of Science* 91 (1): 186–203. <https://doi.org/10.1017/psa.2023.81>.

[^1]: Department of Economics, Stellenbosch University. Email: <johanf@sun.ac.za>.

[^2]: Many conversations have informed this paper. I particularly appreciate thoughtful discussions with Rulof Burger, Helanya Fourie, Willem Fourie, Jesse Naidoo, Matthew Olckers, Melt van Schoor and Marisa von Fintel, and the many reader comments on ourlongwalk.com on this and related issues. I chose the question, assumptions and argument. Anthropic’s Claude Code and OpenAI’s Codex assisted with derivations, drafting, literature search, computational verification and adversarial review. I reviewed every claim and remain responsible for all errors. Cite this paper as: Fourie, Johan. 2026. “Messy Review: Certification Value and the Return to Pedigree.” Working Paper, Department of Economics, Stellenbosch University.
