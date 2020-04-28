DROP TABLE TBA_STOCK_INFO_RECV_DTL;
CREATE TABLE TBA_STOCK_INFO_RECV_DTL(
    RECV_DATE          VARCHAR2(8)    NOT NULL,
    RECV_SEQ          NUMBER    NOT NULL,
    EXCH_TRAN_CODE          VARCHAR2(11),
    MSG_SEQ          NUMBER,
    BIZ_DATE          VARCHAR2(8),
    MKT_ID          VARCHAR2(3),
    SYMBOL          VARCHAR2(12),
    BORD_ID          VARCHAR2(2),
    EXCH_ID          VARCHAR2(2),
    PROD_GRP_ID          VARCHAR2(3),
    ABBR_SYMBOL          VARCHAR2(9),
    SE_GRP_ID          VARCHAR2(2),
    TRD_CURR_ID          VARCHAR2(1),
    PROD_ID          VARCHAR2(11),
    TCKR_CODE          VARCHAR2(20),
    SYMBOL_NM          VARCHAR2(120),
    SYMBOL_ABBR_NM          VARCHAR2(40),
    SYMBOL_ENG_NM          VARCHAR2(80),
    SYMBOL_ENG_ABBR_NM          VARCHAR2(40),
    LISTDT          VARCHAR2(8),
    CURR_CODE          VARCHAR2(3),
    INTGR_DIGT          NUMBER,
    DECI_DIGT          NUMBER,
    CLSPRC          NUMBER,
    CLSPRC_CLSS_TP          VARCHAR2(1),
    FST_TRD_DATE          VARCHAR2(8),
    VWAP          NUMBER,
    RFPRC          NUMBER,
    HLMPRC          NUMBER,
    LLMPRC          NUMBER,
    MKT_CMPO_AVAL_YN          VARCHAR2(1),
    TRD_STOP_YN          VARCHAR2(1),
    LQDT_TRAN_YN          VARCHAR2(1),
    FVAL          NUMBER,
    ISSUDT          VARCHAR2(8),
    LIST_STK_QTY          NUMBER,
    DLSTDT          VARCHAR2(8),
    CMSTK_SYMBOL          VARCHAR2(12),
    STK_KND_TP          VARCHAR2(2),
    PRC_CHNG_TP          VARCHAR2(1),
    EXRGHT_CLSS_TP          VARCHAR2(2),
    TRGT_STK_SYMBOL          VARCHAR2(12),
    EVPRC          NUMBER,
    LPRC          NUMBER,
    HPRC          NUMBER,
    RDMP_DATE          VARCHAR2(8),
    EXCH_BD_CLSS_CODE          VARCHAR2(10),
    ISUR          VARCHAR2(10),
    CLSPRC_YLD          NUMBER,
    CPNRT          NUMBER,
    INT_PAY_MTHD_CODE          VARCHAR2(2),
    INT_PAY_MM_CNT          NUMBER,
    INT_CALC_TP          VARCHAR2(2),
    DSCT_INT_CALC_TP          VARCHAR2(2),
    DSCT_BD_YN          VARCHAR2(1),
    INT_PAYDT_BAS_TP          VARCHAR2(1),
    FST_INT_PAYDT          VARCHAR2(8),
    INT_MMEND_BAS_TP          VARCHAR2(1),
    INT_PRE_TSND_TP          VARCHAR2(1),
    RISK_BD_RDMP_TP          VARCHAR2(1),
    INT_CALC_MIN_PRC_UNIT          NUMBER,
    INT_TRUC_TP          VARCHAR2(1),
    INT_EX_DATE          VARCHAR2(8),
    FRN_INT_CODE          VARCHAR2(2),
    FRN_SPRD          NUMBER,
    FRN_INT          NUMBER,
    FRN_NX_INT          NUMBER,
    GNRL_ACRINT          NUMBER,
    INDX_CALC_ORG_CODE          VARCHAR2(1),
    INDX_MKT_CLSS_ID          VARCHAR2(6),
    INDX_SEQ          VARCHAR2(3),
    INDX_LVRG_OPPS_TP          VARCHAR2(2),
    SETL_MTHD_TP          VARCHAR2(1),
    LAST_TRD_DATE          VARCHAR2(8),
    DRVT_RGHT_TP          VARCHAR2(1),
    EXER_PRC          NUMBER,
    ISSU_MKT_PTCP_PRSN_NO          VARCHAR2(5),
    ELW_CNVS_RT          NUMBER,
    ELW_PAY_AGNC_PRSN          VARCHAR2(120),
    ELW_PAYDT          VARCHAR2(8),
    SCR_RGTH_DLST_DATE          VARCHAR2(8),
    YY_BAS_DAYS          NUMBER,
    REPO_BAS_SYMBOL          VARCHAR2(12),
    REPO_TERM          NUMBER,
    REPO_REAL_TERM          NUMBER,
    REPO_HRCUT_RT          NUMBER,
    MKT_VAL_PRC          NUMBER,
    SETL_DATE          VARCHAR2(8),
    FRNR_BUY_AVAL_QTY          NUMBER,
    FRNR_POSS_QTY          NUMBER,
    FRNR_ORDR_LMT_QTY          NUMBER,
    SYMBOL_MNGT_STAT_CODE          VARCHAR2(3),
    SYMBOL_TRD_STAT_CODE          VARCHAR2(3),
    SYMBOL_TRD_SANC_STAT_CODE          VARCHAR2(3),
    WRKR_ID          VARCHAR2(20),
    WRK_TMP          NUMBER,
PRIMARY KEY(RECV_DATE,RECV_SEQ)
);

