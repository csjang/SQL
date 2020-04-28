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
   AND A.RGHT_TP    		LIKE CONCAT(CONCAT('%', '02'), '%')
   AND A.SUB_RGHT_TP    	LIKE CONCAT(CONCAT('%', '03'), '%')
   AND A.RGHT_CLOS_TP 		= '0' )
   AND CONCAT(A.BASDT, A.SYMBOL) >= NVL(NULL, ' ')
 ORDER BY A.BASDT, A.SYMBOL
 
SELECT A.ACNT_NO                	AS "acntNo"
     , A.SUB_ACNT_NO            	AS "subAcntNo"
     , C.CUST_NM					AS "custNm"
     , A.SYMBOL						AS "symbol"
     , A.RGHT_QTY               	AS "rghtQty"
     , A.SCR_QTY                	AS "scrQty"
     , A.RGHT_BUY_QTY               AS "rghtBuyQty"
     , A.RGHT_SEL_QTY               AS "rghtSelQty"
  FROM TBB_CAPITAL_CHNG_SCHD A
  LEFT OUTER JOIN (SELECT B.ACNT_NO, B.VSD_ACNT_NO, A.CUST_NM FROM TAA_CUSTOMER A, TAB_ACCOUNT B WHERE A.CUST_NO = B.CUST_NO) C
    ON A.ACNT_NO 	= C.ACNT_NO
  JOIN TBB_CAPITAL_CHNG_INFO I 
    ON A.BASDT		= I.BASDT
   AND A.SYMBOL 	= I.SYMBOL
   AND I.SUB_RGHT_TP	= '03'		-- Only Paid-In Capital Increase
 WHERE (
       A.BASDT			= '20200305'
   AND A.SYMBOL			= 'HSG'
   AND A.ACNT_NO		LIKE CONCAT(CONCAT('%', ''), '%') )
   AND CONCAT(A.ACNT_NO, A.SUB_ACNT_NO) >= NVL(NULL, ' ')
 ORDER BY A.ACNT_NO, A.SUB_ACNT_NO;
 

SELECT COUNT(1)
  FROM TBB_CAPITAL_CHNG_SCHD A
  LEFT OUTER JOIN (SELECT B.ACNT_NO, B.VSD_ACNT_NO, A.CUST_NM FROM TAA_CUSTOMER A, TAB_ACCOUNT B WHERE A.CUST_NO = B.CUST_NO) C
    ON A.ACNT_NO 	= C.ACNT_NO
  JOIN TBB_CAPITAL_CHNG_INFO I 
    ON A.BASDT		= I.BASDT
   AND A.SYMBOL 	= I.SYMBOL
   AND I.SUB_RGHT_TP	= '03'		-- Only Paid-In Capital Increase
 WHERE (
       A.BASDT			= '20200305'
   AND A.SYMBOL			= 'HSG'
   AND A.ACNT_NO		LIKE CONCAT(CONCAT('%', ''), '%') );

  
SELECT A.BASDT							AS "basdt"
     , A.SYMBOL							AS "symbol"
     , A.LIST_SYMBOL					AS "listSymbol"
     , A.DIV_RT							AS "divRt"
     , A.FVAL							AS "fval"
  FROM TBB_SPIN_OFF_INFO_DETL A
 WHERE A.BASDT			= '20200309'
   AND A.SYMBOL			= 'ACB'
ORDER BY A.SYMBOL;


SELECT A.ACNT_NO       					AS "acntNo"
     , A.SUB_ACNT_NO					AS "subAcntNo"
     , A.SETL_BAL_QTY     	        	AS "setlBalQty"
  FROM TIA_STOCK_BALANCE A  
 WHERE A.PROC_DATE			= '20200309'
   AND A.SYMBOL				= 'ACB'
 ORDER BY A.ACNT_NO, A.SETL_BAL_QTY;


SELECT A.ACNT_NO       					AS "acntNo"
     , C.VSD_ACNT_NO					AS "vsdAcntNo"
     , SUM(A.SETL_BAL_QTY)     	        AS "setlTotQty"
  FROM TIA_STOCK_BALANCE A  
  LEFT OUTER JOIN (SELECT B.ACNT_NO, B.VSD_ACNT_NO, A.CUST_NM FROM TAA_CUSTOMER A, TAB_ACCOUNT B WHERE A.CUST_NO = B.CUST_NO) C
    ON A.ACNT_NO 	= C.ACNT_NO
 WHERE A.PROC_DATE			= '20200309'
   AND A.SYMBOL				= 'ACB'
   AND A.ACNT_NO = '00000031'
 GROUP BY A.ACNT_NO, C.VSD_ACNT_NO
 ORDER BY A.ACNT_NO;
   

SELECT A.BASDT						AS "basdt"
     , A.SYMBOL                     AS "symbol"
     , S.SYMBOL_NM     				AS "symbolNm"
     , A.AFCHNG_SYMBOL              AS "afchngSymbol"
     , SS.SYMBOL_NM     			AS "afchngSymbolNm"
     , A.GNRLMT_DATE				AS "gnrlmtDate"
     , A.MERG_DATE                	AS "mergDate"
     , A.RGHT_CLOS_TP               AS "rghtClosTp"
  FROM TBB_MERGE_INFO A
  LEFT OUTER JOIN TBA_SYMBOL_INFO S
    ON A.SYMBOL 		= S.SYMBOL
  LEFT OUTER JOIN TBA_SYMBOL_INFO SS
    ON A.AFCHNG_SYMBOL	= SS.SYMBOL
 WHERE (
 	   A.BASDT				BETWEEN '20200323' AND '20200323'
   AND A.SYMBOL				LIKE CONCAT(CONCAT('%', ''), '%') )
 ORDER BY A.BASDT, A.SYMBOL;   



SELECT A.BASDT						AS "basdt"
     , A.SYMBOL						AS "symbol"
     , A.ACNT_NO                	AS "acntNo"
     , A.SUB_ACNT_NO            	AS "subAcntNo"
     , I.CMSTK_ISUPRC				AS "cmstkIsuprc"
     , A.RGHT_QTY               	AS "rghtQty"
     , A.RGHT_QTY
       + A.RGHT_BUY_QTY
       - A.RGHT_SEL_QTY				AS "availQty"
  FROM TBB_CAPITAL_CHNG_SCHD A
  LEFT OUTER JOIN TBB_CAPITAL_CHNG_INFO I 
    ON A.BASDT		= I.BASDT
   AND A.SYMBOL 	= I.SYMBOL
   AND I.SUB_RGHT_TP	= '03'		-- Only Paid-In Capital Increase
 WHERE A.BASDT  			= '20200305'
   AND A.SYMBOL			= 'HSG'
   AND A.ACNT_NO			= '00000031'
   AND A.SUB_ACNT_NO		= 'N00000001';

  
