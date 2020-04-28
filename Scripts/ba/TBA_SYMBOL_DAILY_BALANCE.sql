DROP TABLE TBA_SYMBOL_DAILY_BALANCE;

CREATE TABLE TBA_SYMBOL_DAILY_BALANCE(
    PROC_DATE       VARCHAR2(8)    NOT NULL,
    SYMBOL          VARCHAR2(12)    NOT NULL,
    CUST_PROP_TP          VARCHAR2(1)    NOT NULL,
    PDT_SETL_BAL_QTY          NUMBER    DEFAULT '0'    NOT NULL,
    PDT_MRTG_BAL_QTY          NUMBER    DEFAULT '0'    NOT NULL,
    PDT_BUY_QTY          NUMBER    DEFAULT '0'    NOT NULL,
    CDT_BUY_QTY          NUMBER    DEFAULT '0'    NOT NULL,
    PDT_SEL_QTY          NUMBER    DEFAULT '0'    NOT NULL,
    CDT_SEL_QTY          NUMBER    DEFAULT '0'    NOT NULL,
    CDT_MRTG_SET_QTY          NUMBER    DEFAULT '0'    NOT NULL,
    CDT_MRTG_CLR_QTY          NUMBER    DEFAULT '0'    NOT NULL,
    CDT_DEPO_QTY          NUMBER    DEFAULT '0'    NOT NULL,
    CDT_WIDR_QTY          NUMBER    DEFAULT '0'    NOT NULL,
    CDT_OTH_SECF_TRNS_DEPO_QTY          NUMBER    DEFAULT '0'    NOT NULL,
    CDT_OTH_SECF_TRNS_WIDR_QTY          NUMBER    DEFAULT '0'    NOT NULL,
    CDT_BLCK_QTY          NUMBER    DEFAULT '0'    NOT NULL,
    CDT_BLCK_CLR_QTY          NUMBER    DEFAULT '0'    NOT NULL,
    CDT_HOLD_QTY          NUMBER    DEFAULT '0'    NOT NULL,
    CDT_HOLD_CLR_QTY          NUMBER    DEFAULT '0'    NOT NULL,
    WRKR_ID          VARCHAR2(20),
    WRK_TMP          NUMBER,
PRIMARY KEY(PROC_DATE,SYMBOL,CUST_PROP_TP)
);


SELECT A.PROC_DATE                 	AS "procDate"				
     , A.SYMBOL                     AS "symbol"				
     , B.TCKR_CODE                 	AS "tckrCode"
     , A.CUST_PROP_TP               AS "custPropTp"			
     , A.PDT_SETL_BAL_QTY           AS "pdtSetlBalQty"		
     , A.PDT_MRTG_BAL_QTY           AS "pdtMrtgBalQty"		
     , A.PDT_BUY_QTY                AS "pdtBuyQty"			
     , A.CDT_BUY_QTY                AS "cdtBuyQty"			
     , A.PDT_SEL_QTY                AS "pdtSelQty"			
     , A.CDT_SEL_QTY                AS "cdtSelQty"			
     , A.CDT_MRTG_SET_QTY           AS "cdtMrtgSetQty"		
     , A.CDT_MRTG_CLR_QTY           AS "cdtMrtgClrQty"		
     , A.CDT_DEPO_QTY               AS "cdtDepoQty"			
     , A.CDT_WIDR_QTY               AS "cdtWidrQty"			
     , A.CDT_OTH_SECF_TRNS_DEPO_QTY AS "cdtOthSecfTrnsDepoQty"
     , A.CDT_OTH_SECF_TRNS_WIDR_QTY AS "cdtOthSecfTrnsWidrQty"
     , A.CDT_BLCK_QTY               AS "cdtBlckQty"			
     , A.CDT_BLCK_CLR_QTY           AS "cdtBlckClrQty"		
     , A.CDT_HOLD_QTY               AS "cdtHoldQty"			
     , A.CDT_HOLD_CLR_QTY           AS "cdtHoldClrQty"
     , A.CDT_HOLD_CLR_QTY           AS "cdtHoldClrQty"
     , A.CDT_HOLD_CLR_QTY           AS "cdtHoldClrQty"
     , B.SYMBOL_ABBR_NM             AS "symbolAbbrNm"		
  FROM TBA_SYMBOL_DAILY_BALANCE A
  LEFT OUTER JOIN TBA_SYMBOL_INFO B
    ON A.SYMBOL 	= B.SYMBOL
 WHERE (
 	   A.PROC_DATE			BETWEEN '20200108' AND '20200109'
   AND A.CUST_PROP_TP		LIKE CONCAT(CONCAT('%', ''), '%')
   AND B.TCKR_CODE 			LIKE CONCAT(CONCAT('%', ''), '%')
   AND B.EXCH_ID			LIKE CONCAT(CONCAT('%', ''), '%')
   AND B.MKT_ID				LIKE CONCAT(CONCAT('%', ''), '%')
   AND B.BORD_ID			LIKE CONCAT(CONCAT('%', ''), '%') )
   AND CONCAT(A.PROC_DATE, B.TCKR_CODE) >= NVL(NULL, ' ')
 ORDER BY A.PROC_DATE, B.TCKR_CODE;
 


