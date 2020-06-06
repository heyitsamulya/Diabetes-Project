files = list.files("Results")
for (file in files){
  df = read.csv(paste0("Results/",file), stringsAsFactors = F)
}

df_merged = NA
for (file in files) {
  df = read.csv(paste0("Results/",file), stringsAsFactors = F)
  df = df[df$method == 'Inverse variance weighted' | df$method == 'Wald ratio',]
  if (is.data.frame(df_merged) == F) {
    df_merged = df
  } else {
    df_merged = rbind(df_merged,df)
  }
}
write.csv(df_merged, "c:\\Users\\Amulya\\Documents\\GitHub\\diabetes_mr\\df_merged.csv")