SELECT A.SCR_DATE					AS "scrDate"
     , A.SCR_SEQ					AS "scrSeq"
     , A.ACNT_NO               		AS "acntNo"
     , A.SUB_ACNT_NO           		AS "subAcntNo"
     , C.CUST_NM					AS "custNm"
     , A.SYMBOL						AS "symbol"
     , A.SCR_QTY               		AS "scrQty"
     , A.SCR_AMT               		AS "scrAmt"
     , NVL(V.APRV_PROC_STAT, '0')	AS "aprvProcStat"
  FROM TBB_ICAP_SUBSCRIPTION_DTL A
  LEFT OUTER JOIN (SELECT B.ACNT_NO, B.VSD_ACNT_NO, A.CUST_NM FROM TAA_CUSTOMER A, TAB_ACCOUNT B WHERE A.CUST_NO = B.CUST_NO) C
    ON A.ACNT_NO 	= C.ACNT_NO  
  LEFT OUTER JOIN TCC_APPROVAL_DETAIL V
    ON A.APRV_BIZ_CODE	= V.APRV_BIZ_CODE
   AND A.SCR_DATE		= V.APLC_DATE
   AND A.SCR_SEQ		= V.SEQ
 WHERE A.BASDT  			= '20200305'
   AND A.SYMBOL				= 'HSG'
   AND A.ACNT_NO			= '00000031'
   AND A.SUB_ACNT_NO		= 'N00000001'
 ORDER BY A.SCR_DATE, A.SCR_SEQ; 



SELECT 
	 'Screen No.(BB3120)    : '||'Paid-id Capital Increase Subscription Registration' || Chr(13) || Chr(10) ||
	 'Fixed Date            : '|| TO_CHAR(TO_DATE(A.BASDT, 'YYYYMMDD'), 'DD/MM/YYYY') || Chr(13) || Chr(10) ||
	 'Symbol                : '|| S.SYMBOL || ' - ' || S.SYMBOL_NM || Chr(13) || Chr(10) || 
	 'Subscription  Date    : '|| TO_CHAR(TO_DATE(A.SCR_DATE, 'YYYYMMDD'), 'DD/MM/YYYY') || Chr(13) || Chr(10) ||
	 'Sequance              : '|| A.SCR_SEQ || Chr(13) || Chr(10) ||
	 'Account No.           : '|| A.ACNT_NO || ' - ' || A.SUB_ACNT_NO || Chr(13) || Chr(10) ||		
	 'Account Name.         : '|| C.CUST_NM || Chr(13) || Chr(10) ||		
	 'Allocation Quantity   : '|| TO_CHAR(B.RGHT_QTY,'999,999,999,999') || Chr(13) || Chr(10) ||
	 'Available Quantity    : '|| TO_CHAR(B.RGHT_QTY - B.SCR_QTY + B.RGHT_BUY_QTY - B.RGHT_SEL_QTY,'999,999,999,999') || Chr(13) || Chr(10) ||
	 'Subscription Quantity : '|| TO_CHAR(A.SCR_QTY,'999,999,999,999') || Chr(13) || Chr(10) ||
	 'Subscription Price    : '|| TO_CHAR(I.CMSTK_ISUPRC,'999,999,999,999') || Chr(13) || Chr(10) ||
	 'Subscription Amount   : '|| TO_CHAR(A.SCR_AMT,'999,999,999,999') || Chr(13) || Chr(10) AS "contents"
  FROM TBB_ICAP_SUBSCRIPTION_DTL A
  LEFT OUTER JOIN (SELECT B.ACNT_NO, A.CUST_NO, A.CUST_NM FROM TAA_CUSTOMER A, TAB_ACCOUNT B WHERE A.CUST_NO = B.CUST_NO) C
    ON A.ACNT_NO 	= C.ACNT_NO  
  LEFT OUTER JOIN TBA_SYMBOL_INFO S
    ON A.SYMBOL 	= S.SYMBOL
  JOIN TBB_CAPITAL_CHNG_SCHD B
    ON A.BASDT			= B.BASDT
   AND A.SYMBOL			= B.SYMBOL
   AND A.ACNT_NO		= B.ACNT_NO
   AND A.SUB_ACNT_NO	= B.SUB_ACNT_NO    
  JOIN TBB_CAPITAL_CHNG_INFO I 
    ON A.BASDT		= I.BASDT
   AND A.SYMBOL 	= I.SYMBOL
   AND I.SUB_RGHT_TP	= '03'		-- Only Paid-In Capital Increase    
 WHERE A.BASDT  		= '20200305'
   AND A.SYMBOL			= 'HSG'
   AND A.SCR_DATE		= '20200324'
   AND A.SCR_SEQ		= 1	
   

SELECT A.SCR_DATE					AS "scrDate"
     , A.SCR_SEQ					AS "scrSeq"
     , A.ACNT_NO               		AS "acntNo"
     , A.SUB_ACNT_NO           		AS "subAcntNo"
     , C.CUST_NM					AS "custNm"
     , C.VSD_ACNT_NO				AS "vsdAcntNo"
     , A.SYMBOL						AS "symbol"
     , B.RGHT_QTY              		AS "rghtQty"
     , A.SCR_QTY               		AS "scrQty"
     , A.SCR_AMT               		AS "scrAmt"
     , V.APRV_APLC_PRSN_ID			AS "aprvAplcPrsnId"
     , V.APRV_PRSN_1ST_ID			AS "aprvPrsn1stId"
     , V.APRV_PRSN_2ND_ID			AS "aprvPrsn2ndId"
     , V.APRV_PROC_STAT				AS "aprvProcStat"  
  FROM TBB_ICAP_SUBSCRIPTION_DTL A
  LEFT OUTER JOIN (SELECT B.ACNT_NO, B.VSD_ACNT_NO, A.CUST_NM FROM TAA_CUSTOMER A, TAB_ACCOUNT B WHERE A.CUST_NO = B.CUST_NO) C
    ON A.ACNT_NO 	= C.ACNT_NO  
  JOIN TBB_CAPITAL_CHNG_SCHD B
    ON A.BASDT			= B.BASDT
   AND A.SYMBOL			= B.SYMBOL
   AND A.ACNT_NO		= B.ACNT_NO
   AND A.SUB_ACNT_NO	= B.SUB_ACNT_NO   
  JOIN TBB_CAPITAL_CHNG_INFO I 
    ON A.BASDT		= I.BASDT
   AND A.SYMBOL 	= I.SYMBOL
   AND I.SUB_RGHT_TP	= '03'		-- Only Paid-In Capital Increase       
  LEFT OUTER JOIN TCC_APPROVAL_DETAIL V
    ON A.APRV_BIZ_CODE				= V.APRV_BIZ_CODE
   AND A.SCR_DATE					= V.APLC_DATE
   AND A.SCR_SEQ					= V.SEQ
 WHERE (
       A.BASDT			= '20200305'
   AND A.SYMBOL			= 'HSG'
   AND A.SCR_DATE		BETWEEN '20200324' AND '20200325'
   AND A.ACNT_NO		LIKE CONCAT(CONCAT('%', ''), '%')
   AND A.SCR_CNCL_YN	LIKE CONCAT(CONCAT('%', ''), '%') )
   AND CONCAT(A.ACNT_NO, A.SUB_ACNT_NO) >= NVL(NULL, ' ')
 ORDER BY A.SCR_DATE, A.SCR_SEQ;


