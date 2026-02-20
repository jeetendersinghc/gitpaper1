# ADEX demo script
adex <- data.frame(ID = 1:5, DOSE = c(10, 20, 20, 10, 30))
total_dose <- sum(adex$DOSE)
adex$DOSEGR <- ifelse(adex$DOSE > 15, "HIGH", "LOW")
print(adex)