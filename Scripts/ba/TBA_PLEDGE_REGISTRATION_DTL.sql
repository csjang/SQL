DROP TABLE TBA_PLEDGE_REGISTRATION_DTL;
CREATE TABLE TBA_PLEDGE_REGISTRATION_DTL(
    APLC_DATE          VARCHAR2(8)    NOT NULL,
    APLC_SEQ          NUMBER    NOT NULL,
    APRV_BIZ_CODE          VARCHAR2(3)    NOT NULL,
    ACNT_NO          VARCHAR2(8)    NOT NULL,
    SUB_ACNT_NO          VARCHAR2(9)    NOT NULL,
    SYMBOL          VARCHAR2(12)    NOT NULL,
    TRNS_BAL_TP          VARCHAR2(2)    NOT NULL,
    MRTG_BIZ_TP          VARCHAR2(1)    NOT NULL,
    SET_CLR_TP          VARCHAR2(1)    NOT NULL,
    SET_QTY          NUMBER    DEFAULT '0'    NOT NULL,
    CLR_QTY          NUMBER    DEFAULT '0'    NOT NULL,
    ACQT_PRC          NUMBER    DEFAULT '0'    NOT NULL,
    SET_ORG_TP          VARCHAR2(2),
    SET_ORG_CODE          VARCHAR2(10),
    CERT_NO          VARCHAR2(50),
    SET_CLR_FEE          NUMBER    DEFAULT '0'    NOT NULL,
    VSD_MUR          VARCHAR2(16),
    VSD_MIR          VARCHAR2(28),
    SET_APLC_DATE          VARCHAR2(8),
    SET_APLC_SEQ          NUMBER    DEFAULT '0'    NOT NULL,
    BFPROC_SET_QTY          NUMBER    DEFAULT '0'    NOT NULL,
    WRKR_ID          VARCHAR2(20),
    WRK_TMP          NUMBER,
CONSTRAINT TBA_PLEDGE_REGISTRATION_DTL_PK PRIMARY KEY(APLC_DATE,APLC_SEQ)
);



SELECT A.APLC_DATE						AS "aplcDate"     		 
     , A.APLC_SEQ           			AS "aplcSeq"     		
     , A.ACNT_NO            			AS "acntNo"     		
     , A.SUB_ACNT_NO        			AS "subAcntNo"     		
     , C.CUST_NM            			AS "custNm" 
     , A.APRV_BIZ_CODE     				AS "aprvBizCode"    		
     , A.SET_ORG_TP       				AS "setOrgTp"
     , A.SET_ORG_CODE      				AS "setOrgCode"
     , D.ORG_NM      					AS "orgNm"
     , S.TCKR_CODE        				AS "tckrCode"
     , A.ACQT_PRC           			AS "acqtPrc"
     , NVL(V.APRV_PROC_STAT, '0')		AS "aprvProcStat"
  FROM TBA_PLEDGE_REGISTRATION_DTL A
  LEFT OUTER JOIN (SELECT B.ACNT_NO, A.CUST_NO, A.CUST_NM FROM TAA_CUSTOMER A, TAB_ACCOUNT B WHERE A.CUST_NO = B.CUST_NO) C
    ON A.ACNT_NO 	= C.ACNT_NO  
  LEFT OUTER JOIN TCA_RELATED_ORG D
    ON A.SET_ORG_TP		= D.ORG_TP
   AND A.SET_ORG_CODE	= D.ORG_CODE
  LEFT OUTER JOIN TBA_SYMBOL_INFO S
    ON A.SYMBOL 	= S.SYMBOL
  LEFT OUTER JOIN TCC_APPROVAL_DETAIL V
    ON A.APRV_BIZ_CODE	= V.APRV_BIZ_CODE
   AND A.APLC_DATE		= V.APLC_DATE
   AND A.APLC_SEQ		= V.SEQ
 WHERE (
 	   A.APLC_DATE		= '20200129'
   AND A.APRV_BIZ_CODE 	IN ('134', '135') )
   AND A.APLC_SEQ 		>= NVL(NULL, 0)
 ORDER BY A.APLC_SEQ;
 

SELECT *
  FROM TBA_PLEDGE_REGISTRATION_DTL;

