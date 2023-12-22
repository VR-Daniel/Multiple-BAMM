library(ape)
library(BAMMtools)
library(dplyr)
library(RRphylo)

###### Set a working directory ######

# Once you install BAMM in your machine, you will see a "build" folder containing
# the required files to the software works properly, I usually work from there
setwd("YOUR PATH/bamm/build")

# Define a custom name for your group of study
# JUST CHANGE THE VARIABLE VALUE, NO ITS NAME
group <- "Amphibians"

###### Generate priors for each independent tree ######

# Read the tree files as a multiPhylo object
# JUST CHANGE THE FILE PATH
trees <- read.nexus(paste(group, "Amphibians.nex", sep = "/"))

# Test if trees are dichotomic (must return TRUE, if FALSE see the next step)
# JUST RUN IT, DON'T CHANGE ANYTHING
all(is.binary(trees))

# If trees are polytomic you can dichotomize them using one of the
# followings commands, I recommend the fix.poly because it
# assigns branch lengths (randomly based on node heights)

# If you got TRUE in the previous step, you can omit this

# Using fix.poly (assign branch lengths)
for(i in 1:length(trees)){
  trees[[i]] <- fix.poly(trees[[i]], type = "resolve")
}

# Using multi2di (don't assign branch lengths)
trees <- multi2di(trees)

# Generate a data frame to store the prior values
# JUST RUN IT, DON'T CHANGE ANYTHING
priors <- as.data.frame(matrix(ncol = 4, nrow = length(trees))) %>% setNames(c("expectedNumberOfShifts", "lambdaInitPrior", "lambdaShiftPrior", "muInitPrior"))

# Calculate the priors for each tree
# JUST RUN IT, DON'T CHANGE ANYTHING
for(i in 1:length(trees)){
  priors[i, ] <- setBAMMpriors(trees[[i]], outfile = NULL)
}

###### Export trees as separate files (necessary for running the BAMM) ######

# JUST RUN IT, DON'T CHANGE ANYTHING
for(i in 1:length(trees)){
  write.tree(trees[[i]], file = paste(group, paste0(group, "_Tree_", i, ".tre"), sep = "/"))
}

###### Run multiple BAMM (on a Linux terminal but likely works in Mac too) ######

# Read the divcontrol file (supplied template is for BAMM v.2.5.0, please do not modify it)
# JUST RUN IT, DON'T CHANGE ANYTHING
divcontrol <- readLines(paste(group, "divcontrol_TEMPLATE.txt", sep = "/"), warn = FALSE)

# Set the path to the folder containing the BAMM .exe file and necesarry .dll
# JUST CHANGE THE VARIABLE VALUE, NO ITS NAME
BAMMpath <- "YOUR PATH/bamm/build"

# Generate a loop for run the BAMM
# The R console will show the BAMM messages but the execution will be done in a background CMD
# JUST RUN IT, DON'T CHANGE ANYTHING
for(i in 1:length(trees)){
  
  # Create a temporal copy of the divcontrol file
  tmp.divcontrol <- divcontrol
  
  # Replace the default path to read the tree files
  tmp.divcontrol[6] <- paste("treefile = ", BAMMpath, "/", group, "/", group, "_Tree_", i, ".tre", sep = "")
  
  # Replace the default path to save the output run_info files
  if(file.exists(paste(BAMMpath, "/", group, "/run_info", sep = "")) == FALSE){
    dir.create(paste(BAMMpath, "/", group, "/run_info", sep = ""))
    tmp.divcontrol[7] <- paste("runInfoFilename = ", BAMMpath, "/", group, "/run_info/", "run_info.txt", sep = "")
  }else{
    tmp.divcontrol[7] <- paste("runInfoFilename = ", BAMMpath, "/", group, "/run_info/", "run_info.txt", sep = "")
  }
  
  # Replace the default priors with custom priors generated in the previous step
  tmp.divcontrol[23] <- paste("expectedNumberOfShifts = ", priors[i, 1], sep = "")
  tmp.divcontrol[24] <- paste("lambdaInitPrior = ", priors[i, 2], sep = "")
  tmp.divcontrol[25] <- paste("lambdaShiftPrior = ", priors[i, 3], sep = "")
  tmp.divcontrol[26] <- paste("muInitPrior = ", priors[i, 4], sep = "")
  
  # Replace the default path to save the output mcmc_out, event_data, chain_swap files
  if(file.exists(paste(BAMMpath, "/", group, "/mcmc_output", sep = "")) == FALSE){
    dir.create(paste(BAMMpath, "/", group, "/mcmc_output", sep = ""))
    tmp.divcontrol[34] <- paste("mcmcOutfile = ", BAMMpath, "/", group, "/mcmc_output/", "mcmc_out.txt", sep = "")
  }else{
    tmp.divcontrol[34] <- paste("mcmcOutfile = ", BAMMpath, "/", group, "/mcmc_output/", "mcmc_out.txt", sep = "")
  }
  
  # Replace the default path to save the output event_data files
  if(file.exists(paste(BAMMpath, "/", group, "/event_data", sep = "")) == FALSE){
    dir.create(paste(BAMMpath, "/", group, "/event_data", sep = ""))
    tmp.divcontrol[36] <- paste("eventDataOutfile = ", BAMMpath, "/", group, "/event_data/", "event_data.txt", sep = "")
  }else{
    tmp.divcontrol[36] <- paste("eventDataOutfile = ", BAMMpath, "/", group, "/event_data/", "event_data.txt", sep = "")
  }
  
  # Set a custom prefix for the output files based on the group names
  tmp.divcontrol[40] <- paste("outName = ", group, "_Tree_", i,  sep = "")
  
  # Replace the default path to save the output chain_swap files
  if(file.exists(paste(BAMMpath, "/", group, "/chain_swap", sep = "")) == FALSE){
    dir.create(paste(BAMMpath, "/", group, "/chain_swap", sep = ""))
    tmp.divcontrol[81] <- paste("chainSwapFileName = ", BAMMpath, "/", group, "/chain_swap/", "chain_swap.txt", sep = "")
  }else{
    tmp.divcontrol[81] <- paste("chainSwapFileName = ", BAMMpath, "/", group, "/chain_swap/", "chain_swap.txt", sep = "")
  }
  
  # Save the custom divcontrol file for the current tree
  writeLines(tmp.divcontrol, con = paste(BAMMpath, "/", group, "/divcontrol_CUSTOM.txt", sep = ""))
  
  # Generate the command for running the BAMM analysis
  cmd <- paste(paste(BAMMpath, "/bamm", sep = ""), "-c", paste(BAMMpath, "/", group, "/divcontrol_CUSTOM.txt", sep = ""), sep = " ")
  
  # Run the BAMM
  system(cmd)
  
}