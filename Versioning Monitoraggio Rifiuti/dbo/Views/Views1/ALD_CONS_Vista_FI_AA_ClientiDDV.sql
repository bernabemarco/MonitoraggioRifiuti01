
CREATE VIEW [dbo].[ALD_CONS_Vista_FI_AA_ClientiDDV]
AS
SELECT     'I' AS CodiceRiga, TM.GrContiDDV AS GruppoConti,
                          (SELECT     TOP (1) IdSocieta
                            FROM          dbo.ALD_TabDittaDatiAggiuntivi) AS IdSocieta, DDV.codiceSapDest AS CodiceSap, LEFT(DDV.RAGIONESOCIALE, 40) AS RagioneSociale, 
                      ISNULL(SUBSTRING(DDV.RAGIONESOCIALE, 41, 40), '') AS RagioneSociale2, format(DDV.CODICE, '00000') AS ChiaveRicerca, '' AS CodFiscale, '' AS Piva, 
                      LEFT(DDV.INDIRIZZO, 60) AS Via, DDV.CAP, ISNULL(LEFT(DDV.LOCALITA, 35), '') AS Localita, LEFT(ISNULL(TNaz.CODICEISO, 'IT'), 3) AS Paese, 
                      LEFT(ISNULL(DDV.PROVINCIA, ''), 3) AS Provincia, '' AS Regione, '' AS ClassId, '' AS SocietaPartner, '' AS PersonaFisica, '' AS DATANASCITA, '' AS LuogoDiNascita, 
                      '' AS Sesso, '' AS Professione, '' AS PaeseBanca, '' AS ABICAB, '' AS NConto, '' AS CIN, '' AS ContoMastro, AC.CODCONTO, ISNULL(DDV.CODICE, 0) AS ProgrDDV, 
                      '' AS CodPag, '' AS ModPagamento, '' AS BancaInterna, '' AS GrCashMng, DDV.DATAMODIFICA, DDV.UTENTEMODIFICA, '' AS CODDESTINATARIOPA, '' AS dtAttivaIpa, 
                      '' AS CodCRM, '' AS NaturaTrust, '' AS DscPagamento, '' AS CODAGENTE1, '' AS CodSapPotenziale
FROM         dbo.DESTINAZIONIDIVERSE AS DDV INNER JOIN
                      dbo.ANAGRAFICACF AS AC INNER JOIN
                      dbo.TABMASTRI AS TM ON AC.CODMASTRO = TM.CODICE ON DDV.CODCONTO = AC.CODCONTO INNER JOIN
                      dbo.TABNAZIONI AS TNaz ON DDV.CODNAZIONE = TNaz.CODICE LEFT OUTER JOIN
                      dbo.EXTRACLIENTI AS EX ON AC.CODCONTO = EX.CODCONTO
WHERE     (AC.TIPOCONTO = 'C') AND (DDV.StatoExportDDVSap = 0) AND (DDV.Dismesso = 0) AND (DDV.NoExport = 0) AND (ISNULL(TM.GrContiDDV, '') <> '') AND 
                      (ISNULL
                          ((SELECT     ExporSap
                              FROM         dbo.ALD_TabTrust AS TT
                              WHERE     (IdTrust = EX.IdTrust)), 0) = 1)


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_CONS_Vista_FI_AA_ClientiDDV] TO [Metodo98]
    AS [dbo];

