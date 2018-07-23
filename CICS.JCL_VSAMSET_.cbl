//VSAMZB JOB CLASS=A,MSGCLASS=X                
//STEP1 EXEC PGM=IDCAMS                        
//SYSPRINT DD SYSOUT=A                         
//SYSIN DD *                                   
   DEFINE CLUSTER (NAME(U0210.VSAM.ZBANK)-     
   VOL(B2SYS1) -                               
   INDEXED                                  -  
   RECSZ(30 30)                             -  
   TRACKS(1,1)                              -  
   KEYS(10 0))                              -  
   DATA (NAME(U0210.VSAM.ZBANK.DATA))      -   
   INDEX (NAME(U0210.VSAM.ZBANK.INDEX))        
/*                                             