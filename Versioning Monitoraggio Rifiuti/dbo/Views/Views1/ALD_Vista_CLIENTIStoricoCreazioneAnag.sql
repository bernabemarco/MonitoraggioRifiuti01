

CREATE VIEW [dbo].[ALD_Vista_CLIENTIStoricoCreazioneAnag]
AS
SELECT     ExC.CODCONTO, ExC.DtCreazione, ISNULL(Ald_AnaCFPag.UTENTEMODIFICA, 'DatoRilevatoPrecedentemente') AS TrmCreazione
FROM         dbo.EXTRACLIENTI AS ExC LEFT OUTER JOIN
                      dbo.ALD_MFAnagraficaCFRiservatiPagamento AS Ald_AnaCFPag ON ExC.CODCONTO = ISNULL(Ald_AnaCFPag.CODCONTO, ExC.CODCONTO) AND 
                      YEAR(ExC.DtCreazione) = ISNULL(Ald_AnaCFPag.ESERCIZIO, YEAR(ExC.DtCreazione)) 
and Ald_AnaCFPag.flaginserimento=1


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_Vista_CLIENTIStoricoCreazioneAnag] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_Vista_CLIENTIStoricoCreazioneAnag] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_Vista_CLIENTIStoricoCreazioneAnag] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_Vista_CLIENTIStoricoCreazioneAnag] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_Vista_CLIENTIStoricoCreazioneAnag] TO [Metodo98]
    AS [dbo];

