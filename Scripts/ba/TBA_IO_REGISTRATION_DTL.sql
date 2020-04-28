DROP TABLE TBA_IO_REGISTRATION_DTL;
CREATE TABLE TBA_IO_REGISTRATION_DTL(
    APLC_DATE          VARCHAR2(8)    NOT NULL,
    APLC_SEQ          NUMBER    NOT NULL,
    APRV_BIZ_CODE          VARCHAR2(3)    NOT NULL,
    ACNT_NO          VARCHAR2(8)    NOT NULL,
    SUB_ACNT_NO          VARCHAR2(9)    NOT NULL,
    SYMBOL          VARCHAR2(12)    NOT NULL,
    TRNS_BAL_TP          VARCHAR2(2)    NOT NULL,
    IO_TP          VARCHAR2(1)    DEFAULT '0'    NOT NULL,
    QTY          NUMBER    DEFAULT '0'    NOT NULL,
    ACQT_PRC          NUMBER    DEFAULT '0'    NOT NULL,
    PTNR_ACNT_NO          VARCHAR2(8),
    PTNR_SUB_ACNT_NO          VARCHAR2(9),
    PTNR_VSD_ACNT_NO          VARCHAR2(10),
    PTNR_SECF_CODE          VARCHAR2(10),
    PTNR_SECF_ACNT_NO          VARCHAR2(30),
    CERT_NO          VARCHAR2(50),
    SE_IO_FEE          NUMBER    DEFAULT '0'    NOT NULL,
    VSD_MUR          VARCHAR2(16),
    VSD_MIR          VARCHAR2(28),
    TRAN_DATE          VARCHAR2(8),
    TRAN_SEQ          NUMBER    DEFAULT '0'    NOT NULL,
    PTNR_TRAN_SEQ          NUMBER    DEFAULT '0'    NOT NULL,
    WRKR_ID          VARCHAR2(20),
    WRK_TMP          NUMBER,
CONSTRAINT TBA_IO_REGISTRATION_DTL_PK PRIMARY KEY(APLC_DATE,APLC_SEQ)
);

SELECT *
  FROM ALL_TAB_COMMENTS
 WHERE TABLE_NAME LIKE 'TB%';

SELECT * FROM (
SELECT A.APLC_DATE						AS "aplcDate"     		 
     , A.APLC_SEQ           			AS "aplcSeq"     		
     , A.ACNT_NO            			AS "acntNo"     		
     , A.SUB_ACNT_NO        			AS "subAcntNo"     		
     , C.CUST_NM            			AS "custNm"     		
     , A.IO_TP             				AS "ioTp"  				
     , S.TCKR_CODE        				AS "tckrCode"
     , A.QTY                			AS "qty"
     , A.ACQT_PRC           			AS "acqtPrc"     			
     , A.QTY * A.ACQT_PRC   			AS "purcAmt"			
     , V.APRV_PROC_STAT					AS "aprvProcStat"
  FROM TBA_IO_REGISTRATION_DTL A
  LEFT OUTER JOIN (SELECT ACNT_NO, CUST_NM FROM TAA_CUSTOMER A, TAB_ACCOUNT B WHERE A.CUST_NO = B.CUST_NO) C
    ON A.ACNT_NO 	= C.ACNT_NO  
  LEFT OUTER JOIN TBA_SYMBOL_INFO S
    ON A.SYMBOL 	= S.SYMBOL
  LEFT OUTER JOIN TCC_APPROVAL_DETAIL V
    ON A.APRV_BIZ_CODE	= V.APRV_BIZ_CODE
   AND A.APLC_DATE		= V.APLC_DATE
   AND A.APLC_SEQ		= V.SEQ
 WHERE (
 	   A.APLC_DATE			= '20200115'
   AND A.CNCL_YN			LIKE CONCAT(CONCAT('%', ''), '%') )
   AND A.APLC_SEQ 			>= NVL(NULL, 0)
 ORDER BY A.APLC_SEQ
)WHERE ROWNUM <= 50;  

