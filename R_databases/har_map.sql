
-- hvc.sql

-- this can be written in Toad/SSMS

SELECT
TOP 100

 Res.PAT_ENC_CSN_ID
, PAT_MRN_ID
, CONVERT(varchar(10), ADMITDATE, 21) as ADMIT_DATE
, CONVERT(varchar(10), DISCHARGEDATE, 21) as DISCHARGE_DATE
, CONVERT(varchar(16), OP.SPECIMN_TAKEN_TIME, 21) as SPECIMEN_TAKEN_DTS
, CC.[NAME]
, CC.COMMON_NAME
, ORD_VALUE
, RS.[NAME] as RESULT_STATUS


FROM StgEpicClarityPHS.dbo.ORDER_RESULTS Res WITH (NOLOCK)
INNER JOIN StgEpicClarityPHS.dbo.CLARITY_COMPONENT CC WITH (NOLOCK)
  ON CC.COMPONENT_ID = Res.COMPONENT_ID
LEFT JOIN StgEpicClarityPHS.dbo.ORDER_PROC_2 OP WITH (NOLOCK)
  ON OP.ORDER_PROC_ID = Res.ORDER_PROC_ID
INNER JOIN StgEpicClarityPHS.dbo.ZC_RESULT_STATUS RS WITH (NOLOCK)
  ON RS.RESULT_STATUS_C = Res.RESULT_STATUS_C
INNER JOIN StgEpicClarityPHS.dbo.HOSP_VISITS_CST HVC WITH (NOLOCK)
  ON HVC.PAT_ENC_CSN_ID = Res.PAT_ENC_CSN_ID

WHERE 1=1
AND DATEPART(mm, OP.SPECIMN_TAKEN_TIME) = DATEPART(mm, DATEADD(m, -1, getdate()))
AND DATEPART(yyyy, OP.SPECIMN_TAKEN_TIME) = DATEPART(yyyy, DATEADD(m, -1, getdate()))
AND CC.NAME LIKE '%A1C%'
AND LEFT(HVC.HSP_LOC_NAME, 3) LIKE 'WSH'

