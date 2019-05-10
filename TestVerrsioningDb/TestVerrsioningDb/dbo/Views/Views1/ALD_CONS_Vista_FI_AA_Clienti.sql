
CREATE VIEW [dbo].[ALD_CONS_Vista_FI_AA_Clienti]
AS
SELECT     'I' AS CodiceRiga, (CASE WHEN isnull
                          ((SELECT     GrContiPotenziali
                              FROM         ALD_TabTrust TT
                              WHERE     TT.IdTrust = EX.Idtrust), '') = '' THEN TM.GrConti ELSE
                          (SELECT     GrContiPotenziali
                            FROM          ALD_TabTrust TT
                            WHERE      TT.IdTrust = EX.Idtrust) END) AS GruppoConti,
                          (SELECT     TOP (1) IdSocieta
                            FROM          dbo.ALD_TabDittaDatiAggiuntivi) AS IdSocieta, ISNULL(EX.CodSap, '') AS CodiceSap, LEFT(AC.DSCCONTO1, 40) AS RagioneSociale, 
                      SUBSTRING(AC.DSCCONTO1, 41, 40) AS RagioneSociale2, (CASE WHEN AC.FLGPERSFISICA = 1 THEN AC.CODFISCALE ELSE (CASE WHEN LEFT(AC.PARTITAIVA, 11) 
                      = '00000000000' THEN (CASE WHEN LEFT(AC.CODFISCALE, 11) = '00000000000' THEN LEFT(AC.DSCCONTO1, 20) ELSE AC.CODFISCALE END) 
                      ELSE AC.PartitaIVA END) END) AS ChiaveRicerca, LEFT(AC.CODFISCALE, 16) AS CodFiscale, LEFT(AC.PARTITAIVA, 11) AS Piva, LEFT(AC.INDIRIZZO, 60) AS Via, 
                      LEFT(ISNULL(AC.CAP, ''), 10) AS CAP, ISNULL(LEFT(AC.LOCALITA, 35), '') AS Localita, LEFT(ISNULL(AC.CODICEISO, 'IT'), 3) AS Paese, LEFT(ISNULL(AC.PROVINCIA, ''), 
                      3) AS Provincia,
                          (SELECT     IdRegSap
                            FROM          ConsMFM.dbo.TABREGIONI AS TR
                            WHERE      (CODICE = AC.CODREGIONE)) AS Regione, ISNULL(EX.ClassCID, '') AS ClassId, ISNULL(EX.IdSocietaPartnerMNC, '') AS SocietaPartner, 
                      (CASE WHEN isnull(AC.FLGPERSFISICA, 0) = 1 THEN 'X' ELSE '' END) AS PersonaFisica, (CASE WHEN isnull(AC.FLGPERSFISICA, 0) = 1 THEN CAST(datepart(YYYY, 
                      AC.DATANASCITAPERSFIS) AS varchar(4)) + RIGHT('00' + CAST(datepart(MM, AC.DATANASCITAPERSFIS) AS varchar(2)), 2) + RIGHT('00' + CAST(datepart(DAY, 
                      AC.DATANASCITAPERSFIS) AS varchar(2)), 2) ELSE '' END) AS DATANASCITA, LEFT(ISNULL(AC.COMNASCITAPERSFIS, ''), 25) AS LuogoDiNascita, 
                      (CASE WHEN isnull(AC.FLGPERSFISICA, 0) = 1 THEN (CASE WHEN SUBSTRING(AC.CODFISCALE, 10, 2) > '39' THEN '2' ELSE '1' END) ELSE '' END) AS Sesso, 
                      '' AS Professione, (CASE WHEN isnull(BACF.ABI + BACF.cab, '') <> '' THEN ac.CODICEISO ELSE LEFT(isnull(BACF.CODICEIBAN, ''), 2) END) AS PaeseBanca, 
                      RIGHT(ISNULL(BACF.ABI, ''), 5) + ISNULL(BACF.CAB, '') AS ABICAB, SUBSTRING(ISNULL(BACF.CODICEIBAN, ''), 16, 12) AS NConto, 
                      SUBSTRING(ISNULL(BACF.CODICEIBAN, ''), 5, 1) AS CIN, ISNULL(TM.CodContoMastroSap, '') AS ContoMastro, AC.CODCONTO, 0 AS ProgrDDV, 
                      (CASE WHEN isnull(rc.CODPAG, '0000') = '0000' THEN '0000' ELSE
                          (SELECT     TOP 1 ConvTP.CodPagSap
                            FROM          ConsMFM.dbo.TABPAGAMENTI AS TP RIGHT OUTER JOIN
                                                   ConsMFM.dbo.CONS_ALD_TabConvPagSap AS ConvTP ON TP.CODICE = ConvTP.CodPagMetodo
                            WHERE      (ConvTP.PagamentoClienti = 'X') AND (ISNULL(ConvTP.CodPagMetodo, 'ZZZZ') = isnull(rc.CODPAG, '0000')) OR
                                                   (ISNULL(ConvTP.PagDefault, 0) = 1)
                            ORDER BY ConvTP.CodPagSap DESC) END) AS CodPag, (CASE WHEN rc.CODPAG = '' THEN '' ELSE
                          (SELECT     TOP 1 ConvTP.ModPagamento
                            FROM          ConsMFM.dbo.TABPAGAMENTI AS TP RIGHT OUTER JOIN
                                                   ConsMFM.dbo.CONS_ALD_TabConvPagSap AS ConvTP ON TP.CODICE = ConvTP.CodPagMetodo
                            WHERE      (ConvTP.PagamentoClienti = 'X') AND (ISNULL(ConvTP.CodPagMetodo, 'ZZZZ') = isnull(rc.CODPAG, '0000')) OR
                                                   (ISNULL(ConvTP.PagDefault, 0) = 1)
                            ORDER BY ConvTP.CodPagSap DESC) END) AS ModPagamento, '' AS BancaInterna, ISNULL(TM.GrCashMng, '') AS GrCashMng, AC.DATAMODIFICA, 
                      AC.UTENTEMODIFICA, AC.CODDESTINATARIOPA, CAST(DATEPART(YYYY, EX.DtAttivazioneIPA) AS varchar(4)) + RIGHT('00' + CAST(DATEPART(MM, 
                      EX.DtAttivazioneIPA) AS varchar(2)), 2) + RIGHT('00' + CAST(DATEPART(DAY, EX.DtAttivazioneIPA) AS varchar(2)), 2) AS dtAttivaIpa, EX.CodCRM,
                          (SELECT     NaturaTrust
                            FROM          dbo.ALD_TabTrust AS TT
                            WHERE      (IdTrust = EX.IdTrust)) AS NaturaTrust,
                          (SELECT     DESCRIZIONE
                            FROM          dbo.TABPAGAMENTI AS TP
                            WHERE      (CODICE = RC.CODPAG)) AS DscPagamento, RC.CODAGENTE1, EX.CodSapPotenziale
