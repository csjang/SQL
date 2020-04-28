SELECT *
  FROM TBA_OTSEC_DEPO_DTL;
  
 
SELECT A.BASDT						AS "basdt"
     , A.SYMBOL                     AS "symbol"
     , S.SYMBOL_NM     				AS "symbolNm"
     , A.DIVD_KND                   AS "divdKnd"
     , A.CASH_DIVD_TP               AS "cashDivdTp"
     , A.EXRGHT_DATE                AS "exrghtDate"
     , A.RGHT_CLOS_TP               AS "rghtClosTp"
  FROM TBB_DIVIDEND_INFO A
  LEFT OUTER JOIN TBA_SYMBOL_INFO S
    ON A.SYMBOL 	= S.SYMBOL
 WHERE (
 	   A.BASDT				BETWEEN '20200228' AND '20200228'
   AND S.SYMBOL				LIKE CONCAT(CONCAT('%', ''), '%') )
 ORDER BY A.BASDT, A.SYMBOL;   
  

SELECT A.BASDT						AS "basdt"
     , A.SYMBOL                     AS "symbol"
     , S.SYMBOL_NM     				AS "symbolNm"
     , A.SUB_RGHT_TP                AS "subRghtTp"
     , A.GNRLMT_DATE				AS "gnrlmtDate"
     , A.EXRGHT_DATE                AS "exrghtDate"
     , A.RGHT_CLOS_TP               AS "rghtClosTp"
  FROM TBB_CAPITAL_CHNG_INFO A
  LEFT OUTER JOIN TBA_SYMBOL_INFO S
    ON A.SYMBOL 	= S.SYMBOL
 WHERE (
 	   A.BASDT				BETWEEN '20200228' AND '20200228'
   AND S.SYMBOL				LIKE CONCAT(CONCAT('%', ''), '%') )
 ORDER BY A.BASDT, A.SYMBOL;
 

SELECT A.BASDT						AS "basdt"
     , A.SYMBOL                     AS "symbol"
     , S.SYMBOL_NM     				AS "symbolNm"
     , A.SUB_RGHT_TP                AS "subRghtTp"
     , A.GNRLMT_DATE				AS "gnrlmtDate"
     , A.PROC_DATE                	AS "procDate"
     , A.RGHT_CLOS_TP               AS "rghtClosTp"
  FROM TBB_SPLIT_INFO A
  LEFT OUTER JOIN TBA_SYMBOL_INFO S
    ON A.SYMBOL 	= S.SYMBOL
 WHERE (
 	   A.BASDT				BETWEEN '20200228' AND '20200228'
   AND A.SYMBOL				LIKE CONCAT(CONCAT('%', ''), '%') )
 ORDER BY A.BASDT, A.SYMBOL;


SELECT A.BASDT						AS "basdt"
     , A.SYMBOL                     AS "symbol"
     , A.BFCHNG_SYMBOL				AS "bfchngSymbol"
     , S.SYMBOL_NM     				AS "bfchngSymbolNm"
     , A.POSS_QTY             		AS "possQty"
     , A.ALOC_QTY					AS "alocQty"
  FROM TBB_MERGE_INFO_DETL A
  LEFT OUTER JOIN TBA_SYMBOL_INFO S
    ON A.BFCHNG_SYMBOL 	= S.SYMBOL
 WHERE 
 	   A.BASDT				= '20200302'
   AND A.SYMBOL				LIKE CONCAT(CONCAT('%', '%'), '%') 
 ORDER BY A.BASDT, A.SYMBOL;  
 

SELECT A.BASDT						AS "basdt"							
     , A.SYMBOL                     AS "symbol"
     , A.BFCHNG_SYMBOL              AS "bfchngSymbol"      
     , A.POSS_QTY                   AS "possQty"           
     , A.ALOC_QTY                   AS "alocQty"           
     , A.SE_PROC_TMP                AS "seProcTmp"         
     , A.SE_TRGT_CNT                AS "seTrgtCnt"         
     , A.SE_PROC_CNT                AS "seProcCnt"         
     , A.FRSTK_PROC_TMP             AS "frstkProcTmp"      
     , A.FRSTK_TRGT_CNT             AS "frstkTrgtCnt"      
     , A.FRSTK_PROC_CNT             AS "frstkProcCnt"      
     , A.WRKR_ID            		AS "wrkrId"       
     , A.WRK_TMP            		AS "wrkTmp"       
  FROM TBB_MERGE_INFO_DETL A
 WHERE A.BASDT 			= '20200302'
   AND A.SYMBOL			= 'ACB'
   AND A.BFCHNG_SYMBOL	= 'CCCCCC0001';
   
  
