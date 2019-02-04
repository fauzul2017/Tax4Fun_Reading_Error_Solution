#setwd("/home/fauzul/R_code_similar_bugbase_plotting/BugBase_Analyses-M16V2/All_files/")
### Read the OTU contribution Table which contain TRUE or FALSE data for each OTU######
otu_contribution<-read.csv("otu_contribution.csv",header=TRUE,sep=",")
dim(otu_contribution)
## Make different dataframe for oragnism level traits###################
OTU_ID<-otu_contribution[,1]
Aerobic<-otu_contribution[,c(1,2)]
Anaerobic<-otu_contribution[,c(1,3)]
Contains_Mobile_Elements<-otu_contribution[,c(1,4)]
Facultatively_Anaerobic<-otu_contribution[,c(1,5)]
Forms_Biofilms<-otu_contribution[,c(1,6)]
Gram_Negative<-otu_contribution[,c(1,7)]
Gram_Positive<-otu_contribution[,c(1,8)]
Potentially_Pathogenic<-otu_contribution[,c(1,9)]
Stress_Tolerant<-otu_contribution[,c(1,10)]
#### Subset only TRUE in each organism level traits dataset###########
Aerobic_TRUE = subset(Aerobic, Aerobic == "TRUE")
Anaerobic_TRUE = subset(Anaerobic, Anaerobic == "TRUE")
Contains_Mobile_Elements_TRUE = subset(Contains_Mobile_Elements, Contains_Mobile_Elements == "TRUE")
Facultatively_Anaerobic_TRUE = subset(Facultatively_Anaerobic, Facultatively_Anaerobic == "TRUE")
Forms_Biofilms_TRUE = subset(Forms_Biofilms, Forms_Biofilms == "TRUE")
Gram_Negative_TRUE = subset(Gram_Negative, Gram_Negative == "TRUE")
Gram_Positive_TRUE = subset(Gram_Positive, Gram_Positive == "TRUE")
Potentially_Pathogenic_TRUE = subset(Potentially_Pathogenic, Potentially_Pathogenic == "TRUE")
Stress_Tolerant_TRUE = subset(Stress_Tolerant, Stress_Tolerant == "TRUE")
#####Read normalized OTU abundance in samples and make OTU abundance table for each category viz., aerobic###########################
normalized_otus<-read.csv("normalized_OTU.csv",header=TRUE,sep=",")
otus<-normalized_otus[,1]
Aerobic_index<-which(otus%in%Aerobic_TRUE[,1])
Anaerobic_index<-which(otus%in%Anaerobic_TRUE[,1])
Contains_Mobile_Elements_index<-which(otus%in%Contains_Mobile_Elements_TRUE[,1])
Facultatively_Anaerobic_index<-which(otus%in%Facultatively_Anaerobic_TRUE[,1])
Forms_Biofilms_index<-which(otus%in%Forms_Biofilms_TRUE[,1])
Gram_Negative_index<-which(otus%in%Gram_Negative_TRUE[,1])
Gram_Positive_index<-which(otus%in%Gram_Positive_TRUE[,1])
Potentially_Pathogenic_index<-which(otus%in%Potentially_Pathogenic_TRUE[,1])
Stress_Tolerant_index<-which(otus%in%Stress_Tolerant_TRUE[,1])

