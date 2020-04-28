DROP TABLE TBA_SYMBOL_DAILY_CLOSE_PRICE;

CREATE TABLE TBA_SYMBOL_DAILY_CLOSE_PRICE(
    TRD_DATE          VARCHAR2(8)    NOT NULL,
    MKT_ID          VARCHAR2(3)    NOT NULL,
    BORD_ID          VARCHAR2(2)    NOT NULL,
    SYMBOL          VARCHAR2(12)    NOT NULL,
    CLSPRC          NUMBER    DEFAULT '0'    NOT NULL,
    CLSPRC_YLD          NUMBER    DEFAULT '0'    NOT NULL,
    CLSPRC_CLSS_TP          VARCHAR2(1),
    WRKR_ID          VARCHAR2(20),
    WRK_TMP          NUMBER,
PRIMARY KEY(TRD_DATE,MKT_ID,BORD_ID,SYMBOL)
);

SELECT A.TRD_DATE	                AS "trdDate"		
     , A.MKT_ID                     AS "mktId"		
     , A.BORD_ID                    AS "bordId"		
     , A.CLSPRC                     AS "clsprc"		
     , A.CLSPRC_YLD                 AS "clsprcYld"		
     , A.CLSPRC_CLSS_TP             AS "clsprcClssTp"	
     , A.WRKR_ID                    AS "wrkrId"		
     , A.WRK_TMP                    AS "wrkTmp"		
     , B.TCKR_CODE                 	AS "tckrCode"		
     , B.SYMBOL_ABBR_NM             AS "symbolAbbrNm"		
	 , B.EXCH_ID                    AS "exchId"		
	 , B.CURR_CODE                  AS "currCode"
  FROM TBA_SYMBOL_DAILY_CLOSE_PRICE A
  LEFT OUTER JOIN TBA_SYMBOL_INFO B
    ON A.SYMBOL 	= B.SYMBOL
 WHERE (
 	   A.TRD_DATE			BETWEEN '20190110' AND '20200110'
   AND A.SYMBOL  			LIKE CONCAT(CONCAT('%', ''), '%')
   AND A.MKT_ID				LIKE CONCAT(CONCAT('%', ''), '%')
   AND A.BORD_ID			LIKE CONCAT(CONCAT('%', ''), '%') )
ORDER BY A.TRD_DATE DESC, A.SYMBOL ; 


SELECT CONCAT(A.TRD_DATE, A.SYMBOL)
  FROM TBA_SYMBOL_DAILY_CLOSE_PRICE A
  LEFT OUTER JOIN TBA_SYMBOL_INFO B
    ON A.SYMBOL 	= B.SYMBOL
 WHERE 1=1
ORDER BY A.TRD_DATE DESC, A.SYMBOL ; 


SELECT NVL(SUBSTR('20200102VT7220357A01', 1, 8), '99999999')
     , NVL(SUBSTR('20200102VT7220357A01', 9), ' ')
  FROM DUAL;     