SELECT '1'							AS "update"
	 , A.BASDT						AS "basdt"
     , A.SYMBOL                     AS "symbol"
     , A.BFCHNG_SYMBOL				AS "bfchngSymbol"
     , S.SYMBOL_NM     				AS "bfchngSymbolNm"
     , A.POSS_QTY             		AS "possQty"
     , A.ALOC_QTY					AS "alocQty"
  FROM TBB_MERGE_INFO_DETL A
  LEFT OUTER JOIN TBA_SYMBOL_INFO S
    ON A.BFCHNG_SYMBOL 	= S.SYMBOL;
    
   
DELETE FROM TBB_SPIN_OFF_INFO_MSTR
 WHERE BASDT 			= '20200302'
   AND SYMBOL			= 'ACB';
		
DELETE FROM TBB_SPIN_OFF_INFO_DETL
 WHERE BASDT 			= '20200302'
   AND SYMBOL			= 'ACB';
  
  
SELECT 'U'							AS "update"
	 , A.BASDT						AS "basdt"
     , A.SYMBOL                     AS "symbol"
     , A.LIST_SYMBOL				AS "listSymbol"
     , S.SYMBOL_NM     				AS "listSymbolNm"
     , A.DIV_RT             		AS "divRt"
     , A.FVAL						AS "fval"
     , A.LIST_STK_QTY				AS "listStkQty"
  FROM TBB_SPIN_OFF_INFO_DETL A
  LEFT OUTER JOIN TBA_SYMBOL_INFO S
    ON A.LIST_SYMBOL 	= S.SYMBOL
 WHERE 
 	   A.BASDT				= '20200302'
   AND A.SYMBOL				LIKE CONCAT(CONCAT('%', '%'), '%') 
 ORDER BY A.BASDT, A.SYMBOL;


SELECT A.BASDT						AS "basdt"
     , A.SYMBOL                     AS "symbol"
     , S.SYMBOL_NM     				AS "symbolNm"
     , A.TRAN_AVAL_DATE             AS "tranAvalDate"
     , A.GNRLMT_DATE				AS "gnrlmtDate"
     , A.PROC_DATE                	AS "procDate"
     , A.RGHT_CLOS_TP               AS "rghtClosTp"
  FROM TBB_SPIN_OFF_INFO_MSTR A
  LEFT OUTER JOIN TBA_SYMBOL_INFO S
    ON A.SYMBOL 	= S.SYMBOL
 WHERE 
 	   A.BASDT				= '20200302'
   AND A.SYMBOL				LIKE CONCAT(CONCAT('%', '%'), '%') 
 ORDER BY A.BASDT, A.SYMBOL;


SELECT A.RGHT_DATE					AS "rghtDate"
     , A.SYMBOL                     AS "symbol"
     , S.SYMBOL_NM     				AS "symbolNm"
     , A.RGHT_TP                	AS "RghtTp"
     , A.SUB_RGHT_TP                AS "subRghtTp"
     , A.RGHT_DATE_TP				AS "rghtDateTp"
     , A.RGHT_CLOS_TP               AS "rghtClosTp"
  FROM TBB_SCHEDULE_VIEW A
  LEFT OUTER JOIN TBA_SYMBOL_INFO S
    ON A.SYMBOL 	= S.SYMBOL
 WHERE (
 	   A.RGHT_DATE			BETWEEN '20200301' AND '20200305'
   AND A.SYMBOL				LIKE CONCAT(CONCAT('%', '%'), '%') )
   AND CONCAT(A.RGHT_DATE, A.SYMBOL) >= NVL(NULL, ' ')
 ORDER BY A.RGHT_DATE, A.SYMBOL;
 

