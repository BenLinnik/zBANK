//COPYSEQ JOB CLASS=A,MSGCLASS=X                     
//*                                                  
//* COPY SEQENTIAL DATASET INTO VSAM CLUSTER         
//*                                                  
//DEFCLS EXEC PGM=IDCAMS,REGION=4096K                
//SEQDD DD DSN=U0210.SEQDAT.ZBANK,DISP=SHR           
//VSAMDD DD DSN=U0210.VSAM.ZBANK,DISP=SHR            
//SYSPRINT DD SYSOUT=A                               
//SYSIN DD *                                         
  REPRO INFILE(SEQDD) -                              
        OUTFILE(VSAMDD)                              
/*                                                   