# Reproducing Scutellaria baicalensis vs. Renal Cell Carcinoma Analysis

## Overview
This repository contains the data pipeline, network pharmacology scripts, and molecular docking workflows to reproduce the study on *Scutellaria baicalensis* active compounds against Renal Cell Carcinoma (RCC).

## Project Workflow
1. **Active Compound Screening:** Extracting compounds from TCMSP based on Oral Bioavailability (OB ≥ 30%) and Drug-Likeness (DL ≥ 0.18).
2. **Target Prediction & Mapping:** Cross-referencing herb targets with RCC disease targets from GeneCards & OMIM.
3. **Network Pharmacology:** Building Protein-Protein Interaction (PPI) networks in STRING/Cytoscape to identify core hub genes.
4. **Molecular Docking:** Simulating 3D binding affinities between candidate compounds (e.g., Baicalein) and target proteins using AutoDock Vina.

## Folder Structure
* `data/raw/`: Raw query data from TCMSP, GeneCards, OMIM, PubChem, and PDB.
* `data/processed/`: Filtered active compounds and target intersection datasets.
* `notebooks/`: Exploratory data analysis and network construction.
* `scripts/`: Clean Python/R scripts for automated data parsing.
* `results/`: Processed binding energies and PPI interaction tables.
* `figures/`: Generated network graphs, Venn diagrams, and docking visualizations.