SELECT *
  FROM TBB_FIXDATE_VIEW A;

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
   AND A.SUB_RGHT_TP    	LIKE CONCAT(CONCAT('%', ''), '%')   
   AND A.RGHT_CLOS_TP 		= '0' );


SELECT 
	 'Screen No.(BB3122)    : '||'Capital Increase Right Trade Registration' || Chr(13) || Chr(10) ||
	 'Fixed Date            : '|| TO_CHAR(TO_DATE(A.BASDT, 'YYYYMMDD'), 'DD/MM/YYYY') || Chr(13) || Chr(10) ||
	 'Symbol                : '|| S.SYMBOL || ' - ' || S.SYMBOL_NM || Chr(13) || Chr(10) || 
	 'Trade Date            : '|| TO_CHAR(TO_DATE(A.TRD_DATE, 'YYYYMMDD'), 'DD/MM/YYYY') || Chr(13) || Chr(10) ||
	 'Sequance              : '|| A.TRD_SEQ || Chr(13) || Chr(10) ||
	 'Account No.           : '|| A.ACNT_NO || ' - ' || A.SUB_ACNT_NO || Chr(13) || Chr(10) ||		
	 'Account Name.         : '|| C.CUST_NM || Chr(13) || Chr(10) ||
	 'Trade Type            : '|| CASE WHEN A.APRV_BIZ_CODE='142' THEN 'Inside - ' ELSE 'Outside - ' END || CASE WHEN A.BUY_SEL_TP='1' THEN 'Buy' ELSE 'Sell' END || Chr(13) || Chr(10) || 	
	 'Partner Account No.   : '|| A.PTNR_ACNT_NO || ' - ' || A.PTNR_SUB_ACNT_NO || Chr(13) || Chr(10) ||		
	 'Partner Account Name  : '|| D.CUST_NM || Chr(13) || Chr(10) || 	
	 'Partner Information   : '|| CASE WHEN A.TRAN_PTNR_ID_KND='1' THEN 'Identify Card : ' 
	                                   WHEN A.TRAN_PTNR_ID_KND='2' THEN 'Citizen Card : '
	                                   WHEN A.TRAN_PTNR_ID_KND='3' THEN 'Trading code : '
	                                   WHEN A.TRAN_PTNR_ID_KND='4' THEN 'Business license : '
                                       ELSE '' END  
                               || NVL(A.TRAN_PTNR_ID, '') || CASE WHEN NVL(A.TRAN_PTNR_ID, 'N') = 'N' THEN '' ELSE ' - ' END || NVL(A.TRAN_PTNR_NM, '') || Chr(13) || Chr(10) || 	
	 'Trade Quantity        : '|| TO_CHAR(A.TRD_QTY,'999,999,999,999') || Chr(13) || Chr(10) ||
	 'Trade Amount          : '|| TO_CHAR(A.TRD_AMT,'999,999,999,999') || Chr(13) || Chr(10) AS "contents"
  FROM TBB_ICAP_RIGHT_TRADE_DTL A
  LEFT OUTER JOIN (SELECT B.ACNT_NO, A.CUST_NO, A.CUST_NM FROM TAA_CUSTOMER A, TAB_ACCOUNT B WHERE A.CUST_NO = B.CUST_NO) C
    ON A.ACNT_NO 		= C.ACNT_NO  
  LEFT OUTER JOIN (SELECT B.ACNT_NO, A.CUST_NO, A.CUST_NM FROM TAA_CUSTOMER A, TAB_ACCOUNT B WHERE A.CUST_NO = B.CUST_NO) D
    ON A.PTNR_ACNT_NO 	= D.ACNT_NO  
  LEFT OUTER JOIN TBA_SYMBOL_INFO S
    ON A.SYMBOL 	= S.SYMBOL
  JOIN TBB_CAPITAL_CHNG_SCHD B
    ON A.BASDT			= B.BASDT
   AND A.SYMBOL			= B.SYMBOL
   AND A.ACNT_NO		= B.ACNT_NO
   AND A.SUB_ACNT_NO	= B.SUB_ACNT_NO
  JOIN TBB_CAPITAL_CHNG_INFO I 
    ON A.BASDT		= I.BASDT
   AND A.SYMBOL 	= I.SYMBOL
   AND I.SUB_RGHT_TP	= '03'		-- Only Paid-In Capital Increase  
   AND I.PRGHT_TRAN_YN  = 'Y'		-- Available to trade new stocks
 WHERE A.TRD_DATE		= '20200327' 
   AND A.TRD_SEQ		= 1;


