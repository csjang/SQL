DROP TABLE TBA_SYMBOL_NOTI_RECV_DTL;

CREATE TABLE TBA_SYMBOL_NOTI_RECV_DTL(
    RECV_DATE          VARCHAR2(8),
    RECV_SEQ          NUMBER    NOT NULL,
    MKT_ID          VARCHAR2(3)    NOT NULL,
    BORD_ID          VARCHAR2(2),
    SYMBOL          VARCHAR2(12),
    RFPRC          NUMBER    DEFAULT '0'    NOT NULL,
    HLMPRC          NUMBER    DEFAULT '0'    NOT NULL,
    LLMPRC          NUMBER    DEFAULT '0'    NOT NULL,
    EVPRC          NUMBER    DEFAULT '0'    NOT NULL,
    HPRC          NUMBER    DEFAULT '0'    NOT NULL,
    LPRC          NUMBER    DEFAULT '0'    NOT NULL,
    LIST_STK_QTY          NUMBER    DEFAULT '0'    NOT NULL,
    EXRGHT_CLSS_TP          VARCHAR2(2),
    WRKR_ID          VARCHAR2(20),
    WRK_TMP          NUMBER,
PRIMARY KEY(RECV_SEQ,MKT_ID)
);


SELECT A.RECV_DATE       			AS "recvDate"	
     , A.RECV_SEQ                   AS "recvSeq"		
     , A.MKT_ID                     AS "mktId"		
     , A.BORD_ID                    AS "bordId"		
     , A.RFPRC                      AS "rfprc"		
     , A.HLMPRC                     AS "hlmprc"		
     , A.LLMPRC                     AS "llmprc"		
     , A.EVPRC                      AS "evprc"		
     , A.HPRC                       AS "hprc"			
     , A.LPRC                       AS "lprc"			
     , A.LIST_STK_QTY               AS "listStkQty"	
     , A.EXRGHT_CLSS_TP             AS "exrghtClssTp"	
     , A.WRKR_ID                    AS "wrkrId"		
     , A.WRK_TMP                    AS "wrkTmp"		
     , B.TCKR_CODE                 	AS "tckrCode"		
     , B.ABBR_NM                  	AS "abbrNm"		
	 , B.EXCH_ID                    AS "exchId"		
	 , B.CURR_CODE                  AS "currCode"		
  FROM TBA_SYMBOL_NOTI_RECV_DTL A
  LEFT OUTER JOIN TBA_SYMBOL_INFO B
    ON A.SYMBOL 	= B.SYMBOL
 WHERE (
 	   A.RECV_DATE			BETWEEN '20200101' AND '20200103'
   AND B.TCKR_CODE 			LIKE CONCAT(CONCAT('%', 'SMS'), '%')
   AND A.MKT_ID				LIKE CONCAT(CONCAT('%', ''), '%')
   AND A.BORD_ID			LIKE CONCAT(CONCAT('%', ''), '%') )
ORDER BY A.RECV_DATE, A.RECV_SEQ   












