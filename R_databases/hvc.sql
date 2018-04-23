
-- hvc.sql

-- this can be written in Toad/SSMS

SELECT

PAT_MRN_ID,
PAT_ENC_CSN_ID,
PAT_BASE_CLASS,
HOSP_SERV,
DISCHARGEDATE

FROM StgEpicClarityPHS.dbo.HOSP_VISITS_CST

WHERE DISCHARGEDATE > '2018-03-01'
AND HSP_LOC_NAME LIKE '%SACRED%'
