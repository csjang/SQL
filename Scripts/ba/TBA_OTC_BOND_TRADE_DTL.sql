DROP TABLE TBA_OTC_BOND_TRADE_DTL;
CREATE TABLE TBA_OTC_BOND_TRADE_DTL(
    TRD_DATE          VARCHAR2(8)    NOT NULL,
    TRD_SEQ          NUMBER    NOT NULL,
    APRV_BIZ_CODE          VARCHAR2(3)    NOT NULL,
    ACNT_NO          VARCHAR2(8)    NOT NULL,
    SUB_ACNT_NO          VARCHAR2(9)    NOT NULL,
    PTNR_ACNT_NO          VARCHAR2(8),
    PTNR_SUB_ACNT_NO          VARCHAR2(9),
    SYMBOL          VARCHAR2(12)    NOT NULL,
    TRD_QTY          NUMBER    DEFAULT '0'    NOT NULL,
    TRD_PRC          NUMBER    DEFAULT '0'    NOT NULL,
    TRD_FEE          NUMBER    DEFAULT '0'    NOT NULL,
    BAL_QTY          NUMBER    DEFAULT '0'    NOT NULL,
    PURC_AMT          NUMBER    DEFAULT '0'    NOT NULL,
    TRAN_DATE          VARCHAR2(8),
    TRAN_SEQ          NUMBER,
    PTNR_TRAN_SEQ          NUMBER,
    WRKR_ID          VARCHAR2(20),
    WRK_TMP          NUMBER,
PRIMARY KEY(TRD_DATE,TRD_SEQ)
);


SELECT 
	 'Trade Date        : '|| TO_CHAR(TO_DATE(A.TRD_DATE, 'YYYYMMDD'), 'DD/MM/YYYY') || Chr(13) || Chr(10) ||
	 'Sequance          : '|| A.TRD_SEQ || Chr(13) || Chr(10) ||
	 'Sell Account No.  : '|| A.ACNT_NO || ' - ' || A.SUB_ACNT_NO || Chr(13) || Chr(10) ||		
	 'Sell Account Name : '|| C.CUST_NM || Chr(13) || Chr(10) ||		
	 'Symbol            : '|| S.TCKR_CODE || ' -  ' || S.SYMBOL_NM || Chr(13) || Chr(10) ||
	 'Available Qty     : '|| TO_CHAR(A.BAL_QTY,'999,999,999,999') || Chr(13) || Chr(10) ||
	 'Available Amount  : '|| TO_CHAR(A.PURC_AMT,'999,999,999,999') || Chr(13) || Chr(10) ||
	 'Buy Account No.   : '|| A.PTNR_ACNT_NO || ' - ' || A.PTNR_SUB_ACNT_NO || Chr(13) || Chr(10) ||		
	 'Buy Account Name  : '|| D.CUST_NM || Chr(13) || Chr(10) ||		
	 'Quantity          : '|| TO_CHAR(A.TRD_QTY,'999,999,999,999') || Chr(13) || Chr(10) ||
	 'Purchase Price    : '|| TO_CHAR(A.TRD_PRC,'999,999,999,999') || Chr(13) || Chr(10) ||
	 'Purchase Amount   : '|| TO_CHAR(A.TRD_QTY*A.TRD_PRC,'999,999,999,999') || Chr(13) || Chr(10) ||
	 'Trade Fee         : '|| TO_CHAR(A.TRD_FEE,'999,999,999,999') || Chr(13) || Chr(10) AS "contents"
  FROM TBA_OTC_BOND_TRADE_DTL A
  LEFT OUTER JOIN (SELECT B.ACNT_NO, A.CUST_NO, A.CUST_NM FROM TAA_CUSTOMER A, TAB_ACCOUNT B WHERE A.CUST_NO = B.CUST_NO) C
    ON A.ACNT_NO 	= C.ACNT_NO  
  LEFT OUTER JOIN (SELECT B.ACNT_NO, A.CUST_NO, A.CUST_NM FROM TAA_CUSTOMER A, TAB_ACCOUNT B WHERE A.CUST_NO = B.CUST_NO) D
    ON A.PTNR_ACNT_NO = D.ACNT_NO  
  LEFT OUTER JOIN TBA_SYMBOL_INFO S
    ON A.SYMBOL 	= S.SYMBOL
 WHERE A.TRD_DATE	= '20200131'
   AND A.TRD_SEQ 	= 1;	
   
