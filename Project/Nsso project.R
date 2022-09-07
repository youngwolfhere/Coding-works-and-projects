##Name : Sathish.R
## Roll no: 21227707225
## Dataset - Consumer price index for agricultural labourer(RBI)

#Loading the required libraries
library(readr)

#Extraction of level 1 from NSSO dataset:
Dlevel1<-read_fwf(file="F:\\Codes\\r77182v1L01.txt",
                  fwf_cols(Schedule_id =c(1,3),
                           fsu_Serial=c(4,8), round=c(9,10),
                           Schedule=c(11,13),Sample=c(14,14),Sector=c(15,15),
                           NSS_Region=c(16,18),District=c(19,20),Strt=c(21,22),
                           Sub_Strt=c(23,24),Sub_Round=c(25,25),
                           FOD_Sub_Region=c(26,29),Second_st_str=c(30,30),
                           Sample_hhld_no=c(31,32),visit=c(33,33),
                           Level=c(34,35),Filler=c(36,40),Informant_Sl=c(41,42),
                           Response_Code=c(43,43),Survey_Code=c(44,44),
                           Substitution_Code=c(45,45), Employee_code1=c(46,49),
                           Employee_code2=c(50,53),Employee_code3=c(54,57),
                           Date_of_Survey=c(58,63),Date_of_Despatch=c(64,69),
                           Time_canvas=c(70,72),No_of_investigators=c(73,73),
                           Remarks1=c(74,74),Remarks2=c(75,75),
                           Remarks_Sch=c(76,76),Remarks_Sch1=c(77,77),
                           policies=c(78,80),Blank=c(110,126),NSC=c(127,129),
                           MULT=c(127,129)),
                  col_types= cols(Schedule_id =col_character(),
                                  fsu_Serial=col_character(),
                                  round=col_character(),
                                  Schedule=col_character(),
                                  Sample=col_character(),
                                  Sector=col_character(),
                                  NSS_Region=col_character(),
                                  District=col_character(),
                                  Strt=col_character(),
                                  Sub_Strt=col_character(),
                                  Sub_Round=col_character(),
                                  FOD_Sub_Region=col_character(),
                                  Second_st_str=col_character(),
                                  Sample_hhld_no=col_character(),
                                  visit=col_character(),
                                  Level=col_character(), 
                                  Filler=col_character(),
                                  Informant_Sl=col_character(),
                                  Response_Code=col_character(),
                                  Survey_Code=col_character(),
                                  Substitution_Code=col_character(),
                                  Employee_code1=col_character(),
                                  Employee_code2=col_character(),
                                  Employee_code3=col_character(),
                                  Date_of_Survey=col_character(),
                                  Date_of_Despatch=col_character(),
                                  Time_canvas=col_character(),
                                  No_of_investigators=col_character(),
                                  Remarks1=col_character(),
                                  Remarks2=col_character(),
                                  Remarks_Sch=col_character(),
                                  Remarks_Sch1=col_character(),
                                  policies=col_character(),
                                  Blank=col_character(),
                                  NSC=col_number(),MULT=col_number()))
