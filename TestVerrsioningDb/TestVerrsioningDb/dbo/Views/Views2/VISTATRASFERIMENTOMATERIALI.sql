﻿

--- fine A#11903


--- inizio A#11725

CREATE view [dbo].[VISTATRASFERIMENTOMATERIALI]
  as select
    RP.IDTESTA
    ,RP.IDRIGA
    ,IP.IDIMPEGNO
    ,TP.TIPOCOM+'/'+cast(TP.ESERCIZIO as varchar)+'/'+right('0000000000'+cast(TP.NUMEROCOM as varchar),10)+'/'+right('00000'+cast(RP.IDRIGA as varchar),5)+'/'+right('00000'+cast(IP.IDIMPEGNO as varchar),5) as RIFIMPEGNO
    ,TP.ESERCIZIO
    ,TP.TIPOCOM
    ,TP.NUMEROCOM
    ,TP.DATAEMISSIONE
    ,RP.CODICEORD
    ,RP.CODCLIDEST
    ,RP.CODFORDEST
    ,RP.CODART as CODARTORD
    ,RP.DESCRIZIONEART as DESCRIZIONEARTORD
    ,RP.VALOREPRIORITA
    ,IP.CODART as CODARTIMP
    ,IP.DESCRIZIONEART as DESCRIZIONEARTIMP
    ,IP.UMGEST as UMGEST
    ,(case when LP.PARTITA is null then IP.QTAGESTIONE else LP.QTAGESTIONE end) as QTAGESTIONE
    ,(case when LP.PARTITA is null then IP.QTAGESTIONEVERS else LP.QTAGESTIONEPREL end) as QTAGESTIONEPREL
    ,IP.UM1MAG as UM1MAG
    ,(case when LP.PARTITA is null then IP.QTA1MAG else LP.QTA1MAG end) as QTA1MAG
    ,IP.UM2MAG
    ,(case when LP.PARTITA is null then IP.QTA2MAG else LP.QTA2MAG end) as QTA2MAG
    ,(case when LP.PARTITA is null then IP.QTAGESTIONETRASF else LP.QTAGESTIONETRASF end) as QTAGESTIONETRASF
    ,(case when 
        (case when LP.PARTITA is null then IP.QTAGESTIONEVERS else LP.QTAGESTIONEPREL end)>(case when LP.PARTITA is null then IP.QTAGESTIONETRASF else LP.QTAGESTIONETRASF end) then 
        (case when LP.PARTITA is null then IP.QTAGESTIONE else LP.QTAGESTIONE end)
        -(case when LP.PARTITA is null then IP.QTAGESTIONEVERS else LP.QTAGESTIONEPREL end)
    else 
        (case when LP.PARTITA is null then IP.QTAGESTIONE else LP.QTAGESTIONE end)
        -(case when LP.PARTITA is null then IP.QTAGESTIONETRASF else LP.QTAGESTIONETRASF end) end) as QTAGESTIONEDATRASF
    ,IP.CODFORIMP as CODFOR
    ,(select DSCCONTO1 from ANAGRAFICACF where CODCONTO=CODFORIMP) as RAGSOCFOR
    ,(case when LP.PARTITA is null then IP.PARTITAASSEGNATA else LP.PARTITA end) as PARTITARICHIESTA
    ,IP.PARTITAVINCOLATA as PARTITAVINCOLATA
    ,IP.DEPOSITO as DEPOSITODEST
    ,IP.UBICAZIONE as UBICAZIONEDEST
    ,IP.DEPOSITOCOLL as DEPOSITOPROV
    ,IP.UBICAZIONECOLL as UBICAZIONEPROV
    ,IP.STATOIMPEGNO
    ,IP.RIFCOMMCLI
    ,IP.DATAIMPEGNORICH
from
    TESTEORDINIPROD TP
    inner join RIGHEORDPROD RP on RP.IDTESTA=TP.PROGRESSIVO
    inner join IMPEGNIORDPROD IP on IP.IDTESTA=RP.IDTESTA and IP.IDRIGA=RP.IDRIGA
    left outer join PARTITEIMPEGNIORDPROD LP on LP.IDTESTA=IP.IDTESTA and LP.IDRIGA=IP.IDRIGA and LP.IDIMPEGNO=IP.IDIMPEGNO

GO
GRANT DELETE
    ON OBJECT::[dbo].[VISTATRASFERIMENTOMATERIALI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[VISTATRASFERIMENTOMATERIALI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[VISTATRASFERIMENTOMATERIALI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTATRASFERIMENTOMATERIALI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[VISTATRASFERIMENTOMATERIALI] TO [Metodo98]
    AS [dbo];

