

CREATE VIEW AIOT_VistaTotaliDichInt AS
    SELECT
        DI.Progressivo,
        DI.CodCliFor, rtrim(rtrim(ACF.DscConto1) + ' ' + ACF.DscConto2) AS RagSocCF,
        DI.Esercizio, DI.NrDichiarazione, DI.NrDichRicevuta,
        DI.DataEmissione, DI.DataRegistrazione,
        DI.TipoDichiarazione,
        DI.ImportoPeriodoEuro AS ImpDichEuro,
        DI.NrProtocollo1, DI.NrProtocollo2,
        DI.Revoca, DI.DataRevoca, DI.Definitivo,
        isnull(FT.ImponibileEuro, 0) AS ImpFattEuro,
        (DI.ImportoPeriodoEuro - isnull(FT.ImponibileEuro, 0)) AS ImpResEuro,
        isnull(OB.ImpOrdEuro, 0) AS ImpOrdEuro, isnull(OB.ImpDDTEuro, 0) AS ImpDDTEuro

    FROM DichiarazioneIntento DI
        INNER JOIN AnagraficaCF ACF ON DI.CodCliFor=ACF.CodConto
        LEFT OUTER JOIN (SELECT DIF.ProgDichIntento, sum(DIF.ImponibileEuro) AS ImponibileEuro

            FROM VistaPlafondDichIntFatt DIF
                INNER JOIN TrattamentoIVA TIF ON DIF.CodIVA=TIF.Codice

            WHERE DIF.ProgDichIntento<>0 AND TIF.Plafond=1

            GROUP BY DIF.ProgDichIntento

        ) FT ON DI.Progressivo=FT.ProgDichIntento
        LEFT OUTER JOIN (SELECT TD.ProgDichIntento,
                sum(CASE PD.Tipo WHEN 'O' THEN (TD.Segno * CI.TotImponibileEuroRes) ELSE 0 END) AS ImpOrdEuro,
                sum(CASE PD.Tipo WHEN 'B' THEN (TD.Segno * CI.TotImponibileEuroRes) ELSE 0 END) AS ImpDDTEuro

            FROM DichiarazioneIntento_TabDoc DTD
                INNER JOIN ParametriDoc PD ON DTD.Codice=PD.Codice
                INNER JOIN TesteDocumenti TD ON DTD.Codice=TD.TipoDoc
                INNER JOIN CastellettiIVA CI ON TD.Progressivo=CI.IDTesta
                INNER JOIN TrattamentoIVA TIOB ON CI.CodIVA=TIOB.Codice

            WHERE PD.Tipo IN ('O', 'B') AND TD.DocChiuso=0 AND TD.ProgDichIntento<>0 AND TIOB.Plafond=1

            GROUP BY TD.ProgDichIntento

        ) OB ON DI.Progressivo=OB.ProgDichIntento

GO
GRANT SELECT
    ON OBJECT::[dbo].[AIOT_VistaTotaliDichInt] TO [Metodo98]
    AS [dbo];

