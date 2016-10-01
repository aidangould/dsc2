pollutantmean <- function(directory, pollutant, id = 1:332) {
        originalwd <- getwd()
        setwd(paste(getwd(),"/",directory, sep = "")) #sets the wd to current wd + $directory
        levelvector <- c() #creates an empty vector to place polutant levels from individual files into; will be averaged later
        if(pollutant=="nitrate"){
                for(i in id){
                        nthcsv <- read.csv(paste(formatC(i, width=3, flag="0"), ".csv", sep="")) ## stores the nth csv in an R object; uses formatC() to convert i into a width of 3, like the naming of the files
                        levelvector <- c(levelvector, nthcsv$nitrate)
                }
        } else if(pollutant=="sulfate") {
                for(i in id){
                        nthcsv <- read.csv(paste(formatC(i, width=3, flag="0"), ".csv", sep="")) ## stores the nth csv in an R object; uses formatC() to convert i into a width of 3, like the naming of the files
                        levelvector <- c(levelvector, nthcsv$sulfate)
                } 
        } else {
                print("pollutant not recognized")
        }
        meanlevel <- mean(levelvector, na.rm=TRUE)
        print(signif(meanlevel,4))
        setwd(originalwd)
}