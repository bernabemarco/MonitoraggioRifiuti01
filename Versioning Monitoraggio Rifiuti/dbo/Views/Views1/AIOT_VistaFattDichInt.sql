

CREATE VIEW AIOT_VistaFattDichInt AS
    SELECT
        DI.CodCliFor, rtrim(rtrim(ACF.DscConto1) + ' ' + ACF.DscConto2) AS RagSocCF,
        DI.Esercizio, DI.Progressivo, DI.NrDichiarazione,
        FT.TipoTF, FT.NrReg, FT.DataReg, FT.DesMovCont,
        FT.NrRiga, FT.Posizione,
        FT.IDTestaDoc, FT.NumDoc, FT.DataDoc,
        FT.NrRifer, FT.DataRif,
        FT.CodIVA, TI.Descrizione AS DesIVA,
        FT.ImponibileEuro

    FROM DichiarazioneIntento DI
        INNER JOIN AnagraficaCF ACF ON DI.CodCliFor=ACF.CodConto
        INNER JOIN (SELECT
                0 AS TipoTF, TC.ProgDichIntento, TC.Causale,
                RI.NrReg, TC.DataReg, TC.Descrizione AS DesMovCont,
                RI.NrRiga, RI.Posizione,
                TC.IDTestaDoc, RI.NumDoc, RI.DataDoc,
                TC.NrRifer, TC.DataRif,
                RI.CodIVA, RI.ImponibileEuro

            FROM RigheIVA RI
                INNER JOIN TesteContabilita TC ON RI.NrReg=TC.Progressivo

            WHERE isnull(TC.ProgDichIntento, 0)<>0

            UNION ALL

            SELECT
                1 AS TipoTF, TC.ProgDichIntento, TC.Causale,
                RI.NrReg, TC.DataReg, TC.Descrizione AS DesMovCont,
                RI.NrRiga, RI.Posizione,
                TC.IDTestaDoc, RI.NumDoc, RI.DataDoc,
                TC.NrRifer, TC.DataRif,
                RI.CodIVA, RI.ImponibileEuro

            FROM RigheIVATF RI
                INNER JOIN TesteContabilitaTF TC ON RI.NrReg=TC.Progressivo

            WHERE isnull(TC.ProgDichIntento, 0)<>0
        ) FT ON DI.Progressivo=FT.ProgDichIntento
        INNER JOIN TrattamentoIVA TI ON FT.CodIVA=TI.Codice
        INNER JOIN TabUtenti TU ON TU.UserDB=cast(user_name() AS varchar(25))

    WHERE TI.Plafond=1
      AND (TU.Supervisor=1 OR (TU.Supervisor=0 AND UserID IN (SELECT ACC.NomeUtente FROM AccessiCausCont ACC WHERE ACC.CodCausale=FT.Causale AND ACC.FlagAbilita=1)))
      AND (DI.CodCliFor=TU.CodCliFor OR isnull(TU.CodCliFor, '')='')

GO
GRANT SELECT
    ON OBJECT::[dbo].[AIOT_VistaFattDichInt] TO [Metodo98]
    AS [dbo];

