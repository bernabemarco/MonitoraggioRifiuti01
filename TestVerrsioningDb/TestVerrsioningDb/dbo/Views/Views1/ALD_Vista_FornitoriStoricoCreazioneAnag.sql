
CREATE VIEW [dbo].[ALD_Vista_FornitoriStoricoCreazioneAnag]
AS
SELECT     ExF.CODCONTO, ExF.DtCreazione, ISNULL(Ald_AnaCFPag.UTENTEMODIFICA, 'DatoRilevatoPrecedentemente') AS TrmCreazione
FROM         dbo.EXTRAFORNITORI AS ExF LEFT OUTER JOIN
                      dbo.ALD_MFAnagraficaCFRiservatiPagamento AS Ald_AnaCFPag ON ExF.CODCONTO = ISNULL(Ald_AnaCFPag.CODCONTO, ExF.CODCONTO) AND 
                      YEAR(ExF.DtCreazione) = ISNULL(Ald_AnaCFPag.ESERCIZIO, YEAR(ExF.DtCreazione)) 
and Ald_AnaCFPag.flaginserimento=1

GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_Vista_FornitoriStoricoCreazioneAnag] TO [Metodo98]
    AS [dbo];

