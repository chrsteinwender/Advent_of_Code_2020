# Subject: Advent of Code 2020
# Day: 02.12.2020
# Author: Christian Steinwender

require(stringr)

# Day 2 - check eligibility of passwords

Tag2 <- read_excel("~/Privat/Advent of Code/Tag2.xlsx")

df <- as.character(Tag2$Daten)

      # Split string data in password section and info section
      pw <- strsplit(df, ":")
      pw <- as.matrix(t(as.data.frame(pw)))
        colnames(pw) <- c("info", "pw")
        rownames(pw) <- c()
      pw <- as.data.frame(pw)
      
      # Extract necessary password criterium from info section and clean remaining info section
      pw$criteria <-
        str_trim(str_sub(
          pw$info,
          start = str_length(pw$info) - 1,
          end =  str_length(pw$info)
        ))
      
      pw$info <-
        str_trim(str_sub(pw$info, start = 1, end =  str_length(pw$info) - 1))
      
      # Define the boundaries of the password eligibility
      pw_bounds <- str_split(pw$info, "-")
      pw_bounds <- as.matrix(t(as.data.frame(pw_bounds)))
        colnames(pw_bounds) <- c("min", "max")
        rownames(pw_bounds) <- c()
      pw_bounds <- as.data.frame(pw_bounds)
      
      pw$min <- pw_bounds$min
      pw$max <- pw_bounds$max
      
      # Counting the ocurrences of the criteria in the password and transforming data into numerics
      pw$count <- str_count(pw$pw, pw$criteria)
        pw$min <- as.numeric(as.character(pw$min))
        pw$max <- as.numeric(as.character(pw$max))
        pw$count <- as.numeric(as.character(pw$count))
      
      # first PW eligibility check and counting the eligible passwords
      pw$eligible1 <-
        ifelse(pw$min <= pw$count & pw$count <= pw$max, 1, 0)
      
      sum(pw$eligible1)
      
      # further manipulating data to have the necessary info for the second eligibility check
      pw$firstcheck <- pw$min
      pw$lastcheck <- pw$max
      
      pw$first <-
        str_sub(pw$pw,
                start = pw$firstcheck + 1,
                end = pw$firstcheck + 1)
      pw$last  <-
        str_sub(pw$pw,
                start = pw$lastcheck + 1,
                end = pw$lastcheck + 1)
      
      # second PW eligibility check and counting the eligible passwords
      pw$eligible2a <-
        ifelse(pw$criteria == pw$first & pw$criteria != pw$last, 1, 0)
      pw$eligible2b <-
        ifelse(pw$criteria != pw$first & pw$criteria == pw$last, 1, 0)
      
      pw$eligible2 <-
        ifelse(pw$eligible2a == 1 | pw$eligible2b == 1, 1, 0)
      
      sum(pw$eligible2)

