## diabetes, type 1, type 2, potentially other factors

library(TwoSampleMR)
#ao = available_outcomes() # contains all the IDs for exposure and outcome

# exposures: depression
# outcomes: How it affects outcomes of Type 1 and Type 2 diabetes

## Extract a list of variants which influence the exposure
exposure_id = 'ukb-b-13932'
# exposure_variants - a table of variants which influence the exposure, and the size of the influence of these
# .. variants on the exposure.
exposure_variants = extract_instruments(exposure_id)
# apply clumping to make sure that all the variants are independent
exposure_variants = clump_data(exposure_variants)
outcome_id = 'ebi-a-GCST005536' # type 1 diabetes
##outcome_id = 'ebi-a-GCST006867' # type 2 diabetes
effect_of_exposure_variants_on_outcome = extract_outcome_data(exposure_variants$SNP, outcome_id)
# table of SNPs with their effect on the outcome and on the exposure
# .. this is created by merging the tables we previously extracted
variants_merged = harmonise_data(exposure_variants, effect_of_exposure_variants_on_outcome)
#write.csv(variants_merged, 'Results/vigorousactivitydurationtype2_variants.csv', row.names = F)
# now use the table of SNPs with their effect on outcome and exposure to perform mendelian randomization analysis
results = mr(variants_merged)
write.csv(results, 'C:\\Users\\Amulya\\Documents\\GitHub\\diabetes_mr\\Results\\celiacdiseasetype1.csv', row.names = F)
#write.csv(results, 'Results/vigorousactivitydurationtype2.csv', row.names = F)

