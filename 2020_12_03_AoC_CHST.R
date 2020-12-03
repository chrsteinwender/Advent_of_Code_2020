# Subject: Advent of Code 2020
# Day: 03.12.2020
# Author: Christian Steinwender

# Day 3 - determine the number of trees of using a particular slope through a forest

    # Loading data
    Tag3 <- read_excel("Privat/Advent of Code/Tag3.xlsx")
    df <- Tag3
    
    # Using forest snippet to construct a lage enough forest
    n <- ceiling((nrow(df) * 10) / ncol(df))
    full_df <- df
    for (i in 1:n) {
      full_df <- cbind(full_df, df)
    }
    full_df <- as.data.frame(full_df)
    
    # Recoding the forest into a numerical format (tree == 1)
    full_df[full_df == "#"] <- 1
    full_df[full_df == "."] <- 0
    full_df <- sapply(full_df, as.numeric)
    full_df <- as.matrix(full_df)
    
    # Setting the start-values
    sum <- 0
    i <- 1
    j <- 1
    
    # Setting the slope
    step_down = 1
    step_right = 3
    
    # FInding and counting trees in the choosen slope
    while (i < nrow(full_df)) {
      i <- i + step_down
      j <- j + step_right
      add <- full_df[i, j]
      sum <- sum + add
    }
    
    # Return result
    result <- as.numeric(sum)
    print(result)
    
    # Clean results of Day 3
    
    # first part
    # [3,1] -> 250
    
    # second part
    # [1,1] -> 55
    # [3,1] -> 250
    # [5,1] -> 54
    # [7,1] -> 55
    # [1,2] -> 39
    
    result = 55 * 250 * 54 * 55 * 39
    # 1592662500