Aerobic_normalized_data<-normalized_otus[Aerobic_index,]
Anaerobic_normalized_data<-normalized_otus[Anaerobic_index,]
Contains_Mobile_Elements_normalized_data<-normalized_otus[Contains_Mobile_Elements_index,]
Facultatively_Anaerobic_normalized_data<-normalized_otus[Facultatively_Anaerobic_index,]
Forms_Biofilms_normalized_data<-normalized_otus[Forms_Biofilms_index,]
Gram_Negative_normalized_data<-normalized_otus[Gram_Negative_index,]
Gram_Positive_normalized_data<-normalized_otus[Gram_Positive_index,]
Potentially_Pathogenic_normalized_data<-normalized_otus[Potentially_Pathogenic_index,]
Stress_Tolerant_normalized_data<-normalized_otus[Stress_Tolerant_index,]
######## Read taxonomy data for each OTUs, 1st,2nd,3rd,4th,5th,6th,7th column contains OTU, Phylum, Class, Order, Family, Genus and Species information###################################
taxonomy<-read.csv("M16V2_otu_taxonomy.csv",header=TRUE,sep=",")
colnames(taxonomy)
taxonomy_otus<-taxonomy[,1]
taxonomy_Aerobic_index<-which(taxonomy_otus%in%Aerobic_TRUE[,1])
taxonomy_Anaerobic_index<-which(taxonomy_otus%in%Anaerobic_TRUE[,1])
taxonomy_Contains_Mobile_Elements_index<-which(taxonomy_otus%in%Contains_Mobile_Elements_TRUE[,1])
taxonomy_Facultatively_Anaerobic_index<-which(taxonomy_otus%in%Facultatively_Anaerobic_TRUE[,1])
taxonomy_Forms_Biofilms_index<-which(taxonomy_otus%in%Forms_Biofilms_TRUE[,1])
taxonomy_Gram_Negative_index<-which(taxonomy_otus%in%Gram_Negative_TRUE[,1])
taxonomy_Gram_Positive_index<-which(taxonomy_otus%in%Gram_Positive_TRUE[,1])
taxonomy_Potentially_Pathogenic_index<-which(taxonomy_otus%in%Potentially_Pathogenic_TRUE[,1])
taxonomy_Stress_Tolerant_index<-which(taxonomy_otus%in%Stress_Tolerant_TRUE[,1])

Aerobic_taxonomy_data<-taxonomy[taxonomy_Aerobic_index,]
Anaerobic_taxonomy_data<-taxonomy[taxonomy_Anaerobic_index,]
Contains_Mobile_Elements_taxonomy_data<-taxonomy[taxonomy_Contains_Mobile_Elements_index,]
Facultatively_Anaerobic_taxonomy_data<-taxonomy[taxonomy_Facultatively_Anaerobic_index,]
Forms_Biofilms_taxonomy_data<-taxonomy[taxonomy_Forms_Biofilms_index,]
Gram_Negative_taxonomy_data<-taxonomy[taxonomy_Gram_Negative_index,]
Gram_Positive_taxonomy_data<-taxonomy[taxonomy_Gram_Positive_index,]
Potentially_Pathogenic_taxonomy_data<-taxonomy[taxonomy_Potentially_Pathogenic_index,]
Stress_Tolerant_taxonomy_data<-taxonomy[taxonomy_Stress_Tolerant_index,]
Final_Aerobic_data<-cbind(Aerobic_normalized_data,Aerobic_taxonomy_data[,-1])
Final_Anaerobic_data<-cbind(Anaerobic_normalized_data,Anaerobic_taxonomy_data[,-1])
Final_Contains_Mobile_Elements_data<-cbind(Contains_Mobile_Elements_normalized_data,Contains_Mobile_Elements_taxonomy_data[,-1])
Final_Facultatively_Anaerobic_data<-cbind(Facultatively_Anaerobic_normalized_data,Facultatively_Anaerobic_taxonomy_data[,-1])
Final_Forms_Biofilms_data<-cbind(Forms_Biofilms_normalized_data,Forms_Biofilms_taxonomy_data[,-1])
Final_Gram_Negative_data<-cbind(Gram_Negative_normalized_data,Gram_Negative_taxonomy_data[,-1])
Final_Gram_Positive_data<-cbind(Gram_Positive_normalized_data,Gram_Positive_taxonomy_data[,-1])
Final_Potentially_Pathogenic_data<-cbind(Potentially_Pathogenic_normalized_data,Potentially_Pathogenic_taxonomy_data[,-1])
Final_Stress_Tolerant_data<-cbind(Stress_Tolerant_normalized_data,Stress_Tolerant_taxonomy_data[,-1])

