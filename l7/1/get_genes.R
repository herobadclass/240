if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("GEOquery")

library(GEOquery) 

all_data = getGEO("GSE21935") 
all_data = all_data$GSE21935_series_matrix.txt.gz 

pheno = all_data@phenoData@data 
assay = assayDataElement(all_data@assayData, 'exprs') 


x = head(assay,10)

y = pheno[,39]
for(i in 1:length(y)){
  if(y[i] == "control"){
    y[i] = 0
  }
  else{
    y[i] = 1
  }
}

save(x,y, file = "1a.RData")
