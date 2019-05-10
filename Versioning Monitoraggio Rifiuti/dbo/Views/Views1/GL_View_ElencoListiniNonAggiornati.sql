

Create View [dbo].[GL_View_ElencoListiniNonAggiornati]
AS

    select
         tl.TP_Tipo
        ,tla.CODART
        ,aa.VARESPLICITE
        ,tla.NRLISTINO
        ,tla.UM
        ,tla.DataVal
        ,tla.TP_CodConto
        ,tla.PREZZO
        ,tla.PREZZOEURO
        ,aa.GRUPPO
        ,aa.CATEGORIA
        ,aa.CODCATEGORIASTAT
        ,aac.GRUPPOPRZPART
        ,tem.CodFamigliaPOS
        ,tem.CodRepartoPOS
        ,tlaa.CodLivelloInterno
    from
        TABLISTINI TL
    inner join 
        TP_LISTINIART tla
    on  
        tla.NRLISTINO = tl.NRLISTINO
    inner join
        ANAGRAFICAARTICOLI AA
    on
        AA.CODICE = tla.CODART
    inner join
        ANAGRAFICAARTICOLICOMM AAC
    on
            tla.CODART = AAC.CODICEART
        and AAC.ESERCIZIO = (SELECT esercizioattivo from TABUTENTI where USERDB = user_name())
    left join
        TP_ExtraMag tem
    on
        tem.CodArt = tla.CODART
    left join
        Tp_LivelliArticoli tlaa
    on
        tlaa.Codice = tla.CODART
    where
        tla.Aggiornato = 0 and
        (tla.TP_Sconti = '' or tla.TP_Sconti IS NULL) and
        (tla.TP_FormulaSct = '' or tla.TP_FormulaSct IS NULL) 


GO
GRANT SELECT
    ON OBJECT::[dbo].[GL_View_ElencoListiniNonAggiornati] TO [Metodo98]
    AS [dbo];