SELECT A.SYMBOL						AS "symbol"
     , A.MKT_ID                     AS "mktId"
     , A.BORD_ID                    AS "bordId"
     , A.EXCH_ID                    AS "exchId"
     , A.PROD_ID                    AS "prodId"
     , A.ABBR_SYMBOL                AS "abbrSymbol"
     , A.SE_GRP_ID                  AS "seGrpId"
     , A.TRD_CURR_ID                AS "trdCurrId"
     , A.PROD_GRP_ID                AS "prodGrpId"
     , A.ISIN_CODE                  AS "isinCode"
     , A.SYMBOL_NM                  AS "symbolNm"
     , A.SYMBOL_ABBR_NM             AS "symbolAbbrNm"
     , A.SYMBOL_ENG_NM              AS "symbolEngNm"
     , A.SYMBOL_ENG_ABBR_NM         AS "symbolEngAbbrNm"
     , A.SE_TP                      AS "seTp"
     , A.LISTDT                     AS "listdt"
     , A.CURR_CODE                  AS "currCode"
     , A.SETL_MULT                  AS "setlMult"
     , A.INTGR_DIGT                 AS "intgrDigt"
     , A.DECI_DIGT                  AS "deciDigt"
     , A.CLSPRC                     AS "clsprc"
     , A.CLSPRC_CLSS_TP             AS "clsprcClssTp"
     , A.FST_TRD_DATE               AS "fstTrdDate"
     , A.VWAP                       AS "vwap"
     , A.RFPRC                      AS "rfprc"
     , A.HLMPRC                     AS "hlmprc"
     , A.LLMPRC                     AS "llmprc"
     , A.MKT_CMPO_AVAL_YN           AS "mktCmpoAvalYn"
     , A.TRD_STOP_YN                AS "trdStopYn"
     , A.LQDT_TRAN_YN               AS "lqdtTranYn"
     , A.FVAL                       AS "fval"
     , A.ISSUDT                     AS "issudt"
     , A.LIST_STK_QTY               AS "listStkQty"
     , A.DLSTDT                     AS "dlstdt"
     , A.CMSTK_SYMBOL               AS "cmstkSymbol"
     , A.STK_KND_TP                 AS "stkKndTp"
     , A.PRC_CHNG_TP                AS "prcChngTp"
     , A.EXRGHT_CLSS_TP             AS "exrghtClssTp"
     , A.TRGT_STK_SYMBOL            AS "trgtStkSymbol"
     , A.EVPRC                      AS "evprc"
     , A.LPRC                       AS "lprc"
     , A.HPRC                       AS "hprc"
     , A.RDMP_DATE                  AS "rdmpDate"
     , A.EXCH_BD_CLSS_CODE          AS "exchBdClssCode"
     , A.ISUR                       AS "isur"
     , A.CLSPRC_YLD                 AS "clsprcYld"
     , A.CPNRT                      AS "cpnrt"
     , A.INT_PAY_MTHD_CODE          AS "intPayMthdCode"
     , A.INT_PAY_MM_CNT             AS "intPayMmCnt"
     , A.INT_CALC_TP                AS "intCalcTp"
     , A.DSCT_INT_CALC_TP           AS "dsctIntCalcTp"
     , A.DSCT_BD_YN                 AS "dsctBdYn"
     , A.INT_PAYDT_BAS_TP           AS "intPaydtBasTp"
     , A.FST_INT_PAYDT              AS "fstIntPaydt"
     , A.INT_MMEND_BAS_TP           AS "intMmendBasTp"
     , A.INT_PRE_TSND_TP            AS "intPreTsndTp"
     , A.RISK_BD_RDMP_TP            AS "riskBdRdmpTp"
     , A.INT_CALC_MIN_PRC_UNIT      AS "intCalcMinPrcUnit"
     , A.INT_TRUC_TP                AS "intTrucTp"
     , A.INT_EX_DATE                AS "intExDate"
     , A.FRN_INT_CODE               AS "frnIntCode"
     , A.FRN_SPRD                   AS "frnSprd"
     , A.FRN_INT                    AS "frnInt"
     , A.FRN_NX_INT                 AS "frnNxInt"
     , A.GNRL_ACRINT                AS "gnrlAcrint"
     , A.INDX_CALC_ORG_CODE         AS "indxCalcOrgCode"
     , A.INDX_MKT_CLSS_ID           AS "indxMktClssId"
     , A.INDX_SEQ                   AS "indxSeq"
     , A.INDX_LVRG_OPPS_TP          AS "indxLvrgOppsTp"
     , A.SETL_MTHD_TP               AS "setlMthdTp"
     , A.LAST_TRD_DATE              AS "lastTrdDate"
     , A.DRVT_RGHT_TP               AS "drvtRghtTp"
     , A.EXER_PRC                   AS "exerPrc"
     , A.ISSU_MKT_PTCP_PRSN_NO      AS "issuMktPtcpPrsnNo"
     , A.ELW_CNVS_RT                AS "elwCnvsRt"
     , A.ELW_PAY_AGNC_PRSN          AS "elwPayAgncPrsn"
     , A.ELW_PAYDT                  AS "elwPaydt"
     , A.SCR_RGTH_DLST_DATE         AS "scrRgthDlstDate"
     , A.YY_BAS_DAYS                AS "yyBasDays"
     , A.REPO_BAS_SYMBOL            AS "repoBasSymbol"
     , A.REPO_TERM                  AS "repoTerm"
     , A.REPO_REAL_TERM             AS "repoRealTerm"
     , A.REPO_HRCUT_RT              AS "repoHrcutRt"
     , A.MKT_VAL_PRC                AS "mktValPrc"
     , A.SETL_DATE                  AS "setlDate"
     , A.FRNR_BUY_AVAL_QTY          AS "frnrBuyAvalQty"
     , A.FRNR_POSS_QTY              AS "frnrPossQty"
     , A.FRNR_ORDR_LMT_QTY          AS "frnrOrdrLmtQty"
     , A.UNDLY_ID                   AS "undlyId"
     , A.EXPR_YYMM                  AS "exprYymm"
     , A.EXPRDT                     AS "exprdt"
     , A.LAST_SETL_DATE             AS "lastSetlDate"
     , A.DRVT_RGHT_EXER_CLSS_TP     AS "drvtRghtExerClssTp"
     , A.DRVT_ADJT_TP               AS "drvtAdjtTp"
     , A.UNDLY_SYMBOL               AS "undlySymbol"
     , A.REMN_DAYS                  AS "remnDays"
     , A.SETL_PRC                   AS "setlPrc"
     , A.OPT_PRC_TP                 AS "optPrcTp"
     , A.SPRD_CMPO_CODE             AS "sprdCmpoCode"
     , A.SPRD_CMPO_SYMBOL_1ST       AS "sprdCmpoSymbol1st"
     , A.SPRD_CMPO_SYMBOL_2ND       AS "sprdCmpoSymbol2nd"
     , A.SYMBOL_MNGT_STAT_CODE      AS "symbolMngtStatCode"
     , A.SYMBOL_TRD_STAT_CODE       AS "symbolTrdStatCode"
     , A.SYMBOL_TRD_SANC_STAT_CODE  AS "symbolTrdSancStatCode"
     , A.MRGN_TRAN_AVAL_YN          AS "mrgnTranAvalYn"
     , A.MRGN_PRC                   AS "mrgnPrc"
     , A.SSC_MRGN_RT                AS "sscMrgnRt"
     , A.PNTS_MRGN_RT               AS "pntsMrgnRt"
     , A.SSC_ASST_EVLT_PRC          AS "sscAsstEvltPrc"
     , A.PNTS_ASST_EVLT_PRC         AS "pntsAsstEvltPrc"
     , A.SSC_ASST_EVLT_RT           AS "sscAsstEvltRt"
     , A.PNTS_ASST_EVLT_RT          AS "pntsAsstEvltRt"
     , A.WRKR_ID                    AS "wrkrId"
     , A.WRK_TMP                    AS "wrkTmp"
  FROM TBA_SYMBOL_INFO A
 WHERE A.SYMBOL  		= 'ADB';
 

