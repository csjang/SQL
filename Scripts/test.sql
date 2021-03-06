  SELECT MR              AS "mir"
     , F20_SEME        AS "f20Seme"
  FROM gateway.TGW_MT544
 WHERE MR = '180001FOOLHKH0AXXX0304002735';

SELECT *
  FROM TCC_APPROVAL_DETAIL
 WHERE APRV_BIZ_CODE = '128'
   AND APLC_DATE = '20200414';
 

SELECT MIR            AS "mir"
     , MT_MSG_TP      AS "mtMsgTp"
     , VSD_RECV_STAT  AS "vsdRecvStat"
  FROM gateway.TGW_VSD_RECV
 WHERE VSD_RECV_STAT = '0'
   AND MT_MSG_TP IN ('544', '546')
 ORDER BY MIR;
 
SELECT *
  FROM TAC_TRANSACTION
 WHERE ACNT_NO = '00000028' 
   AND TRAN_DATE  = '20200416';


SELECT NVL(A.PURC_AMT / A.BAL_QTY, 0)
  FROM TAC_STOCK_BALANCE A
 WHERE A.ACNT_NO 		= '00000028'
   AND A.SUB_ACNT_NO 	= 'N00000001'
   AND A.SYMBOL			= '00001';

SELECT CEIL(5000000/321)
  FROM DUAL;
  

SELECT A.SYMBOL				AS "id"
     , S.SYMBOL_NM			AS "item"
     , S.MKT_ID				AS "mktId"
  FROM TAC_STOCK_BALANCE A
  LEFT OUTER JOIN TBA_SYMBOL_INFO S
    ON A.SYMBOL 	= S.SYMBOL    
 WHERE A.ACNT_NO 		= '00000028'
   AND A.SUB_ACNT_NO 	= 'N00000001'
   AND A.BAL_QTY		> 0;
  
  
SELECT A.SYMBOL				AS "id"
     , A.SYMBOL_NM			AS "item"
     , A.MKT_ID				AS "mktId"
  FROM TBA_SYMBOL_INFO A
  WHERE (  
 	   A.SYMBOL 		LIKE UPPER(CONCAT(CONCAT('%', ''), '%'))
    OR A.SYMBOL_NM		LIKE UPPER(CONCAT(CONCAT('%', ''), '%')))
   AND A.MKT_ID			LIKE UPPER(CONCAT(CONCAT('%', ''), '%'))
   AND A.SYMBOL 		>= NVL(NULL, ' ')   
 ORDER BY 1; 
 

SELECT A.SYMBOL				AS "id"
     , S.SYMBOL_NM			AS "item"
     , S.MKT_ID				AS "mktId"
  FROM TAC_STOCK_BALANCE A
  JOIN TBA_SYMBOL_INFO S
    ON A.SYMBOL 	= S.SYMBOL    
 WHERE A.ACNT_NO 		= '00000028'
   AND A.SUB_ACNT_NO 	= 'N00000001'
   AND A.BAL_QTY		> 0
   AND S.MKT_ID 		LIKE UPPER(CONCAT(CONCAT('%', ''), '%'))
 ORDER BY 1;
 
SELECT A.SYMBOL				AS "id"
     , A.SYMBOL_NM			AS "item"
  FROM TBA_SYMBOL_INFO A
  WHERE (  
 	   A.SYMBOL 		LIKE UPPER(CONCAT(CONCAT('%', ''), '%'))
    OR A.SYMBOL_NM		LIKE UPPER(CONCAT(CONCAT('%', ''), '%')))
   AND A.SE_TP			LIKE UPPER(CONCAT(CONCAT('%', '01'), '%'))
   AND A.SYMBOL 		>= NVL(NULL, ' ')   
 ORDER BY 1;
 
SELECT COUNT(*) 
  FROM TBA_SYMBOL_INFO
 WHERE SYMBOL = 'TTT';
 
SELECT A.SCR_RGHT_DLST_DATE 
  FROM TBA_SYMBOL_INFO A
 WHERE A.SYMBOL  		= 'ACB';
 
SELECT CEIL(A.PURC_AMT / A.BAL_QTY)		AS "result"
     , A.BAL_QTY						AS "balQty"
     , A.PURC_AMT						AS "purcAmt"
  FROM TAC_STOCK_BALANCE A
 WHERE A.ACNT_NO 		= '00000028'
   AND A.SUB_ACNT_NO 	= 'N00000001'
   AND A.SYMBOL			= 'BBBBAAAA';   
   
  
SELECT A.ORG_CODE			AS "id"
     , A.ORG_NM				AS "item"
  FROM TCA_RELATED_ORG A
 WHERE A.ORG_TP 		= '01'   
 ORDER BY 1;
