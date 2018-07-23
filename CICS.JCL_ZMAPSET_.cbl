//ZMAPSET JOB CLASS=A,MSGCLASS=X
//IBMLIB JCLLIB ORDER=(DFH530.CICS.SDFHPROC)
//ASSEM EXEC DFHMAPS,MAPNAME='ZBNKSET',INDEX='DFH530.CICS',
//     MAPLIB='DFH530.CICS.SDFHLOAD',
//     DSCTLIB='DFH530.CICS.SDFHMAC'
//SYSUT1 DD *
ZBNKSET  DFHMSD TYPE=MAP,MODE=INOUT,LANG=COBOL2,STORAGE=AUTO,          X
               TIOAPFX=YES
ZLOGIN   DFHMDI SIZE=(24,80),LINE=1,COLUMN=1,CTRL=FREEKB
         DFHMDF POS=(1,35),LENGTH=15,ATTRB=(ASKIP,NORM),               X
               INITIAL='ZBANK LOGIN'
         DFHMDF POS=(3,27),LENGTH=30,ATTRB=(ASKIP,NORM),               X
               INITIAL='    ______             _    '
         DFHMDF POS=(4,27),LENGTH=30,ATTRB=(ASKIP,NORM),               X
               INITIAL='    | ___ \           | |   '
         DFHMDF POS=(5,27),LENGTH=30,ATTRB=(ASKIP,NORM),               X
               INITIAL=' ___| |_/ / __ _ _ __ | | __'
         DFHMDF POS=(6,27),LENGTH=30,ATTRB=(ASKIP,NORM),               X
               INITIAL='|_  / ___ \/ _` | `_ \| |/ /'
         DFHMDF POS=(7,27),LENGTH=30,ATTRB=(ASKIP,NORM),               X
               INITIAL=' / /| |_/ / (_| | | | |   < '
         DFHMDF POS=(8,27),LENGTH=30,ATTRB=(ASKIP,NORM),               X
               INITIAL='/___\____/ \__,_|_| |_|_|\_\'
LOGINFO  DFHMDF POS=(10,30),LENGTH=50,ATTRB=(ASKIP,NORM)
         DFHMDF POS=(13,30),LENGTH=20,ATTRB=(ASKIP,NORM),              X
               INITIAL='ACCOUNT:'
LOGACC   DFHMDF POS=(13,42),LENGTH=10,ATTRB=(UNPROT,NUM,NORM,IC)
         DFHMDF POS=(14,30),LENGTH=4,ATTRB=(ASKIP,NORM),               X
               INITIAL='PIN:'
LOGPIN   DFHMDF POS=(14,42),LENGTH=4,ATTRB=(UNPROT,NUM,NORM)
         DFHMDF POS=(18,30),LENGTH=10,ATTRB=(ASKIP,NORM),              X
               INITIAL='ACTIONS:'
         DFHMDF POS=(19,30),LENGTH=30,ATTRB=(ASKIP,NORM),              X
               INITIAL='Q - EXIT, R - REGISTER'
               LOGACT   DFHMDF POS=(18,42),LENGTH=1,ATTRB=(UNPROT,NORM)
ZHOME    DFHMDI SIZE=(24,80),LINE=1,COLUMN=1,CTRL=FREEKB
         DFHMDF POS=(1,35),LENGTH=15,ATTRB=(ASKIP,NORM),               X
               INITIAL='ZBANK HOME'
         DFHMDF POS=(3,27),LENGTH=30,ATTRB=(ASKIP,NORM),               X
               INITIAL='    ______             _    '
         DFHMDF POS=(4,27),LENGTH=30,ATTRB=(ASKIP,NORM),               X
               INITIAL='    | ___ \           | |   '
         DFHMDF POS=(5,27),LENGTH=30,ATTRB=(ASKIP,NORM),               X
               INITIAL=' ___| |_/ / __ _ _ __ | | __'
         DFHMDF POS=(6,27),LENGTH=30,ATTRB=(ASKIP,NORM),               X
               INITIAL='|_  / ___ \/ _` | `_ \| |/ /'
         DFHMDF POS=(7,27),LENGTH=30,ATTRB=(ASKIP,NORM),               X
               INITIAL=' / /| |_/ / (_| | | | |   < '
         DFHMDF POS=(8,27),LENGTH=30,ATTRB=(ASKIP,NORM),               X
               INITIAL='/___\____/ \__,_|_| |_|_|\_\'
