


/*
    rif.A#12517 - sostituito join con VISTARELAZIONIPROGPROD con subselect con top 1
    rif.17/08/2015 - RIF.S#3747 - gestione c/trasformazione
*/
CREATE view [dbo].[VISTASITUAZIONEPROGPROD] as
    select 
        PRG.NOMEPIANIF,PRG.PROG_ID,PRG.RIFID,PRG.RIF_PROP,PRG.ORDINELETTURA,
        PRG.IDTESTADOC,PRG.IDRIGADOC,PRG.IDIMPEGNO,
        PRG.RIFERIMENTI,
        (case PRG.TIPO
            when 0 then PRG.CODART
            when 1 then PRG.CODART + ' >> Prop.OF: ' + PRG.CODFOR
            when 2 then PRG.CODART + ' >> Prop.OP: ' + PRG.CODFOR
            when 3 then PRG.RIFERIMENTI
            when 4 then PRG.RIFERIMENTI
            when 5 then PRG.RIFERIMENTI
            when 6 then PRG.RIFERIMENTI
            when 7 then PRG.CODART
            when 8 then '>> Prop.Ris: ' + PRG.CODART + ' [' + PRG.CODDEPOSITO +']'
            when 9 then PRG.RIFERIMENTI + '[' + PRG.CODDEPOSITO +']'
            when 10 then PRG.RIFERIMENTI
            when 12 then PRG.CODART + ' >> Prop.OPT: ' + PRG.CODFOR
        end) as DESCRIZIONERIGA,
        PRG.CODFOR as CODCLIFOR,    
        CF.DSCCONTO1 as RAGSOCCLIFOR,
        (case PRG.TIPO 
            when 6 then
                (select CODCLIDEST from RIGHEORDPROD RD
                where RD.IDTESTA = PRG.IDTESTADOC and RD.IDRIGA = PRG.IDRIGADOC)
            else
                ''
        end) as CODCLIDEST,     
        PRG.DATAORD,
        PRG.CODART,
        dbo.[DESCRIZIONEARTICOLOPROGPROD](PRG.TIPO,PRG.IDTESTADOC,PRG.IDRIGADOC,PRG.IDIMPEGNO,PRG.CODART) as DSCARTICOLO,
        (
            SELECT TOP 1 REL.RIFERIMENTO 
            FROM VISTARELAZIONIPROGPROD REL 
            WHERE REL.CODCLIFOR=PRG.CODFOR and REL.ARTICOLO=PRG.CODART
            ORDER BY REL.RIFERIMENTO
        ) as RELAZIONEARTICOLO,
        PRG.UMARTICOLO as UMBASE,
        (case PRG.TIPO
            when 0 then PRG.QTAIMP
            when 1 then PRG.QTAORD
            when 2 then PRG.QTAORD
            when 3 then PRG.QTAIMP
            when 4 then PRG.QTAORD
            when 5 then PRG.QTAORD
            when 6 then PRG.QTAORD
            when 7 then PRG.QTAIMP
            when 8 then 
                (case when PAR.TIPOGESTIONE=3 then PRG.QTAORD else PRG.QTAIMP end)
            when 9 then 
                (case when PAR.TIPOGESTIONE=3 then PRG.QTAORD else PRG.QTAIMP end)
            when 10 then PRG.QTAIMP
            when 12 then PRG.QTAORD
        end) as QTABASE,    
        PRG.UMDOCUMENTO as UMGEST,PRG.QTADOCUMENTO as QTAGEST,
        PRG.DATACONS,
        datediff(d, GetDate(), PRG.DATACONS) as RITARDO,
        (case when datediff(d, GetDate(), PRG.DATACONS)<0 then
            abs(datediff(d, GetDate(), PRG.DATACONS))
        else
            0
        end) as GIORNIRITARDO,
        PRG.VERDBA,
        PRG.RIFCOMMCLI, 
        CAST({fn YEAR(PRG.DATAINIZPROD)} as VARCHAR(4))+'/'+RIGHT('00'+CAST({fn WEEK(PRG.DATAINIZPROD)} as VARCHAR(2)),2) as SETTIMANADISP,
        PRG.TIPO as TIPORECORD,
        (case PRG.TIPO
            when 3 then 0
            when 10 then 0
            when 0 then 1
            when 7 then 1
            when 1 then 2
            when 5 then 2
            when 2 then 3
            when 4 then 3
            when 6 then 3
            when 8 then (case when PAR.TIPOGESTIONE=3 then 2 else 0 end)
            when 9 then (case when PAR.TIPOGESTIONE=3 then 2 else 0 end)
            /*
            when 8 then
                (case when PAR.TIPOGESTIONE=3 then 
                    (case when ART.TIPOGESTIONE=0 then 2 else 3 end)
                 else 0 end)
            when 9 then
                (case when PAR.TIPOGESTIONE=3 then 
                    (case when ART.TIPOGESTIONE=0 then 2 else 3 end)
                 else 0 end
            */
            when 12 then 3
        end) as TIPORECORDRAGG,
        (case PRG.TIPO
            when 3 then 0
            when 10 then 0
            when 0 then 1
            when 7 then 1
            when 1 then 2
            when 5 then 3
            when 2 then 4
            when 4 then 5
            when 6 then 5
            when 8 then (case when PAR.TIPOGESTIONE=3 then 1 else 0 end)
            when 9 then (case when PAR.TIPOGESTIONE=3 then 3 else 0 end)
            /*
            when 8 then
                (case when PAR.TIPOGESTIONE=3 then 
                    (case when ART.TIPOGESTIONE=0 then 1 else 4 end)
                 else 0 end)
            when 9 then
                (case when PAR.TIPOGESTIONE=3 then 
                    (case when ART.TIPOGESTIONE=0 then 3 else 5 end)
                 else 0 end
            */
            when 12 then 4
        end) as TIPORECORDRAGG2,
        PRG.TIPODOC,
        (case PRG.TIPO 
            when 5 then
                (select case when QTAGEST=0 then 0 else 100*QTAGESTPRELEVATA/QTAGEST end
                from RIGHEDOCUMENTI RD
                where RD.IDTESTA = PRG.IDTESTADOC and RD.IDRIGA = PRG.IDRIGADOC)
            when 4 then
                (select case when QTAGEST=0 then 0 else 100*QTAGESTPRELEVATA/QTAGEST end
                from RIGHEDOCUMENTI RD
                where RD.IDTESTA = PRG.IDTESTADOC and RD.IDRIGA = PRG.IDRIGADOC)
            when 6 then
                (select case when QTAGESTIONE=0 then 0 else 100*QTAGESTIONEVERS/QTAGESTIONE end
                from RIGHEORDPROD RD
                where RD.IDTESTA = PRG.IDTESTADOC and RD.IDRIGA = PRG.IDRIGADOC)
            else
                0
        end) as PERCAVANZAMENTO,
        PRG.FILTRO,
        PRG.DARILASCIARE,
        (select count(1) from ECCEZIONIPROGPROD ECC where ECC.NOMEPIANIF=PRG.NOMEPIANIF and ECC.RIFID=PRG.PROG_ID) as ECCEZIONIRIGA
    from 
        PROGPRODUZIONE PRG
        inner join IMPOSTAZIONIPROGPROD PAR on PAR.NOMEPIANIF=PRG.NOMEPIANIF
        left outer join ANAGRAFICAARTICOLI ART on ART.CODICE=PRG.CODART
        left outer join ANAGRAFICACF CF on CF.CODCONTO=PRG.CODFOR           


GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTASITUAZIONEPROGPROD] TO [Metodo98]
    AS [dbo];

