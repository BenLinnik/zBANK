      *                                                                
      * ZBANK WITH ACCESS TO THE VSAM FILE
      *                                                                
       PROGRAM-ID. ZBANK.                                              
       DATA DIVISION.                                                  
       WORKING-STORAGE SECTION.                                        
       COPY ZBNKSET.                                                   
       77 WS-REC-LEN PIC S9(4) COMP.                                   
       77 WS-FILE-NAME PIC X(8) VALUE 'VSAMZBNK'.                      
       77 WS-RESP-CODE PIC 9(8).                                       
       01 WS-FILE-REC.                                                 
         05 WS-ACCNO PIC 9(10).                                        
         05 WS-PIN PIC 9(10).                                          
         05 WS-BALANCE PIC 9(10).                                      
       01  ACCNO PIC 9(10).                                            
       01  PIN PIC 9(10).                                              
       01  EXIT-CONDITION PIC 9 VALUE 0.                               
       01  SCREEN-STATE PIC 9 VALUE 0.                                 
       01  ACTION PIC X.                                               
       01  AMOUNT PIC 9(10).                                           
       01  BALANCE PIC 9(10).                                          
       01  INFO PIC X(50) VALUE "PLEASE LOG IN!".                      
       PROCEDURE DIVISION.                                             
           PERFORM WITH TEST BEFORE UNTIL EXIT-CONDITION = 1           
             IF SCREEN-STATE = 0                                       
               MOVE LOW-VALUES TO ZLOGINO                              
               MOVE INFO TO LOGINFOO                                   
               EXEC CICS SEND MAP('ZLOGIN') MAPSET('ZBNKSET')          
                 ERASE                                                 
               END-EXEC                                                
               EXEC CICS RECEIVE MAP('ZLOGIN') MAPSET('ZBNKSET')       
                 INTO(ZLOGINI)                                         
               END-EXEC                                                
               MOVE LOGACCI TO ACCNO                                   
               MOVE LOGPINI TO PIN                                     
               MOVE 30 TO WS-REC-LEN                                   
               MOVE LOGACCI TO WS-ACCNO                                
               EXEC CICS UNLOCK DATASET(WS-FILE-NAME)                   
               END-EXEC                                                 
               EXEC CICS READ DATASET(WS-FILE-NAME)                     
                         INTO (WS-FILE-REC)                             
                         RIDFLD(WS-ACCNO)                               
                         LENGTH(WS-REC-LEN)                             
                         UPDATE                                         
                         RESP(WS-RESP-CODE)                             
               END-EXEC                                                 
               IF  WS-RESP-CODE NOT = ZEROS                             
                 MOVE WS-RESP-CODE TO INFO                              
               ELSE                                                     
                 IF PIN = WS-PIN                                        
                   MOVE 1 TO SCREEN-STATE                               
                   MOVE "WELCOME!" TO INFO                              
                   MOVE WS-BALANCE TO BALANCE                           
                 ELSE                                                   
                   MOVE "WRONG PIN OR ACCOUNT!" TO INFO                 
                 END-IF                                                 
               END-IF                                                   
               MOVE LOGACTI TO ACTION                                   
               IF ACTION = "Q"                                          
                 EXEC CICS UNLOCK DATASET(WS-FILE-NAME)                 
                 END-EXEC                                               
                 MOVE 1 TO EXIT-CONDITION                               
               END-IF                                                   
               IF ACTION = "R"                                          
                 MOVE 2 TO SCREEN-STATE                                 
                 MOVE "PLEASE REGISTER!" TO INFO                        
               END-IF                                                   
               EXEC CICS SEND MAP('ZLOGIN') MAPSET('ZBNKSET') DATAONLY  
                 FROM(ZLOGINO)                                          
               END-EXEC                                                 
             END-IF                                                     
             IF SCREEN-STATE = 1                                        
               MOVE LOW-VALUES TO ZHOMEO                                
               MOVE BALANCE TO BALANCEO                                 
               MOVE INFO TO HOMINFOO                                   
               EXEC CICS SEND MAP('ZHOME') MAPSET('ZBNKSET')           
                 ERASE                                                 
               END-EXEC                                                
               EXEC CICS RECEIVE MAP('ZHOME') MAPSET('ZBNKSET')        
                 INTO(ZHOMEI)                                          
               END-EXEC                                                
               MOVE HOMACTI TO ACTION                                  
               MOVE AMOUNTI TO AMOUNT                                  
               IF ACTION = "Q"                                         
                 MOVE 0 TO SCREEN-STATE                                
                 MOVE "PLEASE LOG IN!" TO INFO                         
               END-IF                                                  
               IF ACTION = "D"                                         
                 ADD AMOUNT TO WS-BALANCE                              
                 EXEC CICS REWRITE DATASET(WS-FILE-NAME)               
                   FROM (WS-FILE-REC)                                  
                   LENGTH(WS-REC-LEN)                                  
                   RESP(WS-RESP-CODE)                                  
                 END-EXEC                                              
                 MOVE WS-RESP-CODE TO INFO                             
                 IF  WS-RESP-CODE = ZEROS                              
                   MOVE "MONEY SAFELY DEPOSITED!" TO INFO              
                   ADD AMOUNT TO BALANCE                               
                 END-IF                                                
               END-IF                                                  
               IF ACTION = "W"                                         
                 SUBTRACT AMOUNT FROM WS-BALANCE                       
                 EXEC CICS REWRITE DATASET(WS-FILE-NAME)               
                   FROM (WS-FILE-REC)                                  
                   LENGTH(WS-REC-LEN)                                  
                   RESP(WS-RESP-CODE)                                  
                 END-EXEC                                              
                 MOVE WS-RESP-CODE TO INFO                             
                   MOVE "MONEY SAFELY WITHDRAWN!" TO INFO              
                   SUBTRACT AMOUNT FROM BALANCE                        
               END-IF                                                  
               IF ACTION = "T"                                          
                 MOVE "TRANSFER TO BE IMPLEMENTED" TO INFO              
               END-IF                                                   
               EXEC CICS SEND MAP('ZHOME') MAPSET('ZBNKSET') DATAONLY   
                 FROM(ZHOMEO)                                           
               END-EXEC                                                 
             END-IF                                                     
             IF SCREEN-STATE = 2                                        
               MOVE LOW-VALUES TO ZRGSTRO                               
               MOVE INFO TO REGINFOO                                    
               EXEC CICS SEND MAP('ZRGSTR') MAPSET('ZBNKSET')           
                 ERASE                                                  
               END-EXEC                                                 
               EXEC CICS RECEIVE MAP('ZRGSTR') MAPSET('ZBNKSET')        
                 INTO(ZRGSTRI)                                          
               END-EXEC                                                 
               MOVE REGACTI TO ACTION                                   
               IF ACTION = "Q"                                          
                 MOVE 0 TO SCREEN-STATE                                 
                 MOVE "PLEASE LOG IN!" TO INFO                          
               END-IF                                                   
               EXEC CICS SEND MAP('ZRGSTR') MAPSET('ZBNKSET') DATAONLY  
                 FROM(ZRGSTRO)                                          
               END-EXEC                                                 
             END-IF                                                     
           END-PERFORM.                                                 
           EXEC CICS SEND MAP('ZLOGIN') MAPSET('ZBNKSET') DATAONLY      
             ERASE                                                      
           END-EXEC                                                     
           EXEC CICS RETURN END-EXEC.                                   