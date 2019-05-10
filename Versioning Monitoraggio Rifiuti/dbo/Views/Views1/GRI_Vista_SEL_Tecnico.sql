

-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ GRI_Vista_SEL_Tecnico
CREATE VIEW [dbo].[GRI_Vista_SEL_Tecnico]
AS
SELECT	AA.CODAGENTE, AA.DSCAGENTE, AA.INDIRIZZO, AA.CAP,
				AA.LOCALITA, AA.PROVINCIA, AA.CODFISCALE, AA.PROVVIGIONI,
				AA.TELEFONO, AA.FAX, AA.PARTITAIVA, 
				XA.TipoAgente, XA.SoggettoCommessa,
				TA.Descrizione, TA.Posizione
FROM  ANAGRAFICAAGENTI AA 
				INNER JOIN EXTRAAGENTI XA ON AA.CODAGENTE = XA.CODAGENTE 
				INNER JOIN SL_TipoAgente TA ON XA.TipoAgente = TA.CODICE
WHERE  (TA.Posizione = 3)

GO
GRANT DELETE
    ON OBJECT::[dbo].[GRI_Vista_SEL_Tecnico] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GRI_Vista_SEL_Tecnico] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GRI_Vista_SEL_Tecnico] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GRI_Vista_SEL_Tecnico] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GRI_Vista_SEL_Tecnico] TO [Metodo98]
    AS [dbo];

