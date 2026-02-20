# ADEX demo script
adex <- data.frame(ID = 1:6, DOSE = c(10, 20, 20, 10, 30, 40))
total_dose <- sum(adex$DOSE)
adex$DOSEGR <- ifelse(adex$DOSE > 15, "HIGH", "LOW")
print(adex)
