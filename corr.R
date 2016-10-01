corr <- function(directory, threshold = 0) {
        originalwd <- getwd()
        setwd(paste(getwd(),"/",directory, sep = "")) #sets the wd to current wd + $directory
        correlations <- c()
        filesnames <- list.files()
        for(i in filesnames) {
                mycsv <- read.csv(i)
                casesvector <- complete.cases(mycsv$sulfate, mycsv$nitrate)
                casescount <- table(casesvector)["TRUE"]
                if(is.na(as.logical(casescount))) {}
                else if(as.numeric(casescount) >= threshold) {
                        correlations <- c(correlations, cor(mycsv$sulfate, mycsv$nitrate, use = "complete.obs"))
                }
        }
        setwd(originalwd)
        print(correlations) ##got stuck for a long time because I had print ABOVE setwd(), and it was adding the wd to the ouput for correlations (ugh)
}