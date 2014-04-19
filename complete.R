complete <- function(directory, id = 1:332) {
  
  #We create a variable with the directory wher to find the csv files to be uploaded 
    direc1<-paste(getwd(),directory,sep="/")
  
  #We create a vector including a complete list of csv files in the folder
  
  files<-list.files(direc1,pattern="*.csv")
  
  #We create a vector with index of files to be included
  
  indfiles<-id
  
  #We upoad first file of the index 
  
  direc2<-paste(direc1,files[indfiles[1]],sep="/")
  datafiles<-read.csv(direc2)
  
  #We create a temporary file to keep the results of uploaded files
  compsulfate<-!is.na(datafiles[,2])
  compnitrate<-!is.na(datafiles[,3])
  comp<-compsulfate*compnitrate
  tempsolutions<-data.frame(median(datafiles[,4]),sum(comp))
  colnames(tempsolutions)<-c("id","nobs")
  
  #We move the tempsolutions to our final data frame
  
  solutions<-tempsolutions
  
  #We repeat with the rest of files to upload and append to solutions 
  
  if (length(indfiles)>1){
    
    for (i in 2:length(indfiles)) {
      direc2<-paste(direc1,files[indfiles[i]],sep="/")
      datafiles<-read.csv(direc2)
      compsulfate<-!is.na(datafiles[,2])
      compnitrate<-!is.na(datafiles[,3])
      comp<-compsulfate*compnitrate      
      tempsolutions<-data.frame(median(datafiles[,4]),sum(comp))
      colnames(tempsolutions)<-c("id","nobs")
      
      solutions<-rbind(solutions,tempsolutions)      
      
    }
  }
  solutions
}