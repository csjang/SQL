SELECT * FROM TXT_ACNT_BOOK
ORDER BY IO_DATE, SEQ_NO;

-- <select id="selectOneBook" resultType="papaya.xc.model.BookModel">
SELECT A.SEQ_NO             AS "seqNo"
     , A.IO_DATE            AS "ioDate"
     , A.IO_TP              AS "ioTp"
     , A.IO_CODE            AS "ioCode"
     , A.IO_AMT             AS "ioAmt"
     , A.RMRK               AS "rmrk"
     , A.INCLUDE            AS "include"
     , A.WRK_TMP            AS "wrkTmp"   
  FROM TXT_ACNT_BOOK A
 WHERE  
		A.SEQ_NO       		= 33;

-- <select id="selectBook" resultType="papaya.xc.model.BookModel">
SELECT * FROM (
SELECT A.SEQ_NO             AS "seqNo"
     , A.IO_DATE            AS "ioDate"
     , A.IO_TP              AS "ioTp"
     , A.IO_CODE            AS "ioCode"
     , A.IO_AMT             AS "ioAmt"
     , A.RMRK               AS "rmrk"
     , A.INCLUDE            AS "include"
     , A.WRKR_ID            AS "wrkrId"
     , A.WRK_TMP			AS "wrkTmp"   
  FROM TXT_ACNT_BOOK A
 WHERE A.IO_DATE	BETWEEN '20191001' AND '20191014'
   AND A.IO_TP		LIKE CONCAT(CONCAT('%', ''), '%')
   AND A.IO_CODE	LIKE CONCAT(CONCAT('%', ''), '%')
   AND CONCAT(A.IO_DATE, A.SEQ_NO)	>= NVL(NULL, ' ')
 ORDER BY A.IO_DATE, A.SEQ_NO
 ) WHERE ROWNUM <= 100;


SELECT * FROM TXA_USER_INFO;

SELECT A.CODE                AS "value"
     , A.VAL                 AS "label"
  FROM TXC_VALID_VALUES A
 WHERE A.TERM                = 'BOOK_ITEMS'
   AND A.LANG_TP             = 'ko'
 ORDER BY 1;

SELECT * FROM TXC_TABLE;

SELECT * FROM TXC_TABLE_COLUMN
WHERE TBL_ID = 'TXT_TEST_01'
ORDER BY UNIQ_NO;

-- 용어집
SELECT * FROM TXC_WORD;

-- 필드명
SELECT * FROM TXC_WORD_TERM
WHERE TERM LIKE '%DATE%';

-- <select id="selectColumnsList" resultType="papaya.xc.model.Columns">
SELECT A.TBL_ID                 AS "tblId"
     , A.COL_ID                 AS "colId"
     , (SELECT B.TERM_NM     
        FROM TXC_WORD_TERM B 
        WHERE B.TERM = A.COL_ID)AS "termNm"
     , (SELECT C.TERM_LOC_NM     
        FROM TXC_WORD_TERM C
        WHERE C.TERM = A.COL_ID)AS "termLocNm"
     , A.UNIQ_NO                AS "uniqNo"
     , A.PK_YN                  AS "pkYn"
     , A.NOT_NULL_YN            AS "notNullYn"
     , A.DEF_YN                 AS "defYn"
     , A.DEF_VAL             	AS "defVal"
     , A.ENC_YN                 AS "encYn"
     , A.RMRK                   AS "rmrk"
     , A.REG_TMP                AS "regTmp"
     , A.WRKR_ID                AS "wrkrId"
     , A.WRK_TMP                AS "wrkTmp"
     , A.COL_ID                 AS "colIdOld"
     , (SELECT D.DATA_TP     
        FROM TXC_WORD_TERM D
       WHERE D.TERM = A.COL_ID) AS "dataTp"
     , (SELECT E.DATA_SIZE    
        FROM TXC_WORD_TERM E
       WHERE E.TERM = A.COL_ID) AS "dataSize"
     , (SELECT F.DATA_DECI_SIZE    
        FROM TXC_WORD_TERM F 
       WHERE F.TERM = A.COL_ID) AS "dataDeciSize"
  FROM TXC_TABLE_COLUMN A
 WHERE A.UNIQ_NO >= NVL(NULL, 1)
   AND A.TBL_ID LIKE 'TXT_TEST_01'
 ORDER BY A.UNIQ_NO;
              
