---
abstract: |
  We study selection into the Great Trek, the 1835–1840 migration of 12,000–14,000 Dutch-speaking colonists from the Cape Colony into southern Africa’s interior. Linking Voortrekker genealogies to the 1825 census and slave-compensation records, we find that within districts linked trekking households were larger, with more children, a similar census asset index, and fewer enslaved people. Married couples’ overrepresentation among linked households explains much of the demographic difference. Owners with greater emancipation losses were not detectably more likely to trek. Consistent with Hirschman’s distinction between grievance and exit, linked Trekkers were established frontier families rather than the most exposed slaveholders.
author:
- Johan Fourie[^1]
- Calumet Links[^2]
bibliography: references.bib
reference-section-title: References
title: Selection into the Great Trek[^3]
---

> Figures and typeset tables are omitted from this Markdown version.
> The complete paper, with all figures, is in JF_CL_SelectionIntoThe_v5.pdf.


**Keywords:** migration selection; Cape Colony; Hirschman; slavery; partible inheritance

**JEL codes:** N37; J61; C45; O15

# Introduction

Between 1835 and 1840, an estimated 12,000 to 14,000 Dutch-speaking colonists left the Cape Colony and moved into the interior of southern Africa. The movement was large, roughly a fifth of the colony’s European population, and its consequences were lasting. It led to the formation of settler polities beyond British jurisdiction, intensified conflicts over land and labor across the interior, and changed the political organization of the subcontinent (Walker 1934; Muller 1974; Giliomee 2003). Yet a simple puzzle about the Voortrekkers has never been resolved with systematic evidence. They were not the colony’s richest inhabitants, since the south-western wine farmers and large slaveholders overwhelmingly stayed. Nor were they its poorest, who lacked the wagons, oxen and supplies the journey demanded. What, then, distinguished those who left from those who stayed?

We show that, among linked households, household composition distinguished them more clearly than the assets the census records, and that it did so largely through the family. Using machine-learning record linkage (Feigenbaum 2016; Abramitzky et al. 2021), we match Voortrekker genealogies to the 1825 Cape Colony census (*opgaafrolle*) on the names of husbands and wives, and separately to the British slave compensation records compiled by Ekama et al. (2021). Within districts, Trekker households were larger than the households that stayed, by about 0.7 persons and 0.5 children, a difference that survives clustering by district and corrections for multiple testing. Among linked households, much of it reflects the higher share of married couples. Married couples headed 82 percent of linked Trekker households but 65 percent of other households in the same districts, a gap that may reflect the linkage’s preference for married men. Trekkers were not wealthier than their neighbors on a census index of assets and production, but they held fewer enslaved people and Khoekhoe workers and sowed less wheat, while their herds were as large. This is the profile of established frontier families with recorded assets in the middle of their districts’ distribution, held in mobile rather than sunk form.

The finding is consistent with a long-standing interpretation. Keegan (1996) and Muller (1974) placed land scarcity and the expansionary logic of pastoral production at the center of the Trek’s material causes, and Venter (1985) described a “hunger for land” after the shift to expensive quitrent tenure in 1814. The demographic-pressure account has never, however, been tested against individual-level data.

The most prominent alternative centers on slave emancipation, which the Afrikaner nationalist tradition treated as central to the Trek (Van Jaarsveld 1951; Muller 1974). If financial exposure to emancipation drove the migration, and outweighed the cost of leaving slave-dependent farms behind, the more exposed owners should have been more likely to trek. Using the compensation records, we find that within districts owners with larger proportional losses were not detectably more likely to trek, and that Trekker owners held fewer enslaved people, had less slaveholding wealth and lost less in absolute terms than other owners in the same district. Within districts the estimated association between proportional loss and trekking is small and, if anything, negative. Whatever its force as ideology, the narrow financial version of the emancipation narrative, in which recorded losses selected owners into the Trek, is not supported by these data.

These findings are consistent with Hirschman’s ((1970)) framework, in which exit is exercised not by those most aggrieved by institutional change but by those for whom exit is cheapest. Trekker households held assets that could move, such as herds, wagons and family labor, rather than the immobile infrastructure of the slave economy, and the largest slaveholders, for whom exit was costliest, stayed. We do not observe exit costs directly and offer this as an interpretation of the selection pattern rather than a test of it. The ideological grievances voiced by Anna Steenkamp and in Retief’s manifesto were plausibly shared across the frontier, but measured financial exposure to emancipation did not detectably predict who acted on them.

The paper makes two contributions. The first is to the historiography of the Great Trek. Successive generations of scholarship have proposed land scarcity, emancipation, frontier insecurity, racial equalization and the demand for self-governance as the decisive cause (Van Jaarsveld 1951; Muller 1974; Keegan 1996; Legassick 2010; Giliomee 2003), and we provide the first systematic quantitative test. Linked Trekker households were larger, as the demographic-pressure account holds, and the difference operated mainly through the family, since established married households were overrepresented among them. The result on emancipation also contributes to a wider literature. The British program of 1833–34 is one of the best-documented episodes of compensated expropriation in modern history (Draper 2010; Hall et al. 2014), yet individual-level evidence on whether the most exposed elites exit has been unavailable. At the Cape the largest slaveholders stayed, and within districts owners with larger recorded losses were not detectably more likely to leave. Hirschman’s distinction between exit, voice and loyalty, applied here for the first time to the Great Trek, distinguishes the intensity of grievance from the capacity to leave and reconciles the older material and ideological accounts.

The second contribution is to the economic history of migration selection. Selection is shaped by origin constraints, destination opportunities and the costs of movement (Hatton and Ward 2024), and by the dimension along which it is measured (Leopold et al. 2025). Linked microdata show patterns that vary across settings, from negative wealth selection among European emigrants to the United States (Abramitzky et al. 2012) to occupational upgrading in Argentina (Pérez 2017), positive selection in the Great Migration of African Americans (Collins and Wanamaker 2014, 2015; Derenoncourt 2022) and neutral to slightly negative selection among native-born US internal migrants (Zimran 2024); see also Conor (2019), Beltrán Tapia and Miguel Salanova (2017), Dribe et al. (2022) and Hanson et al. (2023). A related literature studies forced movement (Becker et al. 2020) and the legacies of settler migrations (Natkhov and Vasilenok 2021; Blum et al. 2022; Leeuwen and Maas 2022; Bazzi et al. 2023). The Great Trek adds an African case and an early one, predating the settler migrations of the late nineteenth century by two or three generations; the word *trek* entered English through this episode. Selection operated under different transport costs, state capacity and information networks, and on a different unit, because at a pastoral frontier the decision belongs to a household whose mix of mobile and immobile assets determines whether exit is feasible.