SELECT A.BASDT						AS "basdt"
     , A.ACNT_NO                	AS "acntNo"
     , A.SUB_ACNT_NO            	AS "subAcntNo"
     , C.CUST_NM					AS "custNm"
     , A.SYMBOL						AS "symbol"
     , A.RGHT_QTY               	AS "rghtQty"
     , A.SCR_QTY                	AS "scrQty"
     , A.RGHT_BUY_QTY               AS "rghtBuyQty"
     , A.RGHT_SEL_QTY               AS "rghtSelQty"
     , A.RGHT_QTY 
       - A.SCR_QTY 
       + A.RGHT_BUY_QTY
       - A.RGHT_SEL_QTY				AS "availQty"
     , I.SCR_STDT               	AS "scrStdt"  
     , I.SCR_ENDT               	AS "scrEndt"  
  FROM TBB_CAPITAL_CHNG_SCHD A
  LEFT OUTER JOIN (SELECT B.ACNT_NO, B.VSD_ACNT_NO, A.CUST_NM FROM TAA_CUSTOMER A, TAB_ACCOUNT B WHERE A.CUST_NO = B.CUST_NO) C
    ON A.ACNT_NO 	= C.ACNT_NO
  JOIN TBB_CAPITAL_CHNG_INFO I 
    ON A.BASDT		= I.BASDT
   AND A.SYMBOL 	= I.SYMBOL
   AND I.SUB_RGHT_TP	= '03'		-- Only Paid-In Capital Increase
 WHERE (
       A.BASDT			= #{basdt}
   AND A.SYMBOL			= #{symbol}
   
   
SELECT A.TRD_DATE					AS "trdDate"
     , A.TRD_SEQ					AS "trdSeq"
     , A.ACNT_NO               		AS "acntNo"
     , A.SUB_ACNT_NO           		AS "subAcntNo"
     , C.CUST_NM					AS "custNm"
     , A.SYMBOL						AS "symbol"
     , S.SYMBOL_NM					AS "symbolNm"
     , A.BUY_SEL_TP					AS "buySelTp"
     , A.TRD_QTY               		AS "trdQty"
     , A.TRD_AMT               		AS "trdAmt"
     , A.PTNR_ACNT_NO				AS "ptnrAcntNo"				
     , A.PTNR_SUB_ACNT_NO			AS "ptnrSubAcntNo"
     , CC.CUST_NM					AS "ptnrCustNm"
     , NVL(V.APRV_PROC_STAT, '0')	AS "aprvProcStat"
  FROM TBB_ICAP_RIGHT_TRADE_DTL A
  LEFT OUTER JOIN (SELECT B.ACNT_NO, B.VSD_ACNT_NO, A.CUST_NM FROM TAA_CUSTOMER A, TAB_ACCOUNT B WHERE A.CUST_NO = B.CUST_NO) C
    ON A.ACNT_NO 	= C.ACNT_NO  
  LEFT OUTER JOIN (SELECT B.ACNT_NO, B.VSD_ACNT_NO, A.CUST_NM FROM TAA_CUSTOMER A, TAB_ACCOUNT B WHERE A.CUST_NO = B.CUST_NO) CC
    ON A.PTNR_ACNT_NO 	= CC.ACNT_NO  
  LEFT OUTER JOIN TBA_SYMBOL_INFO S
    ON A.SYMBOL 	= S.SYMBOL    
  LEFT OUTER JOIN TCC_APPROVAL_DETAIL V
    ON A.APRV_BIZ_CODE				= V.APRV_BIZ_CODE
   AND A.TRD_DATE					= V.APLC_DATE
   AND A.TRD_SEQ					= V.SEQ
 WHERE A.BASDT			= '20200305'
   AND A.SYMBOL			= 'HSG'
   AND A.ACNT_NO		= '00000031'
   AND A.SUB_ACNT_NO	= 'N00000001'
 ORDER BY A.TRD_DATE, A.TRD_SEQ;
 

SELECT A.TRD_DATE					AS "trdDate"
     , A.TRD_SEQ					AS "trdSeq"
     , A.ACNT_NO               		AS "acntNo"
     , A.SUB_ACNT_NO           		AS "subAcntNo"
     , C.CUST_NM					AS "custNm"
     , A.SYMBOL						AS "symbol"
     , S.SYMBOL_NM					AS "symbolNm"
     , A.BUY_SEL_TP					AS "buySelTp"
     , A.TRD_QTY               		AS "trdQty"
     , A.TRD_AMT               		AS "trdAmt"
     , A.PTNR_ACNT_NO				AS "ptnrAcntNo"				
     , A.PTNR_SUB_ACNT_NO			AS "ptnrSubAcntNo"
     , CC.CUST_NM					AS "ptnrCustNm"
     , A.TRAN_PTNR_ID_KND			AS "tranPtnrIdKnd"
     , A.TRAN_PTNR_ID				AS "tranPtnrId"
     , NVL(V.APRV_PROC_STAT, '0')	AS "aprvProcStat"
  FROM TBB_ICAP_RIGHT_TRADE_DTL A
  LEFT OUTER JOIN (SELECT B.ACNT_NO, B.VSD_ACNT_NO, A.CUST_NM FROM TAA_CUSTOMER A, TAB_ACCOUNT B WHERE A.CUST_NO = B.CUST_NO) C
    ON A.ACNT_NO 	= C.ACNT_NO  
  LEFT OUTER JOIN (SELECT B.ACNT_NO, B.VSD_ACNT_NO, A.CUST_NM FROM TAA_CUSTOMER A, TAB_ACCOUNT B WHERE A.CUST_NO = B.CUST_NO) CC
    ON A.PTNR_ACNT_NO 	= CC.ACNT_NO  
  LEFT OUTER JOIN TBA_SYMBOL_INFO S
    ON A.SYMBOL 	= S.SYMBOL    
  LEFT OUTER JOIN TCC_APPROVAL_DETAIL V
    ON A.APRV_BIZ_CODE				= V.APRV_BIZ_CODE
   AND A.TRD_DATE					= V.APLC_DATE
   AND A.TRD_SEQ					= V.SEQ
 WHERE A.BASDT			= '20200305'
   AND A.SYMBOL			= 'HSG'
   AND A.TRD_DATE		BETWEEN '20200331' AND '20200331'
   AND A.TRD_CNCL_YN	= 'N'
   AND A.ACNT_NO		LIKE CONCAT(CONCAT('%', ''), '%')
   AND CONCAT(A.ACNT_NO, A.SUB_ACNT_NO) >= NVL(null, ' ')
 ORDER BY A.TRD_DATE, A.TRD_SEQ;
 

SELECT A.BASDT						AS "basdt"
     , A.RGHT_DATE					AS "rghtDate"
     , A.SYMBOL                     AS "symbol"
     , S.SYMBOL_NM     				AS "symbolNm"
     , A.RGHT_TP                	AS "RghtTp"
     , A.SUB_RGHT_TP                AS "subRghtTp"
     , A.RGHT_DATE_TP				AS "rghtDateTp"
     , A.RGHT_CLOS_TP               AS "rghtClosTp"
  FROM TBB_SCHEDULE_VIEW A
  LEFT OUTER JOIN TBA_SYMBOL_INFO S
    ON A.SYMBOL 	= S.SYMBOL;


SELECT A.BASDT						AS "basdt"
     , A.RGHT_DATE					AS "rghtDate"
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
 	   A.RGHT_DATE			BETWEEN '20200101' AND '20210630'
   AND A.SYMBOL				LIKE CONCAT(CONCAT('%', ''), '%')
   AND A.RGHT_DATE_TP		IN ('04', '06') )
 ORDER BY A.RGHT_DATE, A.SYMBOL; 
 
     

-- TBB_DIVIDEND_SCHD  
SELECT SUM(CASE WHEN DIVD_CSH_AMT > 0 THEN 1 ELSE 0 END)	AS "cshCnt"
     , SUM(CASE WHEN DIVD_STK_QTY > 0 THEN 1 ELSE 0 END) 	AS "stkCnt"
     , SUM(CASE WHEN FRSTK_AMT > 0 THEN 1 ELSE 0 END) 		AS "frstkCnt"
  FROM TBB_DIVIDEND_SCHD 
 WHERE BASDT 	= '20200305'
   AND SYMBOL 	= 'HSG';
  
