complete <- function(directory, id = 1:332) {
        originalwd <- getwd()
        setwd(paste(getwd(),"/",directory, sep = "")) #sets the wd to current wd + $directory
        frame <- data.frame(matrix(ncol = 2, nrow = 0))
        for(i in id){
                nthcsv <- read.csv(paste(formatC(i, width=3, flag="0"), ".csv", sep="")) ## stores the nth csv in an R object; uses formatC() to convert i into a width of 3, like the naming of the files
                casesvector <- complete.cases(nthcsv$sulfate, nthcsv$nitrate)
                casescount <- table(casesvector)["TRUE"]
                newrow <- c(i,casescount)
                frame <- rbind(frame, newrow)
        }
        names(frame) <- c("id", "nobs")
        print(frame)
        setwd(originalwd)
}