SELECT COUNT(1)
  FROM TBB_SCHEDULE_VIEW A
  LEFT OUTER JOIN TBA_SYMBOL_INFO S
    ON A.SYMBOL 	= S.SYMBOL
 WHERE (
 	   A.RGHT_DATE			BETWEEN '20200301' AND '20200305'
   AND A.SYMBOL				LIKE CONCAT(CONCAT('%', ''), '%')
   AND A.RGHT_TP			LIKE CONCAT(CONCAT('%', ''), '%')
   AND A.RGHT_DATE_TP		LIKE CONCAT(CONCAT('%', ''), '%')
   AND A.RGHT_CLOS_TP		LIKE CONCAT(CONCAT('%', ''), '%') );

  
SELECT BASDT 		AS "BASDT"
     , SYMBOL		AS "SYMBOL"
     , RGHT_TP		AS "RGHT_TP"
     , CASE WHEN DIVD_KND = '1' THEN '91'
            WHEN DIVD_KND = '2' THEN '92'
            ELSE '93' END AS "SUB_RGHT_TP"
  FROM TBB_DIVIDEND_INFO;  
  
 
SELECT A.BASDT						AS "basdt"
     , A.SYMBOL                     AS "symbol"
     , S.SYMBOL_NM     				AS "symbolNm"
     , A.RGHT_TP                	AS "RghtTp"
     , A.SUB_RGHT_TP                AS "subRghtTp"
  FROM TBB_FIXDATE_VIEW A
  LEFT OUTER JOIN TBA_SYMBOL_INFO S
    ON A.SYMBOL 	= S.SYMBOL
 WHERE 
 	   A.BASDT				BETWEEN '20200305' AND '20200305'
   AND A.SYMBOL				LIKE CONCAT(CONCAT('%', ''), '%')
   AND A.RGHT_TP			LIKE CONCAT(CONCAT('%', ''), '%')
   AND A.RGHT_CLOS_TP 		= '0';
   
 
 SELECT COUNT(1)
  FROM TBB_FIXDATE_VIEW A
  LEFT OUTER JOIN TBA_SYMBOL_INFO S
    ON A.SYMBOL 	= S.SYMBOL
 WHERE (
 	   A.BASDT				BETWEEN '20200101' AND '20200305'
   AND A.SYMBOL				LIKE CONCAT(CONCAT('%', ''), '%') );
   

-- °èÁÂÀÜ°í
SELECT A.BASDT            				AS "basdt"     		
     , A.SYMBOL        					AS "symbol"
     , AC.VSD_ACNT_NO					AS "vsdAcntNo"
     , A.SUM_QTY               	        AS "sumQty"
  FROM (
  		SELECT A.PROC_DATE 			AS "BASDT"
  		     , A.ACNT_NO            AS "ACNT_NO"
             , A.SYMBOL				AS "SYMBOL"
             , SUM(A.SETL_BAL_QTY)  AS "SUM_QTY"
          FROM TIA_STOCK_BALANCE A
         WHERE A.PROC_DATE			= '20200305'
           AND A.SYMBOL				= 'HSG'
         GROUP BY A.PROC_DATE, A.ACNT_NO, A.SYMBOL) A
  LEFT OUTER JOIN TAB_ACCOUNT AC
    ON AC.ACNT_NO 	= A.ACNT_NO;
   
-- ºÎ°èÁÂÀÜ°í
SELECT A.ACNT_NO       					AS "acntNo"
     , A.SUB_ACNT_NO       				AS "subAcntNo"
     , C.CUST_NM						AS "custNm"
     , C.VSD_ACNT_NO					AS "vsdAcntNo"
     , A.SYMBOL        					AS "symbol"
     , S.SYMBOL_NM						AS "symbolNm"
     , A.SETL_BAL_QTY          	        AS "setlBalQty"
  FROM TIA_STOCK_BALANCE A  
  LEFT OUTER JOIN (SELECT B.ACNT_NO, B.VSD_ACNT_NO, A.CUST_NM FROM TAA_CUSTOMER A, TAB_ACCOUNT B WHERE A.CUST_NO = B.CUST_NO) C
    ON A.ACNT_NO 	= C.ACNT_NO
  LEFT OUTER JOIN TBA_SYMBOL_INFO S
    ON A.SYMBOL 	= S.SYMBOL
 WHERE (
       A.PROC_DATE			= '20200305'
   AND A.SYMBOL				= 'HSG'
   AND A.ACNT_NO			LIKE CONCAT(CONCAT('%', ''), '%') );
  

