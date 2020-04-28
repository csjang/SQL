DROP TABLE TBA_OTDEPO_ACNT_BAL_REGI_MSTR;
CREATE TABLE TBA_OTDEPO_ACNT_BAL_REGI_MSTR(
    PROC_DATE          VARCHAR2(8)    NOT NULL,
    PROC_SEQ          NUMBER    NOT NULL,
    APRV_BIZ_CODE          VARCHAR2(3)    NOT NULL,
    ACNT_NO          VARCHAR2(8)    NOT NULL,
    SUB_ACNT_NO          VARCHAR2(9)    NOT NULL,
    CURR_CODE          VARCHAR2(3),
    AMT          NUMBER    DEFAULT '0'    NOT NULL,
    TRAN_SEQ          NUMBER    DEFAULT '0'    NOT NULL,
    WRKR_ID          VARCHAR2(20),
    WRK_TMP          NUMBER,
PRIMARY KEY(PROC_DATE,PROC_SEQ)
);

DROP TABLE TBA_OTDEPO_ACNT_BAL_REGI_DETL;
CREATE TABLE TBA_OTDEPO_ACNT_BAL_REGI_DETL(
    PROC_DATE          VARCHAR2(8)    NOT NULL,
    PROC_SEQ          NUMBER    NOT NULL,
    SYMBOL          VARCHAR2(12)    NOT NULL,
    QTY          NUMBER    DEFAULT '0'    NOT NULL,
    TRAN_SEQ          NUMBER    DEFAULT '0'    NOT NULL,
    WRKR_ID          VARCHAR2(20),
    WRK_TMP          NUMBER,
PRIMARY KEY(PROC_DATE,PROC_SEQ,SYMBOL)
);

SELECT A.RECV_DATE						AS "recvDate"     		 
     , A.ACNT_NO            			AS "acntNo"     		
     , A.SUB_ACNT_NO        			AS "subAcntNo"     		
     , A.TIMS        					AS "tims"     		
     , A.CURR_CODE      				AS "currCode"  				
     , A.AMT  							AS "amt"
     , A.APRV_BIZ_CODE               	AS "aprvBizCode"
     , A.APLC_PRSN_ID           		AS "aplcPrsnId"
     , A.APLC_TMP           			AS "aplcTmp"
     , A.APRV_APLC_DATE           		AS "aprvAplcDate"
     , A.APRV_APLC_SEQ          		AS "aprvAplcSeq"
  FROM TBA_OTDEPO_ACNT_BAL_REGI_MSTR A
 WHERE A.RECV_DATE = '20200207';


SELECT A.RECV_DATE						AS "recvDate"     		 
     , A.ACNT_NO            			AS "acntNo"     		
     , A.SUB_ACNT_NO        			AS "subAcntNo"     		
     , A.SEQ      						AS "seq"  				
     , A.SYMBOL    						AS "symbol"  				
     , A.QTY  							AS "qty"
  FROM TBA_OTDEPO_ACNT_BAL_REGI_DETL A
  WHERE A.RECV_DATE		= '20200206'
 ORDER BY A.SEQ;   
 


SELECT LISTAGG(DETAIL, '') WITHIN GROUP(ORDER BY SEQ) AS "contens"
  FROM  (  
		SELECT
			 '1' AS "SEQ",
			 'Application Date  : '|| TO_CHAR(TO_DATE(A.RECV_DATE, 'YYYYMMDD'), 'DD/MM/YYYY') || Chr(13) || Chr(10) ||
			 'Account No.       : '|| A.ACNT_NO || ' - ' || A.SUB_ACNT_NO || Chr(13) || Chr(10) ||		
			 'Account Name      : '|| C.CUST_NM || Chr(13) || Chr(10) || 
			 'Currency          : '|| A.CURR_CODE || Chr(13) || Chr(10) || 
			 'Amount            : '|| TO_CHAR(A.AMT,'999,999,999,999') || Chr(13) || Chr(10) || Chr(13) || Chr(10) AS "DETAIL"
		  FROM TBA_OTDEPO_ACNT_BAL_REGI_MSTR A
		  LEFT OUTER JOIN (SELECT B.ACNT_NO, A.CUST_NO, A.CUST_NM FROM TAA_CUSTOMER A, TAB_ACCOUNT B WHERE A.CUST_NO = B.CUST_NO) C
		    ON A.ACNT_NO 		= C.ACNT_NO
		 WHERE A.RECV_DATE		= '20200206'
		   AND A.ACNT_NO 		= '00000029'
		   AND A.SUB_ACNT_NO	= 'N00000001'
		   AND TIMS				= 1
		UNION ALL
		SELECT 
			'2' AS "SEQ",
			 LISTAGG(S.TCKR_CODE || ' - ' || RPAD(S.SYMBOL_NM, 16) || '   ' || TO_CHAR(A.QTY,'99,999,999') || Chr(13) || Chr(10), '') WITHIN GROUP(ORDER BY A.SEQ) AS "DETAIL"
		  FROM TBA_OTDEPO_ACNT_BAL_REGI_DETL A
		  LEFT OUTER JOIN TBA_SYMBOL_INFO S
		    ON A.SYMBOL 		= S.SYMBOL  
		 WHERE A.RECV_DATE		= '20200206'
		   AND A.ACNT_NO 		= '00000029'
		   AND A.SUB_ACNT_NO	= 'N00000001'
		   AND TIMS				= 1
	     );