####### Calculate Relative Abundance############################
Final_Aerobic_data_relative_abundance<-Final_Aerobic_data [,2:51] / colSums(normalized_otus[,2:51])[col(Final_Aerobic_data[,2:51])]
F_Aerobic<-cbind(Final_Aerobic_data_relative_abundance, Final_Aerobic_data [,52])
colnames(F_Aerobic)[51]<-c("Phylum")
library(plyr)
####Aggregate OTU level relative abundance at Phylum Level######################################
F1_Aerobic<-aggregate(.~ Phylum,data=F_Aerobic,FUN=sum)
##### Read metadata file#########################################
sample_name<-read.csv("sample_names.csv",header=TRUE,sep=",")
sample_index<-sample_name[,1]                     
sample_index 
col_name<-as.factor(colnames(F1_Aerobic))[-1]                   
replace_sample_name<-sample_name[match(col_name,sample_index),2]
colnames(F1_Aerobic)[2:51]<-as.vector(replace_sample_name)
#### calculate mean for each metadata category#############
F11_Aerobic<-t(apply(F1_Aerobic[,-1], 1, function(x) tapply(x, colnames(F1_Aerobic)[-1], mean))) 
#rownames(F11_Aerobic)<-c(as.vector(rownames(F1_Aerobic))) 
rownames(F11_Aerobic)<-c(as.vector(F1_Aerobic[,1]))
barplot(F11_Aerobic,col=1:4,legend=rownames(F11_Aerobic))
######Anaerobic data plot#################
Final_Anaerobic_data_relative_abundance<-Final_Anaerobic_data [,2:51] / colSums(normalized_otus[,2:51])[col(Final_Anaerobic_data[,2:51])]
F_Anaerobic<-cbind(Final_Anaerobic_data_relative_abundance, Final_Anaerobic_data [,52])
colnames(F_Anaerobic)[51]<-c("Phylum")
library(plyr)
F1_Anaerobic<-aggregate(.~ Phylum,data=F_Anaerobic,FUN=sum)
col_name<-as.factor(colnames(F1_Anaerobic))[-1]    
replace_sample_name<-sample_name[match(col_name,sample_index),2]
colnames(F1_Anaerobic)[2:51]<-as.vector(replace_sample_name)
F11_Anaerobic<-t(apply(F1_Anaerobic[,-1], 1, function(x) tapply(x, colnames(F1_Anaerobic)[-1], mean))) 
rownames(F11_Anaerobic)<-c(as.vector(F1_Anaerobic[,1]))
barplot(F11_Anaerobic,col=1:6,legend=rownames(F11_Anaerobic))
######Contains_Mobile_Elements data plot#################
Final_Contains_Mobile_Elements_data_relative_abundance<-Final_Contains_Mobile_Elements_data [,2:51] / colSums(normalized_otus[,2:51])[col(Final_Contains_Mobile_Elements_data[,2:51])]
F_Contains_Mobile_Elements<-cbind(Final_Contains_Mobile_Elements_data_relative_abundance, Final_Contains_Mobile_Elements_data [,52])
colnames(F_Contains_Mobile_Elements)[51]<-c("Phylum")
library(plyr)
F1_Contains_Mobile_Elements<-aggregate(.~ Phylum,data=F_Contains_Mobile_Elements,FUN=sum)
col_name<-as.factor(colnames(F1_Contains_Mobile_Elements))[-1]  
replace_sample_name<-sample_name[match(col_name,sample_index),2]
colnames(F1_Contains_Mobile_Elements)[2:51]<-as.vector(replace_sample_name)
F11_Contains_Mobile_Elements<-t(apply(F1_Contains_Mobile_Elements[,-1], 1, function(x) tapply(x, colnames(F1_Contains_Mobile_Elements)[-1], mean))) 
rownames(F11_Contains_Mobile_Elements)<-c(as.vector(F1_Contains_Mobile_Elements[,1]))
barplot(F11_Contains_Mobile_Elements,col=1:7,legend=rownames(F11_Contains_Mobile_Elements))
######Facultatively_Anaerobic data plot#################
Final_Facultatively_Anaerobic_data_relative_abundance<-Final_Facultatively_Anaerobic_data [,2:51] / colSums(normalized_otus[,2:51])[col(Final_Facultatively_Anaerobic_data[,2:51])]
F_Facultatively_Anaerobic<-cbind(Final_Facultatively_Anaerobic_data_relative_abundance, Final_Facultatively_Anaerobic_data [,52])
colnames(F_Facultatively_Anaerobic)[51]<-c("Phylum")
library(plyr)
F1_Facultatively_Anaerobic<-aggregate(.~ Phylum,data=F_Facultatively_Anaerobic,FUN=sum)
col_name<-as.factor(colnames(F1_Facultatively_Anaerobic))[-1]  
replace_sample_name<-sample_name[match(col_name,sample_index),2]
colnames(F1_Facultatively_Anaerobic)[2:51]<-as.vector(replace_sample_name)
F11_Facultatively_Anaerobic<-t(apply(F1_Facultatively_Anaerobic[,-1], 1, function(x) tapply(x, colnames(F1_Facultatively_Anaerobic)[-1], mean))) 
rownames(F11_Facultatively_Anaerobic)<-c(as.vector(F1_Facultatively_Anaerobic[,1]))
barplot(F11_Facultatively_Anaerobic,col=1:3,legend=rownames(F11_Facultatively_Anaerobic))
######Forms_Biofilms data plot#################
Final_Forms_Biofilms_data_relative_abundance<-Final_Forms_Biofilms_data [,2:51] / colSums(normalized_otus[,2:51])[col(Final_Forms_Biofilms_data[,2:51])]
F_Forms_Biofilms<-cbind(Final_Forms_Biofilms_data_relative_abundance, Final_Forms_Biofilms_data [,52])
colnames(F_Forms_Biofilms)[51]<-c("Phylum")
library(plyr)
F1_Forms_Biofilms<-aggregate(.~ Phylum,data=F_Forms_Biofilms,FUN=sum)
col_name<-as.factor(colnames(F1_Forms_Biofilms))[-1]  
replace_sample_name<-sample_name[match(col_name,sample_index),2]
colnames(F1_Forms_Biofilms)[2:51]<-as.vector(replace_sample_name)
F11_Forms_Biofilms<-t(apply(F1_Forms_Biofilms[,-1], 1, function(x) tapply(x, colnames(F1_Forms_Biofilms)[-1], mean))) 
rownames(F11_Forms_Biofilms)<-c(as.vector(F1_Forms_Biofilms[,1]))
barplot(F11_Forms_Biofilms,col=1:4,legend=rownames(F11_Forms_Biofilms))
######Gram_Negative data plot#################
Final_Gram_Negative_data_relative_abundance<-Final_Gram_Negative_data [,2:51] / colSums(normalized_otus[,2:51])[col(Final_Gram_Negative_data[,2:51])]
F_Gram_Negative<-cbind(Final_Gram_Negative_data_relative_abundance, Final_Gram_Negative_data [,52])
colnames(F_Gram_Negative)[51]<-c("Phylum")
library(plyr)
F1_Gram_Negative<-aggregate(.~ Phylum,data=F_Gram_Negative,FUN=sum)
col_name<-as.factor(colnames(F1_Gram_Negative))[-1]
replace_sample_name<-sample_name[match(col_name,sample_index),2]
colnames(F1_Gram_Negative)[2:51]<-as.vector(replace_sample_name)
F11_Gram_Negative<-t(apply(F1_Gram_Negative[,-1], 1, function(x) tapply(x, colnames(F1_Gram_Negative)[-1], mean))) 
rownames(F11_Gram_Negative)<-c(as.vector(F1_Gram_Negative[,1]))
barplot(F11_Gram_Negative,col=1:5,legend=rownames(F11_Gram_Negative))
######Gram_Positive data plot#################
Final_Gram_Positive_data_relative_abundance<-Final_Gram_Positive_data [,2:51] / colSums(normalized_otus[,2:51])[col(Final_Gram_Positive_data[,2:51])]
F_Gram_Positive<-cbind(Final_Gram_Positive_data_relative_abundance, Final_Gram_Positive_data [,52])
colnames(F_Gram_Positive)[51]<-c("Phylum")
library(plyr)
F1_Gram_Positive<-aggregate(.~ Phylum,data=F_Gram_Positive,FUN=sum)
col_name<-as.factor(colnames(F1_Gram_Positive))[-1]
replace_sample_name<-sample_name[match(col_name,sample_index),2]
colnames(F1_Gram_Positive)[2:51]<-as.vector(replace_sample_name)
F11_Gram_Positive<-t(apply(F1_Gram_Positive[,-1], 1, function(x) tapply(x, colnames(F1_Gram_Positive)[-1], mean))) 
rownames(F11_Gram_Positive)<-c(as.vector(F1_Gram_Positive[,1]))
barplot(F11_Gram_Positive,col=1:4,legend=rownames(F11_Gram_Positive))
######Potentially_Pathogenic data plot#################
Final_Potentially_Pathogenic_relative_abundance<-Final_Potentially_Pathogenic_data [,2:51] / colSums(normalized_otus[,2:51])[col(Final_Potentially_Pathogenic_data[,2:51])]
F_Potentially_Pathogenic<-cbind(Final_Potentially_Pathogenic_relative_abundance, Final_Potentially_Pathogenic_data [,52])
colnames(F_Potentially_Pathogenic)[51]<-c("Phylum")
library(plyr)
F1_Potentially_Pathogenic<-aggregate(.~ Phylum,data=F_Potentially_Pathogenic,FUN=sum)
col_name<-as.factor(colnames(F1_Potentially_Pathogenic))[-1]
replace_sample_name<-sample_name[match(col_name,sample_index),2]
colnames(F1_Potentially_Pathogenic)[2:51]<-as.vector(replace_sample_name)
F11_Potentially_Pathogenic<-t(apply(F1_Potentially_Pathogenic[,-1], 1, function(x) tapply(x, colnames(F1_Potentially_Pathogenic)[-1], mean))) 
rownames(F11_Potentially_Pathogenic)<-c(as.vector(F1_Potentially_Pathogenic[,1]))
barplot(F11_Potentially_Pathogenic,col=1:4,legend=rownames(F11_Potentially_Pathogenic))
######Stress_Tolerant data plot#################
Final_Stress_Tolerant_relative_abundance<-Final_Stress_Tolerant_data [,2:51] / colSums(normalized_otus[,2:51])[col(Final_Stress_Tolerant_data[,2:51])]
F_Stress_Tolerant<-cbind(Final_Stress_Tolerant_relative_abundance, Final_Stress_Tolerant_data [,52])
colnames(F_Stress_Tolerant)[51]<-c("Phylum")
library(plyr)
F1_Stress_Tolerant<-aggregate(.~ Phylum,data=F_Stress_Tolerant,FUN=sum)
col_name<-as.factor(colnames(F1_Stress_Tolerant))[-1]
replace_sample_name<-sample_name[match(col_name,sample_index),2]
colnames(F1_Stress_Tolerant)[2:51]<-as.vector(replace_sample_name)
F11_Stress_Tolerant<-t(apply(F1_Stress_Tolerant[,-1], 1, function(x) tapply(x, colnames(F1_Stress_Tolerant)[-1], mean))) 
rownames(F11_Stress_Tolerant)<-c(as.vector(F1_Stress_Tolerant[,1]))
barplot(F11_Stress_Tolerant,col=1:4,legend=rownames(F11_Stress_Tolerant))
###### Similarly You Can Make Plots for Class, Order, Family, Genus and Species level by changing as following for stress_Tolerance at Class level ###########
Final_Stress_Tolerant_relative_abundance<-Final_Stress_Tolerant_data [,2:51] / colSums(normalized_otus[,2:51])[col(Final_Stress_Tolerant_data[,2:51])]
F_Stress_Tolerant<-cbind(Final_Stress_Tolerant_relative_abundance, Final_Stress_Tolerant_data [,53])
colnames(F_Stress_Tolerant)[51]<-c("Class")
library(plyr)
F1_Stress_Tolerant<-aggregate(.~ Class,data=F_Stress_Tolerant,FUN=sum)
col_name<-as.factor(colnames(F1_Stress_Tolerant))[-1]
replace_sample_name<-sample_name[match(col_name,sample_index),2]
colnames(F1_Stress_Tolerant)[2:51]<-as.vector(replace_sample_name)
F11_Stress_Tolerant<-t(apply(F1_Stress_Tolerant[,-1], 1, function(x) tapply(x, colnames(F1_Stress_Tolerant)[-1], mean))) 
rownames(F11_Stress_Tolerant)<-c(as.vector(F1_Stress_Tolerant[,1]))
barplot(F11_Stress_Tolerant,col=1:4,legend=rownames(F11_Stress_Tolerant))
######################################################################################################################################