SELECT COUNT(1)
  FROM TIA_STOCK_BALANCE A  
  LEFT OUTER JOIN (SELECT B.ACNT_NO, B.VSD_ACNT_NO, A.CUST_NM FROM TAA_CUSTOMER A, TAB_ACCOUNT B WHERE A.CUST_NO = B.CUST_NO) C
    ON A.ACNT_NO 	= C.ACNT_NO
  LEFT OUTER JOIN TBA_SYMBOL_INFO S
    ON A.SYMBOL 	= S.SYMBOL
 WHERE (
       A.PROC_DATE			= '20200305'
   AND A.SYMBOL				= 'HSG'
   AND A.ACNT_NO		LIKE CONCAT(CONCAT('%', ''), '%') );
  
SELECT SUM(A.SETL_BAL_QTY)     	        AS "setlTotQty"     
  FROM TIA_STOCK_BALANCE A  
  LEFT OUTER JOIN (SELECT B.ACNT_NO, B.VSD_ACNT_NO, A.CUST_NM FROM TAA_CUSTOMER A, TAB_ACCOUNT B WHERE A.CUST_NO = B.CUST_NO) C
    ON A.ACNT_NO 	= C.ACNT_NO
  LEFT OUTER JOIN TBA_SYMBOL_INFO S
    ON A.SYMBOL 	= S.SYMBOL
 WHERE (
       A.PROC_DATE			= '20200305'
   AND A.SYMBOL				= 'HSG'
   AND A.ACNT_NO		LIKE CONCAT(CONCAT('%', ''), '%') );

     
     
SELECT A.BASDT						AS "basdt"
     , A.SYMBOL                     AS "symbol"
     , S.SYMBOL_NM     				AS "symbolNm"
     , A.RGHT_TP                	AS "RghtTp"
     , A.RGHT_CLOS_TP               AS "rghtClosTp"
  FROM TBB_FIXDATE_VIEW A
  LEFT OUTER JOIN TBA_SYMBOL_INFO S
    ON A.SYMBOL 	= S.SYMBOL
 WHERE (
       A.SYMBOL				LIKE CONCAT(CONCAT('%', 'HSG'), '%')
   AND A.RGHT_CLOS_TP 		= '0' )
   AND CONCAT(A.BASDT, A.SYMBOL) >= NVL(NULL, ' ')
 ORDER BY A.BASDT, A.SYMBOL;
  


SELECT A.ACNT_NO       					AS "acntNo"
     , C.VSD_ACNT_NO					AS "vsdAcntNo"
     , SUM(A.SETL_BAL_QTY)     	        AS "setlTotQty"
  FROM TIA_STOCK_BALANCE A  
  LEFT OUTER JOIN (SELECT B.ACNT_NO, B.VSD_ACNT_NO, A.CUST_NM FROM TAA_CUSTOMER A, TAB_ACCOUNT B WHERE A.CUST_NO = B.CUST_NO) C
    ON A.ACNT_NO 	= C.ACNT_NO
 WHERE A.PROC_DATE			= '20200305'
   AND A.SYMBOL				= 'HSG'
 GROUP BY A.ACNT_NO, C.VSD_ACNT_NO
 ORDER BY A.ACNT_NO;


SELECT A.ACNT_NO       					AS "acntNo"
     , A.SUB_ACNT_NO					AS "subAcntNo"
     , A.SETL_BAL_QTY     	        	AS "setlBalQty"
  FROM TIA_STOCK_BALANCE A  
 WHERE A.PROC_DATE			= '20200305'
   AND A.SYMBOL				= 'HSG'
 ORDER BY A.ACNT_NO, A.SETL_BAL_QTY;


DELETE FROM TBB_STOCK_CHNG_SCHD
 WHERE BASDT 			= '20200305'
   AND AFCHNG_SYMBOL	= 'HSG';

DELETE FROM TBB_VSDACCT_STOCK_CHNG_SCHD
 WHERE BASDT 			= '20200305'
   AND AFCHNG_SYMBOL	= 'HSG';


