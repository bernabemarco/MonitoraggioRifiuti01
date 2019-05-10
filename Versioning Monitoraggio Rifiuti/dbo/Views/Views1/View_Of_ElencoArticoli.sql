
CREATE VIEW [dbo].[View_Of_ElencoArticoli]
AS

    Select distinct
         aa.Codice
        ,aa.Descrizione
        ,tlb.CodFor
        ,tlb.tp_CodDep
        ,tem.ModalitaCalcolo
        ,aa.Gruppo
        ,aa.Categoria
        ,aa.CodCategoriaStat
        ,aac.GruppoPrzPart
        ,tem.CodFamigliaPOS
        ,tem.CodRepartoPOS
        ,tlm.CodLivelloInterno
        ,tem.CodMarchio
        ,aa.VarEsplicite
        ,aac.Esercizio
        --Produzione
        ,IsNull(pp.NOMEPIANIF,'')       as NOMEPIANIF
        ,IsNull(pp.DATACONS,GetDate())  as DATACONS
        ,IsNull(pp.RIFCOMMCLI,'')       as RIFCOMMCLI
        ,IsNull(pp.PROG_ID,0)           as PROG_ID
    from
        ANAGRAFICAARTICOLI aa
    inner join
        ANAGRAFICAARTICOLICOMM aac
    on
        aac.CODICEART = aa.CODICE
    inner join
        TABLOTTIRIORDINO tlb
    on
        AA.CODICE=tlb.CODART
    inner join
        TP_ExtraMag tem
    on 
        tem.CodArt = aa.CODICE
    LEFT JOIN 
        Tp_LivelliArticoli tlm
    ON 
        TLM.Codice = aa.CODICE
    LEFT JOIN
        PROGPRODUZIONE pp
    on
            pp.CODART = tlb.CODART 
        AND pp.CODFOR = tlb.CODFOR
        AND ((pp.QTAORD > pp.QTADOCUMENTO) AND pp.TIPO = 1)
    


GO
GRANT SELECT
    ON OBJECT::[dbo].[View_Of_ElencoArticoli] TO [Metodo98]
    AS [dbo];