SELECT 
	 'Application Date  : '|| TO_CHAR(TO_DATE(A.APLC_DATE, 'YYYYMMDD'), 'DD/MM/YYYY') || Chr(13) || Chr(10) ||
	 'Sequance          : '|| A.APLC_SEQ || Chr(13) || Chr(10) ||
	 'Account No.       : '|| A.ACNT_NO || ' - ' || A.SUB_ACNT_NO || Chr(13) || Chr(10) ||		
	 'Account Name      : '|| C.CUST_NM || Chr(13) || Chr(10) ||		
	 'Type              : '|| CASE WHEN A.APRV_BIZ_CODE='134' THEN 'Block' ELSE 'Unblock' END || Chr(13) || Chr(10) ||
	 'Set Date          : '|| NVL(TO_CHAR(TO_DATE(A.SET_APLC_DATE, 'YYYYMMDD'), 'DD/MM/YYYY'), '') || Chr(13) || Chr(10) ||
	 'Sequance          : '|| A.SET_APLC_SEQ || Chr(13) || Chr(10) ||
	 'Organization      : '|| A.SET_ORG_TP || ' - ' || A.SET_ORG_CODE || '(' || D.ORG_NM || ')' ||Chr(13) || Chr(10) ||
	 'Symbol            : '|| S.TCKR_CODE || ' -  ' || S.SYMBOL_NM || Chr(13) || Chr(10) || 
	 'Quantity          : '|| CASE WHEN A.APRV_BIZ_CODE='134' THEN TO_CHAR(A.SET_QTY,'999,999,999,999') ELSE TO_CHAR(A.CLR_QTY,'999,999,999,999') END || Chr(13) || Chr(10) ||
	 'Purchase Price    : '|| TO_CHAR(A.ACQT_PRC,'999,999,999,999') || Chr(13) || Chr(10) ||
	 'Purchase Amount   : '|| CASE WHEN A.APRV_BIZ_CODE='134' THEN TO_CHAR(A.SET_QTY*A.ACQT_PRC,'999,999,999,999') ELSE TO_CHAR(A.CLR_QTY*A.ACQT_PRC,'999,999,999,999') END || Chr(13) || Chr(10) ||
	 'Fee               : '|| TO_CHAR(A.SET_CLR_FEE,'999,999,999,999') || Chr(13) || Chr(10) ||
	 'Certificate No    : '|| A.CERT_NO || Chr(13) || Chr(10) AS "contents"
  FROM TBA_PLEDGE_REGISTRATION_DTL A
  LEFT OUTER JOIN (SELECT B.ACNT_NO, A.CUST_NO, A.CUST_NM FROM TAA_CUSTOMER A, TAB_ACCOUNT B WHERE A.CUST_NO = B.CUST_NO) C
    ON A.ACNT_NO 	= C.ACNT_NO  
  LEFT OUTER JOIN TCA_RELATED_ORG D
    ON A.SET_ORG_TP		= D.ORG_TP
   AND A.SET_ORG_CODE	= D.ORG_CODE
  LEFT OUTER JOIN TBA_SYMBOL_INFO S
    ON A.SYMBOL 	= S.SYMBOL
 WHERE A.APLC_DATE	= '20200129'
   AND A.APLC_SEQ 	= 1;	

  
SELECT *
  FROM TBA_PLEDGE_REGISTRATION_DTL A
 WHERE A.APLC_DATE		= '20200130'
 ORDER BY A.APLC_SEQ;


SELECT A.APLC_DATE						AS "aplcDate"     		 
     , A.APLC_SEQ           			AS "aplcSeq" 
     , A.ACNT_NO           				AS "acntNo" 
     , A.SUB_ACNT_NO           			AS "subAcntNo" 
     , C.CUST_NM            			AS "custNm"     		
     , A.MRTG_BIZ_TP       				AS "mrtgBizTp"
     , A.SET_CLR_TP    					AS "setClrTp"
     , S.TCKR_CODE  					AS "tckrCode"
     , S.SYMBOL_NM     					AS "symbolNm"
     , A.ACQT_PRC           			AS "acqtPrc"     			
	 , A.SET_CLR_FEE           			AS "setClrFee"  
     , A.SET_ORG_TP            			AS "setOrgTp"     		
     , D.ORG_NM      					AS "orgNm"     		
     , A.SET_APLC_DATE      			AS "setAplcDate"
     , A.SET_APLC_SEQ					AS "setAplcSeq"     		
     , NVL(V.APRV_PROC_STAT, '0')		AS "aprvProcStat"     
  FROM TBA_PLEDGE_REGISTRATION_DTL A
  LEFT OUTER JOIN (SELECT B.ACNT_NO, A.CUST_NO, A.CUST_NM FROM TAA_CUSTOMER A, TAB_ACCOUNT B WHERE A.CUST_NO = B.CUST_NO) C
    ON A.ACNT_NO 	= C.ACNT_NO
  LEFT OUTER JOIN TCA_RELATED_ORG D
    ON A.SET_ORG_TP		= D.ORG_TP
   AND A.SET_ORG_CODE	= D.ORG_CODE
  LEFT OUTER JOIN TBA_SYMBOL_INFO S
    ON A.SYMBOL 	= S.SYMBOL
  LEFT OUTER JOIN TCC_APPROVAL_DETAIL V
    ON A.APRV_BIZ_CODE	= V.APRV_BIZ_CODE
   AND A.APLC_DATE		= V.APLC_DATE
   AND A.APLC_SEQ		= V.SEQ
 WHERE (
 	   A.APLC_DATE			BETWEEN '20200101' AND '20200130'
   AND A.MRTG_BIZ_TP		LIKE CONCAT(CONCAT('%', ''), '%')
   AND A.SET_CLR_TP			LIKE CONCAT(CONCAT('%', ''), '%')
   AND A.ACNT_NO 			LIKE CONCAT(CONCAT('%', ''), '%')
   AND A.SUB_ACNT_NO		LIKE CONCAT(CONCAT('%', ''), '%')
   AND S.TCKR_CODE			LIKE CONCAT(CONCAT('%', ''), '%') )
   AND CONCAT(A.APLC_DATE, A.APLC_SEQ) >= NVL(NULL, ' ')
 ORDER BY A.APLC_DATE, A.APLC_SEQ;
 
 
 