PROJECT TITTLE:
# AES-Core-engine-

INFO:
AES Encrypt core: >DATA -128 bit,KEY-128 bit
                  >Single pipelined approach 
                  >ECB mode
                  
FILE INFO:
AES MAIN: This module is the AES TOP mode in which other module are instantion ;
AES expand key: 128 bit key genreation for each round total 11 key are genreated ;
ROUND: Each round perform a set of operation already def in AES FIPS 197 standard: The submodule used in rounds are SUBBYTE,SHIFTROWS,MIXCOLUM;
LAST ROUND: instantation two more module inside it SUBBYTE ,SHIFTROWS (NO Mix column);
SUBBYTE: Module inst SBOX 
SHIFTROWS: Shifting as per define in the AES FIPS 197 standard 
Mixcolumn: used in round only module ,Inisde used module multipy by 2 multiply by 3 to achieve the neccesary shift operation and used in mul 32 module
SBOX: storing the predeinfed value for used in SUBBYTE 

Happy learning