SELECT *
  FROM TBA_SYMBOL_INFO;
 
 
SELECT A.SYMBOL				AS "id"
     , A.SYMBOL_NM			AS "item"
  FROM TBA_SYMBOL_INFO A
 ORDER BY 1; 
 
SELECT A.CURR_CODE			AS "value"
     , A.CURR_CODE			AS "text"
  FROM TCA_CURRENCY A
 WHERE A.MJR_CURR_YN 		= 'Y'   
 ORDER BY 1;
 
SELECT A.ORG_CODE			AS "id"
     , A.ORG_NM				AS "item"
  FROM TCA_RELATED_ORG A
 WHERE A.ORG_TP 			= '03'   
 ORDER BY 1;
 

SELECT A.SYMBOL				AS "id"
     , A.SYMBOL_NM			AS "item"
  FROM TBA_SYMBOL_INFO A
  WHERE (  
 	   A.SYMBOL 			LIKE CONCAT(CONCAT('%', 'S'), '%')
   AND A.SYMBOL_NM 			LIKE CONCAT(CONCAT('%', ''), '%') )
 ORDER BY 1; 
 
SELECT A.SYMBOL						AS "symbol"				
  FROM TBA_SYMBOL_INFO A
 WHERE A.SYMBOL  					= 'SSS'
   AND A.SYMBOL_NM					= 'Sample'
   AND A.SYMBOL_ENG_NM				= 'Sample'
   AND A.ABBR_NM					= 'SSS'
   AND A.ENG_ABBR_NM				= 'Sample';
   
  
