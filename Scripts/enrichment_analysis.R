# ------------------------------------------------------------------------------
# Title: GO and KEGG Pathway Enrichment Analysis
# Description: Functional annotation of core hub genes for Wogonin against RCC
# ------------------------------------------------------------------------------

# Install required packages if not already installed:
# if (!requireNamespace("BiocManager", quietly = TRUE)) install.packages("BiocManager")
# BiocManager::install(c("clusterProfiler", "org.Hs.eg.db", "enrichplot", "ggplot2"))

library(clusterProfiler)
library(org.Hs.eg.db)
library(ggplot2)

# 1. Define the core hub gene symbols
hub_genes <- c("STAT3", "CCND1", "TP53", "CASP3", "VEGFA", "JUN")

# 2. Map gene symbols to ENTREZ IDs (required for clusterProfiler)
gene_ids <- bitr(
  hub_genes, 
  fromType = "SYMBOL", 
  toType   = "ENTREZID", 
  OrgDb    = org.Hs.eg.db
)

# 3. Perform Gene Ontology (GO) Biological Process Enrichment
go_results <- enrichGO(
  gene          = gene_ids$ENTREZID,
  OrgDb         = org.Hs.eg.db,
  ont           = "BP",            # Biological Process
  pAdjustMethod = "BH",
  pvalueCutoff  = 0.05
)

# Export GO Barplot Image
png("figures/go_enrichment_barplot.png", width = 800, height = 600, res = 120)
barplot(go_results, showCategory = 10, title = "GO Biological Process Enrichment")
dev.off()

# 4. Perform KEGG Pathway Enrichment Analysis
kegg_results <- enrichKEGG(
  gene         = gene_ids$ENTREZID,
  organism     = 'hsa',           # Homo sapiens
  pvalueCutoff = 0.05
)

# Export KEGG Dotplot Image
png("figures/kegg_enrichment_dotplot.png", width = 800, height = 600, res = 120)
dotplot(kegg_results, showCategory = 10, title = "KEGG Pathway Enrichment")
dev.off()

# 5. Export processed tables to CSV
write.csv(as.data.frame(go_results), "data/processed/go_enrichment.csv", row.names = FALSE)
write.csv(as.data.frame(kegg_results), "data/processed/kegg_enrichment.csv", row.names = FALSE)

cat("Successfully generated GO/KEGG tables and plot figures!\n")
