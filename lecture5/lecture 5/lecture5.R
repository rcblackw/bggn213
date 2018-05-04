#' ---
#' title: "BGGN213 lecture 5"
#' author: "Reggie Blackwell"
#' date: "April 18 2018"
#' ---
#' ---
#' title: "Bioinformatics Lecture 5"
#' output:
#'   html_document:
#'     code_folding: hide
#' ---
#exploratory analysis, saving data
#plots
x <- rnorm(1000,0)
plot(x)

mean(x)

sd(x)

summary(x)
#q2 = median

boxplot(x)

hist(x)
dotchart(x)
#section 1 
#read chart into console
baby <- read.table("bggn213_05_rstats/weight_chart.txt",header=T)
plot(baby, type="b", pch=15, cex=1.5,lwd=2, xlim=c(-2,20), ylim=c(2,10), xlab="Age (months)", ylab="Weight (kg)", main="Some title")

#read in feature counts file
feat<- read.table("bggn213_05_rstats/feature_counts.txt", header=T, sep="\t")
#set margins
par(mar=c(6,12,5,10))
barplot(feat$Count, names.arg=feat$Feature, horiz=TRUE, las=2, main="Some title" )

#create multiple plots on one screen
par(mfrow =c(2,1))
#remove multipe plots

#section 2
#first error = multiple rows with same name
#use read.delim to use sep="\t" in each and header=T
#part A
#the number of columns


#part B
exp <- read.delim("bggn213_05_rstats/up_down_expression.txt")
par(mar=c(1,1,1,1))#set the margins
nrow(exp)#the number of rows in file
palette(c("red","green","blue"))#set the color palette for this graph
plot(exp$Condition1, exp$Condition2,  col=exp$State)
table(exp$State)#summary table of genes and direction
#part C
value <- read.table("bggn213_05_rstats/expression_methylation.txt")
#create a color palette from grey to red
this<- colorRampPalette(c("blue", "orange"))(100)
#
scatter.smooth(value$promoter.meth,value$gene.meth,col=this)
