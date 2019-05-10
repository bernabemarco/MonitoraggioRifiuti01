
create view Ald_VistaAsaCommessaAgente3_TotProvvigioni
as

SELECT     TD.ESERCIZIO, MONTH(TD.DATADOC) AS Periodo, TAsa.IdASA, TAsa.Descrizione, RD.RIFCOMMCLI, VCMFM.RifCMFM, TD.CODAGENTE3, AAg.DSCAGENTE, 
                      SUM(RD.TOTNETTORIGAEURO * TD.SEGNO) AS TotFatt, SUM(RD.TOTPROVVAGEURO3 * TD.SEGNO) AS TotProvv3
FROM         PARAMETRIDOC AS PD INNER JOIN
                      RIGHEDOCUMENTI AS RD INNER JOIN
                      TESTEDOCUMENTI AS TD ON RD.IDTESTA = TD.PROGRESSIVO ON PD.CODICE = TD.TIPODOC INNER JOIN
                      ExtraCommCli AS ExC INNER JOIN
                      AnagraficaCommesse AS AC ON ExC.RifProgressivo = AC.Progressivo INNER JOIN
                      CONS_ALD_TABASA AS TAsa ON ExC.IdASA = TAsa.IdASA ON RD.RIFCOMMCLI = AC.RifComm INNER JOIN
                      ANAGRAFICAAGENTI AS AAg ON TD.CODAGENTE3 = AAg.CODAGENTE LEFT OUTER JOIN
                      ALD_Vista_CommessaMFM AS VCMFM ON RD.RIFCOMMCLI = VCMFM.RifComm
WHERE     (PD.TIPO = 'F' OR
                      PD.TIPO = 'N') AND (PD.CLIFOR = 'C')
					  AND (RD.TIPORIGA IN ('N', 'V'))
GROUP BY TD.ESERCIZIO, MONTH(TD.DATADOC), TAsa.IdASA, TAsa.Descrizione, RD.RIFCOMMCLI, VCMFM.RifCMFM, TD.CODAGENTE3, AAg.DSCAGENTE

GO
GRANT DELETE
    ON OBJECT::[dbo].[Ald_VistaAsaCommessaAgente3_TotProvvigioni] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Ald_VistaAsaCommessaAgente3_TotProvvigioni] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[Ald_VistaAsaCommessaAgente3_TotProvvigioni] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Ald_VistaAsaCommessaAgente3_TotProvvigioni] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Ald_VistaAsaCommessaAgente3_TotProvvigioni] TO [Metodo98]
    AS [dbo];

