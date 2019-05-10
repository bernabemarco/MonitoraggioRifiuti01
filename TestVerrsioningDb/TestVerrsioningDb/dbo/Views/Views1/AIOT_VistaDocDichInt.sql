

CREATE VIEW AIOT_VistaDocDichInt AS
    SELECT
        DI.CodCliFor, rtrim(rtrim(ACF.DscConto1) + ' ' + ACF.DscConto2) AS RagSocCF,
        DI.Esercizio, DI.Progressivo, DI.NrDichiarazione,
        PD.Tipo AS TipoOB, TD.Progressivo AS IDTestaDoc,
        (CASE rtrim(TD.Bis)
            WHEN '' THEN (TD.TipoDoc + '/' + cast(TD.Esercizio AS varchar) + '/' + cast(TD.NumeroDoc AS varchar))
            ELSE (TD.TipoDoc + '/' + cast(TD.Esercizio AS varchar) + '/' + cast(TD.NumeroDoc AS varchar) + '/' + TD.Bis)
        END) AS NumDoc,
        TD.DataDoc, TD.NumRifDoc, TD.DataRifDoc,
        CI.CodIVA, (TD.Segno * CI.TotImponibileEuroRes) AS ImpEuro,
        TI.Descrizione AS DesIVA

    FROM DichiarazioneIntento DI
        INNER JOIN AnagraficaCF ACF ON DI.CodCliFor=ACF.CodConto
        INNER JOIN TesteDocumenti TD ON DI.Progressivo=TD.ProgDichIntento
        INNER JOIN DichiarazioneIntento_TabDoc DTD ON TD.TipoDoc=DTD.Codice
        INNER JOIN ParametriDoc PD ON TD.TipoDoc=PD.Codice
        INNER JOIN CastellettiIVA CI ON TD.Progressivo=CI.IDTesta
        INNER JOIN TrattamentoIVA TI ON CI.CodIVA=TI.Codice
        INNER JOIN TabUtenti TU ON TU.UserDB=cast(user_name() AS varchar(25))

    WHERE TD.DocChiuso=0
      AND PD.Tipo IN ('O', 'B')
      AND TI.Plafond=1
      AND (TU.Supervisor=1 OR (TU.Supervisor=0 AND UserID IN (SELECT AD.NomeUtente FROM AccessiDocumenti AD WHERE AD.CodDocumento=TD.TipoDoc AND AD.FlagVisualizza=1)))
      AND (DI.CodCliFor=TU.CodCliFor OR isnull(TU.CodCliFor, '')='')

GO
GRANT SELECT
    ON OBJECT::[dbo].[AIOT_VistaDocDichInt] TO [Metodo98]
    AS [dbo];

