


/*
    rif.27/02/2016 - modificato tipo per ordini trasformazione di fase	
	rif.14/03/2016 - aggiunti campi TIPO, MODIFICATO_ESTERNAMENTE
*/
CREATE view [dbo].[VISTARILASCIOPIANO] as
    select  
        PP.NOMEPIANIF
		,PP.RIFERIMENTI
		,PP.PROG_ID
		,PP.TIPO
		,(case PP.TIPO
            when 3 then 1 -- ordine cliente         
            when 5 then 2 -- ordine fornitore
            when 4 then 3 -- ordine lavorazione
            when 9 then 5 -- ordine riservazione
        end) as TIPORECORD
		,PP.TIPODOC
		,PP.IDTESTADOC
		,PP.IDRIGADOC
		,PP.CODART
		,(select DESCRIZIONE from ANAGRAFICAARTICOLI ART where ART.CODICE=PP.CODART) as DSCART
		,PP.CODFOR as CODFOR_PIAN
		,(select DSCCONTO1 from ANAGRAFICACF CF where CF.CODCONTO=PP.CODFOR) as RAGSOCFOR_PIAN
		,TD.CODCLIFOR as CODFOR_ATT
		,(select DSCCONTO1 from ANAGRAFICACF CF where CF.CODCONTO=TD.CODCLIFOR) as RAGSOCFOR_ATT
		,PP.DATACONS as DATACONS_PIAN
		,RD.DATACONSEGNA as DATACONS_ATT
		,PP.QTADOCBASE as QUANTITA_PIAN
		,RD.QTA1MAGRES as QUANTITA_ATT
		,PP.UMARTICOLO
		,PP.VERDBA as VERDBA_PIAN
		,RD.VERSIONEDIBA as VERDBA_ATT		
		,(case when RD.IDTESTA is null then 1 else 0 end) as RIGANUOVA
		,(case when PP.CODFOR<>TD.CODCLIFOR then 1 else 0 end) as CODFOR_MOD
		,(case when PP.DATACONS<>RD.DATACONSEGNA then 1 else 0 end) as DATACONS_MOD
		,(case when PP.VERDBA<>RD.VERSIONEDIBA then 1 else 0 end) as VERDBA_MOD
		,(case when PP.QTADOCBASE<>RD.QTA1MAGRES then 1 else 0 end) as QUANTITA_MOD
		,DBO.[MAPS_ElementoModificatoEsternamente](PP.NOMEPIANIF, PP.PROG_ID) as MODIFICATO_ESTERNAMENTE
    from 
        PROGPRODUZIONE PP 
        left outer join TESTEDOCUMENTI TD on TD.PROGRESSIVO=PP.IDTESTADOC
        left outer join RIGHEDOCUMENTI RD on RD.IDTESTA=PP.IDTESTADOC and RD.IDRIGA=PP.IDRIGADOC
    where 
        TIPO in (3,5,4,9)
        and ((RD.IDTESTA is null) 
            or (PP.CODFOR<>TD.CODCLIFOR)
            or (PP.DATACONS<>RD.DATACONSEGNA) 
            or (PP.QTADOCBASE<>RD.QTA1MAGRES) 
            or (RD.VERSIONEDIBA<>'' and PP.VERDBA<>RD.VERSIONEDIBA))

    union all 

    select 
        PP.NOMEPIANIF
		,PP.RIFERIMENTI
		,PP.PROG_ID
		,PP.TIPO
		,4 as TIPORECORD
		,PP.TIPODOC
		,PP.IDTESTADOC
		,PP.IDRIGADOC
		,PP.CODART
		,(select DESCRIZIONE from ANAGRAFICAARTICOLI ART where ART.CODICE=PP.CODART) as DSCART
		,PP.CODFOR as CODFOR_PIAN
		,(select DSCCONTO1 from ANAGRAFICACF CF where CF.CODCONTO=PP.CODFOR) as RAGSOCFOR_PIAN
		,RD.CODFORDEST as CODFOR_ATT
		,(select DSCCONTO1 from ANAGRAFICACF CF where CF.CODCONTO=RD.CODFORDEST) as RAGSOCFOR_ATT
		,PP.DATACONS as DATACONS_PIAN
		,RD.DATAFINERICH as DATACONS_ATT
		,PP.QTADOCBASE as QUANTITA_PIAN
		,RD.QTA1MAGRES as QUANTITA_ATT
		,PP.UMARTICOLO
		,PP.VERDBA as VERDBA_PIAN
		,RD.VERSIONEDBA as VERDBA_ATT
		,(case when RD.IDTESTA is null then 1 else 0 end) as RIGANUOVA
		,(case when PP.CODFOR<>RD.CODFORDEST then 1 else 0 end) as CODFOR_MOD
		,(case when PP.DATACONS<>RD.DATAFINERICH then 1 else 0 end) as DATACONS_MOD
		,(case when PP.VERDBA<>RD.VERSIONEDBA then 1 else 0 end) as VERDBA_MOD
		,(case when PP.QTADOCBASE<>RD.QTA1MAGRES then 1 else 0 end) as QUANTITA_MOD
		,DBO.[MAPS_ElementoModificatoEsternamente](PP.NOMEPIANIF, PP.PROG_ID) as MODIFICATO_ESTERNAMENTE
    from 
        PROGPRODUZIONE PP 
        left outer join RIGHEORDPROD RD on RD.IDTESTA=PP.IDTESTADOC and RD.IDRIGA=PP.IDRIGADOC
    where 
        TIPO = 6
        and ((RD.IDTESTA is null) 
            or (PP.CODFOR<>RD.CODFORDEST)
            or (PP.DATACONS<>RD.DATAFINERICH) 
            or (PP.QTADOCBASE<>RD.QTA1MAGRES) 
            or (PP.VERDBA<>RD.VERSIONEDBA))
	

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTARILASCIOPIANO] TO [Metodo98]
    AS [dbo];

