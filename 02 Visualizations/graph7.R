require("jsonlite")
require("RCurl")
# Change the USER and PASS below to be your UTEid
df <- data.frame(fromJSON(getURL(URLencode('129.152.144.84:5001/rest/native/?query="select * from titanic where sex is not null "'),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/PDBF15DV.usuniversi01134.oraclecloud.internal', USER='cs329e_in2422', PASS='orcl_in2422', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE), ))
df
summary(df)
head(df)
# 
require(extrafont)
ggplot() + 
  coord_cartesian() + 
  scale_x_continuous() +
  #scale_y_continuous() +
  scale_y_discrete()+
  #facet_wrap(~SURVIVED) +
  #facet_grid(.~SURVIVED, labeller=label_both) + # Same as facet_wrap but with a label.
  #facet_grid(PCLASS~SURVIVED, labeller=label_both) +
  labs(title='Titanic') +
  labs(x="Age", y=paste("Survived")) +
  layer(data=df, 
        mapping=aes(x=as.numeric(as.character(AGE)), y=as.character(SURVIVED)), 
        stat="identity", 
        stat_params=list(), 
        geom="histogram",
        geom_params=list(), 
        #position=position_identity()
        position=position_jitter(width=.3, height=0)
  )