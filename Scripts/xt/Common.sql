SELECT * 
  FROM TCA_NATION;

 
SELECT A.NATN_CODE			AS "natnCode"
  FROM TCA_NATION A
 WHERE NATN_CODE  		= '410';


SELECT * FROM (
SELECT A.NATN_CODE			AS "natnCode"
	 , A.NATN_NM			AS "natnNm"
	 , A.NATN_ENG_NM		AS "natnEngNm"
	 , A.ALPH_02			AS "alph02"
	 , A.ALPH_03			AS "alph03"
	 , A.CURR_CODE			AS "currCode"
  FROM TCA_NATION A
 WHERE A.NATN_CODE  LIKE CONCAT('%',CONCAT(TRIM(''),'%'))
ORDER BY A.NATN_CODE
) WHERE ROWNUM <= 10;

DELETE FROM TCA_NATION;

INSERT INTO TCA_NATION
VALUES( '410', '´ëÇÑ¹Î±¹', 'Korea(Republic of)', 'KR', 'KOR', 'KRW', 'csjang', NULL );
INSERT INTO TCA_NATION
VALUES( '392', 'ÀÏº»', 'Japan', 'JP', 'JPN', 'YEN', 'csjang', NULL );
INSERT INTO TCA_NATION
VALUES( '840', '¹Ì±¹', 'United States fo America', 'US', 'USA', 'USD', 'csjang', NULL );


SELECT * FROM (
	SELECT '%'					AS "id"
	     , 'ALL'				AS "item"
	  FROM DUAL B
	 UNION
	SELECT A.NATN_CODE			AS "id"
	     , A.NATN_NM			AS "item"
	  FROM TCA_NATION A
	 WHERE( A.NATN_CODE 		LIKE CONCAT(CONCAT('%', ''), '%')
	    OR A.NATN_NM 			LIKE CONCAT(CONCAT('%', ''), '%')
	   	OR A.NATN_ENG_NM		LIKE CONCAT(CONCAT('%', ''), '%') )
   	   AND A.NATN_CODE 			>= '392'   
     ORDER BY 2
) WHERE ROWNUM <= 2;


SELECT * 
  FROM TCA_NATION;
 
 
 SELECT * FROM (
	SELECT '%'					AS "id"
	     , 'ALL'				AS "item"
	  FROM DUAL 
	 UNION
	SELECT A.CURR_CODE			AS "id"
	     , A.CURR_NM			AS "item"
	  FROM TCA_CURRENCY A
	 WHERE (  
	 	   A.CURR_CODE 			LIKE CONCAT(CONCAT('%', ''), '%')
	    OR A.CURR_NM 			LIKE CONCAT(CONCAT('%', ''), '%')
	   	OR A.CURR_ENG_NM		LIKE CONCAT(CONCAT('%', ''), '%') )
   	   AND A.CURR_CODE 			>= NVL(NULL, ' ')   
	 ORDER BY 1 
)WHERE ROWNUM <= 50;


SELECT * FROM (
SELECT A.CURR_CODE			AS "currCode"
	 , A.CURR_NM			AS "currNm"
	 , A.CURR_ENG_NM		AS "currEngNm"
	 , A.TIMS				AS "tims"
	 , A.EXRT				AS "exrt"
	 , CASE WHEN A.MJR_CURR_YN = 'Y' THEN '1' ELSE '0' END	AS "mjrCurrYn"
  FROM TCA_CURRENCY A
 WHERE A.CURR_CODE  		LIKE CONCAT('%', CONCAT(TRIM(''), '%'))
   AND A.CURR_CODE 			>= NVL(NULL, ' ')
ORDER BY A.CURR_CODE
) WHERE ROWNUM 				<= 50;

SELECT * 
  FROM TCA_CURRENCY
ORDER BY CURR_CODE;
 
INSERT INTO TCA_CURRENCY
VALUES( 'SSS', '»ùÇÃ', 'Sample SMP', '1', '13.25', '0', 'csjang', NULL );


SELECT *
  FROM TCA_DAILY_EXRT
ORDER BY BAS_DATE;

DROP TABLE TCA_DAILY_EXRT;
CREATE TABLE TCA_DAILY_EXRT (
    BAS_DATE                      VARCHAR2(8)          NOT NULL,
    CURR_CODE                     VARCHAR2(3)          NOT NULL,
    TIMS                          NUMBER               NOT NULL,
    EXRT                          NUMBER               DEFAULT 0 NOT NULL,
    USD_CNVS_RT                   NUMBER               DEFAULT 0 NOT NULL,
    WRKR_ID                       VARCHAR2(20),
    WRK_TMP                       NUMBER,
  PRIMARY KEY (BAS_DATE, CURR_CODE, TIMS)
);

INSERT INTO TCA_DAILY_EXRT
VALUES ('20191125', 'YEN', 1, 100.4321, 100.4321, 'csjang', NULL);


SELECT * FROM (
SELECT A.BAS_DATE			AS "basDate"
	 , A.CURR_CODE			AS "currCode"
	 , B.CURR_NM			AS "currNm"
	 , A.TIMS				AS "tims"
	 , A.EXRT				AS "exrt"
	 , A.USD_CNVS_RT		AS "usdCnvsRt"
  FROM TCA_DAILY_EXRT A
	   LEFT OUTER JOIN (SELECT CURR_CODE
	   						 , CURR_NM
				  		  FROM TCA_CURRENCY ) B
	   ON A.CURR_CODE = B.CURR_CODE
 WHERE A.BAS_DATE  			= '20191122'
   AND ( A.CURR_CODE > NVL(SUBSTR('USD2', 1, 3), ' ')
    OR ( A.CURR_CODE >= NVL(SUBSTR('USD2', 1, 3), ' ') AND A.TIMS <= NVL(TO_NUMBER(SUBSTR('USD2', 4)), 999999) ) )
ORDER BY A.CURR_CODE, A.TIMS DESC
) WHERE ROWNUM 				<= 2;


