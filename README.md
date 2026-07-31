# Reproducing Network Pharmacology and Molecular Docking Analysis of Scutellaria baicalensis Against Renal Cell Carcinoma

## Overview
This repository contains a fully reproducible computational biology pipeline reproducing the study on ***Scutellaria baicalensis*** active compounds (specifically **Wogonin**) against **Renal Cell Carcinoma (RCC)**. 

The workflow integrates target prediction, protein-protein interaction (PPI) network analysis, functional enrichment (GO/KEGG), and structure-based 3D molecular docking validation.

---

## Project Workflow

1. **Active Compound Screening:** Extracting active phytocompounds from TCMSP based on Oral Bioavailability ($\text{OB} \ge 30\%$) and Drug-Likeness ($\text{DL} \ge 0.18$).
2. **Target Prediction & Mapping:** Cross-referencing herb targets with RCC disease targets mapped from GeneCards and OMIM databases.
3. **Network Pharmacology:** Constructing Protein-Protein Interaction (PPI) networks via STRING/Cytoscape to extract core hub genes (`STAT3`, `CCND1`, `TP53`, `CASP3`, `VEGFA`, `JUN`).
4. **Functional Enrichment:** GO Biological Process and KEGG pathway enrichment analysis performed via R/Bioconductor (`clusterProfiler`).
5. **Molecular Docking:** Structure-based binding affinity validation between Wogonin and target proteins using AutoDock Vina / CB-Dock2.

---

## Key Molecular Docking Results

| Target Gene | PDB ID | Ligand | Binding Energy (kcal/mol) | Affinity Rating |
| :--- | :--- | :--- | :--- | :--- |
| **STAT3** | **6TLC** | Wogonin | **-7.7** | Strong |
| **CCND1** | **237L** | Wogonin | **-7.0** | Strong |
| **TP53** | **1TUP** | Wogonin | **-6.8** | Good |
| **CASP3** | **1QX3** | Wogonin | **-6.4** | Good |
| **VEGFA** | **1VPF** | Wogonin | **-6.4** | Good |
| **JUN** | **1FOS** | Wogonin | **-6.3** | Good |

> **Evaluation Metric:** Binding energy $\le -5.0\text{ kcal/mol}$ indicates good binding affinity; $\le -7.0\text{ kcal/mol}$ indicates strong binding affinity. All top 6 core targets passed the threshold for spontaneous binding.

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
│       └── tcmsp_wogonin_targets.csv
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