SELECT A.SYMBOL							AS "symbol"
     , A.BFCHNG_SYMBOL					AS "bfchngSymbol"
     , A.POSS_QTY						AS "possQty"
     , A.ALOC_QTY						AS "alocQty"
  FROM TBB_MERGE_INFO_DETL A
 WHERE A.BASDT			= '20200305'
   AND A.SYMBOL			= 'HSG'
 ORDER BY A.SYMBOL;

SELECT * FROM
(
SELECT A.BASDT							AS "basdt"
     , A.SYMBOL							AS "symbol"
     , A.SYMBOL							AS "listSymbol"
     , A.CNTN_RT						AS "drvRt"
     , A.FVAL							AS "fval"
     , 1								AS "SEQ"
  FROM TBB_SPIN_OFF_INFO_MSTR A
 WHERE A.BASDT			= '20200309'
   AND A.SYMBOL			= 'ACB'
UNION   
SELECT A.BASDT							AS "basdt"
     , A.SYMBOL							AS "symbol"
     , A.LIST_SYMBOL					AS "listSymbol"
     , A.DIV_RT							AS "drvRt"
     , A.FVAL							AS "fval"
     , 2								AS "SEQ"     
  FROM TBB_SPIN_OFF_INFO_DETL A
 WHERE A.BASDT			= '20200309'
   AND A.SYMBOL			= 'ACB'
)
ORDER BY "SEQ";   
   
 

SELECT * FROM
(
SELECT A.BASDT							AS "basdt"
     , A.SYMBOL							AS "symbol"
     , A.SYMBOL							AS "listSymbol"
     , A.CNTN_RT						AS "divRt"
     , A.FVAL							AS "fval"
     , 1								AS "SEQ"
  FROM TBB_SPIN_OFF_INFO_MSTR A
 WHERE A.BASDT			= '20200309'
   AND A.SYMBOL			= 'ACB'
UNION   
SELECT A.BASDT							AS "basdt"
     , A.SYMBOL							AS "symbol"
     , A.LIST_SYMBOL					AS "listSymbol"
     , A.DIV_RT							AS "divRt"
     , A.FVAL							AS "fval"
     , 2								AS "SEQ"     
  FROM TBB_SPIN_OFF_INFO_DETL A
 WHERE A.BASDT			= '20200309'
   AND A.SYMBOL			= 'ACB'
)
ORDER BY "SEQ";
 
 
SELECT A.ACNT_NO       		
     , SUM(A.SETL_BAL_QTY)
  FROM TIA_STOCK_BALANCE A  
 GROUP BY A.ACNT_NO

 SELECT PROC_DATE AS "PROC_DATE", SYMBOL AS "SYMBOL", ACNT_NO AS "ACNT_NO", SUM(SETL_BAL_QTY) AS "SETL_BAL_QTY" FROM TIA_STOCK_BALANCE GROUP BY PROC_DATE, SYMBOL, ACNT_NO;
 
SELECT C.ACNT_NO       	
     , C.CUST_NM
     , A.VSD_ACNT_NO
     , A.SYMBOL
     , D.SETL_BAL_QTY
     , A.DIVD_CSH_AMT
     , A.DIVD_STK_QTY
     , A.FRSTK_QTY
     , A.FRSTK_AMT
     , A.VSD_DIVD_CSH_AMT
     , A.VSD_DIVD_STK_QTY
     , A.VSD_FRSTK_QTY
     , A.VSD_FRSTK_AMT
  FROM TBB_VSDACCT_DIVIDEND_SCHD A
  LEFT OUTER JOIN (SELECT B.ACNT_NO, B.VSD_ACNT_NO, A.CUST_NM FROM TAA_CUSTOMER A, TAB_ACCOUNT B WHERE A.CUST_NO = B.CUST_NO) C
    ON A.VSD_ACNT_NO 	= C.VSD_ACNT_NO
  LEFT JOIN (SELECT PROC_DATE AS "PROC_DATE", SYMBOL AS "SYMBOL", ACNT_NO AS "ACNT_NO", SUM(SETL_BAL_QTY) AS "SETL_BAL_QTY" FROM TIA_STOCK_BALANCE GROUP BY PROC_DATE, SYMBOL, ACNT_NO) D
    ON A.BASDT		= D.PROC_DATE
   AND A.SYMBOL 	= D.SYMBOL
   AND C.ACNT_NO	= D.ACNT_NO 
 WHERE A.BASDT			= '20200305'
   AND A.SYMBOL			= 'HSG'
   AND C.ACNT_NO		LIKE CONCAT(CONCAT('%', ''), '%')
 ORDER BY C.ACNT_NO; 
 