-- Table Join 
SELECT A.TBL_ID                 AS "tblId"
	 , A.COL_ID                 AS "colId"
     , B.TERM_NM     			AS "termNm"
     , B.TERM_LOC_NM			AS "termLocNm"
     , A.UNIQ_NO                AS "uniqNo"
     , A.PK_YN                  AS "pkYn"
     , A.NOT_NULL_YN            AS "notNullYn"
     , A.DEF_YN                 AS "defYn"
     , A.DEF_VAL             	AS "defVal"
     , A.ENC_YN                 AS "encYn"
     , A.RMRK                   AS "rmrk"
     , A.REG_TMP                AS "regTmp"
     , A.WRKR_ID                AS "wrkrId"
     , A.WRK_TMP                AS "wrkTmp"
     , A.COL_ID                 AS "colIdOld"
     , B.DATA_TP     			AS "dataTp"
     , B.DATA_SIZE  			AS "dataSize"
     , B.DATA_DECI_SIZE    		AS "dataDeciSize"
  FROM TXC_TABLE_COLUMN A
  JOIN TXC_WORD_TERM B
    ON A.COL_ID = B.TERM
 WHERE A.UNIQ_NO >= NVL(NULL, 1)
   AND A.TBL_ID LIKE 'TXT_TEST_01'
 ORDER BY A.UNIQ_NO;

-- Single Table
SELECT A.TBL_ID                 AS "tblId"
	 , A.COL_ID                 AS "colId"
     , A.UNIQ_NO                AS "uniqNo"
     , A.PK_YN                  AS "pkYn"
     , A.NOT_NULL_YN            AS "notNullYn"
     , A.DEF_YN                 AS "defYn"
     , A.DEF_VAL             	AS "defVal"
     , A.ENC_YN                 AS "encYn"
     , A.RMRK                   AS "rmrk"
     , A.REG_TMP                AS "regTmp"
     , A.WRKR_ID                AS "wrkrId"
     , A.WRK_TMP                AS "wrkTmp"
     , A.COL_ID                 AS "colIdOld"
  FROM TXC_TABLE_COLUMN A
 WHERE A.UNIQ_NO >= NVL(NULL, 1)
   AND A.TBL_ID LIKE 'TXT_TEST_01'
 ORDER BY A.UNIQ_NO;


SELECT '%'			AS "id"
     , 'ALL'		AS "item"
  FROM DUAL
 UNION
SELECT A.CODE 		AS "id" 
     , A.VAL  		AS "item" 
  FROM TXC_VALID_VALUES A 
 WHERE A.TERM = 'BOOK_ITEMS' 
   AND A.LANG_TP = 'ko' 
   AND A.VAL LIKE CONCAT(CONCAT('%', '%'), '%')
   AND A.CODE >= ' '
 ORDER BY 1; 


SELECT SUBSTR(', 법정통화입금제한, 암호화폐입금제한, 신규주문제한', 3)
  FROM DUAL;

SELECT SUBSTR(', 법정통화입금제한' || ', 암호화폐입금제한' || '신규주문제한' || ', 로그인제한', 3)
  FROM DUAL;
 
 
 CREATE TABLE TXT_ACNT_BOOK (	
	SEQ_NO 		NUMBER 		NOT NULL ENABLE, 
	IO_DATE 	VARCHAR2(8) NOT NULL ENABLE, 
	IO_TP 		VARCHAR2(1) NOT NULL ENABLE, 
	IO_CODE 	VARCHAR2(2) NOT NULL ENABLE, 
	IO_AMT 		NUMBER 		NOT NULL ENABLE, 
	RMRK 		VARCHAR2(64), 
	INCLUDE 	VARCHAR2(1),
	WRKR_ID 	VARCHAR2(20), 
	WRK_TMP 	NUMBER, 
CONSTRAINT PK_TXT_ACNT_BOOK PRIMARY KEY (SEQ_NO)
);
 

CREATE SEQUENCE SEQ_TXT_ACNT_BOOK
	START WITH 1
	INCREMENT BY 1
	MAXVALUE 999999;