SELECT A.APLC_DATE						AS "aplcDate"     		 
     , A.APLC_SEQ           			AS "aplcSeq"     		
     , A.ACNT_NO            			AS "acntNo"     		
     , A.SUB_ACNT_NO        			AS "subAcntNo"     		
     , C.CUST_NM            			AS "custNm"     		
     , A.IO_TP             				AS "ioTp"  				
     , S.TCKR_CODE        				AS "tckrCode"
     , A.QTY                			AS "qty"
     , A.ACQT_PRC           			AS "acqtPrc"     			
     , A.QTY * A.ACQT_PRC   			AS "purcAmt"			
     , NVL(V.APRV_PROC_STAT, '0')		AS "aprvProcStat"
  FROM TBA_IO_REGISTRATION_DTL A
  LEFT OUTER JOIN (SELECT B.ACNT_NO, A.CUST_NO, A.CUST_NM FROM TAA_CUSTOMER A, TAB_ACCOUNT B WHERE A.CUST_NO = B.CUST_NO) C
    ON A.ACNT_NO 	= C.ACNT_NO  
  LEFT OUTER JOIN TBA_SYMBOL_INFO S
    ON A.SYMBOL 	= S.SYMBOL
  LEFT OUTER JOIN TCC_APPROVAL_DETAIL V
    ON A.APRV_BIZ_CODE	= V.APRV_BIZ_CODE
   AND A.APLC_DATE		= V.APLC_DATE
   AND A.APLC_SEQ		= V.SEQ
 WHERE (
 	   A.APLC_DATE		= '20200115'
   AND A.CNCL_YN		LIKE CONCAT(CONCAT('%', ''), '%') )
   AND A.APLC_SEQ 		>= NVL(NULL, 0)
 ORDER BY A.APLC_SEQ
 
 
 
 SELECT A.APLC_DATE						AS "aplcDate"     		 
     , A.APLC_SEQ           			AS "aplcSeq"     		
     , A.ACNT_NO            			AS "acntNo"     		
     , A.SUB_ACNT_NO        			AS "subAcntNo"     		
     , C.CUST_NM            			AS "custNm"     		
     , A.APRV_BIZ_CODE     				AS "aprvBizCode"  				
     , A.PTNR_ACNT_NO      				AS "ptnrAcntNo"  				
     , A.PTNR_SUB_ACNT_NO  				AS "ptnrSubAcntNo"
     , S.TCKR_CODE  					AS "tckrCode"
     , A.QTY                			AS "qty"
     , A.ACQT_PRC           			AS "acqtPrc"     			
     , A.QTY * A.ACQT_PRC   			AS "purcAmt"			
     , NVL(V.APRV_PROC_STAT, '0')		AS "aprvProcStat"
  FROM TBA_IO_REGISTRATION_DTL A
  LEFT OUTER JOIN (SELECT B.ACNT_NO, A.CUST_NO, A.CUST_NM FROM TAA_CUSTOMER A, TAB_ACCOUNT B WHERE A.CUST_NO = B.CUST_NO) C
    ON A.ACNT_NO 	= C.ACNT_NO  
  LEFT OUTER JOIN TBA_SYMBOL_INFO S
    ON A.SYMBOL 	= S.SYMBOL
  LEFT OUTER JOIN TCC_APPROVAL_DETAIL V
    ON A.APRV_BIZ_CODE	= V.APRV_BIZ_CODE
   AND A.APLC_DATE		= V.APLC_DATE
   AND A.APLC_SEQ		= V.SEQ
 WHERE (
 	   A.APLC_DATE		= '20200116'
   AND A.CNCL_YN		LIKE CONCAT(CONCAT('%', ''), '%')
   AND A.APRV_BIZ_CODE 	IN ('130', '131') )
   AND A.APLC_SEQ 		>= NVL(null, 0)
 ORDER BY A.APLC_SEQ
 
 
 SELECT A.APLC_DATE						AS "aplcDate"     		 
     , A.APLC_SEQ           			AS "aplcSeq"     		
     , A.ACNT_NO            			AS "acntNo"     		
     , A.SUB_ACNT_NO        			AS "subAcntNo"     		
     , C.CUST_NM            			AS "custNm" 
     , A.APRV_BIZ_CODE     				AS "aprvBizCode"    		
     , A.TRNS_BAL_TP       				AS "trnsBalTp"
     , S.TCKR_CODE        				AS "tckrCode"
     , S.SYMBOL_ABBR_NM     			AS "symbolAbbrNm"
     , A.PTNR_ACNT_NO      				AS "ptnrAcntNo"  				
     , A.PTNR_SUB_ACNT_NO  				AS "ptnrSubAcntNo"
     , D.CUST_NM            			AS "ptnrAcntNm"
     , A.QTY                			AS "qty"
     , A.ACQT_PRC           			AS "acqtPrc"
     , A.SE_IO_FEE           			AS "seIoFee"
     , A.QTY * A.ACQT_PRC   			AS "purcAmt"
     , A.CNCL_YN           				AS "cnclYn"
     , NVL(V.APRV_PROC_STAT, '0')		AS "aprvProcStat"
  FROM TBA_IO_REGISTRATION_DTL A
  LEFT OUTER JOIN (SELECT B.ACNT_NO, A.CUST_NO, A.CUST_NM FROM TAA_CUSTOMER A, TAB_ACCOUNT B WHERE A.CUST_NO = B.CUST_NO) C
    ON A.ACNT_NO 	= C.ACNT_NO  
  LEFT OUTER JOIN (SELECT B.ACNT_NO, A.CUST_NO, A.CUST_NM FROM TAA_CUSTOMER A, TAB_ACCOUNT B WHERE A.CUST_NO = B.CUST_NO) D
    ON A.ACNT_NO 	= D.ACNT_NO  
  LEFT OUTER JOIN TBA_SYMBOL_INFO S
    ON A.SYMBOL 	= S.SYMBOL
  LEFT OUTER JOIN TCC_APPROVAL_DETAIL V
    ON A.APRV_BIZ_CODE	= V.APRV_BIZ_CODE
   AND A.APLC_DATE		= V.APLC_DATE
   AND A.APLC_SEQ		= V.SEQ
 WHERE A.APLC_DATE	= '20200116'
   AND A.APLC_SEQ 	= 2;
  
  
