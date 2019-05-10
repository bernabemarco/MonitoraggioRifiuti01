
CREATE VIEW [dbo].ALD_VistaPreventivoClientiVociCustom
AS
SELECT     TFC.PROGRESSIVO, TFC.RIFERIMENTO, TFC.REVISIONE, TABREVISIONICOMMCLI.DESCRIZIONE AS DscRevisione, ExTFC.CodPagamento, 
                      TABPAGAMENTI.DESCRIZIONE AS DscPagamento, ExTFC.RifOffCRM AS RifOffCRMpiePagina, ACF.DSCCONTO1 AS RagSocCli1, 
                      ACF.DSCCONTO2 AS RagSocCli2, ACF.INDIRIZZO, ACF.CAP, ACF.LOCALITA, ACF.PROVINCIA
FROM         TESTEFOGLICOMMCLI AS TFC INNER JOIN
                      EXTRATESTEFOGLICOMMCLI AS ExTFC ON TFC.PROGRESSIVO = ExTFC.PROGRESSIVO INNER JOIN
                      ANAGRAFICACF AS ACF ON TFC.CODCLIENTE = ACF.CODCONTO LEFT OUTER JOIN
                      TABREVISIONICOMMCLI ON TFC.REVISIONE = TABREVISIONICOMMCLI.CODICE LEFT OUTER JOIN
                      TABPAGAMENTI ON ExTFC.CodPagamento = TABPAGAMENTI.CODICE

GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_VistaPreventivoClientiVociCustom] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_VistaPreventivoClientiVociCustom] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_VistaPreventivoClientiVociCustom] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_VistaPreventivoClientiVociCustom] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_VistaPreventivoClientiVociCustom] TO [Metodo98]
    AS [dbo];

