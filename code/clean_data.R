###############################################################################
#
# File name: clean_data.R
#
# Purpose: To clean the datasets BMX_D.csv and BPX_D.csv by confirming the patient IDs 
# match, merging the datasets, keeping only the required variables, 
# checking for missing values and extreme values, creating a bmi categorical
# variable, creating a hypertension variable, and systolic and diastolic values averaged over the three measurements. 
#
# Data in: data_raw/BMX_D.csv and data_raw/BPX_D.csv
# Data out: data_clean/bmx_bpx.csv
#
###############################################################################

rm(list=ls())

# Load the datasets ###########################################################
bmx <- read.csv(file = "data_raw/BMX_D.csv")
bpx <- read.csv(file = "data_raw/BPX_D.csv")

# Understand datasets #########################################################
str(bmx)
str(bpx)

# Confirm the respondent sequence numbers match ###############################
bmx_seqn <- bmx$SEQN
bpx_seqn <- bpx$SEQN
same_seqn <- (bmx_seqn == bpx_seqn)
table(same_seqn)
# Yes, the respondent sequence numbers match

# Keep only the variables I need ###############################################
bmx_subset <- subset(bmx, select = c(SEQN, BMXWT, BMXHT, BMXBMI))
bpx_subset <- subset(bpx, select = c(SEQN, BPXSY1, BPXDI1, BPXSY2, BPXDI2, 
                                     BPXSY3, BPXDI3))

# Combine the two datasets #####################################################
bmx_bpx <- merge(bmx_subset, bpx_subset, by = 'SEQN')

# Check new dataset
str(bmx_bpx)

# Check for missing values ####################################################
bmx_bpx_missing <- is.na.data.frame(bmx_bpx)
table(bmx_bpx_missing)
#FALSE  TRUE 
#75756 23744 

# Drop participants with any missing values ###################################
bmx_bpx_complete <- na.omit(bmx_bpx)

# Check again for missing values ##############################################
bmx_bpx_complete_missing <- is.na.data.frame(bmx_bpx_complete)
table(bmx_bpx_complete_missing)
#FALSE 
#51440 

# Check for extreme values ####################################################
summary(bmx_bpx_complete$BMXWT)
# min=20kg and max=201kg are plausible bodyweights

summary(bmx_bpx_complete$BMXHT)
# min=118cm and max=204cm are plausible heights

summary(bmx_bpx_complete$BMXBMI)
# min=13 and max=57 are plausible BMI values

summary(bmx_bpx_complete$BPXSY1)
# min=80 is plausible. max=224 is a medical emergency, but possible

summary(bmx_bpx_complete$BPXDI1)
# min=0 is possible but very rare. max=120 is possible

summary(bmx_bpx_complete$BPXSY2)
# min=74 is plausible. max=230 is a medical emergency, but possible

summary(bmx_bpx_complete$BPXDI2)
# min=0 is possible but very rare. max=118 is possible

summary(bmx_bpx_complete$BPXSY3)
# min=80 is plausible. max=234 is a medical emergency, but possible

summary(bmx_bpx_complete$BPXDI3)
# min=0 is possible but very rare. max=118 is possible

# Create a categorical BMI variable ############################################
bmx_bpx_complete$BMXBMI_cat <- cut(bmx_bpx_complete$BMXBMI, 
                                   breaks = c(0, 18, 24, 29, 100),
                                   labels = c("Underweight", "Healthy", 
                                              "Overweight", "Obese"))

table(bmx_bpx_complete$BMXBMI_cat)

# Create systolic and diastolic variables averaged over the three measurements #
bmx_bpx_complete$BPXSY_avg <- ((bmx_bpx_complete$BPXSY1 + bmx_bpx_complete$BPXSY2 
                                + bmx_bpx_complete$BPXSY3) / 3)

bmx_bpx_complete$BPXDI_avg <- ((bmx_bpx_complete$BPXDI1 + bmx_bpx_complete$BPXDI2 
                                + bmx_bpx_complete$BPXDI3) / 3)

# Create a hypertension yes/no variable ########################################
bmx_bpx_complete$hypertension <- (bmx_bpx_complete$BPXSY_avg >= 140 |
                                    bmx_bpx_complete$BPXDI_avg >= 90)

# Output clean dataset ########################################################
write.csv(bmx_bpx_complete, "data_clean/bmx_bpx.csv", row.names = FALSE)