SELECT A.REG_DTM       		AS "regDtm"
     , A.WORK_TYPE          AS "workType"
     , A.PROC_STAT          AS "procStat"
     , A.ACNT_ID            AS "acntId"
     , ''             		AS "userName"
     , ''               	AS "secuLevl"
     , A.WRKR_ID            AS "wrkrId"
     , A.WRK_TMP			AS "wrkTmp"   
  FROM TXT_IDEN_IMG_INFO A
 WHERE A.WORK_TYPE			LIKE '%'
   AND A.PROC_STAT			LIKE '%'
   AND A.ACNT_ID			LIKE '%' 
 ORDER BY A.REG_DTM DESC, A.ACNT_ID;

SELECT * FROM (
SELECT A.REG_DTM       		AS "regDtm"
     , A.WORK_TYPE          AS "workType"
     , A.PROC_STAT          AS "procStat"
     , A.ACNT_ID            AS "acntId"
     , ''             		AS "userName"
     , A.MEDIA_TYPE        	AS "secuLevl"
     , A.WRKR_ID            AS "wrkrId"
     , A.WRK_TMP			AS "wrkTmp"
  FROM TXT_IDEN_IMG_INFO A
 WHERE A.WORK_TYPE			LIKE CONCAT('', '%')
   AND A.PROC_STAT			LIKE CONCAT('', '%')
   AND A.ACNT_ID			LIKE CONCAT(CONCAT('%', ''), '%')
   AND A.REG_DTM			<= NVL(NULL, '99999999999999999999')
 ORDER BY A.REG_DTM DESC, A.ACNT_ID
) WHERE ROWNUM <= 6;
   
 
INSERT INTO TXT_IDEN_IMG_INFO
VALUES (
	   TO_CHAR(SYSTIMESTAMP, 'YYYYMMDDHH24MISSFF6')
	 , '10000012', '1', '1', '홍길동', '1', '', '', '', '', '', '', '사유입니다.', '1', '192.1.1.100', 'csjang'
	 , (SYSDATE - TO_DATE('1970-01-01 09:00:00', 'YYYY-MM-DD HH24:MI:SS'))*24*60*60*1000 + TO_NUMBER(TO_CHAR(SYSTIMESTAMP, 'FF3'))
	 );

SELECT TO_CHAR(SYSTIMESTAMP, 'YYYYMMDDHH24MISSFF6')	
  FROM DUAL;
	
UPDATE TXT_IDEN_IMG_INFO
   SET PROC_STAT = '1'
 WHERE PROC_STAT = '4';
   
DELETE FROM TXT_IDEN_IMG_INFO;
	
SELECT 
TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') dt,
ROUND((SYSDATE - TO_DATE('19700101 000000', 'YYYYMMDD HH24MISS'))*86400) as udt 
FROM dual; 

SELECT (SYSDATE - TO_DATE('1970-01-01 09:00:00', 'YYYY-MM-DD HH24:MI:SS'))*24*60*60*1000 + TO_NUMBER(TO_CHAR(SYSTIMESTAMP, 'FF3')) 
  FROM DUAL;
 
SELECT (CAST(SYSTIMESTAMP AS DATE) - TO_DATE('1970-01-01', 'YYYY-MM-DD'))*24*60*60*1000 + TO_NUMBER(TO_CHAR(SYSTIMESTAMP, 'FF3')) 
  FROM DUAL;

SELECT A.REG_DTM             AS "regDtm"
     , A.ACNT_ID             AS "acntId"
     , A.USER_NAME	         AS "userName"
     , A.WORK_TYPE           AS "workType"
     , A.SECU_LEVL     		 AS "secuLevl"
     , A.PROC_STAT           AS "procStat"
     , A.RSRN                AS "rsrn"
     , A.IMG_FILE_1_NM       AS "imgFile1Nm"
     , A.IMG_FILE_2_NM       AS "imgFile2Nm"
     , A.IMG_FILE_3_NM       AS "imgFile3Nm"
  FROM TXT_IDEN_IMG_INFO A
 WHERE A.REG_DTM             = '20191108154336893417';

SELECT *
  FROM TXT_IDEN_IMG_INFO;
