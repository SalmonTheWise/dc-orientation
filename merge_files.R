require(dplyr)
require(data.table)

install.packages("data.table")

# read file path
all_paths <-
  list.files(path = "E:/WM/new type measure",
             pattern = "*.txt",
             full.names = TRUE)

# read file content
all_content <-
  all_paths %>%
  lapply(read.table,
         header = TRUE,
         sep = "\t",
         encoding = "UTF-8")

# read file name
all_filenames <- all_paths %>%
  basename() %>%
  as.list()

# combine file content list and file name list
all_lists <- mapply(c, all_content, all_filenames, SIMPLIFY = FALSE)

# unlist all lists and change column name
all_result <- rbindlist(all_lists, fill = T)
# change column name
names(all_result)[4] <- "File.Path"
names(all_result)[4] <- "File.Path"

write.table(all_result, paste("all_result.txt", sep = ""), sep="\t",row.names=F)