-- 증자감자예정내역
-- 유상증자: 청약수량, 단수주대금(X)
-- 유상감자: 감자대금, 감자출고, 단수주대금
-- 무상증자: 권리수량, 단수주대금
-- 무상감자: 감자출고, 단수주대금
SELECT SUM(CASE WHEN ROC_AMT > 0 THEN 1 ELSE 0 END)			AS "cshCnt"
     , SUM(CASE WHEN RGHT_QTY > 0 THEN 1 ELSE 0 END) 		AS "rghtCnt"
     , SUM(CASE WHEN SCR_QTY 
                   + RGHT_BUY_QTY 
                   - RGHT_SEL_QTY  > 0 THEN 1 ELSE 0 END) 	AS "stkCnt"
     , SUM(CASE WHEN ROC_WIDR_QTY > 0 THEN 1 ELSE 0 END) 	AS "rocCnt"
     , SUM(CASE WHEN FRSTK_AMT > 0 THEN 1 ELSE 0 END) 		AS "frstkCnt"
  FROM TBB_CAPITAL_CHNG_SCHD 
 WHERE BASDT 	= '20200305'
   AND SYMBOL 	= 'HSG';
  

-- 종목변경예정내역(합병, 액면분할, 병합)
SELECT SUM(CASE WHEN BFCHNG_QTY > 0 THEN 1 ELSE 0 END)		AS "stkCnt"
     , SUM(CASE WHEN FRSTK_AMT > 0 THEN 1 ELSE 0 END) 		AS "frstkCnt"
  FROM TBB_STOCK_CHNG_SCHD 
 WHERE BASDT 	= '20200309'
   AND SYMBOL 	= 'ACB';      
  
   
-- 회사분할예정내역(회사분할  )
SELECT SUM(CASE WHEN BFCHNG_QTY > 0 THEN 1 ELSE 0 END)		AS "stkCnt"
     , SUM(CASE WHEN FRSTK_AMT > 0 THEN 1 ELSE 0 END) 		AS "frstkCnt"
  FROM TBB_SPIN_OFF_SCHD 
 WHERE BASDT 	= '20200309'
   AND SYMBOL 	= 'ACB';    
   

SELECT TO_CHAR(ADD_MONTHS(SYSDATE, -6),'YYYYMMDD')
  FROM DUAL;
 
SELECT BASDT		AS "BASDT"
     , BASDT 		AS "RGHT_DATE"
     , SYMBOL		AS "SYMBOL"
     , RGHT_TP		AS "RGHT_TP"
     , CASE WHEN DIVD_KND = '1' THEN '91'
            WHEN DIVD_KND = '2' THEN '92'
            ELSE '93' END AS "SUB_RGHT_TP"	 
     , '01'			AS "RGHT_DATE_TP"
     , RGHT_CLOS_TP	AS "RGHT_CLOS_TP"
  FROM TBB_DIVIDEND_INFO
 WHERE BASDT > TO_CHAR(ADD_MONTHS(SYSDATE, -6),'YYYYMMDD');
    

SELECT * 
  FROM TAC_TRANSACTION
 WHERE TRAN_KND_CODE = '153';
 

SELECT A.BASDT						AS "basdt"
     , A.SYMBOL                     AS "symbol"
     , S.SYMBOL_NM     				AS "symbolNm"
     , A.RGHT_TP                	AS "RghtTp"
     , A.RGHT_CLOS_TP               AS "rghtClosTp"
  FROM TBB_DIVIDEND_INFO A
  LEFT OUTER JOIN TBA_SYMBOL_INFO S
    ON A.SYMBOL 	= S.SYMBOL
 WHERE (
 	   A.BASDT				BETWEEN '20200101' AND '20200630'
   AND A.SYMBOL				LIKE CONCAT(CONCAT('%', ''), '%')
   AND A.RGHT_TP			LIKE CONCAT(CONCAT('%', ''), '%') )
   AND CONCAT(A.BASDT, A.SYMBOL) >= NVL(NULL, ' ')
 ORDER BY A.BASDT, A.SYMBOL;  
 

SELECT A.BASDT                                                                                                              AS "basdt"   
     , A.SYMBOL                                                                                                             AS "symbol"  
     , S.SYMBOL_NM                                                                                                          AS "symbolNm"
     , I.RGHT_TP                                                                                                            AS "rghtTp"  
     , I.RGHT_CLOS_TP 																										AS "rghtClosTp"  
     , CASE WHEN I.RGHT_CLOS_TP='9' THEN I.WRK_TMP ELSE 0 END																AS "closDate"  
     , SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000003' AND A.DIVD_STK_QTY>0 THEN 1 ELSE 0 END) || ' / ' 
       || SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000003' AND A.DIVD_STK_QTY>0 AND A.SE_DEPO_TRAN_NO>0 THEN 1 ELSE 0 END)	AS "custStock"
     , SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000003' AND A.DIVD_CSH_AMT>0 THEN 1 ELSE 0 END) || ' / ' 
       || SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000003' AND A.DIVD_CSH_AMT>0 AND A.CSH_DEPO_TRAN_NO>0 THEN 1 ELSE 0 END)	AS "custCash"
     , SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000003' AND A.FRSTK_QTY>0 THEN 1 ELSE 0 END) || ' / '
       || SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000003' AND A.FRSTK_QTY>0 AND A.FRSTK_ATM_TRAN_NO>0 THEN 1 ELSE 0 END)	AS "custFrStock"
     , SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000004' AND A.DIVD_STK_QTY>0 THEN 1 ELSE 0 END) || ' / ' 
       || SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000004' AND A.DIVD_STK_QTY>0 AND A.SE_DEPO_TRAN_NO>0 THEN 1 ELSE 0 END)	AS "propStock"
     , SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000004' AND A.DIVD_CSH_AMT>0 THEN 1 ELSE 0 END) || ' / ' 
       || SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000004' AND A.DIVD_CSH_AMT>0 AND A.CSH_DEPO_TRAN_NO>0 THEN 1 ELSE 0 END)	AS "propCash"
     , SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000004' AND A.FRSTK_QTY>0 THEN 1 ELSE 0 END) || ' / '
       || SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000004' AND A.FRSTK_QTY>0 AND A.FRSTK_ATM_TRAN_NO>0 THEN 1 ELSE 0 END)	AS "propFrStock"
  FROM TBB_DIVIDEND_SCHD A
  LEFT OUTER JOIN TBA_SYMBOL_INFO S
    ON A.SYMBOL 	= S.SYMBOL  
  JOIN TBB_DIVIDEND_INFO I
    ON A.BASDT  	= I.BASDT 
   AND A.SYMBOL 	= I.SYMBOL
 WHERE A.BASDT	BETWEEN '20200101' AND '20200630'
 GROUP BY A.BASDT, A.SYMBOL, S.SYMBOL_NM, I.RGHT_TP, I.RGHT_CLOS_TP;
 
 
 
