//PPCOMLNK JOB CLASS=A,MSGCLASS=X                           
//CICSLIB JCLLIB ORDER=(DFH530.CICS.SDFHPROC)               
//PPCL EXEC DFHZITCL,INDEX='DFH530.CICS',LNGPRFX=IGY520,    
//    DSCTLIB='DFH530.CICS.SDFHCOB',                        
//    PROGLIB='U0210.CICS.LOADLIB'                          
//COBOL.SYSIN DD DSN=U0210.CICS.COB(ZBANK3),DISP=SHR        
//LKED.SYSIN DD *                                           
    NAME ZBANK(R)                                           
/*                                                          