-- 3022 : 타사대체 입출고   
SELECT A.APLC_DATE						AS "aplcDate"     		 
     , A.APLC_SEQ           			AS "aplcSeq"     		
     , A.ACNT_NO            			AS "acntNo"     		
     , A.SUB_ACNT_NO        			AS "subAcntNo"     		
     , A.IO_TP        					AS "ioTp"     		
     , C.CUST_NM            			AS "custNm"     		
     , A.PTNR_SECF_CODE      			AS "ptnrSecfCode"  				
     , A.PTNR_SECF_ACNT_NO  			AS "ptnrSecfAcntNo"
     , S.TCKR_CODE  					AS "tckrCode"
     , A.QTY                			AS "qty"
     , A.ACQT_PRC           			AS "acqtPrc"     			
     , A.QTY * A.ACQT_PRC   			AS "purcAmt"			
     , NVL(V.APRV_PROC_STAT, '0')		AS "aprvProcStat"
  FROM TBA_IO_REGISTRATION_DTL A
  LEFT OUTER JOIN (SELECT B.ACNT_NO, A.CUST_NO, A.CUST_NM FROM TAA_CUSTOMER A, TAB_ACCOUNT B WHERE A.CUST_NO = B.CUST_NO) C
    ON A.ACNT_NO 	= C.ACNT_NO  
  LEFT OUTER JOIN TBA_SYMBOL_INFO S
    ON A.SYMBOL 	= S.SYMBOL
  LEFT OUTER JOIN TCC_APPROVAL_DETAIL V
    ON A.APRV_BIZ_CODE	= V.APRV_BIZ_CODE
   AND A.APLC_DATE		= V.APLC_DATE
   AND A.APLC_SEQ		= V.SEQ
 WHERE (
 	   A.APLC_DATE		= '20200117'
   AND A.CNCL_YN		LIKE CONCAT(CONCAT('%', ''), '%')
   AND A.APRV_BIZ_CODE 	IN ('132', '133') )
   AND A.APLC_SEQ 		>= NVL(null, 0)
 ORDER BY A.APLC_SEQ;


