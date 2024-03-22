args = commandArgs(trailingOnly=TRUE)
filename = args[1]
sleeptime = args[2]

df = read.table(filename, header=TRUE, sep = ",")

cat("---------------------------------------", 
    paste("Start Analysis:", args[1]), 
    "---------------------------------------", sep = "\n")

for (row in 1:nrow(df)) {
  
  Sys.sleep(strtoi(sleeptime))
  #print_string = paste(" >> Processing row #", df[row, "rowname"], ":", df[row, "values"])
  print_string = paste(" >> Processing sample #", df[row, "rowname"], " (runtime: " ,sleeptime, " seconds)", sep = "")
  cat(print_string, sep = "\n")
  
  }


  
cat("-------------", 
    "Analysis done", 
    "-------------", sep = "\n")