SELECT A.SYMBOL						AS "symbol"
	 , A.TCKR_CODE					AS "tckrCode"				
     , A.EXCH_ID					AS "exchId"				
     , A.SE_GRP_ID					AS "seGrpId"
     , A.PDT_CLSPRC					AS "pdtClsprc"
     , A.EVPRC						AS "evprc"				
     , A.RFPRC						AS "rfprc"				
     , A.HLMPRC						AS "hlmprc"				
     , A.LLMPRC						AS "llmprc"				
     , A.HPRC						AS "hprc"					
     , A.LPRC						AS "lprc"					
     , A.SETL_PRC					AS "setlPrc"					
     , A.VWAP						AS "vwap"					
     , A.EXRGHT_CLSS_TP				AS "exrghtClssTp"					
     , A.UNSETL_QTY					AS "unsetlQty"					
     , A.SYMBOL_MNGT_STAT_CODE		AS "symbolMngtStatCode"				
     , A.SYMBOL_TRD_STAT_CODE		AS "symbolTrdStatCode"				
     , A.SYMBOL_TRD_SANC_STAT_CODE	AS "symbolTrdSancStatCode"				
     , A.TRD_STOP_YN				AS "trdStopYn"				
     , A.RAND_END_TRGR_COND_TP		AS "randEndTrgrCondTp"				
  FROM TBA_SYMBOL_DEFINE_RECV_DTL A
 WHERE (  
 	   A.TCKR_CODE			LIKE CONCAT(CONCAT('%', ''), '%')
    OR UPPER(A.SYMBOL_NM)	LIKE CONCAT(CONCAT('%', ''), '%') )
   AND A.TCKR_CODE 			>= NVL(null, ' ')   
 ORDER BY A.TCKR_CODE 

 
