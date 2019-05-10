



/*
    rif.20/08/2015 - s#3747 - aggiunto tipo proposte ordini trasformazione fase
    rif.27/10/2015 - s#3747 - aggiunto tipo proposte ordini terzisti di fase
	rif.08/03/2016 - considero solamente le fasi relative a cicli emessi
*/
CREATE view [dbo].[VISTARILASCIORAGG] as
    -- rilascio modifiche
    select 
        NOMEPIANIF,
        TIPORECORD, 
        1 as TIPORILASCIO, 
        count(1) as CONTA, 
        0 as DARILASCIARE
    from VISTARILASCIOPIANO
    where RIGANUOVA=0
    group by NOMEPIANIF,TIPORECORD

    union all
    
    -- rilascio nuove righe
    select 
        NOMEPIANIF,
        TIPORECORD, 
        2 as TIPORILASCIO, 
        count(1) as CONTA,
        0 as DARILASCIARE
    from VISTARILASCIOPIANO
    where RIGANUOVA<>0
    group by NOMEPIANIF,TIPORECORD

    union all

    -- rilascio proposte
    --  proposte ordini fornitore
    select 
        NOMEPIANIF,
        2 as TIPORECORD, 
        3 as TIPORILASCIO, 
        count(1) as CONTA,
        sum(isnull(DARILASCIARE,0)) as DARILASCIARE
    from PROGPRODUZIONE
    where TIPO = 1
    group by NOMEPIANIF

    union all

    --  proposte ordini lavorazione
    select
        NOMEPIANIF,
        3 as TIPORECORD, 
        3 as TIPORILASCIO, 
        count(1) as CONTA,
        sum(isnull(DARILASCIARE,0)) as DARILASCIARE
    from PROGPRODUZIONE
    where TIPO in (2,12)
    group by NOMEPIANIF

    union all
    
    --  proposte ordini produzione
    select 
        NOMEPIANIF,
        4 as TIPORECORD, 
        3 as TIPORILASCIO, 
        count(1) as CONTA,
        sum(isnull(DARILASCIARE,0)) as DARILASCIARE
    from PROGPRODUZIONE
    where TIPO = 2
    group by NOMEPIANIF

    union all
    
    --  proposte riservazioni
    select 
        NOMEPIANIF,
        5 as TIPORECORD, 
        3 as TIPORILASCIO, 
        count(1) as CONTA,
        sum(isnull(DARILASCIARE,0)) as DARILASCIARE
    from PROGPRODUZIONE
    where TIPO = 8
    group by NOMEPIANIF

    union all 

    --  rif.s#3747 - proposte ordini trasformazione fase
    select 
        NOMEPIANIF,
        6 as TIPORECORD, 
        3 as TIPORILASCIO, 
        count(1) as CONTA,
        sum(isnull(DARILASCIARE,0)) as DARILASCIARE
    from PROGPRODUZIONE
    where TIPO = 12
    group by NOMEPIANIF

    union all

    --s#3747 - proposte ordini terzisti di fase
    select
        NOMEPIANIF
        ,7 as TIPORECORD
        ,3 as TIPORILASCIO
        ,COUNT(1) as CONTA
        ,sum(isnull([EMETTIORDINE],0)) as DARILASCIARE
    from PROGPRODUZIONEFASI
	where TIPO=0
    group by NOMEPIANIF



GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTARILASCIORAGG] TO [Metodo98]
    AS [dbo];