SELECT LISTAGG(DETAIL, '') WITHIN GROUP(ORDER BY DETAIL) AS "contens"
  FROM  (  
		SELECT 
			 'Application Date	: '|| TO_CHAR(TO_DATE(A.RECV_DATE, 'YYYYMMDD'), 'DD/MM/YYYY') || Chr(13) || Chr(10) ||
			 'Account No.       : '|| A.ACNT_NO || ' - ' || A.SUB_ACNT_NO || Chr(13) || Chr(10) ||		
			 'Account Name      : '|| C.CUST_NM || Chr(13) || Chr(10) || Chr(13) || Chr(10) AS "DETAIL"
		  FROM TBA_OTDEPO_ACNT_BAL_REGI_MSTR A
		  LEFT OUTER JOIN (SELECT B.ACNT_NO, A.CUST_NO, A.CUST_NM FROM TAA_CUSTOMER A, TAB_ACCOUNT B WHERE A.CUST_NO = B.CUST_NO) C
		    ON A.ACNT_NO 		= C.ACNT_NO
		 WHERE A.RECV_DATE		= '20200206'
		   AND A.ACNT_NO 		= '00000028'
		   AND A.SUB_ACNT_NO	= 'N00000001'
		UNION ALL
		SELECT 
			 LISTAGG(S.TCKR_CODE || ' - ' || RPAD(S.SYMBOL_NM, 20) || '   ' || TO_CHAR(A.QTY,'99,999,999') || Chr(13) || Chr(10), '') WITHIN GROUP(ORDER BY A.SEQ) AS "DETAIL"
		  FROM TBA_OTDEPO_ACNT_BAL_REGI_DETL A
		  LEFT OUTER JOIN TBA_SYMBOL_INFO S
		    ON A.SYMBOL 		= S.SYMBOL  
		 WHERE A.RECV_DATE		= '20200206'
		   AND A.ACNT_NO 		= '00000028'
		   AND A.SUB_ACNT_NO	= 'N00000001'
	     ) ;
	   

	    
SELECT LISTAGG(DETAIL, '') WITHIN GROUP(ORDER BY SEQ) AS "contens"
  FROM  (  
		SELECT 
		     '1' AS "SEQ",
			 'Application Date  : '|| TO_CHAR(TO_DATE(A.PROC_DATE, 'YYYYMMDD'), 'DD/MM/YYYY') || Chr(13) || Chr(10) ||
			 'Account No.       : '|| A.ACNT_NO || ' - ' || A.SUB_ACNT_NO || Chr(13) || Chr(10) ||		
			 'Account Name      : '|| C.CUST_NM || Chr(13) || Chr(10) || 
			 'Currency          : '|| A.CURR_CODE || Chr(13) || Chr(10) || 
			 'Amount            : '|| TO_CHAR(A.AMT,'999,999,999,999') || Chr(13) || Chr(10) || Chr(13) || Chr(10) AS "DETAIL"
		  FROM TBA_OTDEPO_ACNT_BAL_REGI_MSTR A
		  LEFT OUTER JOIN (SELECT B.ACNT_NO, A.CUST_NO, A.CUST_NM FROM TAA_CUSTOMER A, TAB_ACCOUNT B WHERE A.CUST_NO = B.CUST_NO) C
		    ON A.ACNT_NO 		= C.ACNT_NO
		 WHERE A.PROC_DATE		= '20200224'
		   AND A.PROC_SEQ 		= 1		   
		UNION ALL
		SELECT 
		     '2' AS "SEQ",
			 LISTAGG(S.SYMBOL || ' - ' || RPAD(S.SYMBOL_NM, 16) || '   ' || TO_CHAR(A.QTY,'99,999,999') || Chr(13) || Chr(10), '') WITHIN GROUP(ORDER BY A.PROC_SEQ) AS "DETAIL"
		  FROM TBA_OTDEPO_ACNT_BAL_REGI_DETL A
		  LEFT OUTER JOIN TBA_SYMBOL_INFO S
		    ON A.SYMBOL 		= S.SYMBOL  
		 WHERE A.PROC_DATE		= '20200224'
		   AND A.PROC_SEQ 		= 1	
	     );   	    
  
SELECT 	    
	 'Set Date          : '|| NVL(TO_CHAR(TO_DATE(A.SET_APLC_DATE, 'YYYYMMDD'), 'DD/MM/YYYY'), '') || Chr(13) || Chr(10) ||
	 'Sequance          : '|| A.SET_APLC_SEQ || Chr(13) || Chr(10) ||
	 'Organization      : '|| A.SET_ORG_TP || ' - ' || A.SET_ORG_CODE || '(' || D.ORG_NM || ')' ||Chr(13) || Chr(10) ||
	 'Symbol            : '|| S.SYMBOL || ' - ' || S.SYMBOL_NM || Chr(13) || Chr(10) || 
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
 WHERE A.APLC_DATE	= #{aplcDate}
   AND A.APLC_SEQ 	= #{aplcSeq}	