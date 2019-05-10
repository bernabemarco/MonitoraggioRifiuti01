
CREATE VIEW VISTASITUAZIONEFASIBASE AS
    select 
        PRG.NOMEPIANIF,FASI.PROG_ID,FASI.FASE_ID,FASI.TIPO,
        PRG.DESCRIZIONERIGA,
        PRG.CODART,
        PRG.DSCARTICOLO as DSCART,
        FASI.RIFPROGRESSIVO,FASI.RIFNUMEROFASE,
        isnull(FASI.RIFNUMEROFASESUCC,0) as RIFNUMEROFASESUCC,
        FASI.TIPOFASE,FASI.OPERAZIONE,OPE.DESCRIZIONE as DSCOPERAZIONE,
        upper(isnull(MAC.CODICECDLAVORO, FASI.CDLAVORO)) as CDLAVORO,CDL.DESCRIZIONE as DSCCDLAVORO,
        (case when FASI.MACCHINA is null or FASI.MACCHINA='' then
            upper(FASI.CDLAVORO)
        else
            upper(FASI.MACCHINA)
        end) as MACCHINA,
        (case when FASI.MACCHINA is null or FASI.MACCHINA='' then
            CDL.DESCRIZIONE
        else
            MAC.DESCRIZIONE
        end) as DSCMACCHINA,
        FASI.DATAINIZIO,FASI.ORAINIZIO,
        FASI.DATAFINE,FASI.ORAFINE,
        cast((cast(datepart(year, FASI.DATAINIZIO) as varchar) + '-' 
        + right('00' + cast(datepart(month, FASI.DATAINIZIO) as varchar),2) + '-' 
        + right('00' + cast(datepart(day, FASI.DATAINIZIO) as varchar),2) + 'T' 
        + right('00' + cast(datepart(hour, FASI.ORAINIZIO) as varchar),2) + ':' 
        + right('00' + cast(datepart(minute, FASI.ORAINIZIO) as varchar),2) + ':' 
        + right('00' + cast(datepart(second, FASI.ORAINIZIO) as varchar),2)) as datetime) as DATAORAINIZIO,
        cast((cast(datepart(year, FASI.DATAFINE) as varchar) + '-' 
        + right('00' + cast(datepart(month, FASI.DATAFINE) as varchar),2) + '-' 
        + right('00' + cast(datepart(day, FASI.DATAFINE) as varchar),2) + 'T' 
        + right('00' + cast(datepart(hour, FASI.ORAFINE) as varchar),2) + ':' 
        + right('00' + cast(datepart(minute, FASI.ORAFINE) as varchar),2) + ':' 
        + right('00' + cast(datepart(second, FASI.ORAFINE) as varchar),2)) as datetime) as DATAORAFINE,     
        (case when FASI.TIPO=0 then
            OPE.DESCRIZIONE + ' (' 
            + (select cast(ANNOBOLLA as varchar) + '/' + cast(NUMEROBOLLA as varchar) 
            from RIGHECICLOORDINE RCO
            where RCO.PROGRESSIVO=FASI.RIFPROGRESSIVO and RCO.NUMEROFASE=FASI.RIFNUMEROFASE)
            + ')'
        else
            OPE.DESCRIZIONE
        end) as DSCFASE,
        (case when FASI.TIPO=0 then
            (select cast(ANNOBOLLA as varchar) + '/' + cast(NUMEROBOLLA as varchar) 
                from RIGHECICLOORDINE RCO
                where RCO.PROGRESSIVO=FASI.RIFPROGRESSIVO and RCO.NUMEROFASE=FASI.RIFNUMEROFASE)
        else
            ''
        end) as RIFBOLLALAV,
         (case FASI.TIPOFASE
            when 0 then FASI.OREDURATA -- fase interna
            when 1 then FASI.OREATTRAVERSAMENTO -- fase esterna
            when 2 then FASI.OREDURATA+FASI.OREATTRAVERSAMENTO -- fase mista
        end) as OREDURATASCHED,
        FASI.ORESETUP,FASI.OREMACCHINA,FASI.OREUOMO,FASI.OREDURATA,
        FASI.OREMOVIMENTAZIONE,FASI.ORECODA,
        FASI.OREATTRAVERSAMENTO,
        dbo.[CALCOLAINDICECARICOFASE](CDL.DISPRISORSE, CDL.DISPRISORSECM, FASI.DISPRISORSE, MAC.INDICECAPACITA, MAC.INDICECAPACITACM, FASI.INDICECAPACITA) as INDICECARICO,
        FASI.NUMEROOPERAI,
        FASI.DATAFABBISOGNO,
        (select max(FF.DATAFINE) from PROGPRODUZIONEFASI FF where FF.NOMEPIANIF=FASI.NOMEPIANIF and FF.PROG_ID=FASI.PROG_ID) as DATAFINECICLO,
        PRG.DATACONS as DATACONSEGNA,   
        dbo.LEGGIANNOTAZIONIFASE(FASI.TIPO,FASI.RIFPROGRESSIVO,FASI.RIFNUMEROFASE) as NOTEFASE,
        (case when FASI.QTAPREVISTA=0 then 0 else (100*FASI.QTAVERSATA)/FASI.QTAPREVISTA end) as PERCAVANZQTA,
        (case when FASI.OREDURATA=0 then 0 else (100*FASI.OREDURATAVERSATA)/FASI.OREDURATA end) as PERCAVANZDURATA,
        PRG.RIFCOMMCLI,
        FASI.QTAPREVISTA,
        FASI.UMGEST,
        (case when FASI.TIPO=0
            then (select QTATERZISTA 
                    from RIGHECICLOORDINE RCO
                    where RCO.PROGRESSIVO=FASI.RIFPROGRESSIVO and RCO.NUMEROFASE=FASI.RIFNUMEROFASE)
            else 0
        end) as QTATERZISTA,
        FASI.RIFSOVRAPP
    from 
        VISTASITUAZIONEPROGPROD PRG 
            inner join PROGPRODUZIONEFASI FASI on PRG.NOMEPIANIF=FASI.NOMEPIANIF and PRG.PROG_ID=FASI.PROG_ID
            inner join TABELLAOPERAZIONI OPE on OPE.CODICE=FASI.OPERAZIONE          
            left outer join TABELLAMACCHINE MAC on MAC.CODICE=FASI.MACCHINA 
            left outer join TABELLACDLAVORO CDL on CDL.CODICE=isnull(MAC.CODICECDLAVORO, FASI.CDLAVORO)

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTASITUAZIONEFASIBASE] TO [Metodo98]
    AS [dbo];

