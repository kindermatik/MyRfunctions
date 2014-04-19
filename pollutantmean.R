pollutantmean <- function(directory, pollutant, id = 1:332) {
#We create a variable with the directory wher to find the csv files to be uploaded 
  
  direc1<-paste(getwd(),directory,sep="/")

#We create a vector including a complete list of csv files in the folder

files<-list.files(direc1,pattern="*.csv")

#We create a vector with index of files to be included

indfiles<-id

#We upoad first file of the index 
  
  direc2<-paste(direc1,files[indfiles[1]],sep="/")
  datafiles<-read.csv(direc2)

#We append the rest of the csv files if id is for more than one file
  
  if (length(indfiles)>1){

    for (i in 2:length(indfiles)) {
      datafiles1<-datafiles
      direc2<-paste(direc1,files[indfiles[i]],sep="/")
      datafiles2<-read.csv(direc2)
      datafiles<-rbind(datafiles1,datafiles2)
    }
  }

#We create a vector with the directorym the pollutant chosen and the mean

solutions<-(mean(datafiles[,pollutant],na.rm=TRUE))
solutions

}
