corr <- function(directory, threshold = 0){

  #We create a list to have ill the fil s with theanumber of correct observations
  compfileind<-complete(directory,id = 1:332)
  
  #We create a logical vector for files with valid observations above threshold
  usedfiles<-compfileind$nobs>threshold
  
  #We create a variable with the directory where to find the csv files to be uploaded 
  direc1<-paste(getwd(),directory,sep="/")
  
  #We create a vector including a complete list of csv files in the folder
  files<-list.files(direc1,pattern="*.csv")
  
  #We create an empty numeric vector to store the correlations
  solutions<-vector("numeric",0)
  
  #We review csv files and if they have enough valid observation we calulate the vector of correlations
  
  for (i in 1:332){
    
    if (usedfiles[i]==TRUE) {
      direc2<-paste(direc1,files[i],sep="/")
      datafiles<-read.csv(direc2)
      correlation<-cor(datafiles$sulfate,datafiles$nitrate,"pairwise")
      solutions<-c(solutions,correlation)
    }
  
  }

  solutions
}