SELECT SUM(D.SETL_BAL_QTY)
     , SUM(A.DIVD_CSH_AMT)
     , SUM(A.DIVD_STK_QTY)
     , SUM(A.FRSTK_QTY)
     , SUM(A.FRSTK_AMT)
     , SUM(A.VSD_DIVD_CSH_AMT)
     , SUM(A.VSD_DIVD_STK_QTY)
     , SUM(A.VSD_FRSTK_QTY)
     , SUM(A.VSD_FRSTK_AMT)
  FROM TBB_VSDACCT_DIVIDEND_SCHD A
  LEFT OUTER JOIN (SELECT B.ACNT_NO, B.VSD_ACNT_NO, A.CUST_NM FROM TAA_CUSTOMER A, TAB_ACCOUNT B WHERE A.CUST_NO = B.CUST_NO) C
    ON A.VSD_ACNT_NO 	= C.VSD_ACNT_NO
  LEFT JOIN (SELECT PROC_DATE AS "PROC_DATE", SYMBOL AS "SYMBOL", ACNT_NO AS "ACNT_NO", SUM(SETL_BAL_QTY) AS "SETL_BAL_QTY" FROM TIA_STOCK_BALANCE GROUP BY PROC_DATE, SYMBOL, ACNT_NO) D
    ON A.BASDT		= D.PROC_DATE
   AND A.SYMBOL 	= D.SYMBOL
   AND C.ACNT_NO	= D.ACNT_NO 
 WHERE A.BASDT			= '20200305'
   AND A.SYMBOL			= 'HSG'
   AND C.ACNT_NO		LIKE CONCAT(CONCAT('%', ''), '%');

SELECT A.ACNT_NO                AS "acntNo"
     , A.SUB_ACNT_NO            AS "subAcntNo"
     , C.CUST_NM				AS "custNm"
     , C.VSD_ACNT_NO			AS "vsdAcntNo"
     , A.SYMBOL					AS "symbol"
     , D.SETL_BAL_QTY			AS "setlBalQty"
     , A.DIVD_CSH_AMT           AS "divdCshAmt"
     , A.DIVD_STK_QTY           AS "divdStkQty"
     , A.FRSTK_QTY              AS "frstkQty"
     , A.FRSTK_AMT              AS "frstkAmt"
     , A.CSH_DEPO_TRAN_DATE     AS "cshDepoTranDate"
     , A.CSH_DEPO_TRAN_NO       AS "cshDepoTranNo"
     , A.SE_DEPO_TRAN_DATE      AS "seDepoTranDate"
     , A.SE_DEPO_TRAN_NO        AS "seDepoTranNo"
     , A.FRSTK_ATM_TRAN_DATE    AS "frstkAtmTranDate"
     , A.FRSTK_ATM_TRAN_NO      AS "frstkAtmTranNo"
  FROM TBB_DIVIDEND_SCHD A
  LEFT OUTER JOIN (SELECT B.ACNT_NO, B.VSD_ACNT_NO, A.CUST_NM FROM TAA_CUSTOMER A, TAB_ACCOUNT B WHERE A.CUST_NO = B.CUST_NO) C
    ON A.ACNT_NO 	= C.ACNT_NO
  LEFT OUTER JOIN TIA_STOCK_BALANCE D 
    ON A.BASDT		= D.PROC_DATE
   AND A.ACNT_NO	= D.ACNT_NO 
   AND A.SUB_ACNT_NO= D.SUB_ACNT_NO 
   AND A.SYMBOL 	= D.SYMBOL
 WHERE (
       A.BASDT			= '20200305'
   AND A.SYMBOL			= 'HSG'
   AND A.ACNT_NO		LIKE CONCAT(CONCAT('%', ''), '%') )
 ORDER BY A.ACNT_NO, A.SUB_ACNT_NO;
 