SELECT A.SYMBOL						AS "symbol"
	 , A.TCKR_CODE					AS "tckrCode"				
	 , A.SYMBOL_NM					AS "symbolNm"				
     , A.EXCH_ID					AS "exchId"				
     , A.SE_TP						AS "seTp"
     , A.SE_GRP_ID					AS "seGrpId"
     , A.PDT_CLSPRC					AS "pdtClsprc"
     , A.EVPRC						AS "evprc"				
     , A.RFPRC						AS "rfprc"				
     , A.HLMPRC						AS "hlmprc"				
     , A.LLMPRC						AS "llmprc"				
     , A.HPRC						AS "hprc"					
     , A.LPRC						AS "lprc"					
     , A.SETL_PRC					AS "setlPrc"					
     , A.VWAP						AS "vwap"					
     , A.EXRGHT_CLSS_TP				AS "exrghtClssTp"					
     , A.UNSETL_QTY					AS "unsetlQty"					
     , A.SYMBOL_MNGT_STAT_CODE		AS "symbolMngtStatCode"				
     , A.SYMBOL_TRD_STAT_CODE		AS "symbolTrdStatCode"				
     , A.SYMBOL_TRD_SANC_STAT_CODE	AS "symbolTrdSancStatCode"				
     , A.TRD_STOP_YN				AS "trdStopYn"				
     , A.RAND_END_TRGR_COND_TP		AS "randEndTrgrCondTp"				
  FROM TBA_SYMBOL_INFO A
 WHERE (  
 	   A.TCKR_CODE			LIKE CONCAT(CONCAT('%', ''), '%')
    OR UPPER(A.SYMBOL_NM)	LIKE CONCAT(CONCAT('%', ''), '%') )
   AND A.SE_TP				LIKE CONCAT(CONCAT('%', ''), '%')
   AND A.TCKR_CODE 			>= NVL(NULL, ' ')   
 ORDER BY A.TCKR_CODE;
 

SELECT A.RECV_DATE					AS "recvDate"
	 , A.RECV_SEQ					AS "recvSeq"
	 , A.TCKR_CODE					AS "tckrCode"				
     , A.EXCH_ID					AS "exchId"				
     , A.SE_GRP_ID					AS "seGrpId"
     , A.PDT_CLSPRC					AS "pdtClsprc"
     , A.EVPRC						AS "evprc"				
     , A.RFPRC						AS "rfprc"				
     , A.HLMPRC						AS "hlmprc"				
     , A.LLMPRC						AS "llmprc"				
     , A.HPRC						AS "hprc"					
     , A.LPRC						AS "lprc"					
     , A.SETL_PRC					AS "setlPrc"					
     , A.VWAP						AS "vwap"					
     , A.EXRGHT_CLSS_TP				AS "exrghtClssTp"					
     , A.UNSETL_QTY					AS "unsetlQty"					
     , A.SYMBOL_MNGT_STAT_CODE		AS "symbolMngtStatCode"				
     , A.SYMBOL_TRD_STAT_CODE		AS "symbolTrdStatCode"				
     , A.SYMBOL_TRD_SANC_STAT_CODE	AS "symbolTrdSancStatCode"				
     , A.TRD_STOP_YN				AS "trdStopYn"				
     , A.RAND_END_TRGR_COND_TP		AS "randEndTrgrCondTp"	
  FROM TBA_SYMBOL_DEFINE_RECV_DTL A	 
 WHERE (
 	   A.RECV_DATE			BETWEEN '20190101' AND '20200129'
   AND A.TCKR_CODE 			LIKE CONCAT(CONCAT('%', ''), '%')
   AND A.SE_GRP_ID			LIKE CONCAT(CONCAT('%', ''), '%')
   AND A.TRD_STOP_YN		LIKE CONCAT(CONCAT('%', 'N'), '%') )
   AND CONCAT(A.RECV_DATE, A.TCKR_CODE) >= NVL(NULL, ' ')
 ORDER BY A.RECV_DATE DESC;    
 

