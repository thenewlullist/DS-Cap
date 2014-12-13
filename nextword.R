require(stylo);require(data.table)
traindt<-fread("traindt.csv");traindt[,V1:=NULL]
setkeyv(traindt,colnames(traindt))

nextword <- function(phrase) {
      #traindt<-fread("traindt.csv");traindt[,V1:=NULL]
      #setkeyv(traindt,colnames(traindt))
      
      ph<-txt.to.words(phrase)
      string<-as.list(ph)
      string<-string[(max(length(string))-1):max(length(string))]
      sub<-na.omit(traindt[string][order(freq,decreasing=T)][1:10][,.(Word=n3,confidence=round(freq/sum(freq)*100,digits=2)," "="%")])
      
      if (nrow(sub) == 0){
            sub<-data.table(Word=c("the","to","and","a","of","in","i","for","is","that"),confidence=c(22.52,13.77,11.59,11.59,9.73,7.87,7.03,5.60,5.41,4.88),' '='%')
            return(sub)}
            else{return(sub)}
}
#                string<-as.list(ph)
#               string<-string[(max(length(string))-2):max(length(string))]
#              sub<-na.omit(traindt[string][1:10][order(freq,decreasing=T)][,.(n4,freq)])
#             if (nrow(sub) > 0){return(sub)}
#                  else {ph<-txt.to.words(phrase)
#                       string<-as.list(ph)
#                      string<-string[(max(length(string))-1):max(length(string))]
#                     sub<-na.omit(traindt[string][1:10][order(freq,decreasing=T)][,.(n3,freq)])
#                    if (nrow(sub) > 0){return(sub)}
#                   else {return("the")}
#            }}

#      return(sub)