FROM         dbo.BANCAAPPCF AS BACF RIGHT OUTER JOIN
                      dbo.ANAGRAFICARISERVATICF AS RC ON BACF.CODICE = RC.BANCAANAGR AND BACF.CODCONTO = RC.CODCONTO RIGHT OUTER JOIN
                      dbo.ANAGRAFICACF AS AC INNER JOIN
                      dbo.TABMASTRI AS TM ON AC.CODMASTRO = TM.CODICE ON RC.CODCONTO = AC.CODCONTO LEFT OUTER JOIN
                      dbo.EXTRACLIENTI AS EX ON AC.CODCONTO = EX.CODCONTO
WHERE     (RC.ESERCIZIO =
                          (SELECT     ESERCIZIOATTIVO
                            FROM          dbo.TABUTENTI
                            WHERE      (USERDB = CAST(USER_NAME() AS VARCHAR(25))))) AND (AC.TIPOCONTO = 'C') AND (ISNULL
                          ((SELECT     ExporSap
                              FROM         dbo.ALD_TabTrust AS TT
                              WHERE     (IdTrust = EX.IdTrust)), 0) = 1)


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_CONS_Vista_FI_AA_Clienti] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_CONS_Vista_FI_AA_Clienti] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_CONS_Vista_FI_AA_Clienti] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_CONS_Vista_FI_AA_Clienti] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_CONS_Vista_FI_AA_Clienti] TO [Metodo98]
    AS [dbo];