SELECT A.TRD_DATE						AS "trdDate"     		 
     , A.TRD_SEQ           				AS "trdSeq"     		
     , A.ACNT_NO            			AS "acntNo"     		
     , A.SUB_ACNT_NO        			AS "subAcntNo"     		
     , C.CUST_NM            			AS "custNm" 
     , S.TCKR_CODE        				AS "tckrCode"
     , S.SYMBOL_NM     					AS "symbolNm"
     , A.PTNR_ACNT_NO      				AS "ptnrAcntNo"  				
     , A.PTNR_SUB_ACNT_NO  				AS "ptnrSubAcntNo"
     , D.CUST_NM            			AS "ptnrCustNm"
     , A.TRD_QTY               			AS "trdQty"
     , A.TRD_PRC           				AS "trdPrc"
     , A.TRD_FEE           				AS "trdFee"
     , A.TRD_QTY * A.TRD_PRC   			AS "trdAmt"
     , A.BAL_QTY           				AS "balQty"
     , A.PURC_AMT          				AS "purcAmt"
     , NVL(V.APRV_PROC_STAT, '0')		AS "aprvProcStat"
  FROM TBA_OTC_BOND_TRADE_DTL A
  LEFT OUTER JOIN (SELECT B.ACNT_NO, A.CUST_NO, A.CUST_NM FROM TAA_CUSTOMER A, TAB_ACCOUNT B WHERE A.CUST_NO = B.CUST_NO) C
    ON A.ACNT_NO 	= C.ACNT_NO  
  LEFT OUTER JOIN (SELECT B.ACNT_NO, A.CUST_NO, A.CUST_NM FROM TAA_CUSTOMER A, TAB_ACCOUNT B WHERE A.CUST_NO = B.CUST_NO) D
    ON A.PTNR_ACNT_NO 	= D.ACNT_NO  
  LEFT OUTER JOIN TBA_SYMBOL_INFO S
    ON A.SYMBOL 	= S.SYMBOL
  LEFT OUTER JOIN TCC_APPROVAL_DETAIL V
    ON A.APRV_BIZ_CODE	= V.APRV_BIZ_CODE
   AND A.TRD_DATE		= V.APLC_DATE
   AND A.TRD_SEQ		= V.SEQ
 WHERE A.TRD_DATE	= '20200131'
   AND A.TRD_SEQ 	= 1;	
   
  
SELECT A.TRD_DATE						AS "trdDate"     		 
     , A.TRD_SEQ           				AS "trdSeq"     		
     , A.ACNT_NO            			AS "acntNo"     		
     , A.SUB_ACNT_NO        			AS "subAcntNo"     		
     , C.CUST_NM            			AS "custNm"     		
     , A.PTNR_ACNT_NO      				AS "ptnrAcntNo"  				
     , A.PTNR_SUB_ACNT_NO  				AS "ptnrSubAcntNo"
     , D.CUST_NM            			AS "ptnrCustNm"     
     , S.TCKR_CODE  					AS "tckrCode"
     , A.TRD_QTY                		AS "trdqty"
     , A.TRD_PRC           				AS "trdPrc"     			
     , A.TRD_QTY * A.TRD_PRC   			AS "trdAmt"			
     , A.TRD_FEE           				AS "trdFee"     			
     , NVL(V.APRV_PROC_STAT, '0')		AS "aprvProcStat"
  FROM TBA_OTC_BOND_TRADE_DTL A
  LEFT OUTER JOIN (SELECT B.ACNT_NO, A.CUST_NO, A.CUST_NM FROM TAA_CUSTOMER A, TAB_ACCOUNT B WHERE A.CUST_NO = B.CUST_NO) C
    ON A.ACNT_NO 		= C.ACNT_NO  
  LEFT OUTER JOIN (SELECT B.ACNT_NO, A.CUST_NO, A.CUST_NM FROM TAA_CUSTOMER A, TAB_ACCOUNT B WHERE A.CUST_NO = B.CUST_NO) D
    ON A.PTNR_ACNT_NO 	= D.ACNT_NO  
  LEFT OUTER JOIN TBA_SYMBOL_INFO S
    ON A.SYMBOL 	= S.SYMBOL
  LEFT OUTER JOIN TCC_APPROVAL_DETAIL V
    ON A.APRV_BIZ_CODE	= V.APRV_BIZ_CODE
   AND A.TRD_DATE		= V.APLC_DATE
   AND A.TRD_SEQ		= V.SEQ
 WHERE A.TRD_DATE		= '20200131'
   AND A.TRD_SEQ 		>= NVL(NULL, 0)
 ORDER BY A.TRD_SEQ; 
 