SELECT SUM(D.SETL_BAL_QTY)			AS "sum1"
     , SUM(A.DIVD_CSH_AMT)          AS "sum2"
     , SUM(A.DIVD_STK_QTY)          AS "sum3"
     , SUM(A.FRSTK_QTY)             AS "sum4"
     , SUM(A.FRSTK_AMT)             AS "sum5"
  FROM TBB_DIVIDEND_SCHD A
  LEFT OUTER JOIN (SELECT B.ACNT_NO, B.VSD_ACNT_NO, A.CUST_NM FROM TAA_CUSTOMER A, TAB_ACCOUNT B WHERE A.CUST_NO = B.CUST_NO) C
    ON A.ACNT_NO 	= C.ACNT_NO
  LEFT OUTER JOIN TIA_STOCK_BALANCE D 
    ON A.BASDT		= D.PROC_DATE
   AND A.ACNT_NO	= D.ACNT_NO 
   AND A.SUB_ACNT_NO= D.SUB_ACNT_NO 
   AND A.SYMBOL 	= D.SYMBOL
 WHERE (
       A.BASDT			= '20200305'
   AND A.SYMBOL			= 'HSG');
   
   
SELECT COUNT(1)
  FROM TBB_DIVIDEND_SCHD A
  LEFT OUTER JOIN (SELECT B.ACNT_NO, B.VSD_ACNT_NO, A.CUST_NM FROM TAA_CUSTOMER A, TAB_ACCOUNT B WHERE A.CUST_NO = B.CUST_NO) C
    ON A.ACNT_NO 	= C.ACNT_NO
  LEFT OUTER JOIN TIA_STOCK_BALANCE D 
    ON A.BASDT			= D.PROC_DATE
   AND A.ACNT_NO		= D.ACNT_NO 
   AND A.SUB_ACNT_NO	= D.SUB_ACNT_NO 
   AND A.SYMBOL 		= D.SYMBOL
 WHERE (
       A.BASDT			= '20200305'
   AND A.SYMBOL			= 'HSG'
   AND C.ACNT_NO		LIKE CONCAT(CONCAT('%', ''), '%') );
   
  
  SELECT A.BASDT						AS "basdt"
     , A.SYMBOL                     AS "symbol"
     , S.SYMBOL_NM     				AS "symbolNm"
     , A.RGHT_TP                	AS "RghtTp"
     , A.RGHT_CLOS_TP               AS "rghtClosTp"
  FROM TBB_FIXDATE_VIEW A
  LEFT OUTER JOIN TBA_SYMBOL_INFO S
    ON A.SYMBOL 	= S.SYMBOL
 WHERE (
       A.SYMBOL				LIKE CONCAT(CONCAT('%', ''), '%')
   AND A.RGHT_TP    		LIKE CONCAT(CONCAT('%', ''), '%')
   AND A.RGHT_CLOS_TP 		= '0' )
 ORDER BY A.BASDT, A.SYMBOL;
 

SELECT C.ACNT_NO       			AS "acntNo"
     , C.CUST_NM				AS "custNm"
     , A.VSD_ACNT_NO			AS "vsdAcntNo"
     , A.SYMBOL					AS "symbol"
     , D.SETL_BAL_QTY			AS "setlBalQty"
     , A.DIVD_CSH_AMT			AS "divdCshAmt"
     , A.DIVD_STK_QTY           AS "divdStkQty"
     , A.FRSTK_QTY              AS "frstkQty"
     , A.FRSTK_AMT              AS "frstkAmt"
     , A.VSD_DIVD_CSH_AMT       AS "vsdDivdCshAmt"
     , A.VSD_DIVD_STK_QTY       AS "vsdDivdStkQty"
     , A.VSD_FRSTK_QTY          AS "vsdFrstkQty"
     , A.VSD_FRSTK_AMT          AS "vsdFrstkAmt"
  FROM TBB_VSDACCT_DIVIDEND_SCHD A
  LEFT OUTER JOIN (SELECT B.ACNT_NO, B.VSD_ACNT_NO, A.CUST_NM FROM TAA_CUSTOMER A, TAB_ACCOUNT B WHERE A.CUST_NO = B.CUST_NO) C
    ON A.VSD_ACNT_NO 	= C.VSD_ACNT_NO
  LEFT JOIN (SELECT PROC_DATE 			AS "PROC_DATE"
                  , SYMBOL 				AS "SYMBOL"
                  , ACNT_NO 			AS "ACNT_NO"
                  , SUM(SETL_BAL_QTY) 	AS "SETL_BAL_QTY" 
               FROM TIA_STOCK_BALANCE 
              GROUP BY PROC_DATE, SYMBOL, ACNT_NO) D
    ON A.BASDT		= D.PROC_DATE
   AND A.SYMBOL 	= D.SYMBOL
   AND C.ACNT_NO	= D.ACNT_NO 
 WHERE (
       A.BASDT			= '20200305'
   AND A.SYMBOL			= 'HSG'
   AND C.ACNT_NO		LIKE CONCAT(CONCAT('%', ''), '%') )
   AND CONCAT(A.ACNT_NO) >= NVL(NULL, ' ')
 ORDER BY C.ACNT_NO;