UNION
SELECT A.BASDT 
     , A.SYMBOL 
     , S.SYMBOL_NM 
     , I.RGHT_TP 
     , SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000003' AND A.RGHT_QTY>0 THEN 1 ELSE 0 END) || ' / ' 
       || SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000003' AND A.RGHT_QTY>0 AND A.SE_DEPO_TRAN_NO>0 THEN 1 ELSE 0 END)		AS "custStock"
     , SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000003' AND A.ROC_AMT>0 THEN 1 ELSE 0 END) || ' / ' 
       || SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000003' AND A.ROC_AMT>0 AND A.CSH_DEPO_TRAN_NO>0 THEN 1 ELSE 0 END)		AS "custCash"
     , SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000003' AND A.FRSTK_QTY>0 THEN 1 ELSE 0 END) || ' / '
       || SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000003' AND A.FRSTK_QTY>0 AND A.FRSTK_ATM_TRAN_NO>0 THEN 1 ELSE 0 END)	AS "custFrStock"
     , SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000004' AND A.RGHT_QTY>0 THEN 1 ELSE 0 END) || ' / ' 
       || SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000004' AND A.RGHT_QTY>0 AND A.SE_DEPO_TRAN_NO>0 THEN 1 ELSE 0 END)		AS "propStock"
     , SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000004' AND A.ROC_AMT>0 THEN 1 ELSE 0 END) || ' / ' 
       || SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000004' AND A.ROC_AMT>0 AND A.CSH_DEPO_TRAN_NO>0 THEN 1 ELSE 0 END)		AS "propCash"
     , SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000004' AND A.FRSTK_QTY>0 THEN 1 ELSE 0 END) || ' / '
       || SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000004' AND A.FRSTK_QTY>0 AND A.FRSTK_ATM_TRAN_NO>0 THEN 1 ELSE 0 END)	AS "propFrStock"
  FROM TBB_CAPITAL_CHNG_SCHD A
  LEFT OUTER JOIN TBA_SYMBOL_INFO S
    ON A.SYMBOL 	= S.SYMBOL  
  JOIN TBB_CAPITAL_CHNG_INFO I
    ON A.BASDT  	= I.BASDT 
   AND A.SYMBOL 	= I.SYMBOL
 WHERE A.BASDT	BETWEEN '20200101' AND '20200630'
 GROUP BY A.BASDT, A.SYMBOL, S.SYMBOL_NM, I.RGHT_TP
UNION 
SELECT A.BASDT 
     , A.SYMBOL 
     , S.SYMBOL_NM 
     , I.RGHT_TP 
     , SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000003' AND A.AFCHNG_QTY>0 THEN 1 ELSE 0 END) || ' / ' 
       || SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000003' AND A.AFCHNG_QTY>0 AND A.SE_DEPO_TRAN_NO>0 THEN 1 ELSE 0 END)		AS "custStock"
     , '0 / 0'        																										AS "custCash"
     , SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000003' AND A.FRSTK_QTY>0 THEN 1 ELSE 0 END) || ' / '
       || SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000003' AND A.FRSTK_QTY>0 AND A.FRSTK_ATM_TRAN_NO>0 THEN 1 ELSE 0 END)	AS "custFrStock"
     , SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000004' AND A.AFCHNG_QTY>0 THEN 1 ELSE 0 END) || ' / ' 
       || SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000004' AND A.AFCHNG_QTY>0 AND A.SE_DEPO_TRAN_NO>0 THEN 1 ELSE 0 END)		AS "propStock"
     , '0 / 0'        																										AS "custCash"
     , SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000004' AND A.FRSTK_QTY>0 THEN 1 ELSE 0 END) || ' / '
       || SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000004' AND A.FRSTK_QTY>0 AND A.FRSTK_ATM_TRAN_NO>0 THEN 1 ELSE 0 END)	AS "propFrStock"
  FROM TBB_STOCK_CHNG_SCHD A
  LEFT OUTER JOIN TBA_SYMBOL_INFO S
    ON A.SYMBOL 	= S.SYMBOL  
  JOIN TBB_MERGE_INFO I
    ON A.BASDT  	= I.BASDT 
   AND A.SYMBOL 	= I.SYMBOL
 WHERE A.BASDT	BETWEEN '20200101' AND '20200630'
 GROUP BY A.BASDT, A.SYMBOL, S.SYMBOL_NM, I.RGHT_TP
UNION 
SELECT A.BASDT 
     , A.SYMBOL 
     , S.SYMBOL_NM 
     , I.RGHT_TP 
     , SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000003' AND A.AFCHNG_QTY>0 THEN 1 ELSE 0 END) || ' / ' 
       || SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000003' AND A.AFCHNG_QTY>0 AND A.SE_DEPO_TRAN_NO>0 THEN 1 ELSE 0 END)		AS "custStock"
     , '0 / 0'        																										AS "custCash"
     , SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000003' AND A.FRSTK_QTY>0 THEN 1 ELSE 0 END) || ' / '
       || SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000003' AND A.FRSTK_QTY>0 AND A.FRSTK_ATM_TRAN_NO>0 THEN 1 ELSE 0 END)	AS "custFrStock"
     , SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000004' AND A.AFCHNG_QTY>0 THEN 1 ELSE 0 END) || ' / ' 
       || SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000004' AND A.AFCHNG_QTY>0 AND A.SE_DEPO_TRAN_NO>0 THEN 1 ELSE 0 END)		AS "propStock"
     , '0 / 0'        																										AS "custCash"
     , SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000004' AND A.FRSTK_QTY>0 THEN 1 ELSE 0 END) || ' / '
       || SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000004' AND A.FRSTK_QTY>0 AND A.FRSTK_ATM_TRAN_NO>0 THEN 1 ELSE 0 END)	AS "propFrStock"
  FROM TBB_STOCK_CHNG_SCHD A
  LEFT OUTER JOIN TBA_SYMBOL_INFO S
    ON A.SYMBOL 	= S.SYMBOL  
  JOIN TBB_SPLIT_INFO I
    ON A.BASDT  	= I.BASDT 
   AND A.SYMBOL 	= I.SYMBOL
 WHERE A.BASDT	BETWEEN '20200101' AND '20200630'
 GROUP BY A.BASDT, A.SYMBOL, S.SYMBOL_NM, I.RGHT_TP