-- 승인내역
SELECT * 
  FROM TCC_APPROVAL_DETAIL;
 WHERE APLC_DATE = '20200131'
 ORDER BY SEQ;

-- 승인업무설정
SELECT *
  FROM TCC_APPROVAL_SET;

-- 승인업무설정
SELECT A.APRV_APLC_PRSN_ID
     , A.APRV_PROC_STAT
     , CASE WHEN B.APRV_TIMS_TP = '1' THEN A.APRV_PRSN_1ST_ID ELSE A.APRV_PRSN_2ND_ID END
     , CASE WHEN B.APRV_TIMS_TP = '1' THEN A.APRV_PROC_1ST_TMP ELSE A.APRV_PROC_2ND_TMP END
  FROM TCC_APPROVAL_DETAIL A, TCC_APPROVAL_SET B
 WHERE A.APRV_BIZ_CODE = B.APRV_BIZ_CODE AND B.SEQ = 0;
  

SELECT A.TRD_DATE						AS "trdDate"     		 
     , A.TRD_SEQ           				AS "trdSeq"     		
     , A.ACNT_NO            			AS "acntNo"     		
     , A.SUB_ACNT_NO        			AS "subAcntNo"     		
     , C.CUST_NM            			AS "custNm"     		
     , A.TRAN_SEQ      		  			AS "tranSeq"     		
     , A.PTNR_ACNT_NO      				AS "ptnrAcntNo"  				
     , A.PTNR_SUB_ACNT_NO  				AS "ptnrSubAcntNo"
     , D.CUST_NM            			AS "ptnrCustNm"     
     , A.PTNR_TRAN_SEQ 					AS "ptnrTranSeq"
     , S.TCKR_CODE  					AS "tckrCode"
     , S.SYMBOL_NM     					AS "symbolNm"
     , A.TRD_QTY                		AS "trdQty"
     , A.TRD_PRC           				AS "trdPrc"     			
     , A.TRD_QTY * A.TRD_PRC   			AS "trdAmt"			
     , A.TRD_FEE           				AS "trdFee"
     , V.APRV_APLC_PRSN_ID				AS "maker"
     , (CASE WHEN X.APRV_TIMS_TP = '1' THEN V.APRV_PRSN_1ST_ID ELSE V.APRV_PRSN_2ND_ID END)		AS "checker"
     , (CASE WHEN X.APRV_TIMS_TP = '1' THEN V.APRV_PROC_1ST_TMP ELSE V.APRV_PROC_2ND_TMP END)	AS "aprvTime"
     , NVL(V.APRV_PROC_STAT, '0')		AS "aprvProcStat"
  FROM TBA_OTC_BOND_TRADE_DTL A
  LEFT OUTER JOIN (SELECT B.ACNT_NO, A.CUST_NO, A.CUST_NM FROM TAA_CUSTOMER A, TAB_ACCOUNT B WHERE A.CUST_NO = B.CUST_NO) C
    ON A.ACNT_NO 		= C.ACNT_NO  
  LEFT OUTER JOIN (SELECT B.ACNT_NO, A.CUST_NO, A.CUST_NM FROM TAA_CUSTOMER A, TAB_ACCOUNT B WHERE A.CUST_NO = B.CUST_NO) D
    ON A.PTNR_ACNT_NO 	= D.ACNT_NO  
  LEFT OUTER JOIN TBA_SYMBOL_INFO S
    ON A.SYMBOL 	= S.SYMBOL
  LEFT OUTER JOIN TCC_APPROVAL_DETAIL V
    ON A.APRV_BIZ_CODE	= V.APRV_BIZ_CODE
   AND A.TRD_DATE		= V.APLC_DATE
   AND A.TRD_SEQ		= V.SEQ
  LEFT JOIN TCC_APPROVAL_SET X
    ON V.APRV_BIZ_CODE = X.APRV_BIZ_CODE 
   AND X.SEQ = 0
 WHERE A.TRD_DATE			BETWEEN '20200130' AND '20200131'
 ORDER BY A.TRD_SEQ
 
 