Biological Individuality Taxonomy

Data and Code for:
“What Is a Biological Individual? A Formal Taxonomy Across the Tree of Life”
Philosophical Transactions of the Royal Society B: Biological Sciences (2026)

Author: Sam Adeyemi
ORCID: 0009-0002-5023-5222
Repository: https://github.com/SamAde1203/BiologicalIndividuality-Taxonomy

## 📁 Repository Structure
```text
BiologicalIndividuality-Taxonomy/
├── README.md
├── LICENSE
├── data/
│   └── case_study_master.csv
├── scripts/
│   └── BiologicalIndividuality-R-Scripts-All-Figures.r
└── figs/
    └── (exported figure files: PDF/TIFF/PNG)


📊 Data Overview

This repository accompanies a comparative analysis of 127 biological case studies across the tree of life, scored along four criteria defining a multidimensional individuality space:

Spatial boundedness

Functional integration

Reproductive bottlenecking

Fitness alignment

Individual entities are positioned within this four-dimensional space.
Tier labels (I–IV) represent empirical clusters, not hierarchical levels.

Core Variables
Column	Description
Taxon	Scientific name
Clade	Major lineage
Criterion_I	Spatial boundedness (0–1)
Criterion_II	Functional integration (0–1)
Criterion_III	Reproductive bottlenecking (0–1)
Criterion_IV	Fitness alignment (0–1)
Tier	Empirical cluster assignment
Notes	Context-dependent considerations
References	Primary literature sources
🖥️ Reproducing the Figures
Requirements

R ≥ 4.5.0

Install required packages:

install.packages(c(
  "ggplot2",
  "dplyr",
  "tidyr",
  "ape",
  "phytools",
  "patchwork",
  "scales"
))

Generate All Figures

From repository root:

setwd("path/to/BiologicalIndividuality-Taxonomy")
source("scripts/BiologicalIndividuality-R-Scripts-All-Figures.r")


Figures will be saved to:

figs/


Output files include:

Fig1A.pdf (Multidimensional axes illustration)

Fig1D.pdf (Illustrative PCA projection)

Fig2C.pdf (Evolutionary regime shifts)

Fig3E.pdf (Symbiosis integration comparison)

Fig4C.pdf (Conflict reduction across tiers)

Fig4D.pdf (Germline timing vs cancer incidence)

All figures are generated at 300 DPI (publication standard).

📖 Conceptual Framework

The taxonomy defines biological individuality as a multidimensional configuration, not a binary or strictly hierarchical category.

Empirically, biological entities cluster into recurrent regions of this space:

Tier I — Minimal individuality (high spatial boundedness only)

Tier II — Physiological integration

Tier III — Developmental individuality (bottlenecking present)

Tier IV — Evolutionary individuality (strong fitness alignment)

These tiers are descriptive generalisations, not prescriptive ontological ranks.


## 📜 License
- **Code:** MIT License (see `LICENSE`)
- **Data:** CC BY 4.0 (Creative Commons Attribution 4.0)

You are free to share and adapt the materials (including commercial use) **with appropriate credit**.

## 🤝 Contributing
Contributions are welcome. To suggest corrections or additions:
1. Open an issue describing the taxon/error and citing supporting sources.
2. Submit a pull request with updated CSV rows + references.

## 📞 Contact
**Corresponding Author:** Sam Adeyemi  
Email: samoadeyemi@yahoo.co.uk  
ORCID: 0009-0002-5023-5222  

## 📝 Version History
- **v1.0 (2026-02-14):** Initial release (manuscript submission version)  
  - Case study dataset (template + expanding master table)  
  - Figure-generation scripts  
  - Output figures (PDF/TIFF)

_Last updated: 2026-02-14_
Repository: https://github.com/SamAde1203/BiologicalIndividuality-Taxonomy.git
