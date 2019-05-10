



/*
    rif.27/10/2015 - aggiunto campo FORNITORE
	rif.16/03/2016 - aggiunto campo ANNULLATA_FASE
*/
CREATE view [dbo].[VISTAMODIFICHERISORSE] as
    select 
        PRG.NOMEPIANIF
        ,PRG.RIFPROGRESSIVO as PROGRESSIVO
        ,PRG.RIFNUMEROFASE as NUMEROFASE
        ,(case when PRG.TIPOMODIFICA & 2 = 0 then
            0
        else
            1
        end) as MOD_CDLRISORSA
        ,PRG.CDLAVORO
        ,(select TERZISTA from TABELLACDLAVORO C where C.CODICE=PRG.CDLAVORO) as FORNITORE
        ,PRG.MACCHINA
        ,(case when PRG.TIPOMODIFICA & 1 = 0 then
            0
        else
            1
        end) as MOD_DATAINIZIOFINE
        ,PRG.DATAINIZIO
        ,PRG.ORAINIZIO
        ,PRG.DATAFINE
        ,PRG.ORAFINE
		,(case when RCO.PROGRESSIVO is null then 1 else 0 end) as ANNULLATA_FASE
    from 
        PROGPRODUZIONEFASI PRG
		left outer join RIGHECICLOORDINE RCO on RCO.PROGRESSIVO=PRG.RIFPROGRESSIVO and RCO.NUMEROFASE=PRG.RIFNUMEROFASE

    where       
        PRG.TIPO=0


GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTAMODIFICHERISORSE] TO [Metodo98]
    AS [dbo];

