﻿


CREATE VIEW [dbo].[ALDEBRA_ADI_ORFANIADIUTO] AS
/*SELEZIONE DOCUMENTI ORFANI NELLA FAMIGLIA A1003*/
SELECT FAMDOC.* 
FROM 
SICURA_DataDB.dbo.A1003 FAMDOC LEFT OUTER JOIN
ALDEBRA_VISTADOCUMENTALE AVD ON FAMDOC.F1001=AVD.KEYUNIQUE
INNER JOIN  Sicura_DATADB.dbo.TDOC ON FAMDOC.FIDD = TDOC.FIDD
WHERE 
AVD.KEYUNIQUE IS NULL
and TDOC.FENA=-1
UNION
/*SELEZIONE DOCUMENTI ORFANI NELLA FAMIGLIA A1004*/
SELECT FAMDOC.* 
FROM 
SICURA_DATADB.dbo.A1004 FAMDOC LEFT OUTER JOIN
ALDEBRA_VISTADOCUMENTALE AVD ON FAMDOC.F1001=AVD.KEYUNIQUE
INNER JOIN  Sicura_DATADB.dbo.TDOC ON FAMDOC.FIDD = TDOC.FIDD
WHERE 
AVD.KEYUNIQUE IS NULL
and TDOC.FENA=-1

GO
GRANT DELETE
    ON OBJECT::[dbo].[ALDEBRA_ADI_ORFANIADIUTO] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALDEBRA_ADI_ORFANIADIUTO] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALDEBRA_ADI_ORFANIADIUTO] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALDEBRA_ADI_ORFANIADIUTO] TO [Metodo98]
    AS [dbo];
