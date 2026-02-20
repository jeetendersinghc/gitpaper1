# ============================================================
# ADSL DEMO SCRIPT — LONG VERSION FOR GIT DIFF PRACTICE
# ============================================================

# 1. Load required packages
suppressPackageStartupMessages({
  library(dplyr)
  library(stringr)
})

# 2. Create demo ADSL dataset
adsl <- data.frame(
  ID = 1:20,
  AGE = c(45, 50, 60, 30, 55, 42, 38, 70, 66, 49,
          53, 27, 31, 64, 58, 41, 33, 52, 68, 47),
  SEX = c("M", "F", "M", "F", "M", "M", "F", "M", "F", "F",
          "M", "F", "F", "M", "M", "F", "M", "F", "M", "F"),
  TRT = c("A", "B", "A", "A", "B", "B", "A", "A", "B", "B",
          "A", "A", "B", "B", "A", "A", "B", "B", "A", "A"),
  stringsAsFactors = FALSE
)

# 3. Create AGE categories
adsl$AGEGR <- ifelse(adsl$AGE >= 60, "60+",
                     ifelse(adsl$AGE >= 40, "40-59", "<40"))

# 4. Create a derived flag variable
adsl$ELDERLY_FLAG <- ifelse(adsl$AGE >= 65, 1, 0)

# 5. Label TRT groups
adsl$TRT_LABEL <- case_when(
  adsl$TRT == "A" ~ "Treatment Arm A",
  adsl$TRT == "B" ~ "Treatment Arm B",
  TRUE ~ "Unknown"
)

# 6. Calculate summary statistics
max_age <- max(adsl$AGE)
min_age <- min(adsl$AGE)

# 7. Summaries by treatment group
summary_by_trt <- adsl %>%
  group_by(TRT) %>%
  summarise(
    COUNT = n(),
    ELDERLY_COUNT = sum(ELDERLY_FLAG)
  )

# 8. Print results
cat("============================================================\n")
cat("ADSL Dataset Summary\n")
cat("============================================================\n")
print(adsl)

cat("\n============================================================\n")
cat("Overall Age Summary\n")
cat("============================================================\n")
cat("Max Age:    ", max_age, "\n")
cat("Min Age:    ", min_age, "\n")

cat("\n============================================================\n")
cat("Summary by Treatment Group\n")
cat("============================================================\n")
print(summary_by_trt)

# 9. Additional derived variable (for diff testing)
adsl$AGE_SQUARED <- adsl$AGE^2

# 10. Print final dataset preview
cat("\n============================================================\n")
cat("Final ADSL Preview\n")
cat("============================================================\n")
print(head(adsl, 10))