SELECT C.ACNT_NO       			AS "acntNo"
     , C.CUST_NM				AS "custNm"
     , A.VSD_ACNT_NO			AS "vsdAcntNo"
     , A.SYMBOL					AS "symbol"
     , A.AFCHNG_SYMBOL          AS "afchngSymbol"
     , A.BFCHNG_QTY             AS "bfchngQty"
     , A.AFCHNG_QTY             AS "afchngQty"
     , A.FRSTK_QTY              AS "frstkQty"
     , A.FRSTK_AMT              AS "frstkAmt"
     , A.VSD_BFCHNG_QTY         AS "vsdBfchngQty"
     , A.VSD_AFCHNG_QTY         AS "vsdAfchngQty"
     , A.VSD_FRSTK_QTY          AS "vsdFrstkQty"
     , A.VSD_FRSTK_AMT          AS "vsdFrstkAmt"
  FROM TBB_VSDACCT_SPIN_OFF_SCHD A
  LEFT OUTER JOIN (SELECT B.ACNT_NO, B.VSD_ACNT_NO, A.CUST_NM FROM TAA_CUSTOMER A, TAB_ACCOUNT B WHERE A.CUST_NO = B.CUST_NO) C
    ON A.VSD_ACNT_NO 	= C.VSD_ACNT_NO
 WHERE (
       A.BASDT			= '20200309'
   AND A.SYMBOL			= 'ACB'
   AND C.ACNT_NO		LIKE CONCAT(CONCAT('%', ''), '%') )
   AND CONCAT(C.ACNT_NO, A.AFCHNG_SYMBOL) >= NVL(NULL, ' ')
 ORDER BY C.ACNT_NO, A.AFCHNG_SYMBOL;


SELECT A.ACNT_NO                AS "acntNo"
     , A.SUB_ACNT_NO            AS "subAcntNo"
     , C.CUST_NM				AS "custNm"
     , C.VSD_ACNT_NO			AS "vsdAcntNo"
     , A.SYMBOL					AS "symbol"
     , A.AFCHNG_SYMBOL          AS "afchngSymbol"     
     , A.BFCHNG_QTY             AS "bfchngQty"        
     , A.AFCHNG_QTY             AS "afchngQty"        
     , A.FRSTK_QTY              AS "frstkQty"         
     , A.FRSTK_AMT              AS "frstkAmt"         
     , A.TRAN_DATE      		AS "tranDate"   
     , A.TRAN_NO        		AS "tranNo"     
     , A.FRSTK_ATM_TRAN_DATE    AS "frstkAtmTranDate" 
     , A.FRSTK_ATM_TRAN_NO      AS "frstkAtmTranNo"   
  FROM TBB_SPIN_OFF_SCHD A
  LEFT OUTER JOIN (SELECT B.ACNT_NO, B.VSD_ACNT_NO, A.CUST_NM FROM TAA_CUSTOMER A, TAB_ACCOUNT B WHERE A.CUST_NO = B.CUST_NO) C
    ON A.ACNT_NO 	= C.ACNT_NO
 WHERE (
       A.BASDT			= '20200309'
   AND A.SYMBOL			= 'ACB'
   AND C.ACNT_NO		LIKE CONCAT(CONCAT('%', ''), '%') )
 ORDER BY A.ACNT_NO, A.SUB_ACNT_NO, A.AFCHNG_SYMBOL;
 