UNION 
SELECT A.BASDT 
     , A.SYMBOL 
     , S.SYMBOL_NM 
     , I.RGHT_TP 
     , SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000003' AND A.AFCHNG_QTY>0 THEN 1 ELSE 0 END) || ' / ' 
       || SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000003' AND A.AFCHNG_QTY>0 AND A.TRAN_NO>0 THEN 1 ELSE 0 END)				AS "custStock"
     , '0 / 0'        																										AS "custCash"
     , SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000003' AND A.FRSTK_QTY>0 THEN 1 ELSE 0 END) || ' / '
       || SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000003' AND A.FRSTK_QTY>0 AND A.FRSTK_ATM_TRAN_NO>0 THEN 1 ELSE 0 END)	AS "custFrStock"
     , SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000004' AND A.AFCHNG_QTY>0 THEN 1 ELSE 0 END) || ' / ' 
       || SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000004' AND A.AFCHNG_QTY>0 AND A.TRAN_NO>0 THEN 1 ELSE 0 END)				AS "propStock"
     , '0 / 0'        																										AS "custCash"
     , SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000004' AND A.FRSTK_QTY>0 THEN 1 ELSE 0 END) || ' / '
       || SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000004' AND A.FRSTK_QTY>0 AND A.FRSTK_ATM_TRAN_NO>0 THEN 1 ELSE 0 END)	AS "propFrStock"
  FROM TBB_SPIN_OFF_SCHD A
  LEFT OUTER JOIN TBA_SYMBOL_INFO S
    ON A.SYMBOL 	= S.SYMBOL  
  JOIN TBB_SPIN_OFF_INFO_MSTR I
    ON A.BASDT  	= I.BASDT 
   AND A.SYMBOL 	= I.SYMBOL
 WHERE A.BASDT	BETWEEN '20200101' AND '20200630'
 GROUP BY A.BASDT, A.SYMBOL, S.SYMBOL_NM, I.RGHT_TP;
 










