

CREATE view [dbo].[Ald_VistaFatturatiAsa05]
as
SELECT     TD.ESERCIZIO, RD.RIFCOMMCLI, ExCom.IdASA, TD.CODCLIFOR
, sum(rd.TOTNETTORIGAEURO*td.SEGNO) as  TotFatturatoCliente
FROM         ExtraCommCli AS ExCom INNER JOIN
                      AnagraficaCommesse AS AnaCom ON ExCom.RifProgressivo = AnaCom.Progressivo INNER JOIN
                      RIGHEDOCUMENTI AS RD INNER JOIN
                      EXTRARIGHEDOC AS ExRD ON RD.IDTESTA = ExRD.IDTESTA AND RD.IDRIGA = ExRD.IDRIGA ON AnaCom.RifComm = RD.RIFCOMMCLI INNER JOIN
                      TESTEDOCUMENTI AS TD ON RD.IDTESTA = TD.PROGRESSIVO INNER JOIN
                      PARAMETRIDOC AS ParDoc ON TD.TIPODOC = ParDoc.CODICE
WHERE     (ExCom.IdASA = '05') AND (ParDoc.TIPO IN ('F', 'N')) AND (ParDoc.CLIFOR = 'C')
--and td.ESERCIZIO=2014
group by  TD.ESERCIZIO, RD.RIFCOMMCLI, ExCom.IdASA, TD.CODCLIFOR



GO
GRANT SELECT
    ON OBJECT::[dbo].[Ald_VistaFatturatiAsa05] TO [Metodo98]
    AS [dbo];