SELECT A.APLC_DATE						AS "aplcDate"     		 
     , A.APLC_SEQ           			AS "aplcSeq"     		
     , A.ACNT_NO            			AS "acntNo"     		
     , A.SUB_ACNT_NO        			AS "subAcntNo"     		
     , C.CUST_NM            			AS "custNm"     		
     , A.IO_TP        					AS "ioTp"     		
     , A.PTNR_SECF_CODE      			AS "ptnrSecfCode"
     , D.ORG_NM							AS "ptnrSecfNm"  				
     , A.PTNR_SECF_ACNT_NO  			AS "ptnrSecfAcntNo"
     , S.TCKR_CODE  					AS "tckrCode"
     , A.QTY                			AS "qty"
     , A.ACQT_PRC           			AS "acqtPrc"     			
     , A.QTY * A.ACQT_PRC   			AS "purcAmt"			
     , NVL(V.APRV_PROC_STAT, '0')		AS "aprvProcStat"
  FROM TBA_IO_REGISTRATION_DTL A
  LEFT OUTER JOIN (SELECT B.ACNT_NO, A.CUST_NO, A.CUST_NM FROM TAA_CUSTOMER A, TAB_ACCOUNT B WHERE A.CUST_NO = B.CUST_NO) C
    ON A.ACNT_NO 	= C.ACNT_NO  
  LEFT OUTER JOIN TCA_RELATED_ORG D
    ON A.PTNR_SECF_CODE = D.ORG_CODE
   AND D.ORG_TP = '2'
  LEFT OUTER JOIN TBA_SYMBOL_INFO S
    ON A.SYMBOL 	= S.SYMBOL
  LEFT OUTER JOIN TCC_APPROVAL_DETAIL V
    ON A.APRV_BIZ_CODE	= V.APRV_BIZ_CODE
   AND A.APLC_DATE		= V.APLC_DATE
   AND A.APLC_SEQ		= V.SEQ
 WHERE (
 	   A.APLC_DATE		= '20200117'
   AND A.CNCL_YN		LIKE CONCAT(CONCAT('%', ''), '%')
   AND A.APRV_BIZ_CODE 	IN ('132', '133') )
   AND A.APLC_SEQ 		>= NVL(null, 0)
 ORDER BY A.APLC_SEQ;
 


SELECT 
	 'Application Date       : '|| TO_CHAR(TO_DATE(A.APLC_DATE, 'YYYYMMDD'), 'DD/MM/YYYY') || Chr(13) || Chr(10) ||
	 'Sequance               : '|| A.APLC_SEQ || Chr(13) || Chr(10) ||
	 'PNTR Account No.       : '|| A.ACNT_NO || ' - ' || A.SUB_ACNT_NO || Chr(13) || Chr(10) ||		
	 'PNTR Account Name      : '|| C.CUST_NM || Chr(13) || Chr(10) ||
	 'I/O Type               : '|| (SELECT VAL FROM TXC_VALID_VALUES WHERE TERM = 'IO_TP' AND CODE = A.IO_TP AND LANG_TP = 'ko') || Chr(13) || Chr(10) ||		
	 'Balance Class          : '|| (SELECT VAL FROM TXC_VALID_VALUES WHERE TERM = 'TRNS_BAL_TP' AND CODE = A.TRNS_BAL_TP AND LANG_TP = 'ko') || Chr(13) || Chr(10) ||	
	 'Other Firm Name        : '|| A.PTNR_SECF_CODE || ' - ' || D.ORG_NM || Chr(13) || Chr(10) ||		
	 'Other Firm Account No. : '|| A.PTNR_SECF_ACNT_NO || Chr(13) || Chr(10) ||		
	 'Symbol                 : '|| S.TCKR_CODE || ' -  ' || S.SYMBOL_NM || Chr(13) || Chr(10) || 
	 'Quantity               : '|| TO_CHAR(A.QTY,'999,999,999,999') || Chr(13) || Chr(10) ||
	 'Purchase Price         : '|| TO_CHAR(A.ACQT_PRC,'999,999,999,999') || Chr(13) || Chr(10) ||
	 'Purchase Amount        : '|| TO_CHAR(A.QTY*A.ACQT_PRC,'999,999,999,999') || Chr(13) || Chr(10) ||
	 'Fee                    : '|| TO_CHAR(A.SE_IO_FEE,'999,999,999,999') || Chr(13) || Chr(10) AS "contents"
  FROM TBA_IO_REGISTRATION_DTL A
  LEFT OUTER JOIN (SELECT B.ACNT_NO, A.CUST_NO, A.CUST_NM FROM TAA_CUSTOMER A, TAB_ACCOUNT B WHERE A.CUST_NO = B.CUST_NO) C
    ON A.ACNT_NO 	= C.ACNT_NO  
  LEFT OUTER JOIN TCA_RELATED_ORG D
    ON A.PTNR_SECF_CODE = D.ORG_CODE
   AND D.ORG_TP = '02'
  LEFT OUTER JOIN TBA_SYMBOL_INFO S
    ON A.SYMBOL 	= S.SYMBOL
 WHERE A.APLC_DATE	= '20200128'
   AND A.APLC_SEQ 	= 1;	
  
   
   
