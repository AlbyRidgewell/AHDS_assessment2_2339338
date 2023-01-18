###############################################################################
#
# File name: produce_figures.R
#
# Purpose: To create the figures that will be used in the report
#
# Data in: data_clean/bmx_bpx.csv
#
# Data out: figures/height_weight_scatter_plot.png
#           figures/sbp_bmi_scatter_plot.png
#           figures/dbp_bmi_scatter_plot.png
#           figures/bmi_hypertension_violin_plot.png
#           figures/sbp_bmi_cat_violin_plot.png
#           figures/hypertension_bmi_cat_barplot.png
#
###############################################################################

rm(list = ls())

# Packages ####################################################################
library(ggplot2)
library(tableone)
library(ggpubr)

# Load the dataset ############################################################
bmx_bpx <- read.csv(file = "data_clean/bmx_bpx.csv")

# Change BMI categorical variable into ordered factor #########################
# Note, it appears this step needs to be done in this script ##################
bmx_bpx$BMXBMI_cat <- factor(bmx_bpx$BMXBMI_cat,
  order = TRUE,
  levels = c(
    "Underweight", "Healthy",
    "Overweight", "Obese"
  )
)


# Plot height against weight ###################################################
png("figures/height_weight_scatter_plot.png", units = "in", width = 7, height = 7, res = 300)

ggscatterhist(
  bmx_bpx,
  x = "BMXWT", y = "BMXHT",
  color = "BMXBMI_cat", size = 0.6, alpha = 0.6,
  palette = c("blue", "green", "orange", "red"),
  margin.plot = "density",
  ggtheme = theme_bw(),
  title = "Scatter plot of height against bodyweight, grouped by BMI category",
  xlab = "Bodyweight (kg)",
  ylab = "Standing height (cm)",
  legend.title = "BMI category"
)

dev.off()

# Plot SBP against BMI #########################################################
png("figures/sbp_bmi_scatter_plot.png", units = "in", width = 7, height = 7, res = 300)

ggplot(bmx_bpx, aes(BMXBMI, BPXSY_avg)) +
  geom_point(size = 0.6, colour = "blue", alpha = 0.5) +
  geom_smooth(method = loess, colour = "red", alpha = 0.5) +
  labs(
    title = "Scatter plot of systolic blood pressure against BMI",
    x = "Body Mass Index (kg/m²)",
    y = "Systolic blood pressure (mmHg)"
  )

dev.off()

# Plot DBP against BMI #########################################################
png("figures/dbp_bmi_scatter_plot.png", units = "in", width = 7, height = 7, res = 300)

ggplot(bmx_bpx, aes(BMXBMI, BPXDI_avg)) +
  geom_point(size = 0.6, colour = "blue", alpha = 0.5) +
  geom_smooth(method = loess, colour = "red", alpha = 0.5) +
  labs(
    title = "Scatter plot of diastolic blood pressure against BMI",
    x = "Body Mass Index (kg/m²)",
    y = "Diastolic blood pressure (mmHg)"
  )

dev.off()

# Violin plot for BMI and hypertension #########################################
png("figures/bmi_hypertension_violin_plot.png", units = "in", width = 7, height = 7, res = 300)

ggplot(bmx_bpx, aes(hypertension, BMXBMI, col = hypertension)) +
  geom_violin() +
  geom_boxplot(width = 0.3, colour = "black", alpha = 0.2) +
  scale_color_manual(values = c("aquamarine3", "red")) +
  theme_light() +
  theme(legend.position = "none") +
  labs(
    title = "Violin plot of BMI for those with and without hypertension",
    x = "Hypertension",
    y = "Body Mass Index (kg/m²)"
  ) +
  scale_x_discrete(labels = c("No", "Yes"))

dev.off()

# Violin plot for SBP for each BMI category ####################################
png("figures/sbp_bmi_cat_violin_plot.png", units = "in", width = 7, height = 7, res = 300)

ggplot(bmx_bpx, aes(BMXBMI_cat, BPXSY_avg, col = BMXBMI_cat)) +
  geom_violin() +
  geom_boxplot(width = 0.3, colour = "black", alpha = 0.2) +
  scale_color_manual(values = c("blue", "green", "orange", "red")) +
  theme_light() +
  theme(legend.position = "none") +
  labs(
    title = "Violin plot of systolic blood pressure for each BMI category",
    x = "BMI category",
    y = "Systolic blood pressure (mmHg)"
  )

dev.off()

# Stacked barplot for BMI cat and hypertension ###############################
png("figures/hypertension_bmi_cat_barplot.png", units = "in", width = 7, height = 7, res = 300)

ggplot(bmx_bpx, aes(BMXBMI_cat, fill = hypertension)) +
  geom_bar() +
  theme_bw() +
  scale_fill_manual(
    values = c("aquamarine3", "red"),
    labels = c("No", "Yes")
  ) +
  labs(
    title = "Stacked barplot for hypertension within each BMI category",
    x = "BMI category",
    y = "Count"
  )

dev.off()
