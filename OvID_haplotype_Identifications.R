#Cedar Mitchell#
#29-July-2019#
#Project: OvID 18s DeepSeq#
#Objective: create function to tabulate how ovale deep sequencing results map to Pf, Poc, Pow, Pm, and Pv 18s sequences.

#libraries:
library(tidyverse)
library(stringr)
library(DT)
library(parallel)
library(broom)

library(Biostrings)

#Read in panplasmo FASTA file;

panplasm <- readDNAStringSet("C:/Users/Cedar/Desktop/Ovale/Lab Work/Analysis/PanPlasmo_sm.FASTA")


haplo <- readDNAStringSet("C:/Users/Cedar/Desktop/Ovale/Lab Work/Analysis/functiontest.FASTA")


#' @title 
#' @param haplo DNAStringSet; this is my haplotype from SeekDeep
#' @param panplasm DNAStringSet; this is the target 
#' @param distmethod character; a string that is input into method for Biostrings::stringDist, method   

haplomatch<-function(haplo, panplasm, distmethod){
  
  smplname <- names(haplo)
  distout = stringDist(c(haplo, panplasm), method = distmethod)
  distout.tidy <- broom::tidy(distout)
  out <- distout.tidy %>% 
    dplyr::filter(item2 == smplname)
  
  return(out)
}