SELECT A.APLC_DATE						AS "aplcDate"     		 
     , A.APLC_SEQ           			AS "recvSeq" 
     , A.ACNT_NO           				AS "acntNo" 
     , A.SUB_ACNT_NO           			AS "subAcntNo" 
     , C.CUST_NM            			AS "custNm"     		
     , A.APRV_BIZ_CODE         			AS "aprvBizCode"     		
     , A.IO_TP         					AS "ioTp"     		
     , S.TCKR_CODE  					AS "tckrCode"
     , S.SYMBOL_ABBR_NM     			AS "symbolAbbrNm"
     , A.QTY                			AS "qty"
     , A.ACQT_PRC           			AS "acqtPrc"     			
     , A.QTY * A.ACQT_PRC   			AS "purcAmt"
	 , A.SE_IO_FEE           			AS "seIoFee"     
     , A.PTNR_ACNT_NO            		AS "ptnrAcntNo"     		
     , A.PTNR_SUB_ACNT_NO      			AS "ptnrSubAcntNo"     		
     , A.PTNR_SECF_CODE      			AS "ptnrSecfCode"
     , A.PTNR_SECF_ACNT_NO				AS "ptnrSecfAcntNo"     		
     , A.CNCL_YN						AS "cnclYn"     		
     , V.VSD_APRV_PROC_STAT				AS "vsdAprvProcStat"  				
     , V.APRV_PROC_STAT					AS "aprvProcStat"
  FROM TBA_IO_REGISTRATION_DTL A
  LEFT OUTER JOIN (SELECT B.ACNT_NO, A.CUST_NO, A.CUST_NM FROM TAA_CUSTOMER A, TAB_ACCOUNT B WHERE A.CUST_NO = B.CUST_NO) C
    ON A.ACNT_NO 	= C.ACNT_NO  
  LEFT OUTER JOIN TBA_SYMBOL_INFO S
    ON A.SYMBOL 	= S.SYMBOL
  LEFT OUTER JOIN TCC_APPROVAL_DETAIL V
    ON A.APRV_BIZ_CODE	= V.APRV_BIZ_CODE
   AND A.APLC_DATE		= V.APLC_DATE
   AND A.APLC_SEQ		= V.SEQ
 WHERE (
 	   A.APLC_DATE			BETWEEN '20200121' AND '20200121'
   AND A.APRV_BIZ_CODE		LIKE CONCAT(CONCAT('%', ''), '%')
   AND A.IO_TP				LIKE CONCAT(CONCAT('%', ''), '%')
   AND A.ACNT_NO 			LIKE CONCAT(CONCAT('%', ''), '%')
   AND A.SUB_ACNT_NO		LIKE CONCAT(CONCAT('%', ''), '%')
   AND S.TCKR_CODE			LIKE CONCAT(CONCAT('%', ''), '%') )
   AND CONCAT(A.APLC_DATE, A.APLC_SEQ) >= NVL(null, ' ')
 ORDER BY A.APLC_DATE, A.APLC_SEQ;
 

-- 증권입출고내역 
SELECT *
  FROM TBA_IO_REGISTRATION_DTL
 WHERE APLC_DATE = '20200122';   
 
-- 승인내역
SELECT *
  FROM TCC_APPROVAL_DETAIL
 WHERE APRV_BIZ_CODE IN ('128', '129', '130', '131', '132', '133', '134', '135', '136', '137', '138')
 ORDER BY SEQ;
 
-- 고객
SELECT *
  FROM TAA_CUSTOMER;
 
SELECT A.CUST_NO
     , A.CUST_NM 
  FROM TAA_CUSTOMER A
  LEFT JOIN TAB_ACCOUNT B
    ON A.CUST_NO = B.CUST_NO
  WHERE B.ACNT_NO = '00000028';
 
 