SELECT * FROM (
SELECT A.BAS_DATE			AS "basDate"
	 , A.TIMS				AS "tims"
	 , A.CURR_CODE			AS "currCode"
	 , B.CURR_NM			AS "currNm"
	 , A.EXRT				AS "exrt"
	 , A.USD_CNVS_RT		AS "usdCnvsRt"
  FROM TCA_DAILY_EXRT A
	   LEFT OUTER JOIN (SELECT CURR_CODE
	   						 , CURR_NM
				  		  FROM TCA_CURRENCY ) B
	   ON A.CURR_CODE = B.CURR_CODE
 WHERE A.CURR_CODE 			= 'KRW'
   AND ( A.BAS_DATE < NVL(SUBSTR('201911221', 1, 8), '99999999')
    OR ( A.BAS_DATE <= NVL(SUBSTR('201911221', 1, 8), '99999999') AND A.TIMS <= NVL(TO_NUMBER(SUBSTR('201911221', 9)), 999999) ) )
ORDER BY A.BAS_DATE DESC, A.TIMS DESC
) WHERE ROWNUM 				<= 2;


SELECT * FROM TCA_PROVINCE;

SELECT * FROM (
SELECT A.PROV_CODE			AS "provCode"
	 , A.PROV_NM			AS "localNm"
	 , A.PROV_ENG_NM		AS "currNm"
  FROM TCA_PROVINCE A
 WHERE (  
 	   A.PROV_CODE 			LIKE CONCAT(CONCAT('%', ''), '%')
    OR A.PROV_NM 			LIKE CONCAT(CONCAT('%', ''), '%')
   	OR A.PROV_ENG_NM		LIKE CONCAT(CONCAT('%', ''), '%') )
   AND A.PROV_CODE 			>= NVL(NULL, ' ')   
ORDER BY A.PROV_CODE
) WHERE ROWNUM 				<= 50;


SELECT * FROM TCA_HFT_COMM;

SELECT * FROM (
SELECT A.BIZ_DATE				AS "bizDate"
	 , A.CAPT_AMT				AS "captAmt"
     , A.CORP_CRD_LMT_RT		AS "corpCrdLmtRt"
     , A.CUST_CRD_LMT_RT		AS "custCrdLmtRt"
     , A.SYMBOL_CRD_LMT_RT		AS "symbolCrdLmtRt"
     , A.CORP_CRD_USE_AMT		AS "corpCrdUseAmt"
     , A.CDT_CORP_CRD_USE_AMT	AS "cdtCorpCrdUseAmt"
  FROM TCA_HFT_COMM A
 WHERE A.BIZ_DATE 			BETWEEN '20190101' AND '20191126'
   AND A.BIZ_DATE 			>= NVL(NULL, ' ')   
ORDER BY A.BIZ_DATE
) WHERE ROWNUM 				<= 10;


SELECT * FROM TCA_NOTIFICATION;


SELECT A.BIZ_DATE				AS "bizDate"
	 , A.CAPT_AMT/10000			AS "captAmt"
     , A.CORP_CRD_LMT_RT		AS "corpCrdLmtRt"
     , A.CUST_CRD_LMT_RT		AS "custCrdLmtRt"
     , A.SYMBOL_CRD_LMT_RT		AS "symbolCrdLmtRt"
     , A.CORP_CRD_USE_AMT		AS "corpCrdUseAmt"
     , A.CDT_CORP_CRD_USE_AMT	AS "cdtCorpCrdUseAmt"
  FROM TCA_HFT_COMM A
ORDER BY A.BIZ_DATE DESC

SELECT 'SUM'			AS "sum"
	 , '123450'			AS "balanceSum"
	 , '1234500000'		AS "divdCshAmtSum"
	 , '12345678'		AS "divdStkQtySum"
	 , '54321'			AS "frstkQtySum"
	 , '32000000'		AS "frstkAmtSum"
  FROM DUAL;

 SELECT TO_CHAR(888888999, '999,999,999,999')
   FROM DUAL;


DROP TABLE TCA_PNTS_COMM;
CREATE TABLE TCA_PNTS_COMM (
    HNX_BIZ_DATE                  VARCHAR2(8)          NOT NULL,
    HSX_BIZ_DATE                  VARCHAR2(8)          NOT NULL,
    CAPT_AMT                      NUMBER               NOT NULL,
    CORP_CRD_LMT_RT               NUMBER               NOT NULL,
    CUST_CRD_LMT_RT               NUMBER               NOT NULL,
    SYMBOL_CRD_LMT_RT             NUMBER               NOT NULL,
    CORP_CRD_USE_AMT              NUMBER               NOT NULL,
    CDT_CORP_CRD_USE_AMT          NUMBER               NOT NULL,
    VSD_RECV_BIZ_AUTO_PROC_YN     VARCHAR2(1)          NOT NULL,
    WRKR_ID                       VARCHAR2(20),
    WRK_TMP                       NUMBER,
  PRIMARY KEY (HNX_BIZ_DATE)
);
