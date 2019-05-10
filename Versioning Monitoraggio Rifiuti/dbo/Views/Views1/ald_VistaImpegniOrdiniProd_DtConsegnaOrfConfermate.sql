

--Aggiornamento vista personalizzata del 26.05.2016
CREATE view [dbo].[ald_VistaImpegniOrdiniProd_DtConsegnaOrfConfermate]
as
select IDTESTA, IDRIGA, IDIMPEGNO, CODART as imp_CodArt, deposito as IMP_Deposito, rifcommcli as imp_rifcommcli
, isnull(
(SELECT  top 1   RD.DATACONSEGNA
FROM         RIGHEDOCUMENTI AS RD INNER JOIN
                      EXTRARIGHEDOC AS ExRD ON RD.IDTESTA = ExRD.IDTESTA AND RD.IDRIGA = ExRD.IDRIGA INNER JOIN
                      PARAMETRIDOC AS pdc ON RD.TIPODOC = pdc.CODICE
WHERE     (ExRD.ctrlDtCons = 1) AND (pdc.TIPO = 'O') AND (pdc.CLIFOR = 'F')
and RIGACHIUSA=0 and QTAGESTRES>0
and rd.CODART=IMPEGNIORDPROD.CODART and rd.CODDEPOSITO=IMPEGNIORDPROD.deposito and rd.RIFCOMMCLI=IMPEGNIORDPROD.rifcommcli
order by rd.DATACONSEGNA ),
(SELECT  top 1   RD.DATACONSEGNA
FROM         RIGHEDOCUMENTI AS RD INNER JOIN
                      EXTRARIGHEDOC AS ExRD ON RD.IDTESTA = ExRD.IDTESTA AND RD.IDRIGA = ExRD.IDRIGA INNER JOIN
                      PARAMETRIDOC AS pdc ON RD.TIPODOC = pdc.CODICE
WHERE     (ExRD.ctrlDtCons = 1) AND (pdc.TIPO = 'O') AND (pdc.CLIFOR = 'F')
and RIGACHIUSA=0 and QTAGESTRES>0
and rd.CODART=IMPEGNIORDPROD.CODART and rd.CODDEPOSITO=IMPEGNIORDPROD.deposito and isnull(rd.RIFCOMMCLI,'')=''
order by rd.DATACONSEGNA)
) as dtConsegna,
(SELECT TOP 1 ExRD.NonConfermato
FROM         RIGHEDOCUMENTI AS RD INNER JOIN
                      EXTRARIGHEDOC AS ExRD ON RD.IDTESTA = ExRD.IDTESTA AND RD.IDRIGA = ExRD.IDRIGA INNER JOIN
                      PARAMETRIDOC AS pdc ON RD.TIPODOC = pdc.CODICE
WHERE  
--integrata where--
1=1
--(ExRD.ctrlDtCons = 1) 
 --fine integrata where--
and (pdc.TIPO = 'O') AND (pdc.CLIFOR = 'F') and RIGACHIUSA=0 and QTAGESTRES>0
and rd.CODART=IMPEGNIORDPROD.CODART
--integrata where--
 and rd.CODDEPOSITO=IMPEGNIORDPROD.deposito and isnull(rd.RIFCOMMCLI,'')=IMPEGNIORDPROD.RIFCOMMCLI
 --fine integrata where--
) as NonConfermato,
(SELECT TOP 1 (RIGHT(ESERCIZIO,2)+'/'+LEFT(TIPODOC+SPACE(3),3)+'/'+
RIGHT('000000'+CAST(NUMERODOC AS VARCHAR(8)),6)+'/'+RIGHT('0000'+CAST(IDRIGA AS VARCHAR(4)),4)) 
FROM RIGHEDOCUMENTI AS RD INNER JOIN  PARAMETRIDOC AS pdc ON RD.TIPODOC = pdc.CODICE
WHERE  (pdc.TIPO = 'O') AND (pdc.CLIFOR = 'F') and RIGACHIUSA=0 and QTAGESTRES>0
and rd.CODART=IMPEGNIORDPROD.CODART
and rd.CODDEPOSITO=IMPEGNIORDPROD.deposito and isnull(rd.RIFCOMMCLI,'')=IMPEGNIORDPROD.RIFCOMMCLI
) as RifOrdFor

from IMPEGNIORDPROD


GO
GRANT DELETE
    ON OBJECT::[dbo].[ald_VistaImpegniOrdiniProd_DtConsegnaOrfConfermate] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ald_VistaImpegniOrdiniProd_DtConsegnaOrfConfermate] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ald_VistaImpegniOrdiniProd_DtConsegnaOrfConfermate] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ald_VistaImpegniOrdiniProd_DtConsegnaOrfConfermate] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ald_VistaImpegniOrdiniProd_DtConsegnaOrfConfermate] TO [Metodo98]
    AS [dbo];