DROP TABLE TBA_SYMBOL_DAILY_PRICE_INFO;
CREATE TABLE TBA_SYMBOL_DAILY_PRICE_INFO(
    RECV_DATE          VARCHAR2(8)    NOT NULL,
    EXCH_ID          VARCHAR2(2)    NOT NULL,
    MKT_ID          VARCHAR2(3)    NOT NULL,
    SYMBOL          VARCHAR2(12)    NOT NULL,
    RFPRC          NUMBER    DEFAULT '0'    NOT NULL,
    EVPRC          NUMBER    DEFAULT '0'    NOT NULL,
    HPRC          NUMBER    DEFAULT '0'    NOT NULL,
    LPRC          NUMBER    DEFAULT '0'    NOT NULL,
    HLMPRC          NUMBER    DEFAULT '0'    NOT NULL,
    LLMPRC          NUMBER    DEFAULT '0'    NOT NULL,
    CLSPRC          NUMBER,
    CLSPRC_CLSS_TP          VARCHAR2(1),
    VWAP          NUMBER    DEFAULT '0'    NOT NULL,
    SETL_PRC          NUMBER    DEFAULT '0'    NOT NULL,
    EXRGHT_CLSS_TP          VARCHAR2(2),
    TRD_STOP_YN          VARCHAR2(1)    DEFAULT 'N'    NOT NULL,
    SYMBOL_MNGT_STAT_CODE          VARCHAR2(3),
    SYMBOL_TRD_STAT_CODE          VARCHAR2(3),
    SYMBOL_TRD_SANC_STAT_CODE          VARCHAR2(3),
    WRKR_ID          VARCHAR2(20),
    WRK_TMP          NUMBER,
PRIMARY KEY(RECV_DATE,EXCH_ID)
);


SELECT A.RECV_DATE       			AS "recvDate"	
     , A.RECV_SEQ                   AS "recvSeq"		
     , A.MKT_ID                     AS "mktId"		
     , A.BORD_ID                    AS "bordId"		
     , A.RFPRC                      AS "rfprc"		
     , A.HLMPRC                     AS "hlmprc"		
     , A.LLMPRC                     AS "llmprc"		
     , A.EVPRC                      AS "evprc"		
     , A.HPRC                       AS "hprc"			
     , A.LPRC                       AS "lprc"			
     , A.LIST_STK_QTY               AS "listStkQty"	
     , A.EXRGHT_CLSS_TP             AS "exrghtClssTp"	
     , A.WRKR_ID                    AS "wrkrId"		
     , A.WRK_TMP                    AS "wrkTmp"		
     , A.SYMBOL                 	AS "symbol"		
     , B.SYMBOL_NM            		AS "symbolNm"		
	 , B.EXCH_ID                    AS "exchId"		
	 , B.CURR_CODE                  AS "currCode"		
  FROM TBA_SYMBOL_NOTI_RECV_DTL A
  LEFT OUTER JOIN TBA_SYMBOL_INFO B
    ON A.SYMBOL 	= B.ISIN_CODE 
 WHERE (
 	   A.RECV_DATE			BETWEEN '20200101' AND '20200220' 
   AND B.SYMBOL 			LIKE CONCAT(CONCAT('%', 'ACB'), '%')
   AND A.MKT_ID				LIKE CONCAT(CONCAT('%', '%'), '%')
   AND A.BORD_ID			LIKE CONCAT(CONCAT('%', '%'), '%') )
   AND CONCAT(A.RECV_DATE, A.RECV_SEQ) >= NVL(NULL, ' ')
ORDER BY A.RECV_DATE, A.RECV_SEQ;


