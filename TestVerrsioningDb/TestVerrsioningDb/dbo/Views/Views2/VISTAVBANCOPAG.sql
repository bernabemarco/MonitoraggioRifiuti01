CREATE VIEW VISTAVBANCOPAG AS           
SELECT 
TesteVBanco.Progressivo,
TesteVBanco.Data,
TesteVBanco.CodCausale,
TesteVBanco.Listino,
TesteVBanco.ScontoFinale,
TesteVBanco.TotImponibile,
TesteVBanco.TotImposta,
TesteVBanco.TotaleNetto,
TesteVBanco.TotImponibileEuro,
TesteVBanco.TotImpostaEuro,
TesteVBanco.TotaleNettoEuro,
TesteVBanco.Incassato,
TesteVBanco.AggMagazzino,
TesteVBanco.Contabilizzato,
TesteVBanco.TipoRigaCont,
TesteVBanco.RigaContabile,
ParametriVBanco.CausPagamento,
(CASE WHEN   ParametriVBanco.UsaCliCorr='C' OR ParametriVBanco.UsaCliCorr='E' THEN  (SELECT   TABVINCOLIGIC.SCCLICORRISP   FROM   TABVINCOLIGIC WHERE ESERCIZIO=(SELECT ESERCIZIOATTIVO FROM TABUTENTI WHERE USERDB=USER_NAME())) ELSE   TesteVBanco.CodCliente   END) AS CodCli
FROM          
(TesteVBanco INNER JOIN ParametriVBanco ON TesteVBanco.CodCausale=ParametriVBanco.Codice)
WHERE TesteVBanco.Progressivo IN (SELECT IDTESTA FROM VBSituazioneCassaD)


GO
GRANT DELETE
    ON OBJECT::[dbo].[VISTAVBANCOPAG] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[VISTAVBANCOPAG] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[VISTAVBANCOPAG] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTAVBANCOPAG] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[VISTAVBANCOPAG] TO [Metodo98]
    AS [dbo];