HOMINFO  DFHMDF POS=(10,30),LENGTH=50,ATTRB=(ASKIP,NORM)
         DFHMDF POS=(12,25),LENGTH=20,ATTRB=(ASKIP,NORM),              X
               INITIAL='CURRENT BALANCE:'
BALANCE  DFHMDF POS=(12,50),LENGTH=10,ATTRB=(ASKIP,NORM)
         DFHMDF POS=(14,25),LENGTH=10,ATTRB=(ASKIP,NORM),              X
               INITIAL='AMOUNT:'
AMOUNT   DFHMDF POS=(14,42),LENGTH=10,ATTRB=(UNPROT,NUM,NORM,IC)
         DFHMDF POS=(15,25),LENGTH=20,ATTRB=(ASKIP,NORM),              X
               INITIAL='CHOOSE AN ACTION:'
         DFHMDF POS=(16,25),LENGTH=30,ATTRB=(ASKIP,NORM),              X
               INITIAL='Q - EXIT, D - DEPOSIT'
         DFHMDF POS=(17,25),LENGTH=30,ATTRB=(ASKIP,NORM),              X
               INITIAL='W - WITHDRAW, T - TRANSFER'
HOMACT   DFHMDF POS=(15,42),LENGTH=1,ATTRB=(UNPROT,NORM)
ZRGSTR   DFHMDI SIZE=(24,80),LINE=1,COLUMN=1,CTRL=FREEKB
         DFHMDF POS=(1,35),LENGTH=15,ATTRB=(ASKIP,NORM),               X
               INITIAL='ZBANK REGISTER'
         DFHMDF POS=(3,27),LENGTH=30,ATTRB=(ASKIP,NORM),               X
               INITIAL='    ______             _    '
         DFHMDF POS=(4,27),LENGTH=30,ATTRB=(ASKIP,NORM),               X
               INITIAL='    | ___ \           | |   '
         DFHMDF POS=(5,27),LENGTH=30,ATTRB=(ASKIP,NORM),               X
               INITIAL=' ___| |_/ / __ _ _ __ | | __'
         DFHMDF POS=(6,27),LENGTH=30,ATTRB=(ASKIP,NORM),               X
               INITIAL='|_  / ___ \/ _` | `_ \| |/ /'
         DFHMDF POS=(7,27),LENGTH=30,ATTRB=(ASKIP,NORM),               X
               INITIAL=' / /| |_/ / (_| | | | |   < '
         DFHMDF POS=(8,27),LENGTH=30,ATTRB=(ASKIP,NORM),               X
               INITIAL='/___\____/ \__,_|_| |_|_|\_\'
REGINFO  DFHMDF POS=(10,30),LENGTH=50,ATTRB=(ASKIP,NORM)
         DFHMDF POS=(13,30),LENGTH=10,ATTRB=(ASKIP,NORM),              X
               INITIAL='ACCOUNT:'
REGACC   DFHMDF POS=(13,42),LENGTH=10,ATTRB=(UNPROT,NUM,NORM,IC)
         DFHMDF POS=(14,30),LENGTH=4,ATTRB=(ASKIP,NORM),               X
               INITIAL='PIN:'
REGPIN   DFHMDF POS=(14,42),LENGTH=4,ATTRB=(UNPROT,NUM,NORM)
         DFHMDF POS=(18,30),LENGTH=10,ATTRB=(ASKIP,NORM),              X
               INITIAL='ACTIONS:'
         DFHMDF POS=(19,30),LENGTH=10,ATTRB=(ASKIP,NORM),              X
               INITIAL='Q - BACK'
REGACT   DFHMDF POS=(18,42),LENGTH=1,ATTRB=(UNPROT,NORM)
         DFHMSD TYPE=FINAL
         END
/*
