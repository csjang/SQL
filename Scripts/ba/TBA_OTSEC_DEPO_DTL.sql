DROP TABLE TBA_OTSEC_DEPO_DTL;
CREATE TABLE TBA_OTSEC_DEPO_DTL(
    RECV_DATE          VARCHAR2(8)    NOT NULL,
    RECV_SEQ          NUMBER    NOT NULL,
    APRV_BIZ_CODE          VARCHAR2(3)    NOT NULL,
    ACNT_NO          VARCHAR2(8)    NOT NULL,
    SUB_ACNT_NO          VARCHAR2(9)    NOT NULL,
    SYMBOL          VARCHAR2(12)    NOT NULL,
    TRNS_BAL_TP          VARCHAR2(2)    NOT NULL,
    QTY          NUMBER    DEFAULT '0'    NOT NULL,
    ACQT_PRC          NUMBER    DEFAULT '0'    NOT NULL,
    ACQT_AMT          NUMBER    DEFAULT '0'    NOT NULL,
    PTNR_ACNT_NO          VARCHAR2(8),
    PTNR_SUB_ACNT_NO          VARCHAR2(9),
    PTNR_VSD_ACNT_NO          VARCHAR2(10),
    PTNR_SECF_CODE          VARCHAR2(10),
    PTNR_SECF_ACNT_NO          VARCHAR2(30),
    CERT_NO          VARCHAR2(50),
    SE_IO_FEE          NUMBER    DEFAULT '0'    NOT NULL,
    TRAN_DATE          VARCHAR2(8),
    TRAN_SEQ          NUMBER    DEFAULT '0'    NOT NULL,
    AUTO_APRV_YN          VARCHAR2(1),
    MIR          VARCHAR2(28),
    WRKR_ID          VARCHAR2(20),
    WRK_TMP          NUMBER,
CONSTRAINT TBA_OTSEC_DEPO_DTL_PK PRIMARY KEY(RECV_DATE,RECV_SEQ)
);


SELECT A.RECV_DATE						AS "recvDate"     		 
     , A.RECV_SEQ           			AS "recvSeq" 
     , D.VSD_ACNT_NO           			AS "vsdAcntNo" 
     , C.CUST_NM            			AS "custNm"     		
     , A.APRV_BIZ_CODE         			AS "aprvBizCode"     		
     , S.TCKR_CODE  					AS "tckrCode"
     , S.SYMBOL_ABBR_NM     			AS "symbolAbbrNm"
     , A.QTY                			AS "qty"
     , A.ACQT_PRC           			AS "acqtPrc"     			
     , A.ACQT_AMT   					AS "acqtAmt"			
     , A.PTNR_ACNT_NO            		AS "ptnrAcntNo"     		
     , A.PTNR_SUB_ACNT_NO      			AS "ptnrSubAcntNo"     		
     , A.PTNR_SECF_CODE      			AS "ptnrSecfCode"
     , A.PTNR_SECF_ACNT_NO				AS "ptnrSecfAcntNo"     		
     , A.TRAN_DATE						AS "tranDate"  				
     , A.TRAN_SEQ						AS "tranSeq"  				
     , V.VSD_APRV_PROC_STAT				AS "vsdAprvProcStat"  				
     , V.APRV_PROC_STAT					AS "aprvProcStat"
  FROM TBA_OTSEC_DEPO_DTL A
  LEFT OUTER JOIN (SELECT B.ACNT_NO, A.CUST_NO, A.CUST_NM FROM TAA_CUSTOMER A, TAB_ACCOUNT B WHERE A.CUST_NO = B.CUST_NO) C
    ON A.ACNT_NO 	= C.ACNT_NO  
  LEFT OUTER JOIN TAB_ACCOUNT D 
    ON A.ACNT_NO 	= D.ACNT_NO  
  LEFT OUTER JOIN TBA_SYMBOL_INFO S
    ON A.SYMBOL 	= S.SYMBOL
  LEFT OUTER JOIN TCC_APPROVAL_DETAIL V
    ON A.APRV_BIZ_CODE	= V.APRV_BIZ_CODE
   AND A.TRAN_DATE		= V.APLC_DATE
   AND A.TRAN_SEQ		= V.SEQ
 WHERE (
 	   A.RECV_DATE			BETWEEN '20200117' AND '20200120'
   AND A.APRV_BIZ_CODE		LIKE CONCAT(CONCAT('%', ''), '%')
   AND A.ACNT_NO 			LIKE CONCAT(CONCAT('%', ''), '%')
   AND A.SUB_ACNT_NO		LIKE CONCAT(CONCAT('%', ''), '%')
   AND S.TCKR_CODE			LIKE CONCAT(CONCAT('%', ''), '%') );


  SELECT V.APRV_APLC_PROC_STAT, V.APRV_PROC_STAT
  FROM TCC_APPROVAL_DETAIL V
 WHERE V.APRV_BIZ_CODE IN ('131', '133')
   AND V.APLC_DATE = '20200120';