Section [2](#sec:background) reviews the causes of the Trek debated in the historiography, Section [3](#sec:data) describes the data and Section [4](#sec:results) presents the linkage and the main evidence. Sections [5](#sec:emancipation) to [7](#sec:heterogeneity) test the emancipation hypothesis and examine timing, leaders and destinations, Section [8](#sec:robustness) reports robustness checks and Section [9](#sec:conclusion) concludes.

# Historical Background and Hypotheses

## The Cape Colony and the Great Trek

By the 1820s the Cape Colony had been under British rule for nearly two decades. Its economy was strongly differentiated by region. In the south-western districts, especially the Cape, Stellenbosch and parts of Swellendam and Worcester, production centered on wheat and wine and depended heavily on slave labor (Worden 1985; Ross 1999). These districts were well connected to Cape Town and to export markets.

The eastern and northern frontier districts were organized differently. Livelihoods there depended on extensive stock farming over large semi-arid spaces, recurrent violence and looser ties to the commercial economy of Cape Town (Van der Merwe 1937; Keegan 1996; Legassick 2010). Slaveholding existed on the frontier but on a smaller scale, and many households relied instead on Khoekhoe and other workers under contractual, indentured and informal coercive arrangements (Newton-King 1999; Elphick and Giliomee 1989). If those who trekked came mainly from the pastoral frontier, their interests may have differed systematically from those of the large slaveholders of the south-west.

Frontier households required grazing, water, transport animals and labor, and movement beyond the formal colonial boundary was a long-standing feature of frontier life (Van der Merwe 1937). The Great Trek was therefore an escalation and reorganization of older pastoral movement under new political conditions rather than an abrupt break with a settled order.

The Trek comprised a sequence of departures between 1835 and 1840. The earliest parties, under Louis Tregardt and Hans van Rensburg, left from the northern frontier in 1835. Larger parties followed under Hendrik Potgieter, Gerrit Maritz, Piet Retief and Piet Uys, drawing especially from Graaff-Reinet, Uitenhage, Cradock (Somerset East) and adjacent districts (Walker 1934; Muller 1974; Giliomee 2003). Family, neighborhood and church networks structured these departures. Some Trekkers settled north of the Orange River, others crossed the Drakensberg into Natal and still others moved into the Transvaal, a heterogeneity that is one reason no single cause has been found to fit all Trekkers (Muller 1974; Legassick 2010).

## Causes and Competing Interpretations

Few questions in South African history have attracted as sustained a debate as the causes of the Great Trek. The historiography proposes five main explanations: land scarcity, slave emancipation, labor and racial equalization, frontier insecurity and the Sixth Frontier War, and the desire for self-governance. We review each and state the prediction it implies; our data address the first two most directly.

### Land scarcity and frontier closure

The Cape’s pastoral frontier had been expanding northward and eastward for over a century before the Trek, as *trekboer* movement into the interior followed from a stock-farming economy that required ever-larger tracts of grazing (Van der Merwe 1937). Stock farmers had reached the Gamtoos by the 1770s, and by the 1810s and 1820s graziers were crossing the Orange seasonally. The state followed rather than led, converting movement it could not prevent into revenue through loan-farm fees and then quitrent (Van der Merwe 1937; Venter 1985). By the early nineteenth century the eastern border zone was contested by Xhosa polities, and the Great Trek occurred when a century-old dispersal reached a boundary that was now fixed.

Muller (1974) placed land scarcity at the center of his taxonomy of material causes, documenting that on the northeastern border of the Somerset district four-fifths of landowners had not received their title deeds (*transporte*) despite having paid for them.[^4] Venter (1985) traces the problem to Cradock’s 1814 reform, which replaced the old loan farms with expensive perpetual quitrent. New farms had to be surveyed and titled, a chronic shortage of surveyors left many farmers waiting years for title, and drought and locusts in the early 1830s compounded the pressure. A household that had not yet received its title deed had less to abandon.

Demography compounded the pressure. Frontier families were larger than those in the settled western districts, with more children and more dependants. In a system of partible inheritance, each generation needed new land to sustain the pastoral livelihoods to which they were accustomed. Keegan (1996) stressed that these were not subsistence-level households but pastoral families whose economic logic demanded geographical expansion. When colonial policy foreclosed expansion within the colony, the interior offered an alternative. Sarel Cilliers recorded that he and 72 “householding people who had no land” petitioned the Governor for permission to settle beyond the Orange River, “and it was refused to us”.[^5]

Quantitative evidence from the pre-Trek frontier is consistent with this growing pressure on land. In Graaff-Reinet between 1798 and 1828, the number of children in farming households rose as land grew scarce, with poorer households substituting family for hired labor (Cilliers and Green 2018); larger households were the least likely to leave their district (Nel 2020); and the advantage of early arrivals declined after the 1820s because of competition from capital-rich British immigrants (Cilliers et al. 2023). These studies end where ours begins, with the question of what large pastoral households did once closure foreclosed expansion within the Colony.

Partible inheritance was the default of Roman-Dutch law, transplanted to the Cape in the seventeenth century and preserved by the British after 1806. Intestate estates were divided equally among children, with the surviving spouse retaining half under community of property, and testamentary practice among colonists followed the same convention. The rule persisted because, in a pastoral economy with abundant grazing and self-reproducing livestock, a father could endow several sons without fragmenting a fixed asset. It began to bind only when land could no longer readily be acquired within the colony, which is what the quitrent reform, the surveyor bottleneck and the fixed boundary accomplished in the two decades before the Trek.

Why did land-constrained families migrate rather than have fewer children? Gay et al. (2026) show that where egalitarian inheritance was *imposed* on an already closed land frontier, as in France after 1793, completed family size fell by roughly half a child as families sought to avoid fragmenting land among heirs. At the Cape the sequence was reversed. Partible inheritance was the long-standing default and the frontier had been open, so expansion had always been the cheaper margin. Closure then arrived within a single generation, faster than fertility norms adjust, and grazing at negligible cost lay immediately beyond the boundary. Exit, on this reading, was the Cape’s substitute for the fertility decline observed in France.

The *pull* of the interior was equally important. The *Mfecane* had depopulated large areas of the highveld and Natal (Etherington 2001), although the “empty lands” narrative has been contested as partly a colonial construction that legitimized settler seizure (Cobbing 1988; Hamilton 1998; Wright 2010); the interior was not empty, and Voortrekker settlement displaced African polities from the outset. For the migration decision, what mattered is that the interior offered grazing at negligible cost compared with the Colony’s increasingly expensive quitrent farms. As one of us has argued elsewhere (Fourie 2022), this price gap created a strong pull for large pastoral households whose demographic profile made them the most land-constrained within the existing colonial boundaries.

*Testable prediction:* If land scarcity and demographic pressure drove the migration, Trekkers should have been drawn from larger, more land-constrained households, with more children, more dependants and a greater need for grazing. The prediction has two parts, which we examine among linked households. Larger households may have trekked because established married households, with heirs to provide for, were more likely to leave than single men, widows and the heads of other small households; or because, among comparable married households, those with more children left at higher rates.

### Slavery, emancipation and compensation

The Slavery Abolition Act of 1833, implemented from 1 December 1834, freed approximately 39,000 enslaved people in the Cape Colony, who remained bound to their former owners as apprentices until December 1838. Compensation was determined centrally in London and proved substantially below Cape valuations, with many farmers receiving as little as a fifth of what they expected (Draper 2010; Binckes 2013).

The Afrikaner nationalist school, articulated most influentially by Muller (1974) and Van Jaarsveld (1951), treated emancipation as central to a broader story of colonial encroachment, and contemporary anger was intense. Governor Napier confirmed the centrality of this grievance to Glenelg: “Great numbers are highly discontented at the abolition of slavery… a vast body make great complaints, and give it as a reason for emigrating.”[^6]

The most quoted statement on slavery and racial equalization is the testimony of Anna Steenkamp, Piet Retief’s niece: “The shameful and unjust proceedings with reference to the freedom of our slaves; and yet it is not so much their freedom that drove us to such lengths, as their being placed on an equal footing with Christians, contrary to the laws of God and the natural distinction of race and religion.”[^7] Steenkamp distinguishes explicitly between emancipation itself and the principle of racial equalization, and assigns greater weight to the latter.

Yet there is contemporary evidence to the contrary. As early as January 1834, Civil Commissioner Campbell reported that farmers were planning to leave the colony with the people they enslaved, but added that “assuredly the emancipation of the Slaves although it may be made as a pretex, has no influence on this movement, for out of the number who have been named to me as intending to depart, one only is a Slave owner”.[^8] Campbell’s observation, that emancipation was invoked as a justification by people with little direct exposure to it, motivates the empirical question. The rhetoric of grievance was shared; the economic exposure may not have been.

*Testable prediction:* If financial exposure to emancipation was the principal driver, and the incentive it created outweighed the cost of abandoning slave-dependent production, Voortrekkers should have been at least as heavily invested in slavery as those who stayed. Compensation records allow a sharper test. Conditional on the scale of ownership, did owners who received worse terms (a larger gap between valuation and payment) leave at higher rates? Neither test can separate weak financial motivation from strong motivation held back by the cost of leaving.

### Labor, equalization and British administration

A third cluster of grievances concerned the British reform of labor relations, above all Ordinance 50 of 1828, which granted legal equality to the Khoekhoe and other free persons of color, removed pass restrictions and limited employers’ coercive powers (Macmillan 1929; Marais 1939; Du Toit and Giliomee 1983). Liberal and revisionist historians placed this at the center of the story (Macmillan 1927, 1929; MacCrone 1937), and Marais (1939) wrote that “In its most important and most distinctive aspect the Great Trek was nothing else than the rebellion of the Boers against the ideas of the philanthropists.”

Before Ordinance 50, *inboeking* (indenture) had given frontier farmers control over Khoekhoe laborers and their children; afterward workers deserted more freely and employers found it harder to compel service.

Racial equalization (*gelykstelling*) was common to these grievances. In April 1834 the Uitenhage Dutch Reformed church council recorded “a great discontent among the congregation because marriage banns of Hottentots are published in the Church”.[^9] Among its members were J. J. Uys, father of Voortrekker leader Piet Uys, and Karel Landman, himself a future trek leader; both trekked within three years.

Retief’s manifesto, published in the *Grahamstown Journal* on 2 February 1837, listed frontier insecurity, dissatisfaction with slave compensation, laws protecting formerly enslaved people, missionary slander, the absence of “proper relations between master and servant” and the wish to govern themselves (Binckes 2013), without singling out any grievance as paramount.

*Testable prediction:* If labor grievances and racial equalization were central, Trekkers should have been disproportionately dependent on the Khoekhoe labor relationships most directly disrupted by Ordinance 50.

### Frontier insecurity and the Sixth Frontier War

The Sixth Frontier War of 1834–1835, the most destructive of the Cape’s border conflicts, coincided with the first departures of the Great Trek. In December 1834, large Xhosa forces invaded the eastern districts. The total capital loss to colonists, in livestock, homesteads and wagons, exceeded £290,000, yet the colonial government returned only £15,801 (Muller 1963).[^10]

Du Toit and Giliomee (1983) argue that the Trek emerged from the cumulative economic, political and psychological insecurities of a closing frontier. The war’s aftermath compounded the grievance when Lord Glenelg reversed D’Urban’s annexation of the Province of Queen Adelaide, returning to the Xhosa the territory the frontier farmers had fought for (Giliomee 2003; Binckes 2013).

*Testable prediction:* If frontier insecurity was paramount, selection should be strongest in the most war-affected districts. More broadly, frontier war losses should show up as negative wealth shocks among those who trekked.

### Self-governance and political autonomy

A desire for political autonomy was common to all of these grievances; the representative government that colonists had petitioned for was not granted until 1853. Colonists from Winterberg and Koonap ascribed “all these evils to one only cause, namely, the want of a representative government.”[^11] Van Jaarsveld (1951) interpreted the Trek as part of a struggle for republican government, though he later acknowledged that national self-consciousness may have been “rather a consequence than a cause” of the Trek.

Of the five causes, emancipation is the one we can test most directly, because slaveholding is recorded in the 1825 census and the compensation records measure each owner’s financial exposure. Our data also address the demographic hypothesis. Self-governance and religious grievances cannot be tested directly, but the economic and demographic profile of those who trekked informs that debate as well.

# Data

Our analysis draws on three sources: the 1825 Cape Colony census, Voortrekker genealogical records and the slave compensation records held at the UK National Archives. Figure [1](#fig:map) shows how the Voortrekker records are distributed across the districts of 1825, with most in the eastern frontier districts of Somerset, Graaff-Reinet, Uitenhage and Beaufort.

*[Figure not reproduced here — see JF_CL_SelectionIntoThe_v5.pdf]*
*Notes*: Districts are shaded by the number of Voortrekker genealogical records originating there (source: Voortrekker genealogies). The inset locates the Cape Colony at the southern tip of Africa. Colesberg (58 records), established only in the 1830s, is included in the Graaff-Reinet total ($n = 210$). Cradock (30 records) is included in the Somerset total ($n = 421$), as Cradock was renamed Somerset in 1825. Clanwilliam (14 records) is included in the Worcester total ($n = 28$), as it fell within Worcester’s 1825 boundary.

*Alt text*: Map of the 1825 Cape Colony districts shaded by number of Voortrekker records, darkest in Somerset and Graaff-Reinet.

Voortrekker Records by District of Origin, Cape Colony 1825

## The 1825 Opgaafrolle

The Opgaafrolle were annual returns (“declarations”) submitted by household heads throughout the Cape Colony for purposes of taxation and administration. For 1825, we have digitized returns from 11 districts: Albany, Beaufort, Cape, Clanwilliam, George, Graaff-Reinet, Somerset, Stellenbosch, Swellendam, Uitenhage and Worcester.[^12]

The returns record each household head by name and, in every district, the wife’s name, either beside the husband’s or on the line beneath it. We parse the names of heads, wives and widows from the returns. 6,385 households record a named wife, 1,013 are headed by a woman, and 13 entries are left unresolved (Appendix [10](#sec:app_methodology)). We call a household a *married couple* when its head is a man and the return names his wife. Economic variables include counts of livestock by type, enslaved people and Khoekhoe servants, and agricultural output (wheat sown and reaped, wine and brandy). Household composition is recorded as the number of settler men, women, sons and daughters; children appear as counts of sons under 16 and daughters under 20, so their individual ages are not observable. Blank quantities are read as zero, as in the original returns, while unresolved annotations and source anomalies are left missing. The analysis sample contains 10,783 households.

Because the census records quantities rather than values, and no household-level prices survive, we summarize economic standing with a census index of assets and production, which we call the *wealth index*, the first principal component of nine standardized stock and output variables (horses, cattle, sheep, goats, pigs, enslaved people, Khoekhoe workers, wheat reaped and wine). It explains 38.9 percent of their joint variance, loads most heavily on horses, cattle, Khoekhoe workers and enslaved people, and has a standard deviation of 1.87 in the 10,755 households with complete inputs. It weights quantities by their covariance rather than their value and omits land, buildings and vines, so it measures the assets and output the census records, not total wealth. Descriptive statistics are in Appendix [11](#sec:app_design_tables).

Table [7](#tab:match_rates) reports Voortrekker records and match rates by district of origin. Somerset, Uitenhage, Graaff-Reinet and Beaufort account for most origins, while Stellenbosch (5 records) and Worcester (28) contributed almost none.

Figure [2](#fig:district_chars) maps four district characteristics. The main Trek origins had fewer enslaved people and more children per household than the Cape and Stellenbosch, while the wealth index does not follow a simple west–east gradient.

*[Figure not reproduced here — see JF_CL_SelectionIntoThe_v5.pdf]*
*Notes*: Panel (a) shows mean numbers of enslaved people per household from the 1825 *opgaafrolle*. Panel (b) shows mean compensation loss (valuation minus compensation, in pounds sterling) per slave owner from the compensation records (Ekama et al. 2021). Panel (c) shows the standardized wealth index defined in Section [3](#sec:data) (first principal component of nine standardized census stock and output variables). Panel (d) shows mean settler children per household. The Somerset census data come from the Cradock 1823 returns (the district was renamed in 1825). Clanwilliam is included in Worcester and Colesberg is included in Graaff-Reinet.

*Alt text*: Four maps of Cape Colony districts showing mean slaveholding, compensation loss, wealth index and children per household; slaveholding is highest in the south-west and children per household in the eastern frontier districts.

District-Level Characteristics, Cape Colony 1825

## Voortrekker Genealogical Records

The Voortrekker data come from genealogical compilations that identify participants in the Great Trek and their families, recording each person’s name, his wife’s name and maiden surname (where known), birth year, origin district, trek leader, year of departure and destination. The file contains 2,702 rows and 2,313 distinct genealogical identifiers spanning several generations. Retaining records born before 1810 or with unknown birth year leaves 1,609 rows, and requiring usable names leaves 1,220, of which 1,131 have at least one census candidate. The birth-year rule identifies potential household heads at least 15 years old in 1825, but does not establish adult status where dates are unknown or wrong. We treat every linked record as a Trekker, since the compilations define participation by their sources rather than by a fixed window. Of the 569 linked heads, 441 left in 1835–1840, 60 later and 8 earlier, and 60 have no usable departure year; restricting the Trekkers to departures in 1835–1840 leaves the main estimates similar (Appendix Table [15](#tab:sample_checks)).

## Slave Compensation Records

The third source is the slave emancipation dataset compiled by Ekama et al. (2021) from the records of the Office of Registry of Colonial Slaves and the Slave Compensation Commission at the UK National Archives. It contains 36,417 records of enslaved people, each with owner, district, occupation, age and appraised value, matched to the compensation claims processed in London, so that it records both each owner’s assessed slaveholding wealth and what compensation was paid. Compensation was set centrally and varied as a share of Cape valuations (Draper 2010). Linking the Voortrekker records to this dataset by blind review yields 229 owner links (Section [5](#sec:emancipation)).

# Who Were the Voortrekkers?

We link Voortrekker records to the 1825 census in three steps (Appendix [10](#sec:app_methodology)). A random forest classifier (Rijpma et al. 2020), trained on hand-labeled pairs, scores every candidate pair on the similarity of the husbands’ and wives’ names, surname rarity and district. Pairs whose wives’ names agree are accepted at the classifier’s threshold, and no other pair is accepted automatically. Two large language models then review every proposal, every pair near the threshold and a set of supplementary candidate pairs independently, seeing the identity evidence alone. A proposal both accept is linked, the authors decide the pairs that one of them accepts, and pairs that neither accepts are not linked. The final linkage retains 569 of 1,220 named records, one per census household, and on a held-out audit sample all 16 of the classifier’s acceptances are correct (95 percent interval 0.81–1.00), a measure of the classifier rather than of the final links. With 10,214 unlinked households, the analysis sample contains 10,783 households.[^13] Linkage favors married men. Men who had married by the census year are linked at 62 percent and men who married later at 29 percent, because a wife’s name helps to identify a man and because many young unmarried trekkers still lived in their parents’ households. We return to this selection in Section [4.4](#sec:married).

The claim that the Trek was not led by the slaveholding elite has a between-region and a within-district component. The between-region component is settled descriptively, because the south-western wine-and-wheat districts, home to the large slaveholders, contributed almost no trekkers (Figures [1](#fig:map) and [2](#fig:district_chars)). Our regressions address the narrower question that remains. Within the frontier districts that supplied the Trek, who left and who stayed?

Comparing migrants with stayers requires attention to the counterfactual (Abramitzky et al. 2012; Abramitzky and Boustan 2017), because region-level differences can be mistaken for individual selection. We therefore report each outcome under four designs of increasing stringency (Table [1](#tab:main_combined)), namely a comparison with nearest census neighbors, district fixed-effects regressions (our main specification), exact matching within districts, and matching within districts on the number of children. Appendix [11](#sec:app_design_tables) reports each design in full.

## Main Results

|                                          |          |          |       |             |
|:-----------------------------------------|:--------:|:--------:|:-----:|:-----------:|
|                                          |  \(1\)   |  \(2\)   | \(3\) |    \(4\)    |
|                                          | Nearest  | District | Exact | Family-size |
| Variable                                 | neighbor |    FE    | match |    match    |
| tex_fragments/tab_main_combined_body.tex |          |          |       |             |

How Voortrekker Households Differed {#tab:main_combined}

*Notes*: Each cell reports the Voortrekker–non-Voortrekker difference for the row variable under the column design, with the $p$-value in parentheses. Column (1): paired comparison of each matched Voortrekker to the households recorded immediately adjacent in the census (the *opgaafrolle* were compiled geographically, by ward and field cornetcy, so adjacent rows are typically spatially proximate); paired $t$-tests over the 539 of 569 matched households with at least one valid non-Voortrekker neighbor. Column (2): coefficient on the Voortrekker indicator from an OLS regression with district fixed effects and heteroskedasticity-robust (HC1) standard errors; $N \leq 10{,}783$ (up to 569 matched Voortrekker households and 10,214 unlinked households, depending on observed outcomes). Column (3): exact matching on district with subclass weights; differences and $p$-values from weighted regressions with HC-robust standard errors. Column (4): exact matching on district and the exact integer number of settler children; the settler-children row is zero by construction. The wealth index is the first principal component of nine standardized census stock and output variables (Section [3](#sec:data)). Horses and cattle are the census aggregates over all horse and cattle categories. $^{*} p < 0.05$, $^{**} p < 0.01$, $^{***} p < 0.001$. Full per-design tables with group means: Appendix [11](#sec:app_design_tables).

Column (1) compares Voortrekkers with the households recorded beside them. Voortrekkers held fewer enslaved people than their neighbors but no less livestock and no lower wealth index, and their households were larger even in this comparison, although adjacent households in a return compiled by ward were neighbors and often kin. The settler-men difference is mechanical, because the matching sample consists of men while the census includes female-headed households, so we treat it as a check on the matching rather than as a finding, here and in every design that follows.

## Differences within Districts

Because Voortrekkers came disproportionately from frontier districts with different asset and household profiles, raw comparisons conflate selection into the Trek with geographic sorting. Our main specification therefore includes district fixed effects:

$$
\begin{equation}
Y_i = \alpha + \beta \cdot \text{Voortrekker}_i + \sum_{d} \gamma_d \cdot \text{District}_{id} + \varepsilon_i
\end{equation}
$$

where $Y_i$ is the outcome for household $i$, $\text{Voortrekker}_i$ indicates a matched Voortrekker, and $\text{District}_{id}$ denotes district fixed effects. The coefficient $\beta$ captures the within-district difference between Voortrekkers and non-Voortrekkers; standard errors are heteroskedasticity-robust.[^14]

Column (2) of Table [1](#tab:main_combined) presents our main results.

First, Voortrekkers did not score higher than other households in their districts on the census index of assets and production. The wealth-index coefficient is small and insignificant ($-0.072$, or $-0.04$ of a standard deviation), and with heteroskedasticity-robust errors an equivalence test rules out differences larger than 0.10 standard deviations; with errors clustered by district the interval is wider and does not (Appendix [14](#sec:app_equivalence)). The components differ. Voortrekkers held as many horses, cattle and sheep as their neighbors but fewer enslaved people and Khoekhoe workers, and they sowed and reaped less wheat; the differences in counts of enslaved people and in wheat survive correction for multiple testing. Voortrekkers held as much livestock as their neighbors but less invested in slaveholding and arable farming, and they were of middling wealth for their districts. Few fell in the lowest, asset-poor part of their districts’ distribution (Figure [16](#fig:wealth_dist)).

Second, Voortrekker households were larger and had more children. A Voortrekker household had 0.68 more persons and 0.51 more children than a household in the same district, about 18 and 24 percent of the comparison means. The differences survive corrections for multiple testing, district-clustered inference (Appendix [15](#sec:app_clustered)), exact matching, a comparison with households of the same surname (Table [14](#tab:all_methods)) and restriction of the controls to households with an adult settler man.

Two features of the comparison group deserve attention. Every matched household contains an adult settler man, but some unlinked households do not, and if an adult man was a precondition for trekking these households are poor counterfactuals. Restricting the controls to households with an adult settler man (Table [2](#tab:married), column (2); Appendix [12](#sec:app_male_headed)) removes the settler-men difference, since every Trekker and every control in a district with Trekkers then has exactly one adult man, and reduces the household-size difference by about 14 percent, leaving the composition differences large and precisely estimated. Most of the rest, as we show next, reflects the presence of a married couple.

Figures [3](#fig:coef_plot) and [5](#fig:household) show the standardized differences under every comparison method.

*[Figure not reproduced here — see JF_CL_SelectionIntoThe_v5.pdf]*
*Notes*: Standardized effect sizes (in standard-deviation units) for wealth-related variables across all six comparison methods. Positive values indicate that Voortrekkers had higher values than non-Voortrekkers. Source: 1825 census linked to the Voortrekker genealogies.

*Alt text*: Grouped bar chart of standardized differences in wealth variables under six comparison methods, negative for enslaved people and Khoekhoe workers.

Wealth Differences

## Comparable Households in the Same District

Columns (3) and (4) of Table [1](#tab:main_combined) tighten the comparison by matching Voortrekkers to households in the same district and, in a further step, with the same number of children. Exact matching on district leaves the estimates almost unchanged (column (3)).

Matching also on the number of children compares households at a similar stage of the family life cycle (column (4)). The children difference is then zero by construction and the household-size difference small, so the informative rows are the economic ones. At the same district and family size, Voortrekkers held fewer enslaved people, sowed less wheat and had a lower wealth index than other households.

## Married Households and Family Size

The household-size difference could arise in two ways, corresponding to the two parts of the prediction in Section [2.2](#sec:causes). Married households might have been more likely to trek than single men, widows and other small households, or among married households those with more children might have left at higher rates. Tables [2](#tab:married) and [3](#tab:decomposition) separate the two. Married couples headed 82 percent of Trekker households but 65 percent of other households in the same districts (weighted by the districts’ Trekker households). Controlling for whether a household was a married couple reduces the household-size coefficient from 0.68 to 0.05 and the children coefficient from 0.51 to 0.05. Among married couples alone, Trekker households were 0.13 persons larger, a difference that is not statistically significant (95 percent confidence interval from -0.11 to 0.38).

Because the linkage itself favors married men, the married share among linked Trekkers may overstate their share among all Trekkers by an amount we cannot measure. If the higher linkage rate of men married by the census year reflected linkage alone, the 82 percent among linked Trekkers would correspond to about 67 percent among all Trekkers, close to the controls’ 65 percent; if it reflected only that later-married men did not yet head households, the share would be 82 percent. The married-household margin therefore describes the linked households, and how far married households were overrepresented among all Trekker households is uncertain (Appendix [20](#sec:app_limits)). The within-couple estimate is small and imprecise; it does not establish either additional selection on family size or its absence.

Among linked households, then, the demographic selection we document is in the first instance selection on the family. Linked Trekkers were disproportionately the heads of established married households, and these households, with their dependent children, made Trekker households larger. In the main linkage, married Trekker households also had a lower index than other married households in their districts and held fewer enslaved people (Table [2](#tab:married), column (3)).

|                    |              |                   |                 |
|:-------------------|:------------:|:-----------------:|:---------------:|
|                    |    \(1\)     |       \(2\)       |      \(3\)      |
|                    |     All      | Controls with an  | Married couples |
| Variable           |  households  | adult settler man |      only       |
| Household size     | 0.680\*\*\*  |    0.585\*\*\*    |      0.132      |
|                    | ($<$0.001) |   ($<$0.001)    |     (0.288)     |
| Settler children   | 0.514\*\*\*  |    0.460\*\*\*    |      0.131      |
|                    | ($<$0.001) |   ($<$0.001)    |     (0.293)     |
| Wealth index       |    -0.072    |      -0.097       |  -0.313\*\*\*   |
|                    |   (0.237)    |      (0.113)      |  ($<$0.001)   |
| Enslaved people    | -0.521\*\*\* |   -0.469\*\*\*    |  -0.782\*\*\*   |
|                    | ($<$0.001) |   ($<$0.001)    |  ($<$0.001)   |
| Trekker households |     569      |        569        |       464       |
| All households     |    10,779    |       9,781       |      6,377      |

Household Composition and Wealth: All Households and Married Couples {#tab:married}

*Notes*: Each cell reports the Voortrekker coefficient from an OLS regression with district fixed effects and heteroskedasticity-robust (HC1) standard errors; $p$-values in parentheses. Column (1): main specification (Table [1](#tab:main_combined), column (2)). Column (2): controls restricted to households with at least one adult settler man (Appendix [12](#sec:app_male_headed)). Column (3): Trekker and control households alike restricted to married couples, households headed by a man whose wife is named in the return. Household counts are for household size and children; they differ slightly for the wealth index and enslaved people. $^{*} p < 0.05$, $^{**} p < 0.01$, $^{***} p < 0.001$.

|                                               |  Main linkage   |
|:----------------------------------------------|:---------------:|
| Full-sample coefficient                       |      0.68       |
| Controlling for married couple                |      0.05       |
| Married-household margin share, FE (%)        |       92        |
| Married-household margin share, Kitagawa (%)  |       91        |
| Couples only: coefficient                     |      0.13       |
|                                               |     (0.288)     |
| % confidence interval                         | \[-0.11, 0.38\] |
| Couples among Trekker households (%)          |       82        |
| Couples among controls, district-weighted (%) |       65        |

The Married-Household Margin {#tab:decomposition}

*Notes*: Household size, district fixed effects, HC1 standard errors; $p$-values in parentheses. “Controlling for married couple” adds an indicator for a male-headed household with a named wife. The FE share is one minus the ratio of the controlled to the full-sample coefficient; the Kitagawa share decomposes the within-district gap into the difference in married shares (valued at the controls’ size difference between married and other households) and the differences within the two groups, weighting districts by their Trekker households.

## Interpretation

At the 1825 baseline, then, Voortrekkers were not drawn from the colony’s wealthy elite. The wealth difference is small and insignificant in most designs, negative when households are compared at the same number of children, and in the main specification with heteroskedasticity-robust errors equivalent to zero within 0.10 standard deviations.[^15] What distinguished linked Trekkers was household composition, operating mainly through the family.

The interpretation depends on a distinction between kinds of capital. *Pastoral capital* is livestock together with the household labor required to herd and move it, and its defining property is mobility, since herds could be driven to the frontier and reproduced there. *Mobile capital* adds wagons and portable equipment. *Immobile assets* are vineyards, arable land and farm buildings, none of which could be taken beyond the colonial border. Slave-dependent production belongs with them, since after 1834 the formerly enslaved people were apprentices bound to their owners’ farms until 1838 and the production built on their labor was sunk in place; the 1825 count of enslaved people is a baseline proxy for that investment. The interior offered open grazing at negligible cost, which suited extensive stock farming but offered nothing to a wine or wheat producer whose capital was sunk in place. Family labor belongs in this accounting as the complementary input to livestock, so a large family with fewer purchased assets is not uniformly poorer.

In Roy–Borjas terms (Borjas 1987), the Trek shows little selection on the measured index of assets and production, negative selection on immobile assets and positive selection on household demography. The Cape rewarded immobile, slave-dependent agriculture and the interior rewarded land-extensive pastoralism, so a comparative-advantage reading predicts selection on households with little capital sunk in place. Selection on household composition requires a further assumption, that family labor raised the return to pastoral farming in the interior by more than it raised the cost of moving. Within districts, Trekkers held the mobile assets of the frontier economy in equal measure and the immobile ones in smaller measure.

In Hirschman’s terms (Hirschman 1970), the largest slaveholders, whose exit costs were highest, stayed, many adapting by shifting to wage labor (Worden 1985; Ross 1999). We use the framework to synthesize the pattern, not to derive it, because the low-exit-cost group is identified by the assets of those who left.

#### The ten-year gap.

The 1825 census predates the Trek by a decade, during which the Cape experienced Ordinance 50, the Sixth Frontier War and emancipation. A middling pastoral household in 1825 could have been destitute by 1835, so the 1825 comparison would not show negative wealth selection at departure. The gap matters less for the composition finding, because household composition may be more persistent over a decade than livestock or crops. Children age, and some leave, but a household with many children in 1825 typically had sons approaching the age at which partible inheritance and the land constraint bind by 1835, whereas herds could be raided and harvests lost. Appendix [20](#sec:app_limits) discusses the remaining concern, differential exposure to the war within districts.

#### Demographic pressure.

Linked Trekkers were disproportionately established married households, while among married households the additional difference in family size is small and imprecise. Three channels are consistent with this pattern. Under partible inheritance, a married household with children faced the division of its land among heirs once the frontier closed. Trekking required adult sons to drive wagons and manage herds, so a household with a wife and children may have mounted a trek more readily than a single man. And brothers followed brothers, so that kinship structured trek parties (Keegan 1996). Our data cannot distinguish these channels, although Trekker households were larger than both their neighbors and same-surname households in their districts, so the premium is not merely a difference between localities or kin groups. Nor can the data separate demographic pressure from the life cycle, or test the fertility margin raised by the comparison with France, because the census records no ages and children only as counts, and the genealogies offer no comparison group of stayers.

#### The Khoekhoe-labor channel.

The labor-grievance prediction implies that Trekkers should have depended disproportionately on the Khoekhoe labor that Ordinance 50 disrupted. Within districts the opposite holds. Trekkers employed fewer Khoekhoe workers than their neighbors, although the difference is not robust to clustering by district, and the positive association across the colony reflects the concentration of Khoekhoe labor in the frontier districts from which Trekkers came. The 1825 worker count is, moreover, a weak proxy for a grievance that centered on the loss of coercive legal control after 1828, so the result is suggestive rather than decisive.

These findings are consistent with the land-scarcity and demographic-pressure channel of the multi-causal historiography (Muller 1974; Du Toit and Giliomee 1983; Keegan 1996) and, within districts, do not support the narrow economic channel of the emancipation narrative. Unlike the negative wealth selection of European emigrants (Abramitzky et al. 2012), linked Trekkers differed in household demography and in the mobility of their assets rather than in the measured index, consistent with Conor (2019)’s point that the practical costs of migration can matter more than wealth.

Figure [4](#fig:conditional) maps the two findings by district. Within-district differences in compensation losses vary in sign, while the children difference is positive in every district shown, including Graaff-Reinet, the district studied in the earlier quantitative literature (Cilliers and Green 2018; Nel 2020).

*[Figure not reproduced here — see JF_CL_SelectionIntoThe_v5.pdf]*
*Notes*: Each panel shows the difference in district means between Voortrekker and non-Voortrekker households (VT minus non-VT). Darker shading indicates larger absolute differences; labels show the signed value. Panel (a) uses the slave compensation records (Ekama et al. 2021): the difference in mean compensation loss (valuation minus compensation, in pounds sterling) per slave owner. Panel (b) uses the 1825 census: the difference in mean children per household. White indicates that the contrast is unavailable: Cape has no linked Voortrekkers in either panel, and in panel (a) Swellendam has no usable compensation-loss means and Worcester no linked Voortrekker owners. Colesberg is included in Graaff-Reinet, Clanwilliam in Worcester and the Somerset census data come from the Cradock 1823 returns.

*Alt text*: Two district maps of Voortrekker-minus-other differences in compensation loss and in children per household; the children difference is positive in every district shown.

Within-District Differences by District

*[Figure not reproduced here — see JF_CL_SelectionIntoThe_v5.pdf]*
*Notes*: Standardized effect sizes (in standard-deviation units) for household composition variables across five comparison methods. Positive values indicate that Voortrekker households were larger on the relevant dimension. In the child-conditioned designs the children difference is zero by construction. Source: 1825 census linked to the Voortrekker genealogies.

*Alt text*: Grouped bar chart of standardized differences in household-composition variables under five comparison methods; household size and children are positive in the designs that do not condition on the number of children.

Household-Composition Differences

# Testing the Slave Emancipation Hypothesis

This section tests the emancipation prediction of Section [2.2](#sec:causes). If financial exposure drove the Trek, and outweighed the cost of leaving, Voortrekkers should have owned more enslaved people than other owners, and those with larger compensation losses should have been more likely to trek. The compensation records compiled by Ekama et al. (2021) allow both tests at the level of the individual owner, recording the number of enslaved people, their appraised valuation and the compensation received.

## Linking to Slave Compensation Records

We link Voortrekker records to the compensation dataset by blind review. Two large language models each examined every genealogy record against all owners with the same surname in the relevant districts, seeing identity evidence alone (names, parentage notes, dates, wives and districts), and chose one owner or none. A record is linked to the owner both chose. Records on which they differ, or whose owner is also chosen for another record, are not linked, and the owners concerned are excluded from the comparison, so that owners selected in unresolved cases are not counted as controls (Appendix [16](#sec:app_lpm)). The review yields 229 links, each to a distinct owner. We compute losses only for owners whose claims pass checks on identity, counts of enslaved people, complete valuations and a unique payment, and we treat missing payments as unknown rather than zero. These checks cannot certify claims whose original payment population is undocumented, and additional named payment recipients alone are not taken as evidence of omitted valuations. The resulting sample contains 2,385 owners with positive valuations, 140 of them linked to trekkers. Within districts, linked owners pass the checks somewhat more often than other owners (Appendix [16](#sec:app_lpm)).

## Slave Ownership Comparisons

*[Figure not reproduced here — see JF_CL_SelectionIntoThe_v5.pdf]*
*Notes*: Raw, unadjusted means per slave owner, with 95 percent confidence intervals, for Voortrekker and non-Voortrekker owners in the compensation records: (a) number of enslaved people, (b) total assessed valuation and (c) absolute loss (valuation minus compensation), each panel on its own scale. These descriptive comparisons do not condition on district; Figure [7](#fig:emancipation_effects) reports district-adjusted differences, including the percentage loss. Source: compensation records (Ekama et al. 2021).

*Alt text*: Three-panel bar chart of mean counts of enslaved people, valuations and losses, lower for Voortrekker owners than for other owners.

Slave Ownership of Voortrekker and Other Owners

*[Figure not reproduced here — see JF_CL_SelectionIntoThe_v5.pdf]*
*Notes*: Standardized district fixed-effects estimates of the difference between Voortrekker and other slave owners, with 95 percent confidence intervals. Source: compensation records (Ekama et al. 2021).

*Alt text*: Coefficient plot of standardized within-district differences between Voortrekker and other slave owners; the intervals for counts of enslaved people, valuation and absolute loss lie below zero.

Slaveholding Wealth and Compensation Losses within Districts

Within districts, Voortrekker slave owners had less at stake than other owners (Figure [7](#fig:emancipation_effects)). They owned fewer enslaved people (by about 0.6), their slaveholding wealth was lower (by about £85) and their absolute losses were smaller (by about £53), while their percentage losses were not detectably different.

The result corroborates the census, in which Voortrekkers held fewer enslaved people under every design. Because both links start from the same genealogical records, we read the agreement as corroboration rather than as independent proof.

## The Compensation Gap

A second channel is the arbitrariness of compensation, because owners of similar scale received different fractions of their assessed valuation (Draper 2010). No other surviving source records both valuation and payment for individual owners.

*[Figure not reproduced here — see JF_CL_SelectionIntoThe_v5.pdf]*
*Notes*: Histograms of the compensation rate (compensation received divided by assessed valuation) for Voortrekker and non-Voortrekker slave owners, scaled to unit area. A lower rate indicates a larger proportional loss. The display shows rates up to about 125 percent; observations above this range enter the statistical comparisons. Source: compensation records (Ekama et al. 2021).

*Alt text*: Overlapping histograms of compensation rates for Voortrekker and other slave owners, both concentrated between 25 and 50 percent.

Compensation Rates of Voortrekker and Other Owners

The compensation rates of Voortrekker and other owners overlap closely (Figure [8](#fig:comp_rate_dist)). A colony-wide rank test finds no significant difference in their proportional losses ($p = 0.100$), and the models below, which compare owners within districts, find none either.

## Does Loss Predict Selection?

We estimate probit models of trekking among slave owners:

$$
\begin{equation}
\Pr(\text{Voortrekker}_i = 1) = \Phi(\alpha + \beta_1 \cdot \text{Loss\%}_i + \beta_2 \cdot \text{NSlaves}_i + \sum_{d} \gamma_d \cdot \text{District}_{id})
\end{equation}
$$

where Loss% is the recorded compensation shortfall as a share of the appraisal, NSlaves controls for the scale of ownership and district fixed effects absorb geographic variation in both Trek propensity and compensation generosity. Holding the scale of ownership constant, $\beta_1$ measures the conditional association between worse terms and trekking. The shortfall does not net out collection costs, discounts on sold claims or delays in payment, which the records do not show, and the records do not date when owners learned their awards, so the models estimate selection associated with the recorded shortfall rather than with losses known before departure.

lD..-1D..-1D..-1D..-1D..-1 & & & & &\
tex_fragments/tab_probit_body.tex

*Notes*: Probit regressions with Voortrekker status (0/1) as the dependent variable, estimated among 2,385 owners with positive valuations whose claims pass the recorded coverage checks. All continuous predictors are standardized (mean 0, SD 1). Model-based standard errors in parentheses. The Cape and Worcester districts have no linked Trekkers; dropping their 331 owners, the limit of the maximum-likelihood estimates with district fixed effects, leaves the coefficients unchanged (Appendix [16](#sec:app_lpm)). Model 4 additionally controls for the standardized mean valuation per enslaved person (coefficient omitted from display; insignificant). $^{*} p < 0.10$, $^{**} p < 0.05$, $^{***} p < 0.01$.

The loss coefficient is close to zero and insignificant in every model, with or without district fixed effects, and whether the number of enslaved people, the compensation rate or log valuation enters (Table [\[tab:probit_emancipation\]](#tab:probit_emancipation)). The scale of slaveholding is the one variable with a consistent sign; owners of more enslaved people were less likely to trek (significant at 5 percent in Models 3 and 4, though not in Model 5, where log valuation also enters).

*[Figure not reproduced here — see JF_CL_SelectionIntoThe_v5.pdf]*
*Notes*: Loss-percentage coefficients with 95 percent confidence intervals from Models 1, 2, 3 and 5 of Table [\[tab:probit_emancipation\]](#tab:probit_emancipation) (Model 4 uses the compensation rate instead). Source: compensation records (Ekama et al. 2021).

*Alt text*: Forest plot of loss-percentage coefficients from four probit models, all with intervals crossing zero.

Emancipation Loss and the Probability of Trekking

Within districts, the estimated association between proportional loss and trekking is small and, if anything, negative. In Models 3 and 5, a one-standard-deviation increase in proportional loss corresponds to a change of less than half a percentage point, against a Trek rate of about 6 percent among owners, and the 95 percent intervals rule out increases larger than about half a point. Larger numbers of enslaved people were associated with lower probabilities of trekking (Table [17](#tab:ame)).

## Loss Intensity

*[Figure not reproduced here — see JF_CL_SelectionIntoThe_v5.pdf]*
*Notes*: Proportion of slave owners who were Voortrekkers, by quartile of percentage loss from emancipation. Q1 contains owners with the lowest percentage loss; Q4 those with the highest. Labels show the Voortrekker rate and number of slave owners in each quartile. The dashed line indicates the overall Voortrekker rate among slave owners. Source: compensation records (Ekama et al. 2021).

*Alt text*: Bar chart of Trek rates by emancipation-loss quartile, highest in the third quartile.

Trek Rates by Emancipation Loss

Across the colony as a whole, Trek rates differ across loss quartiles without a consistent gradient, highest in the third quartile (Figure [10](#fig:loss_quartiles); test of equality $p = 0.005$). Nearly two-thirds of the owners in the lowest-loss quartile lived in Stellenbosch, Worcester and the Cape district, which supplied almost no Trekkers. Within districts the quartile differences are small and jointly insignificant ($p = 0.192$), and the probit and linear probability models estimate no clear linear association (Appendix Table [18](#tab:loss_flex)).

## Interpretation

Within districts, then, we find no detectable association between proportional compensation losses and trekking. Compared with other owners in the same district, Voortrekkers owned fewer enslaved people, had less slaveholding wealth, lost less in absolute terms and did not receive detectably worse terms, and the upper tail of the slaveholding distribution is disproportionately represented among those who stayed. Incomplete claim coverage and the exclusion of owners whose identity the review could not resolve limit the precision of these estimates. Emancipation may have contributed to a general sense of grievance that made emigration legitimate, but we find no support for the specific economic channel in which larger recorded losses selected particular owners within a community into emigrating. As Section [2.2](#sec:causes) notes, this cannot separate weak financial motivation from strong motivation held back by the cost of leaving, and while the upper limits of the probit intervals are about half a percentage point, the quartile comparisons are less precise (the district-adjusted interval for the third against the first quartile reaches 4.5 points).

The result is consistent with Steenkamp’s own distinction between the freedom of enslaved people and their being “placed on an equal footing with Christians”, which gives greater weight to equalization than to material loss (Section [2.2](#sec:causes)); it does not imply that trekkers were generally non-owners. The ideological framing of a grievance need not reflect the economic profile of those who act on it.

# Migration Timing

If exposure to emancipation drove the decision to trek, the most exposed households might have left earlier, and the migration-selection literature emphasizes that selection can change over the course of a migration as networks develop (Conor 2019; Ward 2017). We test whether 1825 wealth, numbers of enslaved people or children predicted the year of departure. Compensation losses are observed only for trekkers linked to reconciled claims, so the test concerns slaveholding, not the compensation gap.

lD..3D..3D..3D..3 & & & &\
tex_fragments/tab_timing_body.tex

*Notes*: OLS regressions with move year as the dependent variable. Sample: matched Voortrekkers with recorded departure years in 1835–1845. All economic variables are standardized (mean 0, SD 1). $p$-values are reported in parentheses. Model 3 additionally controls for standardized cattle and sheep holdings (coefficients omitted from display; both insignificant). Households with missing economic quantities are excluded.

Of the 569 linked households, 500 have a recorded departure year in 1835–1845, and 495 have complete economic inputs. In no specification do wealth, numbers of enslaved people or children have a clear linear association with the year of departure (Table [\[tab:timing\]](#tab:timing)), although the test has limited power.

*[Figure not reproduced here — see JF_CL_SelectionIntoThe_v5.pdf]*
*Notes*: Coefficients from Model 4 of Table [\[tab:timing\]](#tab:timing), in years of departure per standard deviation of each predictor, with 95 percent confidence intervals. Source: Voortrekker genealogies linked to the 1825 census.

*Alt text*: Coefficient plot for wealth, enslaved people and children as predictors of the departure year, all with intervals crossing zero.

Economic Characteristics and the Year of Departure

Recent arrivals might hold less accumulated wealth, so that the trekkers’ middling wealth would partly reflect mobility, and mobile families might have left first. The census records no birthplaces, but the genealogies record a birth or baptism place for a subset of trekkers, from which we construct an indicator for heads born or baptized outside the district in which the census enumerates them. Of the 205 trekkers with a place that maps to an 1825 district, 76 percent were born or baptized elsewhere.

Nonlocal birth or baptism does not predict departure timing (Table [4](#tab:tenure), columns 1 and 2), and nonlocal heads were, if anything, wealthier than locally born trekkers in the same district (column 3), also when birth decades are held constant (0.44, $p = 0.030$). The indicator records where a head was born or baptized, not when he arrived, so it does not measure the length of residence. Coverage is limited and possibly selected, and baptism places refer to congregations rather than residences, so we read the table as suggestive at most.

|                                          |           |           |              |
|:-----------------------------------------|:---------:|:---------:|:------------:|
|                                          |   \(1\)   |   \(2\)   |    \(3\)     |
| Dependent variable                       | Move year | Move year | Wealth index |
| tex_fragments/tab_timing_tenure_body.tex |           |           |              |

Nonlocal Birth or Baptism, Departure Timing and Wealth {#tab:tenure}

*Notes*: Sample: matched Voortrekkers with a recorded departure year in 1835–1845 and a birth or baptism place that maps to an 1825 census district ($n = 205$ of 495). “Born/baptized outside 1825 district” equals one when the head’s birth place (or, if missing, baptism place) lies outside the district of 1825 enumeration; foreign-born heads are coded as outside. Ambiguous frontier localities that span 1825 district boundaries are left unmatched rather than guessed. Heteroskedasticity-robust (HC1) standard errors in parentheses. $^{*} p < 0.05$, $^{**} p < 0.01$, $^{***} p < 0.001$.

We detect no clear linear association between baseline resources and the year of departure. Departure cohorts nevertheless differ without a trend. Within districts, households that left in 1838 had the highest index values and those that left after 1840 the lowest (joint test $p = 0.001$; Appendix Table [16](#tab:cohorts)), so selection on wealth differed between cohorts without rising or falling over the course of the migration. If emancipation losses had been the primary driver, the larger slaveholders might have left first, and we do not see that, although the test uses 1825 counts of enslaved people rather than measured losses.

# Heterogeneity

The Trek comprised separate movements under different leaders, bound for different destinations. The emancipation narrative rests partly on Piet Retief, whose manifesto cited British interference with slave owners’ rights (Giliomee 2003); if it is right, his followers might have been wealthier and held more enslaved people than others. We treat the leader and destination comparisons as exploratory.

## Selection by Trek Leader

Nine leaders have at least eight matched follower households, from Potgieter (51) to Pretorius (10). Cell sizes are small, and the comparisons are descriptive. Mean wealth does not differ significantly across leaders (Figure [12](#fig:by_leader); analysis of variance $F = 1.39$, $p = 0.202$), although livestock profiles do (Figure [19](#fig:leader_heatmap)). Retief’s followers had the lowest mean wealth and owned fewer enslaved people than the average Trekker.

*[Figure not reproduced here — see JF_CL_SelectionIntoThe_v5.pdf]*
*Notes*: Each point shows the mean wealth index for a leader’s matched followers; horizontal bars show 95% confidence intervals. Point size increases with the number of matched households. Dashed line indicates the non-Voortrekker mean. Only leaders with at least eight matched followers are shown. Labels indicate the number of matched households per leader. Source: Voortrekker genealogies linked to the 1825 census.

*Alt text*: Dot plot of mean wealth by trek leader with 95 percent intervals, lowest for Retief’s followers.

Wealth by Trek Leader

## Selection by Destination

Natal, with its fertile lowlands and summer rainfall, suited agriculture, while the Transvaal and the later Orange Free State suited extensive pastoralism. If pre-Trek wealth shaped destination choice, we should see sorting.

*[Figure not reproduced here — see JF_CL_SelectionIntoThe_v5.pdf]*
*Notes*: Mean wealth index with 95% confidence intervals by destination region. Point size increases with the number of matched households. Dashed line indicates the non-Voortrekker mean. Labels indicate sample sizes. Source: Voortrekker genealogies linked to the 1825 census.

*Alt text*: Dot plot of mean wealth by destination with 95 percent intervals; the Orange Free State and Western Transvaal groups have the lowest means.

Wealth by Destination

Mean wealth differs across the five destination groups with at least 15 households (Figure [13](#fig:by_destination); analysis of variance $F = 3.26$, $p = 0.012$). Households bound for the Orange Free State and the Western Transvaal were the poorest, and those bound for Natal, the Eastern Transvaal and other destinations the wealthiest; conditional on cattle and numbers of enslaved people, only Natal’s wealth coefficient relative to the Eastern Transvaal is significant ($-0.56$, $p = 0.036$), so that higher wealth is associated with lower relative odds of choosing Natal. The groups are small and uneven, so we read this as evidence of some economic sorting by destination, not as an explanation of why households chose a particular frontier.

# Robustness

We examine three further concerns: the design of the linkage and its review stage, matching bias from spouse evidence, and false-positive links. Section [8.3](#sec:hh_robustness) also examines a linkage without spouse features and the identity errors that limit its use.

## Consistency across Comparisons

The results are consistent across six comparison methods (Table [14](#tab:all_methods)), except that conditioning on the number of children sets the children difference to zero, substantially reduces the household-size difference and makes the wealth difference significantly negative. All six share the same linkage, so this establishes robustness to specification rather than to matching error, which the next subsections address.

## The Linkage Design

The review stage accounts for a substantial share of the links. Of the 569 final links, 344 are classifier proposals accepted by both blind reviewers and 225 were decided by the authors, 157 of them pairs the classifier did not propose. Three features limit the scope for researcher discretion. The hand labels were checked by two language models working independently and blind to household characteristics, and the authors decided only the pairs on which the models disagreed with each other or with the hand label. The reviewers of the final links saw identity evidence alone, without household counts, wealth or classifier scores, and the authors adjudicated from a workbook of the same evidence, although they were not blind to the paper’s broad findings. And the links were locked, with the code and every decision hashed, before any estimate with these links was computed (Appendix [10](#sec:app_methodology)).

Table [5](#tab:tiers_main) re-estimates the main specification separately for households whose link the classifier proposed and for those linked only after adjudication. The tiers differ sharply, and much of the difference reflects their composition. The classifier proposes links automatically only when the wives’ names agree, so its tier consists of married couples with large households, while the adjudicated tier consists mainly of men without a comparable wife, many of them young or unmarried in the census year, whose households are small. The contrast largely reflects the married-household margin of Section [4.4](#sec:married). Among married couples, classifier-proposed and adjudicated links give similar household-size estimates (0.14 and 0.06 persons, both insignificant), although adjudicated couples are poorer. These diagnostics do not establish whether the tiers also differ in accuracy. On a held-out audit sample, all 16 of the classifier’s acceptances are correct (Appendix [17](#sec:app_linkage_diag)); these figures describe the classifier, not the final links.

| Variable | Full sample | Classifier-proposed | Adjudication only |
|:---|:--:|:--:|:--:|
| tex_fragments/tab_match_tiers_body.tex |  |  |  |

Results by How the Link Was Decided {#tab:tiers_main}

*Notes*: Each cell reports the Voortrekker coefficient from a separate OLS regression with district fixed effects and heteroskedasticity-robust (HC1) standard errors; $p$-values in parentheses. Classifier-proposed: links the classifier accepted (all with agreeing wives’ names), whether confirmed by both model reviewers or by the authors. Adjudication only: links retained by the authors although the classifier did not propose them. In the tier columns, the treated group is restricted to links of that tier and the comparison group is the full non-Voortrekker pool. $^{*} p < 0.05$, $^{**} p < 0.01$, $^{***} p < 0.001$.

## Is the Household Size Finding Genuine?

#### Concern 1: Age and cohort effects.

The Voortrekker sample is drawn from men alive and active enough to trek in 1835–40, which may select particular stages of the life cycle in 1825. Most linked heads with a usable birth year were under 35 in 1825. Those aged 15–24 headed small households, while older heads exceeded the unlinked average, so the premium is concentrated among heads old enough to have formed families, consistent with the married-household margin. Census ages are unavailable for unlinked households, so these comparisons mix selection with the life cycle and are not like-for-like. If linked heads were younger than the average census head, the life cycle works against finding a premium in 1825, although the growth of their households by the time of departure could have been offset by marriages, departures and deaths.

#### Concern 2: Matching bias from spouse evidence.

The main linkage identifies married men more readily, which may contribute to the household-size difference. Section [4.4](#sec:married) separates the married-household margin from differences within couples, where the main estimate is small and imprecise. We also retrain the classifier without spouse features, using the same labels and accepting its proposals without review (Table [6](#tab:nonwife)). This wife-blind linkage identifies 503 households, 375 of them also identified by the main linkage.

These additional links are doubtful. Children were often named after their fathers and grandfathers, so men in successive generations share the same names, and without spouse evidence the records offer little other individual information to tell them apart. The genealogy gives birth years for many men, but the census records no ages against which to match them. In the identity check, both reviewing models rejected 14 of 30 links made only by the wife-blind linkage, against 1 of 90 links of the main linkage, citing conflicting spouse evidence, ambiguous namesakes and apparent confusion of fathers and sons (Appendix [17](#sec:app_linkage_diag)). These judgments are not verified error rates, but they raise substantial doubt about the additional links.

In the wife-blind linkage, Trekker households are 0.59 persons larger and have 0.51 more children, and married couples make up 74 percent of its linked households, against 66 percent of the controls, weighted by district. Among couples its estimate is larger, the difference in enslaved people is smaller and imprecise, and the wealth difference among couples is not significant. Given the doubtful identity of many of its links, these results do not establish robustness to marriage-related matching bias. The training labels also used spouse evidence, and the wife-blind classifier still links men married by the census year more often than later-married men. Finally, the main links differ by spouse evidence as married and unmarried households would, with large households where the wives agree and small ones where no wife is comparable.

|  | Main linkage, by spouse evidence |  | Wife-blind linkage |  |
|:---|:--:|:--:|:--:|:--:|
| 2-3 (lr)4-5 | Wives agree | No comparable wife | All households | Married couples |
| Household size | 1.485\*\*\* | -2.234\*\*\* | 0.588\*\*\* | 0.492\*\*\* |
|  | ($<$0.001) | ($<$0.001) | ($<$0.001) | ($<$0.001) |
| Settler children | 1.135\*\*\* | -1.724\*\*\* | 0.514\*\*\* | 0.491\*\*\* |
|  | ($<$0.001) | ($<$0.001) | ($<$0.001) | ($<$0.001) |
| Wealth index | 0.160\* | -0.924\*\*\* | 0.045 | -0.031 |
|  | (0.019) | ($<$0.001) | (0.552) | (0.736) |
| Enslaved people | -0.406\*\*\* | -0.903\*\*\* | -0.176 | -0.263 |
|  | ($<$0.001) | ($<$0.001) | (0.193) | (0.123) |
| Trekker households | 438 | 123 | 503 | 370 |

Spouse Evidence and a Wife-Blind Linkage {#tab:nonwife}

*Notes*: District fixed effects, HC1 standard errors, $p$-values in parentheses. Columns (1)–(2): Trekker households of the main linkage whose link has agreeing wives’ names, or missing or inconclusive spouse evidence, each compared with all controls. Columns (3)–(4): links from a classifier that uses no spouse features, trained on the same labels and taken without review (Section [8.3](#sec:hh_robustness)); column (4) restricts Trekkers and controls to married couples. The identity check raises substantial doubts about links found only by the wife-blind linkage (Appendix [17](#sec:app_linkage_diag)), so columns (3)–(4) are a sensitivity exercise, not independent validation. The eight links of the main linkage whose wives’ names disagree, all retained by author adjudication, are not shown separately. Household counts are maxima across outcomes. $^{*} p < 0.05$, $^{**} p < 0.01$, $^{***} p < 0.001$.

The training labels could also favor large households, because the hand labelers saw household composition. Every label was, however, checked by reviewers who saw no household counts, and the classifier is not given household size or children, so the remaining channel is the correlation between marriage and household size, which Section [4.4](#sec:married) measures directly. Restricting the treated group to the links with the highest classifier scores gives larger composition coefficients (Appendix [14](#sec:app_equivalence)).

#### False-positive contamination.

Random linkage errors attenuate every contrast. In a simulation that replaces 30 percent of linked households at random, a rate calibrated to the share of links retained only by adjudication (Appendix [19](#sec:app_attenuation)), the household-size coefficient falls by about 31 percent but remains significant in nearly all repetitions. The exercise assumes that errors are unrelated to household characteristics, so it cannot rule out selective errors, nor recover a wealth difference that linkage error might have prevented us from detecting.

# Conclusion

The Great Trek is usually explained by grievance against emancipation, British administration and racial equalization. The linked household records show which households left. Within districts, linked Trekker households were larger and had more children than the households that stayed, as the land-scarcity accounts of Keegan (1996), Muller (1974) and Venter (1985) would predict, while their census index of assets and production was similar to that of their neighbors. In earlier decades larger frontier households were the least likely to leave their district (Nel 2020); among the linked households, larger households were overrepresented among those who joined the Trek. The difference arises mainly from the higher share of established married couples among linked Trekker households, and among married couples the additional difference in family size is small and imprecise. Because the linkage identifies married men more readily than single ones, the share of married couples among all Trekker households is uncertain, and the data cannot separate demographic pressure from the capacity to migrate, kin networks or the family life cycle.

The nationalist historiography treated emancipation as central to the Trek (Van Jaarsveld 1951; Muller 1974). Within districts, Trekker owners held fewer enslaved people and less slaveholding wealth than other owners, the largest slaveholders stayed, and owners with larger proportional losses were not detectably more likely to trek. The literature on British compensation documents what owners were paid and what they lost (Draper 2010; Hall et al. 2014); the Cape records add evidence on whether those losses predicted departure. These results do not support the narrow financial version of the emancipation account, although they cannot exclude a strong financial motive offset by the cost of leaving slave-dependent farms. They are consistent with Hirschman’s (1970) account of exit, in which those who leave are not necessarily the most aggrieved but those for whom leaving is cheapest, although we do not observe exit costs directly.

The Trek also adds an early African case to the economic history of migration selection. Linked microdata find negative wealth selection among European emigrants to the United States (Abramitzky et al. 2012), positive selection in the Great Migration (Collins and Wanamaker 2014) and neutral to slightly negative selection among native-born US internal migrants (Zimran 2024). At the Cape, Trekkers differed little from their neighbors on an index of assets and production but differed in the composition of their households and their assets, with as much livestock and fewer enslaved people. A comparison on wealth alone would not show this. The pattern is consistent with a role for the costs of moving (Conor 2019; Hatton and Ward 2024), although we do not measure those costs. If the linked households are representative, the republics were founded by frontier families with less investment in slavery than other colonists, which may help explain why their labor systems differed from the Cape’s.

Several caveats remain. Shocks between 1825 and 1835 could have changed selection on wealth in ways the census cannot show, survival selection could contribute to the household-size difference, 53 percent of named genealogical records remain unlinked, and the census records assets, labor and output, not ideology, networks or risk tolerance. Appendix [20](#sec:app_limits) discusses each concern.

None of this implies that grievances over emancipation, labor policy and British administration were irrelevant. Multi-causal histories explain the Trek through material pressure, political grievance and the demand for self-government (Du Toit and Giliomee 1983; Giliomee 2003; Legassick 2010), and the Trek was an organized political act, with manifestos, elected leaders and negotiations with African polities, which the census does not record. What the linked household records show is that those who left were disproportionately established married households, distinguished more by their family composition than by their census index of assets and production or their measured financial exposure to emancipation.

# Data Availability

The data and code supporting this article will be deposited in the OPEN ICPSR repository under a Creative Commons Attribution 4.0 International (CC BY 4.0) license, with a DOI-based citation supplied at that time. The deposit will contain the 1825 Cape Colony census (*opgaafrolle*) at the household level, the Voortrekker genealogical records, the slave compensation records from Ekama et al. (2021), the parsed census names, the record-linkage outputs with every model review and linkage decision, and the household-level analysis dataset, together with a codebook and an R loader script. The replication package is also available at <https://github.com/johanfourieza/research/tree/main/2026/voortrekker>. No sensitive or proprietary data are involved and no exceptions to full data sharing are requested.

# Record Linkage Methodology

## The Challenge of Historical Record Linkage

Linking individuals across historical datasets presents well-known challenges (Feigenbaum 2016; Abramitzky et al. 2021; M. Bailey et al. 2020). There are no unique identifiers: the 1825 census records names but not birth dates or other distinguishing information. Spelling variation is substantial, as names were transcribed by local officials with inconsistent orthography (e.g., Ackerman/Akkerman, Johan/Jan/Johannes, Gert/Gerhardus). Wife names pose additional complications: the census may record a wife’s married name while the Voortrekker records provide her maiden surname. Multiple individuals may share the same name, particularly with common Afrikaner surnames such as Botha, Du Plessis or Van der Merwe.

These challenges are compounded by the historical context. The Cape Colony’s record-keeping, while detailed for an early nineteenth-century colonial setting, was not designed for longitudinal tracking of individuals. The Voortrekker genealogical records, compiled retrospectively from diverse sources, contain their own inconsistencies and gaps.

## Classification Approach

We follow the approach of Rijpma et al. (2020) in using a Random Forest classifier for probabilistic record linkage. The procedure involves five steps: parsing the census names, blocking, feature engineering, training and threshold selection, and review.

#### Parsing the census names.

The digitized returns record the head and, where present, the wife in a single name field, in several layouts: the wife on the head’s line, on a continuation line, or in a separate column. A parser separates head and spouse in every district, identifies widows entered under the late husband’s name, and treats female-headed households and unresolved entries separately. Across the colony it recovers 6,385 named wives, 1,013 female heads (237 of them marked as widows) and 13 heads whose names cannot be resolved. The parser was audited against the source images before any link was made.

#### Blocking.

To reduce the computational burden of comparing every Voortrekker to every census record, we restrict candidate pairs to census heads whose surname matches the Voortrekker’s, exactly or approximately (the same Soundex code, or a Jaro-Winkler similarity of at least 0.92 once particles such as *van* and *du* are removed), so that variants such as Ackerman and Akkerman are compared. Each Voortrekker is compared with census records in the relevant district search set. For most records this is the declared origin district; for Somerset and Colesberg we expand the search to the historically relevant neighboring or parent districts used in the codebook crosswalk. Voortrekkers without an in-district proposal are then searched, on exact surnames, against heads outside their district search set. 1,131 of the 1,220 named records have at least one candidate.

#### Feature engineering.

For each candidate pair, we compute features capturing the similarity between the Voortrekker record and the census record:

- *Name distances*: Jaro-Winkler string similarity between the Voortrekker’s full name and the census name, and between the first names alone.

- *Wife name distances*: Jaro-Winkler similarity between the wives’ first names, and between the Voortrekker wife’s maiden surname and the census wife’s recorded name, allowing for a wife recorded under her married surname.

- *Spouse evidence*: Whether the wives’ names agree, contradict each other, or give missing or inconclusive evidence (for example, no wife on one side). As Rijpma et al. (2020) note, “the absence of the wife makes it far harder to identify a link.”

- *Surname frequency*: The relative frequency of the surname in the district, capturing the informativeness of a match. A match on a rare surname like “Tregardt” is far more diagnostic than a match on “Botha.”

- *Initials and name length*: Whether the initials match, and the ratio of name lengths.

- *District match*: Whether the Voortrekker’s declared district matches the census district.

The classifier is given no household size, number of children or other census outcome.

#### Training data.

Training labels were assigned in two stages. First, four labelers (the two co-authors and two research assistants familiar with Afrikaans history) each evaluated a separate set of 250 candidate pairs, yielding 902 distinct labeled pairs. Because these labelers saw household composition, all 902 pairs, together with 150 pairs sampled from the full candidate set, were then reviewed independently by two language models (Anthropic’s Claude and OpenAI’s Codex), with both spouses’ names, dates and districts visible but no household counts, wealth or classifier scores. Where both models agreed with each other and with the first-stage label, the label stands; the authors decided the 207 pairs on which the models disagreed or departed from the first-stage label. Of the 1,052 pairs reviewed, 80 that remained uncertain are excluded, leaving 972 labeled pairs (160 matches). Of these, 910 arise as candidates in the linkage: 97 form the held-out audit sample and 813 (139 matches) are used for training and cross-validation.

#### Classifier and thresholds.

Because false positives are more costly than false negatives in our setting, we select thresholds by the $F_{0.5}$ score, which places greater weight on precision than on recall, from out-of-fold predictions in five-fold cross-validation. Folds are grouped by connected sets of Voortrekkers and census households, so that no person or household appears in both training and validation folds, and 15 percent of these sets are held out from training and tuning altogether as an audit sample. The acceptance rule depends on the spouse evidence. A pair whose wives’ names agree is accepted at the selected threshold ($0.60$), in the declared district or elsewhere. Pairs without comparable wives are accepted automatically only if a stricter threshold attains the target precision in cross-validation; in the final model no threshold does, so these pairs are never accepted automatically. Pairs whose wives’ names contradict each other are never accepted automatically. Each Voortrekker’s highest-scoring candidate becomes a proposal if it satisfies the acceptance rule. Every other scored pair within 0.15 of its rule’s threshold enters review; pairs without a finite threshold, those without a comparable wife and those whose wives contradict, are measured against the spouse threshold, so in the final model every pair scoring at least 0.45 is reviewed, whatever its spouse evidence.

#### Review.

All 923 distinct pairs, comprising classifier proposals, review-band pairs and supplementary candidate pairs identified by hand, were reviewed blind by the same two language models, which saw identity evidence alone: names, wives, birth and marriage years, districts and annotations, but no household counts, wealth or classifier scores. A proposal accepted by both models is linked (344 links). Every other pair that at least one model accepted was decided by the authors (225 links, 157 of them pairs the classifier did not propose); pairs that neither model accepted are not linked. The authors decided from a workbook of the same identity evidence, without household outcomes. Each census head is linked to at most one person; five men who appear twice in the returns, four of them because they moved between the 1823 and 1825 enumerations, are linked to their 1825 record, and their other record is excluded from the comparison group. The protocol, the code and every decision were hashed and locked before any estimate with these links was computed; the replication package documents the protocol and its implementation.

The final linkage contains 569 links to 569 census households: 417 through exact surname blocking within the district search set, 101 through approximate surnames, 50 outside the declared district, and 1 outside the candidate set, decided by the authors.

#### Census data handling.

Household records are identified from the layout of the returns, and a record is retained when it reports one adult settler man or one adult settler woman. The rule excludes a single entry, a firm in Albany recorded with two men and no woman; twelve further rows record children without adults. The retained returns contain 10,789 household records. We preserve the original blank-as-zero convention for quantities, parse unambiguous fractions, and leave unresolved annotations, date-formatted quantities and source anomalies missing. One household with a contradictory genealogical death date is excluded from both comparison groups, and five records that duplicate linked Trekker households (four men enumerated in both the Cradock 1823 and the Graaff-Reinet 1825 returns, and one double entry) are excluded from the comparison group, leaving 10,783 households; outcome-specific samples are smaller where quantities are unresolved. A screen for control households possibly repeated across returns, among heads with the same surname whose own and wives’ names both have a Jaro-Winkler similarity of at least 0.92, flags 44 records; dropping them, keeping the later return, leaves the conclusions unchanged (Table [15](#tab:sample_checks)). The screen does not establish that every flagged pair is the same household. Heads without a named wife cannot be screened this way.

## Match Rates and Quality

| District                               | VT Records | Matched | Match Rate (%) |
|:---------------------------------------|-----------:|--------:|---------------:|
| tex_fragments/tab_match_rates_body.tex |            |         |                |

Voortrekker Records and Match Rates by District {#tab:match_rates}

*Notes*: Records are named genealogy rows meeting the implemented pre-1810-or-unknown birth rule, by declared origin; multiple rows can share a genealogical identifier. Matched counts are final links. Unknown origin is retained in the denominator, though it supplies no district-blocked candidate. Somerset includes Cradock, Graaff-Reinet includes Colesberg, and Worcester includes Clanwilliam. The map shows the 1,160 records with a mapped origin.

Table [7](#tab:match_rates) reports match rates by declared origin among the 1,220 named records. The overall rate is 46.6 percent; among the 1,131 records with at least one census candidate it is 50.3 percent.

Figure [14](#fig:rf_importance) shows the variable importance of the linkage classifier. The similarity of the husbands’ names (initials, full name and first name) has the highest importance in the classifier, followed by the similarity of the wives’ first names and surnames; surname and name-pair frequency add further information. Importance describes the fitted classifier rather than independent evidence of historical identity.

*[Figure not reproduced here — see JF_CL_SelectionIntoThe_v5.pdf]*
*Notes*: Mean decrease in Gini impurity for the fifteen most important features of the linkage classifier (spouse-assisted). Higher values indicate greater importance. Source: labeled candidate pairs (Appendix [10](#sec:app_methodology)).

*Alt text*: Horizontal bar chart of variable importance in the linkage classifier; the husbands’ name similarities rank highest.

Variable Importance in the Linkage Classifier

*[Figure not reproduced here — see JF_CL_SelectionIntoThe_v5.pdf]*
*Notes*: Distribution of Random Forest probability scores for the final links. The dashed line marks the classifier threshold (0.60); links decided by the authors can lie below it. Source: final links (Appendix [10](#sec:app_methodology)).

*Alt text*: Histogram of classifier scores for the final links, with a dashed line at the threshold; most scores lie close to one.

Distribution of Match Scores

# Main Results by Design and Descriptive Statistics

This appendix reports each of the four research designs summarized in Table [1](#tab:main_combined) in full and in a common format, together with descriptive statistics for the harmonized variable set. Tables [9](#tab:app_nn), [11](#tab:app_exact) and [12](#tab:app_family) report group means alongside differences; Table [10](#tab:app_fe) reports the district fixed-effects coefficients with robust standard errors.

| Variable                                | Mean | SD  | Min | Max |
|:----------------------------------------|:----:|:---:|:---:|:---:|
| tex_fragments/tab_descriptives_body.tex |      |     |     |     |

Descriptive Statistics, Full Estimation Sample {#tab:app_desc}

*Notes*: Up to 10,783 households in the census estimation sample; observations vary with non-missing outcomes. The wealth index is the first principal component described in Section [3](#sec:data); it explains 38.9 percent of the joint variance of its nine inputs.

| Variable | VT mean | Non-VT mean | Difference | $p$-value |
|:---|:--:|:--:|:--:|:--:|
| tex_fragments/tab_design_nn_body.tex |  |  |  |  |

Design (1): Nearest Census Neighbors {#tab:app_nn}

*Notes*: Paired comparison of each matched Voortrekker to the households recorded immediately adjacent in the census, over the 539 of 569 matched households with at least one valid non-Voortrekker neighbor; $p$-values from paired two-sided $t$-tests.

| Variable                             | Coefficient | Robust SE | $p$-value |
|:-------------------------------------|:-----------:|:---------:|:-----------:|
| tex_fragments/tab_design_fe_body.tex |             |           |             |

Design (2): Differences within Districts {#tab:app_fe}

*Notes*: Each row reports the coefficient on the Voortrekker indicator from a separate OLS regression with district fixed effects; $N \leq 10{,}783$ (up to 569 matched Voortrekker households). Heteroskedasticity-robust (HC1) standard errors.

| Variable | VT mean | Non-VT mean | Difference | $p$-value |
|:---|:--:|:--:|:--:|:--:|
| tex_fragments/tab_design_exact_body.tex |  |  |  |  |

Design (3): Comparable Households in the Same District {#tab:app_exact}

*Notes*: Exact matching on district with subclass weights (564 Voortrekker and 9,336 non-Voortrekker households before outcome-specific missingness). Non-VT means are weighted by exact-match subclass weights; differences and $p$-values from weighted regressions with HC-robust standard errors.

| Variable | VT mean | Non-VT mean | Difference | $p$-value |
|:---|:--:|:--:|:--:|:--:|
| tex_fragments/tab_design_family_body.tex |  |  |  |  |

Design (4): Same District and Number of Children {#tab:app_family}

*Notes*: Exact matching on district and the exact integer number of settler children (562 Voortrekker and 8,463 non-Voortrekker households before outcome-specific missingness). Because settler children is the conditioning variable, its treated and control means are identical by construction. Weighted regressions with HC-robust standard errors.

# Male-Headed Control Group

The genealogical matching sample consists of men, while the control group in the main specification includes female-headed census households. If an adult male was a de facto precondition for trekking, those households are arguably less meaningful counterfactuals. Table [13](#tab:male_headed) re-estimates the district fixed-effects specification restricting controls to households with at least one adult settler man, which drops 999 of the 10,214 control households. The settler-men coefficient becomes zero. In every district with linked households, the remaining controls, like the Trekkers, have exactly one adult man; the one control with three men lives in the Cape district, which has no linked households and so does not identify the coefficient. The household-composition coefficients fall only modestly and remain significant at the 0.1 percent level (household size $0.585$; children $0.460$; children ratio $0.068$): the female-headed households removed from the comparison group are smaller, but they account for only about 14 percent of the household-size difference. The wealth-index coefficient remains insignificant, and enslaved people, Khoekhoe workers and wheat remain significantly negative. The last column pair restricts the treated group to the links the classifier proposed (Table [5](#tab:tiers_main)), all of them married couples. Against male-headed controls, these households are much larger (household size $1.362$, children $1.051$) and somewhat wealthier ($0.154$, $p = 0.031$), with larger herds; marital composition is a plausible contributor, since the comparison sets married couples against all male-headed households. Against married controls the classifier tier’s household-size difference is 0.14 ($p = 0.277$), and its wealth difference -0.28.

|  | All linked households |  |  |  | Classifier-proposed links |  |
|:---|:--:|:--:|:--:|:--:|:--:|:--:|
| 2-5 (lr)6-7 | Full controls |  | Male-headed controls |  | Male-headed controls |  |
| 2-3 (lr)4-5 (lr)6-7 Variable | Coef. | ($p$) | Coef. | ($p$) | Coef. | ($p$) |
| tex_fragments/tab_male_headed_subsamples_body.tex |  |  |  |  |  |  |

Full and Male-Headed Comparison Groups {#tab:male_headed}

*Notes*: Each row reports the Voortrekker coefficient from separate OLS regressions with district fixed effects and heteroskedasticity-robust (HC1) standard errors; $p$-values in parentheses. The male-headed samples restrict non-Voortrekker households to those with at least one adult settler man (settler men $\geq 1$), so the settler-men difference is zero in those columns (see text) and no $p$-value is reported. Observation counts are maxima across outcomes. The first two column pairs retain all 569 matched Voortrekker households; the third restricts them to the 412 households whose link the classifier proposed (Table [5](#tab:tiers_main)), against male-headed controls. $^{*} p < 0.05$, $^{**} p < 0.01$, $^{***} p < 0.001$.

# Additional Tables and Figures

|  |  |  |  |  |  |  |
|:---|:--:|:--:|:--:|:--:|:--:|:--:|
|  | \(1\) | \(2\) | \(3\) | \(4\) | \(5\) | \(6\) |
|  | Row | Same | District | Exact | Family | Dist+Child |
| Variable | Neighbor | Surname | FE | Match | Size | FE |
| tex_fragments/tab_all_methods_body.tex |  |  |  |  |  |  |

Results under Six Comparisons {#tab:all_methods}

*Notes*: Differences (VT minus non-VT) with $p$-values in parentheses. Methods: (1) nearest census neighbor; (2) all non-VTs with the same surname in the same district; (3) OLS with district FE (robust SE); (4) exact matching on district with subclass weights; (5) non-VTs matched on district and exact number of children; (6) OLS with district and children-count FE (robust SE). In methods (5) and (6) the settler-children cells are zero by construction (children is the conditioning variable), and the household-size and children-ratio cells in those columns are largely absorbed by the same conditioning. $^{*} p < 0.05$, $^{**} p < 0.01$, $^{***} p < 0.001$.

*[Figure not reproduced here — see JF_CL_SelectionIntoThe_v5.pdf]*
*Notes*: Percentage of each group’s households in each five-point bin of the within-district wealth percentile, so that the two groups, which differ twentyfold in size, can be compared directly. The lowest bin holds households with few or no recorded assets. Source: 1825 census linked to the Voortrekker genealogies.

*Alt text*: Paired bar chart of the share of Voortrekker and other households in each within-district wealth-percentile bin; other households are concentrated in the lowest bin.

Within-District Wealth Rank of Voortrekker and Other Households

*[Figure not reproduced here — see JF_CL_SelectionIntoThe_v5.pdf]*
*Notes*: Mean wealth index with 95% confidence intervals for Voortrekkers by their year of departure from the Cape Colony. Point size is proportional to the number of matched Voortrekkers in each year; the dashed line shows the linear trend and the shaded band its 95 percent confidence band. Source: Voortrekker genealogies linked to the 1825 census.

*Alt text*: Scatter plot of mean wealth by departure year, 1835 to 1845, with intervals and a slightly declining linear trend.

Mean Wealth of Voortrekkers by Year of Departure

*[Figure not reproduced here — see JF_CL_SelectionIntoThe_v5.pdf]*
*Notes*: Distribution of migration years for linked Voortrekkers, by the census district in which they were enumerated. Boxes show the median and interquartile range, whiskers extend to the most extreme observations within 1.5 times the interquartile range of the box, and points show individual households. Source: Voortrekker genealogies linked to the 1825 census.

*Alt text*: Box plots of departure years by census district; most districts have median departure years in 1837 or 1838.

Distribution of Migration Years by Census District

*[Figure not reproduced here — see JF_CL_SelectionIntoThe_v5.pdf]*
*Notes*: Cell values show the mean for each leader’s followers, expressed as standard deviations from the pooled mean among followers of the displayed leaders. Darker shading indicates larger deviations. Only leaders with at least eight matched followers are shown. Source: Voortrekker genealogies linked to the 1825 census.

*Alt text*: Heatmap of asset z-scores by trek leader; Jacobs’ and De Klerk’s followers stand out for sheep and Landman’s and Maritz’ for cattle.

Asset Composition by Trek Leader

|  | Main linkage |  |  |
|:---|:--:|:--:|:--:|
| 2-4 | All links | Departures | One record per |
|  |  | 1835–1840 | repeated household |
| Household size | 0.680 ($<$0.001) | 0.713 ($<$0.001) | 0.692 ($<$0.001) |
| Settler children | 0.514 ($<$0.001) | 0.547 ($<$0.001) | 0.522 ($<$0.001) |
| Wealth index | -0.072 (0.237) | -0.003 (0.970) | -0.050 (0.408) |
| Enslaved people | -0.521 ($<$0.001) | -0.417 ($<$0.001) | -0.514 ($<$0.001) |
| Size, given couple | 0.052 (0.606) | 0.084 (0.455) |  |
| Couples among Trekkers (%) | 82 | 81 |  |
| Trekker households (maximum) | 569 | 441 | 569 |

Departure Window and Repeated Census Households {#tab:sample_checks}

*Notes*: Voortrekker coefficients from OLS regressions with district fixed effects; HC1 $p$-values in parentheses. “Departures 1835–1840”: Trekker households restricted to links whose genealogical departure year lies in 1835–1840; the other linked households are dropped, not recoded as controls. “One record per repeated household”: 44 control households possibly repeated across returns (same surname, head’s and wife’s names both with a Jaro-Winkler similarity of at least 0.92) are dropped, keeping the later return. Trekker counts are maxima across outcomes; they vary slightly with missing quantities. Exploratory checks, not part of the pre-specified analysis.

|                   |            |             |                            |
|:------------------|:----------:|:-----------:|:--------------------------:|
| Departure         |  Trekker   | Mean wealth | Difference from 1835–1836, |
| cohort            | households |    index    |      district FE (SE)      |
| 1835–1836         |     83     |    +0.11    |             —              |
| 1837              |    172     |    -0.08    |        -0.23 (0.16)        |
| 1838              |     93     |    +0.49    |        +0.52 (0.23)        |
| 1839–1840         |     88     |    -0.06    |        -0.12 (0.18)        |
| 1841–1845         |     59     |    -0.31    |        -0.36 (0.18)        |
| Joint test, $p$ |            |    0.004    |           0.001            |

Wealth by Departure Cohort {#tab:cohorts}

*Notes*: Linked Trekker households with a recorded departure year in 1835–1845 and a complete wealth index. Column 4: coefficients on cohort indicators in an OLS regression of the wealth index with district fixed effects, HC1 standard errors. Exploratory check, not part of the pre-specified analysis.

# Wealth Equivalence and Multiple Outcomes

We implement two one-sided tests (TOST) for equivalence (Lakens 2017). The TOST procedure tests whether the true effect lies within a pre-specified equivalence range $[-\Delta, +\Delta]$, where $\Delta$ is the smallest effect size of interest (SESOI).

Table [\[tab:tost\]](#tab:tost) reports sensitivity across four SESOI values (0.05, 0.10, 0.15 and 0.20 SD). At $\Delta = 0.10$ SD, calibrated to half the negative selection documented by Abramitzky et al. (2012), wealth-index equivalence is confirmed ($p_\text{TOST} = 0.029$), with a 90 percent interval of $[-0.092, +0.015]$ SD. Equivalence is not confirmed at 0.05 SD ($p = 0.361$). Six of the eight individual wealth measures also achieve equivalence at 0.10 SD. Enslaved people ($[-0.115, -0.065]$ SD) do so only at 0.15 SD, and Khoekhoe workers ($[-0.174, -0.029]$ SD) only at 0.20 SD; Trekkers held fewer of both than other households in their districts. These conclusions are specific to the main district-FE design and to heteroskedasticity-robust errors. With errors clustered by district, the 90 percent interval for the wealth index widens to $[-0.277, +0.200]$ SD (CR2 with Satterthwaite degrees of freedom; $[-0.233, +0.156]$ with CR1 and a $t$ distribution with ten degrees of freedom), so equivalence within 0.10 SD is not established under clustered inference. As expected for the variables on which we find positive selection, household size and children are not equivalent to zero at any of the four bounds: their 90 percent intervals, $[0.171, +0.317]$ and $[0.131, +0.283]$ SD, lie well above zero.

lD..3cD..3D..3D..3D..3 & & 90% CI &\
(lr)4-7 Variable & & & & & &\
tex_fragments/tab_tost_body.tex

*Notes*: TOST equivalence tests at four SESOI values. All coefficients are from district FE regressions, standardized by the outcome’s SD. The 90% CI corresponds to $\alpha = 0.05$ for each one-sided test. Equivalence is confirmed (TOST $p < 0.05$) when the entire CI falls within $[-\Delta, +\Delta]$.

## Many Outcomes

Our main specification tests 15 outcome variables in separate regressions. To guard against inflated false positive rates, we apply Bonferroni–Holm corrections (Holm 1979) within two families: wealth variables (9 outcomes) and household composition variables (6 outcomes, the five in the main tables and the count of settler adults). Every household-composition outcome survives the correction ($p_\text{Holm} < 0.001$). In the wealth family, enslaved people ($p_\text{Holm} < 0.001$), wheat reaped ($0.002$) and wheat sown ($0.004$) survive; Khoekhoe workers ($0.129$) and the wealth index do not.

Bonferroni–Holm controls the familywise error rate and is conservative when outcomes are correlated, as the household-composition outcomes clearly are. Under the Benjamini–Hochberg procedure (Benjamini and Hochberg 1995), which controls the false discovery rate, the same outcomes clear the 5 percent level, together with Khoekhoe workers ($p_\text{BH} = 0.049$). The settler-men difference reflects the presence of a male head and disappears with male-headed controls; household size and children do not (Appendix [12](#sec:app_male_headed)). The household-composition differences therefore survive multiple-testing correction and district clustering (Appendix [15](#sec:app_clustered)); what they measure is examined in Section [4.4](#sec:married).

## Links with the Highest Scores

If incorrect matches assign non-Voortrekker census records to Voortrekker status at random, all coefficients are attenuated toward zero (M. J. Bailey et al. 2020). To address this concern, we restrict the treated group to the top quartile of Random Forest scores (matches with $\Pr(\text{match}) \geq 0.988$, $n = 148$), excluding lower-score links from the comparison rather than reclassifying them as controls. In this high-confidence subsample the wealth index remains insignificant ($\hat{\beta} = 0.054$, $p = 0.657$). The household composition coefficients are larger than in the full sample, not smaller ($\hat{\beta}_\text{HH size} = 0.821$, $p < 0.001$; $\hat{\beta}_\text{children} = 0.653$, $p = 0.002$; children ratio $0.105$, $p < 0.001$). The larger coefficients are consistent with attenuation from false positives among lower-score links, although the comparison cannot exclude other differences between high- and low-score links.

# Correlation within Districts

Our main specification reports heteroskedasticity-robust (HC1) standard errors. Table [\[tab:clustered_ses\]](#tab:clustered_ses) adds inference that allows the errors to be correlated within districts. With eleven district units (the fixed effects count Clanwilliam separately from Worcester), ten of which contain linked households, conventional cluster-robust (CR1) $t$-tests over-reject, so we also report wild cluster restricted bootstrap $p$-values (Cameron et al. 2008), with Webb weights and 99,999 replications.

Clustering widens the confidence intervals but does not change the household-composition conclusions. The district-clustered standard error on household size is 0.196, against 0.124 under HC1, and the full-sample household-size and children differences remain significant under the bootstrap ($p = 0.007$ and $p = 0.007$). The settler-men difference remains significant ($p = 0.003$), and the wealth-index estimate is far from significance under the bootstrap. The Khoekhoe-worker difference, significant under HC1, is not ($p = 0.419$), so the evidence for fewer Khoekhoe workers is sensitive to inference. In the main linkage, the household-size and children differences among married couples alone are insignificant under both procedures (Section [4.4](#sec:married)).

The larger clustered errors reflect variation in the size of the gap across districts: in the eleven district units used for clustering, the children difference is positive in nine of the ten with linked households and ranges from $-0.40$ to $1.83$, and district clustering treats that variation as sampling noise. Which errors are appropriate depends on the question asked (Abadie et al. 2023). Cluster adjustment is called for when clusters are drawn from a larger population or when treatment is assigned by cluster. Shared local conditions and migration networks may correlate outcomes and trekking within districts, and the HC1 errors would then understate uncertainty, so we report both. For the wealth index, clustering widens the interval enough that equivalence within 0.10 standard deviations is not established (Appendix [14](#sec:app_equivalence)). The full-sample demographic difference clears the 1 percent threshold under both procedures.

lD..3D..3D..3D..3D..3 & & &\
(lr)3-4 (lr)5-6 Variable & & & & &\
tex_fragments/tab_clustered_body.tex

*Notes*: Each row reports the coefficient on the Voortrekker indicator from a separate OLS regression with district fixed effects; sample size varies with observed outcomes. HC1: heteroskedasticity-robust standard errors. Clustered by district: CR1 cluster-robust standard errors (eleven district units, counting Clanwilliam separately from Worcester; ten with linked households) and wild cluster restricted bootstrap $p$-values (null imposed, Webb six-point weights, 99,999 replications, symmetric test on the CR1 $t$-statistic). Classifier-proposed links: treated group restricted to households whose link the classifier proposed, as in Table [5](#tab:tiers_main). Married couples only: Trekker and control households restricted to male heads with a named wife, as in Table [2](#tab:married); HC1 standard errors and bootstrap $p$-values (9,999 replications).

# Emancipation Analysis: Data and Additional Estimates

We link Voortrekker records to Ekama et al. (2021)’s compensation dataset by blind review. The candidates for a Voortrekker are all owners whose cleaned surname equals his, in the search set derived from his declared district of origin, which for districts later divided or renamed includes the related compensation districts: 7,404 candidate pairs for 886 genealogy records. Two large language models (Anthropic’s Claude Opus 5.5 and OpenAI’s GPT-6 Astra) each reviewed every record with all its candidates, shown in random order, seeing the genealogical record (names, dates, father, wives and declared district) and each owner’s name, district, parentage notes, localities and any minor or deceased flag, but no counts of enslaved people, valuations or payments. Each model had to choose one owner or none. The models agree on an owner for 316 records and on no owner for 534. A record is linked to the owner both chose. The 36 records on which the models differ and the 76 records whose agreed owner is also chosen for another record are left unresolved, and the 72 owners chosen by either model in these cases are excluded from the owner sample rather than counted as non-Trekkers; this also removes 11 otherwise agreed links to excluded owners. Agreement between the models does not certify the accuracy of the final links. The decisions were hashed before any estimate with them was computed. The review yields 229 links, each to a distinct owner; 143 of them also have an unambiguous census identity, which corroborates the genealogical identity without proving the owner match. We calculate losses only when all claims of an owner pass checks on the identifier, local owner identity, recorded counts of enslaved people, complete valuations and a unique payment, and we exclude claims with explicit count contradictions or unresolved cross-district coverage of enslaved people in the source notes. Additional named payment recipients alone do not establish omitted valuations, and these checks cannot independently certify claims whose original payment population is undocumented. We retain valuations (per enslaved person) and payments (per claim) as supplied. Reading their difference as a loss in pounds sterling assumes that both are in decimal pounds; that 99.8 percent of valuations and every payment are whole numbers of pence is consistent with, but does not establish, that assumption. Compensation above valuation is retained where these checks pass, and missing payments are unknown, not zero.

Linked owners pass the checks more often than other owners (61 against 43 percent), partly because claims without a claim number, which are concentrated in the Cape district, are rare among them (6 against 22 percent). Within districts the difference is 4.5 percentage points ($p = 0.037$), and among linked owners the share passing ranges from 58 to 67 percent across departure cohorts. Swellendam and Clanwilliam contribute no reconciled owners. Differential retention changes the composition of the loss sample, and selection related jointly to trekking and to losses or their determinants could distort the estimated association.

The Cape and Worcester districts have no linked Trekkers, so their fixed effects have no finite maximum-likelihood estimates. Dropping their owners (2,054 remain) leaves the probit coefficients unchanged; with sandwich errors the Model 3 interval for the average marginal effect of the loss is $[-0.78, +0.15]$ points. On the same sample the linear probability model gives -0.21 points for the loss and -0.73 for enslaved people, against -2.10 for enslaved people in the probit; the sign is more robust than the magnitude.

Table [\[tab:probit_emancipation\]](#tab:probit_emancipation) reports probit estimates. With a binary dependent variable and small within-district counts, probit estimates can be sensitive to the available variation. Table [\[tab:lpm\]](#tab:lpm) reports linear probability models (OLS) with district fixed effects as a robustness check. The LPM provides a functional-form comparison and coefficients directly interpretable as changes in the probability of trekking.

lD..4D..4D..4 & & &\
tex_fragments/tab_lpm_body.tex

*Notes*: OLS with Voortrekker status as the dependent variable, among 2,385 owners with reconciled claims and positive valuations. Predictors are standardized; HC1 $p$-values are in parentheses. Model 3 also controls for standardized mean valuation per enslaved person (insignificant, omitted).

|                                  | Percentage points | 95% confidence interval |
|:---------------------------------|:-----------------:|:-----------------------:|
| Loss % (std), Model 3            |     $-0.27$     |   $[-1.00,\ +0.46]$   |
| N enslaved people (std), Model 3 |     $-1.81$     |   $[-3.53,\ -0.08]$   |
| Loss % (std), Model 5            |     $-0.32$     |   $[-1.06,\ +0.42]$   |

Emancipation Loss and the Probability of Trekking {#tab:ame}

*Notes*: Average marginal effects (probit) of a one-standard-deviation increase in the predictor on the probability of trekking, in percentage points, from Models 3 and 5 of Table [\[tab:probit_emancipation\]](#tab:probit_emancipation), averaged over all owners, with delta-method intervals from the model-based covariance. Trek rate in the owner sample: 5.9 percent ($N = 2{,}385$).

|  | Pooled |  | District FE and N enslaved people |  |
|:---|:--:|:--:|:--:|:--:|
| 2-3 (lr)4-5 Loss quartile | pp | 95% CI | pp | 95% CI |
| Q2 against Q1 | +0.84 | \[-1.54, 3.22\] | -1.11 | \[-3.57, 1.34\] |
| Q3 against Q1 | +4.55 | \[1.77, 7.33\] | +1.53 | \[-1.45, 4.50\] |
| Q4 against Q1 | +1.35 | \[-1.09, 3.79\] | -1.25 | \[-4.05, 1.55\] |
| Joint test, $p$ | 0.014 |  | 0.192 |  |

Trek Rates by Loss Quartile within Districts {#tab:loss_flex}

*Notes*: Linear probability models of trekking on indicators for quartiles of the percentage loss (boundaries from the pooled sample of 2,385 owners), in percentage points relative to the lowest-loss quartile; HC1 intervals. A natural cubic spline in the percentage loss with district fixed effects and counts of enslaved people gives a joint $p$-value of 0.83. Exploratory checks, not part of the pre-specified analysis.

# Record Linkage Diagnostics

## Classifier Performance

Table [19](#tab:confusion) reports the performance of the classifier at the selected thresholds, by spouse evidence, in grouped cross-validation and on the held-out audit sample. Among pairs whose wives’ names agree, out-of-fold precision is 0.989 and recall 0.894; pairs without comparable wives, and pairs whose wives disagree, are never accepted automatically. On the held-out audit sample, all 16 acceptances of the spouse-assisted classifier are correct (95 percent interval 0.81–1.00), against 15 of 17 for the wife-blind classifier. The hold-out sample is small, and these figures describe classifier performance against hand labels rather than the accuracy of the final links. Only the main linkage additionally passed blind model review and, where the models did not both accept, author adjudication.

|  | Pairs | Matches | Accepted | Correct | Precision | Recall |
|:---|:--:|:--:|:--:|:--:|:--:|:--:|
| Wives agree | 115 | 104 | 94 | 93 | 0.989 | 0.894 |
| No comparable wife | 275 | 33 | 0 | 0 | — | 0.000 |
| Wives disagree | 423 | 2 | 0 | 0 | — | 0.000 |
| Hold-out, spouse-assisted | 97 | 20 | 16 | 16 | 1.000 \[0.81, 1.00\] | 0.800 |
| Hold-out, wife-blind | 97 | 20 | 17 | 15 | 0.882 \[0.66, 0.97\] | 0.750 |

Accuracy of the Linkage Classifier {#tab:confusion}

*Notes*: Upper panel: out-of-fold predictions of the spouse-assisted classifier in five-fold cross-validation grouped by connected genealogy persons and census households, classified at the selected thresholds by spouse evidence. Pairs with disagreeing wives are never accepted automatically. Lower panel: the held-out audit sample (15 percent of labeled person–household components, never used for training or tuning); 95 percent Wilson interval for precision in brackets. These describe classifier performance against hand labels; only the main linkage additionally passed blind model review and author adjudication.

## Identity Check of the Final Links

We drew a seeded random sample of census links, stratified by how the link was made: 30 classifier proposals accepted by both reviewers, 25 classifier proposals decided by the authors, 35 links made by adjudication alone, and 30 links made only by the wife-blind linkage. Two language models, Anthropic’s Claude Fable, which had not reviewed the links, and OpenAI’s GPT-6 Astra, here given a different task from the review, each saw the genealogical record (names, birth and death years, declared district, wives and marriage years) and a set of census heads from across the colony with the same surname (every head whose first name is close, the fifteen with the closest given names, and the linked head), shown with return, name, role, wife and annotations, in random order and without household counts, wealth, classifier scores or any indication of the link, and had to choose one head or none. Claude Fable rejected the link (choosing another head or none) for 0, 0, 1 and 14 links in the four strata, and GPT-6 Astra for 0, 1, 2 and 17. Both rejected 1 of the 90 links of the main linkage and 14 of the 30 wife-blind-only links, in 8 of these both chose the same other head and in 5 both chose none. Their reasons include conflicting spouse evidence, ambiguous namesakes and apparent confusion of fathers and sons. These are model judgments on a small sample, not verified error rates, and the two models may err in the same way.

## Matched vs. Unmatched Voortrekkers

Among the 1,131 records with a census candidate, 569 enter the final linkage. Table [20](#tab:matched_unmatched) compares these with the 562 unlinked records in that same candidate pool.

| Characteristic | Matched ($N=569$) | Unmatched ($N=562$) | Diff | $p$ |
|:---|---:|---:|---:|:---|
| tex_fragments/tab_matched_unmatched_body.tex |  |  |  |  |

Matched vs. Unmatched Voortrekkers {#tab:matched_unmatched}

*Notes*: Comparison of matched and unmatched Voortrekkers on characteristics available from the genealogical records. Matching success correlates with wife-name availability, so the matched sample over-represents men with recorded wives; matched records also have slightly more common surnames. These diagnostics do not establish balance on unobserved characteristics or resolve selection associated with the availability of wives’ names.

# Additional Robustness of the Linkage

This appendix discusses threshold selection, training data and blocking.

#### Thresholds.

The thresholds are chosen by $F_{0.5}$ on out-of-fold predictions, within a protocol fixed before the links were made. The selected threshold for pairs with agreeing wives is 0.60; for the wife-blind classifier, which uses a single threshold within the declared district, it is 0.75. We do not re-estimate the economic results at other thresholds. The wife-blind linkage changes the features and the review as well as the threshold, so it does not isolate sensitivity to the threshold.

#### Training data adequacy.

The 813 training pairs (139 matches) are comparable in size to the training data of Rijpma et al. (2020), who used a similar approach for Cape Colony data. Labels were resolved using the spouses’ names and other identity evidence, with household characteristics concealed from the reviewers. The class balance reflects the low base rate of true matches among candidates.

#### Blocking.

Blocking combines exact surnames with approximate ones (Soundex, or a Jaro-Winkler similarity of at least 0.92 on particle-free surnames), so that common spelling variants enter the candidate set. The particle-free comparison keeps the candidate set manageable despite the frequency of common Afrikaner surnames (Botha, Du Plessis, Van der Merwe).

# Attenuation Bias from False Positives

Incorrect links assign non-Voortrekker households to the Voortrekker group; errors of this kind attenuate coefficients toward zero when they are unrelated to household characteristics (M. Bailey et al. 2020). We consider two benchmark rates. The first is the out-of-fold false-positive share among pairs scoring above the classifier threshold (3.3 percent), an unrestricted score-threshold benchmark that describes the classifier before review; under the implemented rule, which also requires agreeing wives, the out-of-fold rate is lower (1 of 94 accepted pairs). The second rate, 30.0 percent, is the share of links that would be wrong if all 157 households linked only by adjudication and 3.3 percent of the 412 classifier-proposed households were wrong. The simulation applies it to randomly chosen linked households; it does not single out the adjudicated links, so it describes random error at that rate, not the consequence of those particular links being wrong. The concern is most acute for null results: the absence of wealth selection could be a consequence of linkage noise rather than a genuine absence of selection. It is less serious for positive results, since random error works *against* detecting them.

For each of five contamination rates (0%, 3.3%, 10%, 20% and 30.0%), we randomly replace the corresponding fraction of matched Voortrekker outcome values with values drawn from unlinked households in the same district, re-run the district fixed-effects regression, and record the coefficient. We retain 500 repetitions for coefficient distributions and 200 for significance frequencies. Table [21](#tab:attenuation) reports the results.

The household-size and children coefficients attenuate steadily as contamination increases. At 20 percent contamination the mean coefficients are 0.543 and 0.411; at the 30.0 percent rate they are 0.472 and 0.356, and household size remains significant in 99.5 percent of repetitions. Random linkage error of this kind would therefore shrink a true premium without removing it. The simulation imposes random replacement; selective matching errors need not behave in this way, and the linkage’s preference for married men, which is selective, is examined directly in Section [4.4](#sec:married).

The wealth-index coefficient remains small and statistically insignificant at every contamination rate (it is significant in at most 9 percent of repetitions). There is no contamination rate at which a wealth effect emerges. Adding noise to the observed contrast cannot, however, reveal whether linkage error prevented the detection of a true wealth difference, so the exercise is not additional evidence of wealth equivalence.

The negative coefficient for enslaved people attenuates in the same way, from $-0.521$ to $-0.369$ at the 30.0 percent rate.

Table [5](#tab:tiers_main) reports the 412 classifier-proposed and 157 adjudicated households separately. Their contrast largely reflects the married-household margin, since the classifier proposes only married couples; it neither demonstrates nor rules out a difference in accuracy.

|                                        | Contamination rate |      |     |     |       |
|:---------------------------------------|:------------------:|:----:|:---:|:---:|:-----:|
| 2-6 Variable                           |         0%         | 3.3% | 10% | 20% | 30.0% |
| tex_fragments/tab_attenuation_body.tex |                    |      |     |     |       |

Estimates under Simulated Linkage Errors {#tab:attenuation}

*Notes*: Top panel: mean coefficients from 500 repetitions; 95% simulation intervals in brackets. At rate $c$, $c\times N_{\text{VT}}$ treated household outcomes are replaced with outcomes drawn from unlinked households in the same district. The 3.3% benchmark is the out-of-fold false-positive share above the unrestricted score threshold; the 30.0% rate is the share that would be wrong if all 157 adjudicated households and 3.3% of the 412 classifier-proposed households were, applied to randomly chosen linked households. Neither is an estimate or bound on final linkage error. Bottom panel: percentage significant at 5% using HC1 standard errors, from 200 repetitions per nonzero rate.

# Limitations in Detail

This appendix expands the five caveats summarized in Section [9](#sec:conclusion).

#### The ten-year gap.

The 1825 census predates the onset of the Trek in 1835 by a full decade. Between 1825 and 1835, the Cape Colony experienced Ordinance 50 (1828), which restructured labor relations; the Sixth Frontier War (1834–35), which destroyed over £290,000 of capital concentrated in the eastern districts; and emancipation itself. The economic characteristics we observe in 1825 may not reflect households’ circumstances at the time of departure.

The concern goes beyond the possibility that “household wealth could have changed”: these shocks may have *differentially* affected future Voortrekkers and stayers. The Sixth Frontier War’s livestock losses were concentrated in the eastern frontier districts from which most Voortrekkers came, and the pastoral setting recorded in 1825 may have made future Trekkers differentially vulnerable to livestock raids. A household that was middling-pastoral in 1825 could have been substantially poorer by 1835. If so, the small main-specification wealth difference in 1825 could coexist with negative selection by the time of departure.

This concern is substantially less serious for the household-composition finding than for a claim about wealth. Household composition, marriage, the number of children, working-age men and the size of the family, may be more persistent over a decade than livestock holdings or crop output. Children age, and some leave the parental household; but a household with many children in 1825 typically had older children by 1835, with sons approaching the age at which they would need land of their own. The demographic pressure with which our findings are consistent may, if anything, have intensified over the decade as children grew and the division of the estate approached. The district fixed effects in our main specification absorb the broad between-district correlation between war exposure and trek rates: the Sixth Frontier War affected eastern districts most severely and those districts also trekked most. What district fixed effects do *not* eliminate is the possibility of within-district differential vulnerability. If more pastoral, cattle-rich households within the same district suffered larger raid losses, then war could still have increased their relative grievances even without any intentional targeting of future Voortrekkers as a political group. District fixed effects remove differences between districts, not finer differences in exposure within them, which may have arisen from location as well as from asset portfolios.

Without a complete census closer to 1835, we cannot fully resolve the ten-year gap. The 1825 Opgaafrolle remain the most complete individual-level economic data available for the Cape Colony in this period.

#### Unmatched Voortrekkers.

Our overall match rate is 47 percent of named genealogical records, and 50 percent of the records for which the census offers a candidate. If unmatched Voortrekkers differ systematically from matched ones, for example because they had very common names or came from districts with poorer records, our results could be subject to selection bias. Within the candidate pool, matched records more often have a wife recorded in the genealogy and, on average, a slightly more common surname (Table [20](#tab:matched_unmatched)), though such comparisons cannot establish differences in unobserved characteristics. The most important selection concerns marriage: men who had married by the census year are linked far more often (62 percent) than men who married later (29 percent), so linked Trekkers overrepresent married men. Section [4.4](#sec:married) shows that the household-size difference among married couples is small and imprecise. The married share among all Trekkers cannot be measured directly. If the difference in linkage rates reflected linkage alone, the 82 percent married share among linked Trekkers would correspond to about 67 percent among all Trekkers, against 65 percent among the controls; married men would have to be linked 2.4 times as often as later-married men, against 2.2 times in the genealogy, for the excess to vanish. This is an illustrative calibration, not an estimate or a bound, because the genealogy’s linkage rates also reflect whether a man headed a household in 1825 and need not equal the rates at which census couples are linked. A small number of annotated census quantities and disputed source dates are treated as missing or excluded rather than assigned guessed values; they are listed in the replication ledger.

#### Unobservable characteristics.

The census measures assets, labor and output but not ideology, social networks, personality or risk tolerance, characteristics that may have influenced the decision to trek. Our analysis identifies the economic profile of those who left; it cannot fully explain the decision-making process. The small main-specification wealth difference limits an account based on strong wealth selection at this baseline, but a complete account of the Trek would require information on dimensions that no surviving source can provide.

#### Survival selection.

The ten-year gap also introduces the possibility of survival selection. If smaller or more vulnerable households were more likely to experience head-of-household mortality between 1825 and 1835, from frontier violence, disease or other causes, then the surviving pool of potential Voortrekkers would mechanically over-represent larger, healthier households. This works in the same direction as our demographic finding and could inflate the household-size premium. We cannot test this directly without mortality records for the intercensal period, and it remains a possible contributor to the premium.

#### Cross-district mobility.

The classifier accepts cross-district links automatically only when the wives’ names agree, which limits our ability to identify Voortrekkers who had moved between districts before 1835 and had not yet married. Reviewed exceptions do not remove this source of geographic selection.

# References

Abadie, Alberto, Susan Athey, Guido W. Imbens, and Jeffrey M. Wooldridge. 2023. “When Should You Adjust Standard Errors for Clustering?” *Quarterly Journal of Economics* 138 (1): 1–35.

Abramitzky, Ran, and Leah Platt Boustan. 2017. “Immigration in American Economic History.” *Journal of Economic Literature* 55 (4): 1311–45.

Abramitzky, Ran, Leah Platt Boustan, and Katherine Eriksson. 2012. “Europe’s Tired, Poor, Huddled Masses: Self-Selection and Economic Outcomes in the Age of Mass Migration.” *American Economic Review* 102 (5): 1832–56.

Abramitzky, Ran, Leah Platt Boustan, Katherine Eriksson, James Feigenbaum, and Santiago Pérez. 2021. “Automated Linking of Historical Data.” *Journal of Economic Literature* 59 (3): 865–918.

Bailey, Martha J., Connor Cole, Morgan Henderson, and Catherine Massey. 2020. “How Well Do Automated Linking Methods Perform? Lessons from U.S. Historical Data.” *Journal of Economic Literature* 58 (4): 997–1044.

Bailey, Martha, Connor Cole, Morgan Henderson, and Catherine Massey. 2020. “How Well Do Automated Linking Methods Perform? Lessons from U.S. Historical Data.” *Journal of Economic History* 80 (4): 997–1044.

Bazzi, Samuel, Andreas Ferrara, Martin Fiszbein, Thomas Pearson, and Patrick A. Testa. 2023. “The Other Great Migration: Southern Whites and the New Right.” *Quarterly Journal of Economics* 138 (3): 1577–647.

Becker, Sascha O., Irena Grosfeld, Pauline Grosjean, Nico Voigtländer, and Ekaterina Zhuravskaya. 2020. “Forced Migration and Human Capital: Evidence from Post-WWII Population Transfers.” *American Economic Review* 110 (5): 1430–63.

Beltrán Tapia, Francisco, and Santiago de Miguel Salanova. 2017. “Migrants’ Self-Selection in the Early Stages of Modern Economic Growth.” *Economic History Review* 70 (1): 101–21.

Benjamini, Yoav, and Yosef Hochberg. 1995. “Controlling the False Discovery Rate: A Practical and Powerful Approach to Multiple Testing.” *Journal of the Royal Statistical Society: Series B (Methodological)* 57 (1): 289–300.

Binckes, Robin. 2013. *The Great Trek Uncut*. 30° South Publishers.

Blum, Matthias, Karl-Peter Krauss, and Dmytro Myeshkov. 2022. “Human Capital Transfer of German-Speaking Migrants in Eastern Europe, 1780s–1820s.” *Economic History Review* 75 (3): 703–38.

Borjas, George J. 1987. “Self-Selection and the Earnings of Immigrants.” *American Economic Review* 77 (4): 531–53.

Cameron, A. Colin, Jonah B. Gelbach, and Douglas L. Miller. 2008. “Bootstrap-Based Improvements for Inference with Clustered Errors.” *Review of Economics and Statistics* 90 (3): 414–27.

Cilliers, Jeanne, and Erik Green. 2018. “The Land Labour Hypothesis in a Settler Economy: Wealth, Labour, and Household Composition on the South African Frontier.” *International Review of Social History* 63: 239–71.

Cilliers, Jeanne, Erik Green, and Robert Ross. 2023. “Did It Pay to Be a Pioneer? Wealth Accumulation in a Newly Settled Frontier Society.” *The Economic History Review* 76: 257–82.

Cobbing, Julian. 1988. “The Mfecane as Alibi: Thoughts on Dithakong and Mbolompo.” *Journal of African History* 29 (3): 487–519.

Collins, William J., and Marianne H. Wanamaker. 2014. “Selection and Economic Gains in the Great Migration of African Americans: New Evidence from Linked Census Data.” *American Economic Journal: Applied Economics* 6 (1): 220–52.

Collins, William J., and Marianne H. Wanamaker. 2015. “The Great Migration in Black and White: New Evidence on the Selection and Sorting of Southern Migrants.” *Journal of Economic History* 75 (4): 947–92.

Conor, Dylan. 2019. “Cream of the Crop? Geography, Networks, and Irish Migrant Selection in the Age of Mass Migration.” *Journal of Economic History* 79 (1): 139–75.

Derenoncourt, Ellora. 2022. “Can You Move to Opportunity? Evidence from the Great Migration.” *American Economic Review* 112 (2): 369–408.

Draper, Nicholas. 2010. *The Price of Emancipation: Slave-Ownership, Compensation and British Society at the End of Slavery*. Cambridge University Press.

Dribe, Martin, Björn Eriksson, and Jonas Helgertz. 2022. “From Sweden to America: Migrant Selection in the Transatlantic Migration, 1890–1910.” *European Review of Economic History* 27 (1): 24–44.

Du Toit, André, and Hermann Giliomee. 1983. *Afrikaner Political Thought: Analysis and Documents, Volume 1, 1780–1850*. David Philip.

Ekama, Kate, Johan Fourie, Hans Heese, and Lisa-Cheree Martin. 2021. “When Cape Slavery Ended: Introducing a New Slave Emancipation Dataset.” *Explorations in Economic History* 81: 101390.

Elphick, Richard, and Hermann Giliomee. 1989. “The Origins and Entrenchment of European Dominance at the Cape, 1652–c. 1840.” In *The Shaping of South African Society, 1652–1840*, 2nd ed., edited by Richard Elphick and Hermann Giliomee. Maskew Miller Longman.

Etherington, Norman. 2001. *The Great Treks: The Transformation of Southern Africa, 1815–1854*. Longman.

Feigenbaum, James J. 2016. “Automated Census Record Linking: A Machine Learning Approach.” Unpublished manuscript.

Fourie, Johan. 2022. *Our Long Walk to Economic Freedom: Lessons from 100,000 Years of Human History*. Cambridge University Press.

Gay, Victor, Paula E. Gobbi, and Marc Goñi. 2026. “Revolutionary Transition: Inheritance Change and Fertility Decline.” *Journal of Political Economy* 134 (6): 1666–713.

Giliomee, Hermann. 2003. *The Afrikaners: Biography of a People*. University of Virginia Press.

Hall, Catherine, Nicholas Draper, Keith McClelland, Katie Donington, and Rachel Lang. 2014. *Legacies of British Slave-Ownership: Colonial Slavery and the Formation of Victorian Britain*. Cambridge University Press.

Hamilton, Carolyn. 1998. *Terrific Majesty: The Powers of Shaka Zulu and the Limits of Historical Invention*. Harvard University Press.

Hanson, Gordon, Pia Orrenius, and Madeline Zavodny. 2023. “US Immigration from Latin America in Historical Perspective.” *Journal of Economic Perspectives* 37 (1): 199–222.

Hatton, Timothy J., and Zachary Ward. 2024. “International Migration in the Atlantic Economy 1850–1940.” In *Handbook of Cliometrics*. Springer.

Hirschman, Albert O. 1970. *Exit, Voice, and Loyalty: Responses to Decline in Firms, Organizations, and States*. Harvard University Press.

Holm, Sture. 1979. “A Simple Sequentially Rejective Multiple Test Procedure.” *Scandinavian Journal of Statistics* 6 (2): 65–70.

Keegan, Timothy. 1996. *Colonial South Africa and the Origins of the Racial Order*. David Philip.

Lakens, Daniël. 2017. “Equivalence Tests: A Practical Primer for $t$ Tests, Correlations, and Meta-Analyses.” *Social Psychological and Personality Science* 8 (4): 355–62.

Leeuwen, Marco H. D. van, and Ineke Maas. 2022. “Social Mobility Through Migration to the Colonies: The Case of Algeria.” *Journal of Interdisciplinary History* 53 (2): 225–65.

Legassick, Martin. 2010. *The Politics of a South African Frontier: The Griqua, the Sotho-Tswana, and the Missionaries, 1780–1840*. Basler Afrika Bibliographien.

Leopold, Stefan, Jens Ruhose, and Simon Wiederhold. 2025. “Why Is the Roy–Borjas Model Unable to Predict International Migrant Selection on Education? Evidence from Urban and Rural Mexico.” *The World Economy* 48 (2): 300–322.

MacCrone, Ian Douglas. 1937. *Race Attitudes in South Africa: Historical, Experimental and Psychological Studies*. Oxford University Press.

Macmillan, William Miller. 1927. *The Cape Colour Question: A Historical Survey*. Faber; Gwyer.

Macmillan, William Miller. 1929. *Bantu, Boer and Briton: The Making of the South African Native Problem*. Faber; Faber.

Marais, Johannes Stephanus. 1939. *The Cape Coloured People, 1652–1937*. Longmans, Green.

Muller, C. F. J. 1963. *Die Britse Owerheid En Die Groot Trek*. Universiteit van Suid-Afrika.

Muller, C. F. J. 1974. *Die Oorsprong van Die Groot Trek*. Tafelberg.

Natkhov, Timur, and Natalia Vasilenok. 2021. “Skilled Immigrants and Technology Adoption: Evidence from the German Settlements in the Russian Empire.” *Explorations in Economic History* 81: 101399.

Nel, Heinrich. 2020. “Wealth Mobility, Familial Ties and Migration: Evidence from the Cape of Good Hope Panel.” PhD thesis, Stellenbosch University.

Newton-King, Susan. 1999. *Masters and Servants on the Cape Eastern Frontier, 1760–1803*. Cambridge University Press.

Pérez, Santiago. 2017. “The (South) American Dream: Mobility and Economic Outcomes of First- and Second-Generation Immigrants in Nineteenth-Century Argentina.” *The Journal of Economic History* 77 (4): 971–1006.

Rijpma, Auke, Jeanne Cilliers, and Johan Fourie. 2020. “Record Linkage in the Cape of Good Hope Panel.” *Historical Methods* 53 (2): 112–29.

Ross, Robert. 1999. *A Concise History of South Africa*. Cambridge University Press.

Van der Merwe, P. J. 1937. *Die Noordwaartse Beweging van Die Boere Voor Die Groot Trek, 1770–1842*. Die Staatsdrukker.

Van Jaarsveld, Floris Albertus. 1951. *Die Eenheidstrewe van Die Republikeinse Afrikaners*. J. P. van der Walt.

Venter, Chris. 1985. *The Great Trek*. Don Nelson.

Walker, Eric A. 1934. *The Great Trek*. Adam; Charles Black.

Ward, Zachary. 2017. “Birds of Passage: Return Migration, Self-Selection and Immigration Quotas.” *Explorations in Economic History* 64: 37–52.

Worden, Nigel. 1985. *Slavery in Dutch South Africa*. Cambridge University Press.

Wright, John. 2010. “Turbulent Times: Political Transformations in the North and East, 1760s–1830s.” In *The Cambridge History of South Africa, Volume 1: From Early Times to 1885*, edited by Carolyn Hamilton, Bernard K. Mbenga, and Robert Ross. Cambridge University Press.

Zimran, Ariell. 2024. “Internal Migration in the United States: Rates, Selection, and Destination Choice, 1850–1940.” *The Journal of Economic History* 84 (3): 727–66.

[^1]: LEAP, Stellenbosch University. Corresponding author. Email: <johanf@sun.ac.za>.

[^2]: LEAP, Stellenbosch University.

[^3]: We thank Anton Ehlers, Erik Green, Albert Grundlingh, Gustav Hendrich and Dieter von Fintel for valuable comments on an earlier draft. We also thank seminar participants at Stellenbosch University and conference participants at the Economic History Society of Southern Africa annual meeting for helpful suggestions. Both authors acknowledge financial support from the Riksbankens Jubileumsfond (Cape of Good Hope Panel project: M20-0041). The usual disclaimer applies. This paper was created with the help of Anthropic’s Claude Code and OpenAI’s Codex. Cite this paper as: Fourie, Johan, and Calumet Links. 2026. “Selection into the Great Trek.” Working Paper, Department of Economics, Stellenbosch University.

[^4]: Muller cites Col. Somerset’s report of November 1835 to D’Urban, in Emigrant Documents, pp. 74–75.

[^5]: Cilliers, *Joernaal*, cited in Muller, *Die Oorsprong*, p. 225.

[^6]: Napier to Glenelg, quoted in Muller, *Die Britse Owerheid*, p. 76.

[^7]: “Die Dagboek van Anna Steenkamp”, Pietermaritzburg, 1939, p. 10; English translation from Bird, *Annals of Natal*, I, p. 459.

[^8]: Campbell to the Acting Cape Government Secretary, January 1834, quoted in Muller, *Die Oorsprong*, p. 354.

[^9]: Uitenhage 1/1: Kerkraadsnotule, 1817–1842, p. 146, cited in Muller, *Die Oorsprong*, p. 200.

[^10]: Muller, *Die Britse Owerheid*, pp. 68–69, citing L.G. 169–174 and the Relief Commissioner’s returns.

[^11]: Quoted in Muller, *Die Britse Owerheid*, p. 83.

[^12]: Clanwilliam and Worcester use 1824 returns. Somerset was established in 1825; the census we use is recorded under its earlier name, Cradock (1823). Colesberg was formally established only in the 1830s, carved from Graaff-Reinet. Our matching procedure accounts for these boundary changes by searching across related districts.

[^13]: Unlinked census households are classified as non-Voortrekkers, although some are unrecorded or unmatched trekkers; incomplete genealogical coverage prevents a numerical bound on their number. Misclassification of this kind attenuates every contrast toward zero when it is unrelated to household characteristics, and could bias a contrast in either direction when it is selective. Appendix [19](#sec:app_attenuation) considers random contamination of the treated group.

[^14]: Appendix [15](#sec:app_clustered) reports inference with errors clustered by district; the household-composition differences remain significant under it.

[^15]: We follow Lakens (2017); Appendix Table [\[tab:tost\]](#tab:tost) reports sensitivity to the bound. The 0.10 bound is half the negative selection documented by Abramitzky et al. (2012). Equivalence is not confirmed for enslaved people or Khoekhoe workers, of which Trekkers held fewer, nor for the wealth index with district-clustered errors.