SELECT * FROM (
SELECT A.BASDT																												AS "basdt"
     , A.SYMBOL                                                                                                             AS "symbol" 
     , S.SYMBOL_NM                                                                                                          AS "symbolNm"
     , I.RGHT_TP                                                                                                            AS "rghtTp"
     , SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000003' AND A.DIVD_STK_QTY>0 THEN 1 ELSE 0 END) || ' / ' 
       || SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000003' AND A.DIVD_STK_QTY>0 AND A.SE_DEPO_TRAN_NO>0 THEN 1 ELSE 0 END)	AS "custStock"
     , SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000003' AND A.DIVD_CSH_AMT>0 THEN 1 ELSE 0 END) || ' / ' 
       || SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000003' AND A.DIVD_CSH_AMT>0 AND A.CSH_DEPO_TRAN_NO>0 THEN 1 ELSE 0 END)	AS "custCash"
     , SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000003' AND A.FRSTK_QTY>0 THEN 1 ELSE 0 END) || ' / '
       || SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000003' AND A.FRSTK_QTY>0 AND A.FRSTK_ATM_TRAN_NO>0 THEN 1 ELSE 0 END)	AS "custFrStock"
     , SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000004' AND A.DIVD_STK_QTY>0 THEN 1 ELSE 0 END) || ' / ' 
       || SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000004' AND A.DIVD_STK_QTY>0 AND A.SE_DEPO_TRAN_NO>0 THEN 1 ELSE 0 END)	AS "propStock"
     , SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000004' AND A.DIVD_CSH_AMT>0 THEN 1 ELSE 0 END) || ' / ' 
       || SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000004' AND A.DIVD_CSH_AMT>0 AND A.CSH_DEPO_TRAN_NO>0 THEN 1 ELSE 0 END)	AS "propCash"
     , SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000004' AND A.FRSTK_QTY>0 THEN 1 ELSE 0 END) || ' / '
       || SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000004' AND A.FRSTK_QTY>0 AND A.FRSTK_ATM_TRAN_NO>0 THEN 1 ELSE 0 END)	AS "propFrStock"
  FROM TBB_DIVIDEND_SCHD A
  LEFT OUTER JOIN TBA_SYMBOL_INFO S
    ON A.SYMBOL 	= S.SYMBOL  
  JOIN TBB_DIVIDEND_INFO I
    ON A.BASDT  	= I.BASDT 
   AND A.SYMBOL 	= I.SYMBOL
 WHERE A.BASDT		BETWEEN '20200101' AND '20200630'
 GROUP BY A.BASDT, A.SYMBOL, S.SYMBOL_NM, I.RGHT_TP
UNION ALL
SELECT A.BASDT																												AS "basdt"
     , A.SYMBOL                                                                                                             AS "symbol" 
     , S.SYMBOL_NM                                                                                                          AS "symbolNm"
     , I.RGHT_TP                                                                                                            AS "rghtTp"
     , SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000003' AND A.RGHT_QTY>0 THEN 1 ELSE 0 END) || ' / ' 
       || SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000003' AND A.RGHT_QTY>0 AND A.SE_DEPO_TRAN_NO>0 THEN 1 ELSE 0 END)		AS "custStock"
     , SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000003' AND A.ROC_AMT>0 THEN 1 ELSE 0 END) || ' / ' 
       || SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000003' AND A.ROC_AMT>0 AND A.CSH_DEPO_TRAN_NO>0 THEN 1 ELSE 0 END)		AS "custCash"
     , SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000003' AND A.FRSTK_QTY>0 THEN 1 ELSE 0 END) || ' / '
       || SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000003' AND A.FRSTK_QTY>0 AND A.FRSTK_ATM_TRAN_NO>0 THEN 1 ELSE 0 END)	AS "custFrStock"
     , SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000004' AND A.RGHT_QTY>0 THEN 1 ELSE 0 END) || ' / ' 
       || SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000004' AND A.RGHT_QTY>0 AND A.SE_DEPO_TRAN_NO>0 THEN 1 ELSE 0 END)		AS "propStock"
     , SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000004' AND A.ROC_AMT>0 THEN 1 ELSE 0 END) || ' / ' 
       || SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000004' AND A.ROC_AMT>0 AND A.CSH_DEPO_TRAN_NO>0 THEN 1 ELSE 0 END)		AS "propCash"
     , SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000004' AND A.FRSTK_QTY>0 THEN 1 ELSE 0 END) || ' / '
       || SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000004' AND A.FRSTK_QTY>0 AND A.FRSTK_ATM_TRAN_NO>0 THEN 1 ELSE 0 END)	AS "propFrStock"
  FROM TBB_CAPITAL_CHNG_SCHD A
  LEFT OUTER JOIN TBA_SYMBOL_INFO S
    ON A.SYMBOL 	= S.SYMBOL  
  JOIN TBB_CAPITAL_CHNG_INFO I
    ON A.BASDT  	= I.BASDT 
   AND A.SYMBOL 	= I.SYMBOL
 WHERE A.BASDT		BETWEEN '20200101' AND '20200630'
 GROUP BY A.BASDT, A.SYMBOL, S.SYMBOL_NM, I.RGHT_TP
UNION ALL 
SELECT A.BASDT																												AS "basdt"
     , A.SYMBOL                                                                                                             AS "symbol" 
     , S.SYMBOL_NM                                                                                                          AS "symbolNm"
     , I.RGHT_TP                                                                                                            AS "rghtTp"
     , SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000003' AND A.AFCHNG_QTY>0 THEN 1 ELSE 0 END) || ' / ' 
       || SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000003' AND A.AFCHNG_QTY>0 AND A.SE_DEPO_TRAN_NO>0 THEN 1 ELSE 0 END)		AS "custStock"
     , '0 / 0'        																										AS "custCash"
     , SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000003' AND A.FRSTK_QTY>0 THEN 1 ELSE 0 END) || ' / '
       || SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000003' AND A.FRSTK_QTY>0 AND A.FRSTK_ATM_TRAN_NO>0 THEN 1 ELSE 0 END)	AS "custFrStock"
     , SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000004' AND A.AFCHNG_QTY>0 THEN 1 ELSE 0 END) || ' / ' 
       || SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000004' AND A.AFCHNG_QTY>0 AND A.SE_DEPO_TRAN_NO>0 THEN 1 ELSE 0 END)		AS "propStock"
     , '0 / 0'        																										AS "custCash"
     , SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000004' AND A.FRSTK_QTY>0 THEN 1 ELSE 0 END) || ' / '
       || SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000004' AND A.FRSTK_QTY>0 AND A.FRSTK_ATM_TRAN_NO>0 THEN 1 ELSE 0 END)	AS "propFrStock"
  FROM TBB_STOCK_CHNG_SCHD A
  LEFT OUTER JOIN TBA_SYMBOL_INFO S
    ON A.SYMBOL 	= S.SYMBOL  
  JOIN TBB_MERGE_INFO I
    ON A.BASDT  	= I.BASDT 
   AND A.SYMBOL 	= I.SYMBOL
 WHERE A.BASDT		BETWEEN '20200101' AND '20200630'
 GROUP BY A.BASDT, A.SYMBOL, S.SYMBOL_NM, I.RGHT_TP
UNION ALL 
SELECT A.BASDT																												AS "basdt"
     , A.SYMBOL                                                                                                             AS "symbol" 
     , S.SYMBOL_NM                                                                                                          AS "symbolNm"
     , I.RGHT_TP                                                                                                            AS "rghtTp"
     , SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000003' AND A.AFCHNG_QTY>0 THEN 1 ELSE 0 END) || ' / ' 
       || SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000003' AND A.AFCHNG_QTY>0 AND A.SE_DEPO_TRAN_NO>0 THEN 1 ELSE 0 END)		AS "custStock"
     , '0 / 0'        																										AS "custCash"
     , SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000003' AND A.FRSTK_QTY>0 THEN 1 ELSE 0 END) || ' / '
       || SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000003' AND A.FRSTK_QTY>0 AND A.FRSTK_ATM_TRAN_NO>0 THEN 1 ELSE 0 END)	AS "custFrStock"
     , SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000004' AND A.AFCHNG_QTY>0 THEN 1 ELSE 0 END) || ' / ' 
       || SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000004' AND A.AFCHNG_QTY>0 AND A.SE_DEPO_TRAN_NO>0 THEN 1 ELSE 0 END)		AS "propStock"
     , '0 / 0'        																										AS "custCash"
     , SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000004' AND A.FRSTK_QTY>0 THEN 1 ELSE 0 END) || ' / '
       || SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000004' AND A.FRSTK_QTY>0 AND A.FRSTK_ATM_TRAN_NO>0 THEN 1 ELSE 0 END)	AS "propFrStock"
  FROM TBB_STOCK_CHNG_SCHD A
  LEFT OUTER JOIN TBA_SYMBOL_INFO S
    ON A.SYMBOL 	= S.SYMBOL  
  JOIN TBB_SPLIT_INFO I
    ON A.BASDT  	= I.BASDT 
   AND A.SYMBOL 	= I.SYMBOL
 WHERE A.BASDT		BETWEEN '20200101' AND '20200630'
 GROUP BY A.BASDT, A.SYMBOL, S.SYMBOL_NM, I.RGHT_TP
UNION ALL 
SELECT A.BASDT																												AS "basdt"
     , A.SYMBOL                                                                                                             AS "symbol" 
     , S.SYMBOL_NM                                                                                                          AS "symbolNm"
     , I.RGHT_TP                                                                                                            AS "rghtTp"
     , SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000003' AND A.AFCHNG_QTY>0 THEN 1 ELSE 0 END) || ' / ' 
       || SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000003' AND A.AFCHNG_QTY>0 AND A.TRAN_NO>0 THEN 1 ELSE 0 END)				AS "custStock"
     , '0 / 0'        																										AS "custCash"
     , SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000003' AND A.FRSTK_QTY>0 THEN 1 ELSE 0 END) || ' / '
       || SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000003' AND A.FRSTK_QTY>0 AND A.FRSTK_ATM_TRAN_NO>0 THEN 1 ELSE 0 END)	AS "custFrStock"
     , SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000004' AND A.AFCHNG_QTY>0 THEN 1 ELSE 0 END) || ' / ' 
       || SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000004' AND A.AFCHNG_QTY>0 AND A.TRAN_NO>0 THEN 1 ELSE 0 END)				AS "propStock"
     , '0 / 0'        																										AS "custCash"
     , SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000004' AND A.FRSTK_QTY>0 THEN 1 ELSE 0 END) || ' / '
       || SUM(CASE WHEN SUBSTR(A.ACNT_NO, 1, 7)='0000004' AND A.FRSTK_QTY>0 AND A.FRSTK_ATM_TRAN_NO>0 THEN 1 ELSE 0 END)	AS "propFrStock"
  FROM TBB_SPIN_OFF_SCHD A
  LEFT OUTER JOIN TBA_SYMBOL_INFO S
    ON A.SYMBOL 	= S.SYMBOL  
  JOIN TBB_SPIN_OFF_INFO_MSTR I
    ON A.BASDT  	= I.BASDT 
   AND A.SYMBOL 	= I.SYMBOL
 WHERE A.BASDT		BETWEEN '20200101' AND '20200630'
 GROUP BY A.BASDT, A.SYMBOL, S.SYMBOL_NM, I.RGHT_TP
)
WHERE (
       "symbol"			LIKE CONCAT(CONCAT('%', ''), '%')
   AND "rghtTp"			LIKE CONCAT(CONCAT('%', ''), '%') )
   AND CONCAT("basdt", "symbol") >= NVL(NULL, ' ')
   AND ROWNUM <= 101  
 ORDER BY "basdt", "symbol";   
   


SELECT TO_DATE('20200630','YYYYMMDD') - TO_DATE('20200101','YYYYMMDD') - COUNT(A.HOLI_DATE)                 AS "bizDayCount"
     , TO_DATE('20200630','YYYYMMDD') - ADD_MONTHS(TO_DATE('20200630','YYYYMMDD'), -1) - COUNT(A.HOLI_DATE) AS "origDayCount"
  FROM TCA_HOLIDAY A
 WHERE A.HOLI_DATE  >= '20200101'
   AND A.HOLI_DATE  <= '20200630'
   AND A.DATE_ORG_TP = '0';