save(Dlevel1,file="Dlevel1.RData")
#Extraction of level 3 from NSSO dataset:
Dlevel3<-read_fwf(file="F:\\Codes\\r77182v1L03.txt",
                  fwf_cols(Schedule_id =c(1,3),
                           fsu_Serial=c(4,8), round=c(9,10),Schedule=c(11,13),
                           Sample=c(14,14),Sector=c(15,15),NSS_Region=c(16,18),
                           District=c(19,20),Strt=c(21,22),Sub_Strt=c(23,24),
                           Sub_Round=c(25,25),FOD_Sub_Region=c(26,29),
                           Second_st_str=c(30,30),Sample_hhld_no=c(31,32),
                           visit=c(33,33),Level=c(34,35),Filler=c(36,40),
                           Household_size=c(41,43),religion=c(44,44),
                           Social_group=c(45,45),Household_type=c(46,46),
                           area=c(47,52),owned_possessed=c(53,58),leased_in=c(59,64),
                           oth_possessed=c(65,70),leased_out=c(71,76),agri=c(77,77),
                           ow_household=c(78,83),kitchen_garden=c(84,89),PMJJBY=c(90,91),
                           PMSBY=c(92,93),APY=c(94,95),Blank=c(96,126),
                           NSC=c(127,129),MULT=c(127,129)),
                  col_types= cols(Schedule_id =col_character(),
                                  fsu_Serial=col_character(),round=col_character(),
                                  Schedule=col_character(),
                                  Sample=col_character(),
                                  Sector=col_character(),
                                  NSS_Region=col_character(),
                                  District=col_character(),
                                  Strt=col_character(),
                                  Sub_Strt=col_character(),
                                  Sub_Round=col_character(),
                                  FOD_Sub_Region=col_character(),
                                  Second_st_str=col_character(),
                                  Sample_hhld_no=col_character(),
                                  visit=col_character(),Level=col_character(), 
                                  Filler=col_character(),
                                  Household_size=col_character(),
                                  religion=col_character(),
                                  Social_group=col_character(),
                                  Household_type=col_character(),
                                  area=col_character(),owned_possessed=col_character(),
                                  leased_in=col_character(),
                                  oth_possessed=col_character(),
                                  leased_out=col_character(),
                                  agri=col_character(),ow_household=col_character(),
                                  kitchen_garden=col_character(),
                                  PMJJBY=col_character(), PMSBY=col_character(),
                                  APY=col_character(),
                                  Blank=col_character(),
                                  NSC=col_number(),MULT=col_number()))
save(Dlevel3,file="Dlevel3.RData")

#Extraction of level 4 from NSSO dataset:
Dlevel4<-read_fwf(file="F:\\Codes\\r77182v1L04.txt",
                  fwf_cols(Schedule_id =c(1,3),fsu_Serial=c(4,8), round=c(9,10),
                           Schedule=c(11,13),Sample=c(14,14),Sector=c(15,15),
                           NSS_Region=c(16,18),District=c(19,20),Strt=c(21,22),
                           Sub_Strt=c(23,24),Sub_Round=c(25,25),
                           FOD_Sub_Region=c(26,29),Second_st_str=c(30,30),
                           Sample_hhld_no=c(31,32),visit=c(33,33),Level=c(34,35),
                           Filler=c(36,40),consumer_expenditure=c(41,50),
                           consumption_home=c(51,60),consumption_wages=c(61,70),
                           e_durable=c(71,80),expenditure=c(81,90),
                           Blank=c(91,126),NSC=c(127,129),MULT=c(127,129)),
                  col_types= cols(Schedule_id =col_character(),
                                  fsu_Serial=col_character(),round=col_character(),
                                  Schedule=col_character(),
                                  Sample=col_character(),
                                  Sector=col_character(),
                                  NSS_Region=col_character(),
                                  District=col_character(),
                                  Strt=col_character(),
                                  Sub_Strt=col_character(),
                                  Sub_Round=col_character(),
                                  FOD_Sub_Region=col_character(),
                                  Second_st_str=col_character(),
                                  Sample_hhld_no=col_character(),
                                  visit=col_character(),Level=col_character(), 
                                  Filler=col_character(),
                                  consumer_expenditure=col_character(),
                                  consumption_home=col_character(),
                                  consumption_wages=col_character(),
                                  e_durable=col_character(),
                                  expenditure=col_character(),
                                  Blank=col_character(),
                                  NSC=col_number(),MULT=col_number()))
save(Dlevel4,file="Dlevel4.RData")

#Creating weights from multiplier for each of these levels:
Dlevel1$weight<-Dlevel1$MULT/100
Dlevel3$weight<-Dlevel3$MULT/100
Dlevel4$weight<-Dlevel4$MULT/100

#Generating a primary key for these household level data:
Dlevel1$key <-paste0(Dlevel1$fsu_Serial,Dlevel1$Second_st_str,Dlevel1$Sample_hhld_no)
Dlevel3$key <-paste0(Dlevel3$fsu_Serial,Dlevel3$Second_st_str,Dlevel3$Sample_hhld_no)
Dlevel4$key <-paste0(Dlevel4$fsu_Serial,Dlevel4$Second_st_str,Dlevel4$Sample_hhld_no)

