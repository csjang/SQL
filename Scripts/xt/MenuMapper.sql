
SELECT * FROM (
	SELECT USER_ROLE_CODE            AS "userRoleCode"
	     , BIZ_DOMAIN                AS "bizDomain"
	     , SVC_URL                   AS "svcUrl"
	     , USE_AUTH                  AS "useAuth"
	  FROM TXA_ROLE_AUTH /* Role Auth */
	 WHERE USER_ROLE_CODE LIKE CONCAT('%',CONCAT(#{userRoleCode:VARCHAR},'%'))
	   AND BIZ_DOMAIN     LIKE CONCAT('%',CONCAT(#{bizDomain:VARCHAR},'%'))
	   AND CONCAT(USER_ROLE_CODE,CONCAT(BIZ_DOMAIN, SVC_URL)) >= NVL(#{nextKey:VARCHAR}, ' ')
	 ORDER BY USER_ROLE_CODE, BIZ_DOMAIN
) WHERE ROWNUM <= #{reqCount:NUMERIC};


SELECT * FROM (
	SELECT A.USER_ID             			AS "userId"
	     , A.LOGN_PSWD           			AS "lognPswd"
	     , A.PSWD_LAST_UPD_DTM   			AS "pswdLastUpdDtm"
	     , A.PSWD_ERR_TIMS       			AS "pswdErrTims"
	     , NVL(A.LAST_LOGN_DTM,'')       	AS "lastLognDtm"
	     , A.USER_ROLE_CODE     		 	AS "userRoleCode"
	     , A.WRKR_ID             			AS "wrkrId"
	     , A.WRK_TMP             			AS "wrkDtm"
	  FROM TXA_USER_INFO A
	 WHERE A.USER_ID      LIKE CONCAT('%',CONCAT('','%'))
	 ORDER BY A.USER_ID             
) WHERE ROWNUM <= 20;


SELECT X.MENU_ID   AS "menuId"
     , 'M'         AS "menuTp"
     , Z.LOC_NM    AS "menuNm"
     , NULL        AS "menuTr"
     , NULL        AS "dupYn"
     , NULL        AS "upprMenuId"
     , 1           AS "sort"
     , Y.MENU_SEQ
  FROM (
        SELECT CASE C.MENU_TP WHEN '1' THEN C.MENU_ID ELSE C.UP_MENU_ID END AS MENU_ID
          FROM TXB_ROLE_MENU A
             , TXB_PGM_INFO B
             , TXB_MENU_INFO C
         WHERE A.USER_ROLE_CODE = (SELECT USER_ROLE_CODE FROM TXA_USER_INFO WHERE USER_ID = 'csjang')
           AND A.PGM_ID  = B.PGM_ID
           AND B.MENU_ID = C.MENU_ID
         GROUP BY CASE C.MENU_TP WHEN '1' THEN C.MENU_ID ELSE C.UP_MENU_ID END ) X
     , TXB_MENU_INFO Y
     , TXB_MENU_LOCAL Z
 WHERE X.MENU_ID = Y.MENU_ID
   AND Y.MENU_ID = Z.LOC_CODE
   AND Z.LOC_TP  = '1'
   AND Z.LANG_TP = 'ko';

-- USER, ROLE  
SELECT * FROM TXA_USER_INFO;

UPDATE TXA_USER_INFO
   SET PSWD_ERR_TIMS = 0
 WHERE USER_ID = 'csjang';

SELECT * FROM TXA_ROLE_AUTH;


-- MENU
SELECT * FROM TXB_MENU_INFO;

SELECT * FROM TXB_PGM_INFO ORDER BY PGM_ID;

SELECT * FROM TXB_ROLE_MENU;

SELECT * FROM TXB_MENU_LOCAL;

SELECT * FROM TXB_MULTI_LANG;


-- User Info
SELECT USER_ID 				AS "userId" 
     , LOGN_PSWD 			AS "lognPswd" 
     , PSWD_LAST_UPD_DTM 	AS "pswdLastUpdDtm" 
     , PSWD_ERR_TIMS 		AS "pswdErrTims" 
     , LAST_LOGN_DTM 		AS "lastLognDtm" 
     , USER_ROLE_CODE 		AS "userRoleCode" 
  FROM TXA_USER_INFO 
 WHERE USER_ID = 'csjang';
 
 
 -- Select Menu
SELECT X.menuId    AS "menuId"
     , '1'         AS "menuTp"
     , Z.LOC_NM    AS "menuNm"
     , NULL        AS "menuTr"
     , NULL        AS "dupYn"
     , NULL        AS "upprMenuId"
     , 1           AS "sort"
     , Y.MENU_SEQ  AS "menuSeq"
  FROM (
        SELECT CASE C.MENU_TP WHEN '1' THEN C.MENU_ID ELSE C.UP_MENU_ID END AS menuId
          FROM TXB_MENU_INFO C
         GROUP BY CASE C.MENU_TP WHEN '1' THEN C.MENU_ID ELSE C.UP_MENU_ID END ) X
     , TXB_MENU_INFO Y
 LEFT OUTER JOIN TXB_MENU_LOCAL Z
   ON Y.MENU_ID = Z.LOC_CODE
  AND Z.LOC_TP  = '1'
  AND Z.LANG_TP = 'ko'
 WHERE X.menuId = Y.MENU_ID;
/* SUB MENU */
UNION
SELECT C.MENU_ID    AS "menuId"
     , '2'          AS "menuTp"
     , D.LOC_NM     AS "menuNm"
     , NULL         AS "menuTr"
     , NULL         AS "dupYn"
     , C.UP_MENU_ID AS "upprMenuId"
     , 2            AS "sort"
     , C.MENU_SEQ   AS "menuSeq"
  FROM TXB_MENU_INFO C
  LEFT OUTER JOIN TXB_MENU_LOCAL D
    ON C.MENU_ID = D.LOC_CODE
   AND D.LOC_TP  = '1'
   AND D.LANG_TP = 'ko'
 WHERE C.MENU_TP = '2'
 GROUP BY C.MENU_ID , D.LOC_NM , C.UP_MENU_ID , C.MENU_SEQ
 ORDER BY 7,8;
 
 
/* MAIN MENU (1) */
SELECT X.MENU_ID   AS "menuId"
     , 'M'         AS "menuTp"
     , Z.LOC_NM    AS "menuNm"
     , NULL        AS "menuTr"
     , NULL        AS "dupYn"
     , NULL        AS "upprMenuId"
     , 1           AS "sort"
     , Y.MENU_SEQ
  FROM (
        SELECT CASE C.MENU_TP WHEN '1' THEN C.MENU_ID ELSE C.UP_MENU_ID END AS MENU_ID
          FROM TXB_ROLE_MENU A
             , TXB_PGM_INFO B
             , TXB_MENU_INFO C
         WHERE A.USER_ROLE_CODE = (SELECT USER_ROLE_CODE FROM TXA_USER_INFO WHERE USER_ID = 'csjang')
           AND A.PGM_ID  = B.PGM_ID
           AND B.MENU_ID = C.MENU_ID
         GROUP BY CASE C.MENU_TP WHEN '1' THEN C.MENU_ID ELSE C.UP_MENU_ID END ) X
     , TXB_MENU_INFO Y
     , TXB_MENU_LOCAL Z
 WHERE X.MENU_ID = Y.MENU_ID
   AND Y.MENU_ID = Z.LOC_CODE
   AND Z.LOC_TP  = '1'
   AND Z.LANG_TP = 'ko';
 /* SUB MENU */
UNION
SELECT C.MENU_ID    AS "menuId"
     , 'M'          AS "menuTp"
     , D.LOC_NM     AS "menuNm"
     , NULL         AS "menuTr"
     , NULL         AS "dupYn"
     , C.UP_MENU_ID AS "upprMenuId"
     , 2            AS "sort"
     , C.MENU_SEQ
  FROM TXB_ROLE_MENU A
     , TXB_PGM_INFO B
     , TXB_MENU_INFO C
     , TXB_MENU_LOCAL D
 WHERE A.USER_ROLE_CODE = (SELECT USER_ROLE_CODE FROM TXA_USER_INFO WHERE USER_ID = 'csjang')
   AND A.PGM_ID  = B.PGM_ID
   AND B.MENU_ID = C.MENU_ID
   AND C.MENU_TP = '2'
   AND C.MENU_ID = D.LOC_CODE
   AND D.LOC_TP  = '1'
   AND D.LANG_TP = 'ko'
 GROUP BY C.MENU_ID, D.LOC_NM, C.UP_MENU_ID, C.MENU_SEQ
/* SCREEN */
UNION
SELECT B.PGM_ID     AS "menuId"
     , 'P'          AS "menuTp"
     , C.LOC_NM     AS "menuNm"
     , B.SCRN_NO    AS "menuTr"
     , 'Y'          AS "dupYn"
     , B.MENU_ID    AS "upprMenuId"
     , 3            AS "sort"
     , A.MENU_SEQ
  FROM TXB_ROLE_MENU A
     , TXB_PGM_INFO B
     , TXB_MENU_LOCAL C
 WHERE A.USER_ROLE_CODE = (SELECT USER_ROLE_CODE FROM TXA_USER_INFO WHERE USER_ID = 'csjang')
   AND A.PGM_ID  = B.PGM_ID
   AND B.PGM_ID  = C.LOC_CODE
   AND C.LOC_TP  = '2'
   AND C.LANG_TP = 'ko'
 ORDER BY 7, 8;



/* MAIN MENU */
SELECT X.MENU_ID   AS "menuId"
     , 'M'         AS "menuTp"
     , Z.LOC_NM    AS "menuNm"
     , NULL        AS "menuTr"
     , NULL        AS "dupYn"
     , NULL        AS "upprMenuId"
     , 1           AS "sort"
     , Y.MENU_SEQ
  FROM (
        SELECT CASE C.MENU_TP WHEN '1' THEN C.MENU_ID ELSE C.UP_MENU_ID END AS MENU_ID
          FROM TXB_ROLE_MENU A
             , TXB_PGM_INFO B
             , TXB_MENU_INFO C
         WHERE A.USER_ROLE_CODE = (SELECT USER_ROLE_CODE FROM TXA_USER_INFO WHERE USER_ID = 'csjang')
           AND A.PGM_ID  = B.PGM_ID
           AND B.MENU_ID = C.MENU_ID
         GROUP BY CASE C.MENU_TP WHEN '1' THEN C.MENU_ID ELSE C.UP_MENU_ID END ) X
     , TXB_MENU_INFO Y
     , TXB_MENU_LOCAL Z
 WHERE X.MENU_ID = Y.MENU_ID
   AND Y.MENU_ID = Z.LOC_CODE
   AND Z.LOC_TP  = '1'
   AND Z.LANG_TP = 'ko'
/* SUB MENU */
UNION
SELECT C.MENU_ID    AS "menuId"
     , 'M'          AS "menuTp"
     , D.LOC_NM     AS "menuNm"
     , NULL         AS "menuTr"
     , NULL         AS "dupYn"
     , C.UP_MENU_ID AS "upprMenuId"
     , 2            AS "sort"
     , C.MENU_SEQ
  FROM TXB_ROLE_MENU A
     , TXB_PGM_INFO B
     , TXB_MENU_INFO C
     , TXB_MENU_LOCAL D
 WHERE A.USER_ROLE_CODE = (SELECT USER_ROLE_CODE FROM TXA_USER_INFO WHERE USER_ID = 'csjang')
   AND A.PGM_ID  = B.PGM_ID
   AND B.MENU_ID = C.MENU_ID
   AND C.MENU_TP = '2'
   AND C.MENU_ID = D.LOC_CODE
   AND D.LOC_TP  = '1'
   AND D.LANG_TP = 'ko'
 GROUP BY C.MENU_ID, D.LOC_NM, C.UP_MENU_ID, C.MENU_SEQ
/* SCREEN */
UNION
SELECT B.PGM_ID     AS "menuId"
     , 'P'          AS "menuTp"
     , C.LOC_NM     AS "menuNm"
     , B.SCRN_NO    AS "menuTr"
     , 'Y'          AS "dupYn"
     , B.MENU_ID    AS "upprMenuId"
     , 3            AS "sort"
     , A.MENU_SEQ
  FROM TXB_ROLE_MENU A
     , TXB_PGM_INFO B
     , TXB_MENU_LOCAL C
 WHERE A.USER_ROLE_CODE = (SELECT USER_ROLE_CODE FROM TXA_USER_INFO WHERE USER_ID = 'csjang')
   AND A.PGM_ID  = B.PGM_ID
   AND B.PGM_ID  = C.LOC_CODE
   AND C.LOC_TP  = '2'
   AND C.LANG_TP = 'ko'
 ORDER BY 7, 8;

SELECT * FROM TXA_USER_INFO;

