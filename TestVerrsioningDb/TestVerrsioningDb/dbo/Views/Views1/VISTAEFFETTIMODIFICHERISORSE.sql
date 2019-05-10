



/*
    rif.29/12/2015 - aggiunto fornitore
*/
CREATE view [dbo].[VISTAEFFETTIMODIFICHERISORSE] as
    
    select 
        FASI.NOMEPIANIF
        ,FASI.PROG_ID
        ,cast((cast(datepart(year, min(FASI.DATAINIZIO)) as varchar) + '-' 
            + right('00' + cast(datepart(month, min(FASI.DATAINIZIO)) as varchar),2) + '-' 
            + right('00' + cast(datepart(day, min(FASI.DATAINIZIO)) as varchar),2) + 'T00:00:00') as datetime) as DATAINIZIOSCHED
        ,cast((cast(datepart(year, max(FASI.DATAFINE)) as varchar) + '-' 
            + right('00' + cast(datepart(month, max(FASI.DATAFINE)) as varchar),2) + '-' 
            + right('00' + cast(datepart(day, max(FASI.DATAFINE)) as varchar),2) + 'T00:00:00') as datetime) as DATAFINESCHED
        ,PRG.DATACONS as DATACONSORDINE
        ,PRG.RIFERIMENTI as RIFERIMENTIORDINE
        ,PRG.IDTESTADOC as IDCOMMESSA
        ,PRG.IDRIGADOC as IDORDINE
        ,dbo.[MAPS_FornitoreFaseEsterna](FASI.NOMEPIANIF,FASI.PROG_ID) as FORNITORE
    from 
        PROGPRODUZIONE PRG 
        inner join PROGPRODUZIONEFASI FASI on PRG.NOMEPIANIF=FASI.NOMEPIANIF and PRG.PROG_ID=FASI.PROG_ID
    group by 
        FASI.NOMEPIANIF
        ,FASI.PROG_ID
        ,PRG.DATACONS
        ,PRG.RIFERIMENTI
        ,PRG.IDTESTADOC
        ,PRG.IDRIGADOC
    having sum(FASI.TIPOMODIFICA)>0


GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTAEFFETTIMODIFICHERISORSE] TO [Metodo98]
    AS [dbo];