#Merging the level 1,3 and 4 into single household level data to run the analysis:
Dlevel3_4 <-merge(Dlevel3,Dlevel4, by="key",all=TRUE)
Dlevel1_3_4 <-merge(Dlevel3_4,Dlevel1, by="key",all=TRUE)


#Running the Linear regression using the function lm ():
lm.fit <- lm(owned_possessed~ consumer_expenditure+consumption_home
             +consumption_wages+e_durable+leased_in+oth_possessed+leased_out+ow_household ,data=Dlevel1_3_4)
summary(lm.fit)
coef(lm.fit)



###2.Individual Level data #####


#Extraction of level 15 from NSSO dataset:
Dlevel15<-read_fwf(file="F:\\Codes\\r77182v1L15.txt",
                   fwf_cols(Schedule_id =c(1,3),fsu_Serial=c(4,8), round=c(9,10),
                            Schedule=c(11,13),Sample=c(14,14),
                            Sector=c(15,15),NSS_Region=c(16,18),District=c(19,20),
                            Strt=c(21,22),Sub_Strt=c(23,24),Sub_Round=c(25,25),
                            FOD_Sub_Region=c(26,29),Second_st_str=c(30,30),
                            Sample_hhld_no=c(31,32),visit=c(33,33),Level=c(34,35),
                            Filler=c(36,38),Serial_no=c(39,40),per_loan=c(41,41),
                            So_loan=c(42,42),purpose=c(43,43),
                            amount_outstanding=c(44,55),Blank=c(56,126),
                            NSC=c(127,129),MULT=c(127,129)),
                   col_types= cols(Schedule_id =col_character(),
                                   fsu_Serial=col_character(),round=col_character(),
                                   Schedule=col_character(),
                                   Sample=col_character(),
                                   Sector=col_character(),
                                   NSS_Region=col_character(),
                                   District=col_character(),
                                   Strt=col_character(),
                                   Sub_Strt=col_character(),Sub_Round=col_character(),
                                   FOD_Sub_Region=col_character(),
                                   Second_st_str=col_character(),
                                   Sample_hhld_no=col_character(),
                                   visit=col_character(),Level=col_character(), 
                                   Filler=col_character(), Serial_no=col_character(),
                                   per_loan=col_character(),So_loan=col_character(),
                                   purpose=col_character(),
                                   amount_outstanding=col_character(),
                                   Blank=col_character(),NSC=col_number(),
                                   MULT=col_number()))
save(Dlevel15,file="Dlevel15.RData")

#Extraction of level 16 from NSSO dataset:
Dlevel16<-read_fwf(file="F:\\Codes\\r77182v1L16.txt",
                   fwf_cols(Schedule_id =c(1,3),
                            fsu_Serial=c(4,8), round=c(9,10),Schedule=c(11,13),
                            Sample=c(14,14),Sector=c(15,15),NSS_Region=c(16,18),
                            District=c(19,20),Strt=c(21,22),Sub_Strt=c(23,24),
                            Sub_Round=c(25,25),FOD_Sub_Region=c(26,29),
                            Second_st_str=c(30,30),Sample_hhld_no=c(31,32),
                            visit=c(33,33),Level=c(34,35),Filler=c(36,38),
                            Serial_no=c(39,40),Floor_area=c(41,49),E_Purchase=c(50,61),
                            E_Addition=c(62,73),E_Major=c(74,85),E_Improvement=c(86,97),
                            E_Total=c(98,109),Blank=c(110,126),NSC=c(127,129),MULT=c(127,129)),
                   col_types= cols(Schedule_id =col_character(),
                                   fsu_Serial=col_character(),
                                   round=col_character(),
                                   Schedule=col_character(),
                                   Sample=col_character(),
                                   Sector=col_character(),
                                   NSS_Region=col_character(),
                                   District=col_character(),
                                   Strt=col_character(),
                                   Sub_Strt=col_character(),Sub_Round=col_character(),
                                   FOD_Sub_Region=col_character(),
                                   Second_st_str=col_character(),
                                   Sample_hhld_no=col_character(),
                                   visit=col_character(),Level=col_character(), 
                                   Filler=col_character(), Serial_no=col_character(),
                                   Floor_area=col_number(),E_Purchase=col_integer(),
                                   E_Addition=col_integer(),E_Major=col_integer(),
                                   E_Improvement=col_integer(),E_Total=col_integer(),
                                   Blank=col_character(),NSC=col_number(),
                                   MULT=col_number()))
