# Subject: Advent of Code 2020
# Day: 01.12.2020
# Author: Christian Steinwender

library(readxl)

# Day 1 - multiply combinations of numbers which sum equals 2020

    Tag1 <- read_excel("~/Privat/Advent of Code/Tag1.xlsx")
    
    df <- as.matrix(Tag1)
    df <- as.matrix(sort(df))

# Find the numbers in 2 identical dataframes which sum is 2020 and multiply them

    for (a in 1:nrow(df)) {
      for (b in 1:nrow(df)) {
        if ((df[a, ] + df[b, ] == 2020) == TRUE) {
          print(df[a, ] * df[b, ])
          break
        }
      }
    }

# Find the numbers in 3 identical dataframes which sum is 2020 and multiply them

    for (a in 1:nrow(df)) {
      for (b in 1:nrow(df)) {
        for (c in 1:nrow(df)) {
          if ((df[a, ] + df[b, ] + df[c, ] == 2020) == TRUE) {
            print(df[a, ] * df[b, ] * df[c, ])
            break
          }
        }
      }
    }