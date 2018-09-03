#Using following way, i imported the file  fm---ssu---otu_breakdown----Total---sim_93---tax_silva---td_20.csv in Tax4Fun using importSilvaNgsData. 

#In addition to this, there may be some other solutions also available. 

importSilvaNgsData("/home/fauzul/Videos/Others/R_ADVANCED/fm---ssu---otu_breakdown----Total---sim_93---tax_silva---td_20.csv")
#Error in data[[rlabp]] : subscript out of bounds

###### Put a blank line befor starting of the file fm---ssu---otu_breakdown----Total---sim_93---tax_silva---td_20.csv#####

##This should be blank line######
#Number of OTUs	Number of Clustered Sequences	Number of Replicates	Total Number of Sequences	Sample Name	Path
#2	1	0	3	SE_1.fna	Bacteria;Actinobacteria;Actinobacteria;Actinomycetales;Actinomycetaceae;Actinomyces;
#43	142	67	252	SE_1.fna	Bacteria;Actinobacteria;Actinobacteria;Bifidobacteriales;Bifidobacteriaceae;Bifidob


importSilvaNgsData("/home/fauzul/Videos/Others/R_ADVANCED/fm---ssu---otu_breakdown----Total---sim_93---tax_silva---td_20.csv")
#Error in read.table(file = file, header = header, sep = sep, quote = quote,  : 
#  duplicate 'row.names' are not allowed

### put a column as index number #######################################

data<-read.csv("/home/fauzul/Videos/Others/R_ADVANCED/fm---ssu---otu_breakdown----Total---sim_93---tax_silva---td_20.csv",sep="\t")
dim(data)
index<-c(1:dim(data)[1])
data_new<-cbind(index,data)
write.csv(data_new,"test.csv",q=F)
########## convert , to \t #####################
sed 's/,/\t/g' test_new.csv >> test_new.csv
###############################################
silva_ngs_table<-importSilvaNgsData("/home/fauzul/test_new.csv")

#str(silva_ngs_table)
#List of 2
# $ sampleNames: chr(0) 
# $ otuTable   :'data.frame':	14241 obs. of  6 variables:
#  ..$ V2: Factor w/ 330 levels "1","10","100",..: 330 104 232 217 168 304 248 104 1 174 ...
#  ..$ V3: Factor w/ 1084 levels "0","1","10","100",..: 1084 2 178 649 1 1 649 92 1 778 ...
#  ..$ V4: Factor w/ 511 levels "0","1","10","100",..: 511 1 425 1 1 1 2 1 1 461 ...
#  ..$ V5: Factor w/ 1199 levels "1","10","100",..: 1199 578 482 1076 578 1076 2 181 1 1160 ...
#  ..$ V6: Factor w/ 154 levels "Sample.Name",..: 1 2 2 2 2 2 2 2 2 2 ...
#  ..$ V7: Factor w/ 684 levels "Bacteria;Acidobacteria;Acidobacteriia;Acidobacteriales;uncultured;",..: 684 23 24 38 49 64 70 75 76 84 ...

silva_ngs_final<-as.data.frame(silva_ngs_table$otuTable)
colnames(silva_ngs_final) <- as.character(unlist(silva_ngs_final[1,]))
silva_ngs_final=silva_ngs_final[-1,]

######### first make a silva_ngs$Sample_Names
silva_ngs_table$sampleNames<-c((unique(silva_ngs_table$otuTable[5])))
################## Make a table using sample_names as column and taxa names as row ###########################
sample_name<-unique(silva_ngs_table$otuTable[,5])[-1]

taxa_name<-unique(silva_ngs_table$otuTable[,6])[-1]
#### put len= ncol*nrow####
otu_matrix<-matrix( rep( 0, len=104652), ncol = 153)
colnames(otu_matrix)<-sample_name
rownames(otu_matrix)<-taxa_name

for (i in 1:dim(silva_ngs_table$otuTable)[1])
{
sample<-(silva_ngs_table$otuTable[i,5])
taxa<-(silva_ngs_table$otuTable[i,5])
k<-which(sample_name%in%sample)
l<-which(taxa_name%in%taxa)
otu_matrix[l,k]<-silva_ngs_table$otuTable[i,4]
}


Tax4Fun(silva_ngs_table,"SILVA119")
silva_ngs_table$otuTable<-otu_matrix
silva_ngs_table$sampleNames<-sample_name
tax4fun_result$Tax4FunProfile
Tax4FunProfile<-tax4fun_result$Tax4FunProfile
View(Tax4FunProfile)
Tax4FunProfile <- data.frame(t(tax4fun_result$Tax4FunProfile))