save(Dlevel16,file="Dlevel16.RData")

#Extraction of level 15 from NSSO dataset:
Dlevel17<-read_fwf(file="F:\\Codes\\r77182v1L17.txt",
                   fwf_cols(Schedule_id =c(1,3),fsu_Serial=c(4,8), round=c(9,10),
                            Schedule=c(11,13),Sample=c(14,14),Sector=c(15,15),
                            NSS_Region=c(16,18),District=c(19,20),Strt=c(21,22),
                            Sub_Strt=c(23,24),Sub_Round=c(25,25),
                            FOD_Sub_Region=c(26,29),Second_st_str=c(30,30),
                            Sample_hhld_no=c(31,32),visit=c(33,33),Level=c(34,35),
                            Filler=c(36,38),Serial_no=c(39,40),
                            Financed_Institutional=c(41,52),
                            Financed_Non_Institutional=c(53,64),Value_Sale=c(65,76),
                            Value_loss=c(77,88),Value_Total=c(89,100),
                            net_addition=c(101,112),Blank=c(113,126),NSC=c(127,129),
                            MULT=c(127,129)),
                   col_types= cols(Schedule_id =col_character(),
                                   fsu_Serial=col_character(),round=col_character(),
                                   Schedule=col_character(),
                                   Sample=col_character(),
                                   Sector=col_character(),
                                   NSS_Region=col_character(),
                                   District=col_character(),
                                   Strt=col_character(),
                                   Sub_Strt=col_character(),Sub_Round=col_character(),
                                   FOD_Sub_Region=col_character(),
                                   Second_st_str=col_character(),
                                   Sample_hhld_no=col_character(),
                                   visit=col_character(),Level=col_character(), 
                                   Filler=col_character(), Serial_no=col_character(),
                                   Financed_Institutional=col_integer(),
                                   Financed_Non_Institutional=col_integer(),
                                   Value_Sale=col_integer(),
                                   Value_loss=col_integer(),
                                   Value_Total=col_integer(),net_addition=col_integer(),
                                   Blank=col_character(),NSC=col_number(),
                                   MULT=col_number()))
save(Dlevel17,file="Dlevel17.RData")

#Creating weights from multiplier for each of these levels:
Dlevel15$weight<-Dlevel15$MULT/100
Dlevel16$weight<-Dlevel16$MULT/100
Dlevel17$weight<-Dlevel17$MULT/100

#Generating a primary key for these individual level data:
Dlevel15$keyind <-paste0(Dlevel15$fsu_Serial,Dlevel15$Second_st_str,Dlevel15$Sample_hhld_no,Dlevel15$Serial_no)
Dlevel16$keyind <-paste0(Dlevel16$fsu_Serial,Dlevel16$Second_st_str,Dlevel16$Sample_hhld_no,Dlevel16$Serial_no)
Dlevel17$keyind <-paste0(Dlevel17$fsu_Serial,Dlevel17$Second_st_str,Dlevel17$Sample_hhld_no,Dlevel17$Serial_no)

#Merging the level 16,17 as single individual level data to run the analysis:
Dlevel16_17 <-merge(Dlevel16,Dlevel17, by="keyind",all=TRUE)
save(Dlevel16_17,file="Dlevel16_17.RData")

#Changing the NA into zeroes to run the analysis:
Dlevel16_17[][is.na(Dlevel16_17[])] <- 0

#Creating a new single finance column by merging the financed -institutional and non-institutional columns:
Dlevel16_17$Finance <- Dlevel16_17$Financed_Institutional + Dlevel16_17$Financed_Non_Institutional
#Running the Linear regression using the function lm():
lm.fit <- lm(Finance~ Floor_area+E_Purchase+E_Addition+
               E_Major+E_Improvement+Value_Sale+Value_loss, data=Dlevel16_17)
summary(lm.fit)
coef(lm.fit)


