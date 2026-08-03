# Reproducing Molecular Docking and Network Pharmacological Analysis of Scutellaria baicalensis Against Renal Cell Carcinoma

## Overview
This repository contains a full computational reproduction of the study analyzing the active components, target genes, and molecular mechanisms of ***Scutellaria baicalensis*** in the treatment of **Renal Cell Carcinoma (RCC)** (PMID: [38095405](https://pubmed.ncbi.nlm.nih.gov/38095405/)).

The study demonstrates that *Scutellaria baicalensis* operates via a multi-component, multi-target mechanism involving 36 active compounds (including Wogonin, Baicalein, Acacetin, Oroxylin A, Moslosooflavone, Salvigenin, and Neobaicalein) targeting key signaling pathways such as PI3K-Akt, Ras, MAPK, p53, VEGF, and JAK-STAT.

---

## Project Workflow

1. **Active Compound Screening:** Extracted 36 active phytocompounds from *Scutellaria baicalensis* via TCMSP based on Oral Bioavailability ($\text{OB} \ge 30\%$) and Drug-Likeness ($\text{DL} \ge 0.18$).
2. **Target Prediction & Mapping:** Identified 85 common drug-disease target genes between *Scutellaria baicalensis* drug targets and RCC disease targets obtained from OMIM, GeneCards, and DrugBank.
3. **Network Pharmacology:** Constructed Component-Target-Disease PPI networks in STRING and Cytoscape to isolate core hub genes (`STAT3`, `CCND1`, `TP53`, `CASP3`, `VEGFA`, `JUN`, `AKT1`, `EGFR`).
4. **Functional Enrichment:** GO Biological Process and KEGG pathway enrichment analysis performed via R/Bioconductor (`clusterProfiler`).
5. **Molecular Docking:** Structure-based binding affinity validation between representative active compound Wogonin and core target proteins using AutoDock Vina / CB-Dock2 and PyMOL.

---

## Repository Structure

```text
.
├── data/
│   ├── docking/
│   │   ├── casp3.pdb
│   │   ├── ccnd1.pdb
│   │   ├── jun.pdb
│   │   ├── stat3.pdb
│   │   ├── tp53.pdb
│   │   ├── vegfa.pdb
│   │   └── wogonin.sdf
│   ├── processed/
│   │   ├── docking_results.csv
│   │   ├── go_enrichment.csv
│   │   ├── hub_genes.csv
│   │   └── kegg_enrichment.csv
│   └── raw/
│       ├── genecards_rcc_targets.csv
│       ├── omim_rcc_targets.csv
│       └── tcmsp_scutellaria_targets.csv
├── figures/
│   ├── docking_tp53_wogonin.png
│   ├── go_enrichment_barplot.png
│   ├── kegg_enrichment_dotplot.png
│   └── ppi_network_hub_genes.png
├── notebooks/
│   └── exploratory_analysis.ipynb
├── results/
│   └── interaction_tables.csv
├── scripts/
│   ├── enrichment_analysis.R
│   └── ppi_network_construction.R
├── LICENSE
└── README.md
