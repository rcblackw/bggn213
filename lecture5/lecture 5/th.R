library(DESeq2)
library("lattice")
library(tximport)
library(readr)
library(gplots)
library(RColorBrewer)


setwd("C:/Users/reggie blackwell/Desktop/SDxAB readcounts")

SDAB=read.csv("file:///C:/Users/reggie blackwell/Desktop/SDxAB readcounts/SDAB57_AB_MAP.csv", header=T)


condition=factor(c("Control", "Treatment"))
ExpDesign<- data.frame(row.names=colnames(SDAB$Name), condition=condition)
ExpDesign

dds <- DESeqDataSet(SDAB$Name, ExpDesign, ~condition)
dds <- DESeq(dds, betaPrior=FALSE)