SELECT A.TRD_DATE	                AS "trdDate"		
     , A.MKT_ID                     AS "mktId"		
     , A.BORD_ID                    AS "bordId"		
     , A.CLSPRC                     AS "clsprc"		
     , A.CLSPRC_YLD                 AS "clsprcYld"		
     , A.CLSPRC_CLSS_TP             AS "clsprcClssTp"	
     , A.WRKR_ID                    AS "wrkrId"		
     , A.WRK_TMP                    AS "wrkTmp"		
     , B.SYMBOL                 	AS "symbol"		
     , B.SYMBOL_NM             		AS "symbolNm"		
	 , B.EXCH_ID                    AS "exchId"		
	 , B.CURR_CODE                  AS "currCode"
  FROM TBA_SYMBOL_DAILY_CLOSE_PRICE A
  LEFT OUTER JOIN TBA_SYMBOL_INFO B
    ON A.SYMBOL		= B.ISIN_CODE
 WHERE (
 	   A.TRD_DATE			BETWEEN '20200101' AND '20200220')
   AND B.SYMBOL 			LIKE CONCAT(CONCAT('%', ''), '%')
   AND A.MKT_ID				LIKE CONCAT(CONCAT('%', ''), '%')
   AND A.BORD_ID			LIKE CONCAT(CONCAT('%', ''), '%') )
   AND CONCAT(A.TRD_DATE, B.SYMBOL) >= NVL(NULL, ' ')
ORDER BY A.TRD_DATE, B.SYMBOL;



SELECT A.RECV_DATE					AS "recvDate"
     , A.EXCH_ID					AS "exchId"
     , A.MKT_ID                     AS "mktId"
     , A.RFPRC                      AS "rfprc"
     , A.EVPRC                      AS "evprc"
     , A.HPRC                       AS "hprc"
     , A.LPRC                       AS "lprc"
     , A.HLMPRC                     AS "hlmprc"
     , A.LLMPRC                     AS "llmprc"
     , A.CLSPRC                     AS "pdtClsprc"
     , A.CLSPRC_CLSS_TP             AS "clsprcClssTp"
     , A.VWAP                       AS "vwap"
     , A.SETL_PRC                   AS "setlPrc"
     , A.EXRGHT_CLSS_TP             AS "exrghtClssTp"
     , A.TRD_STOP_YN                AS "trdStopYn"
     , A.SYMBOL_MNGT_STAT_CODE      AS "symbolMngtStatCode"
     , A.SYMBOL_TRD_STAT_CODE       AS "symbolTrdStatCode"
     , A.SYMBOL_TRD_SANC_STAT_CODE  AS "symbolTrdSancStatCode"
     , B.SYMBOL                     AS "symbol"
     , B.SYMBOL_NM             		AS "symbolNm"		
  FROM TBA_SYMBOL_DAILY_PRICE_INFO A
  LEFT OUTER JOIN TBA_SYMBOL_INFO B
    ON A.SYMBOL 	= B.ISIN_CODE
 WHERE (
 	   A.RECV_DATE			BETWEEN '20200221' AND '20200221'
   AND B.SYMBOL 			LIKE CONCAT(CONCAT('%', ''), '%')
   AND A.EXCH_ID			LIKE CONCAT(CONCAT('%', ''), '%')
   AND A.MKT_ID				LIKE CONCAT(CONCAT('%', ''), '%') )
   AND CONCAT(A.RECV_DATE, B.SYMBOL) >= NVL(NULL, ' ')
 ORDER BY A.RECV_DATE, B.SYMBOL;   
 
 
 
 SELECT COUNT(1)
  FROM TBA_SYMBOL_DAILY_PRICE_INFO A
  LEFT OUTER JOIN TBA_SYMBOL_INFO B
    ON A.SYMBOL 	= B.ISIN_CODE
 WHERE (
 	   A.RECV_DATE			BETWEEN '20200221' AND '20200221'
   AND B.SYMBOL 			LIKE CONCAT(CONCAT('%', ''), '%')
   AND A.EXCH_ID			LIKE CONCAT(CONCAT('%', ''), '%')
   AND A.MKT_ID				LIKE CONCAT(CONCAT('%', ''), '%') );
   
 