﻿create view ALDEBRA_ADI_MANCANTIADIUTO_DIP
as
  /*SELEZIONE DOCUMENTI MANCANTI NELLA FAMIGLIA A1053*/
SELECT AVD.* 
FROM 
ALDEBRA_VISTADOCUMENTALE_DIP AVD INNER JOIN
PARAMETRIDOC PD ON AVD.TIPODOC=PD.CODICE LEFT OUTER JOIN
Sicura_DATADB.dbo.A1053 FAMDOC ON AVD.KEYUNIQUE=FAMDOC.F1001
WHERE 
/*VENGONO EVIDENZIATI SOLO I TIPIDOC Altro A fornitore*/
(PD.TIPO='A') AND PD.CLIFOR='F' AND 
/*VIENE ELIMINATO DALLA SELEZIONE TUTTO CIO' CHE E' PRECEDENTE AL 2013*/
AVD.ESERCIZIODOC>=2018 AND
/*VENGONO ELIMINATE LE FATTURE NON APPARTENENTI ALLA FAM A1004*/
AVD.KEYUNIQUE LIKE 'DIP-%' AND
FAMDOC.F1001 IS NULL

GO
GRANT SELECT
    ON OBJECT::[dbo].[ALDEBRA_ADI_MANCANTIADIUTO_DIP] TO [Metodo98]
    AS [dbo];

