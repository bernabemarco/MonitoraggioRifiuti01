
CREATE PROCEDURE [dbo].[CONTRATTI_CONSUNTIVAZIONECONDIZIONATI] 
    @WHERECOND      Varchar(8000),
    @FINOALLADATA   Varchar(8),
    @SCONTIPIEDE    smallint,
    @SCONTIINCONDIZ smallint,
    @IDSESSIONE     int,
    @UTENTEMODIFICA varchar(20),
    @ESCLLIQUIDATI  smallint,   
    @RES            int out,
    @ERRORNR        int out,
    @ERRORMS        Varchar(2048) out,
    @ERRORLINE      int out
--ENCRY--
AS
BEGIN   

    set @RES = 1;

    DECLARE @FINOADATA  as datetime
    DECLARE @COMANDO    AS VARCHAR(8000)    

    set @FINOADATA = convert(varchar(8), @FINOALLADATA ,112)
    
    -- Cancellazione dalla tabella statica temporanea per sessione --
    IF OBJECT_ID('ContribCondizInElab') IS NOT NULL
    begin
            Delete From ContribCondizInElab Where SESSIONE = @IDSESSIONE 
    end

    IF OBJECT_ID('tempdb..#ElencoContributi') IS NOT NULL DROP TABLE #ElencoContributi

    Create Table #ElencoContributi(
        DiCui                       smallint        not null, 
        Contratto                   decimal(18,0)   not null,
        ProgressivoContributoCond   decimal(10,0)   not null,
        NrRifRigaCondDiCui          int             null,
        NrRigaContributoCond        int             not null,
        DaData                      datetime        not null,
        AData                       datetime        not null,
        Valore                      decimal(19,6)   not null,
        Qta                         decimal(19,6)   not null default(0),
        Um                          varchar(3)      null default(''),
        Qta2                        decimal(19,6)   not null default(0),
        Um2                         varchar(3)      null default(''),
        ConsuntivatoQta             decimal(19,6)   not null default(0),
        ConsuntivatoValore          decimal(19,6)   not null default(0),
        Gruppo                      decimal(5,0)    null,
        Categoria                   decimal(5,0)    null,
        CategoriaS                  decimal(5,0)    null,
        GruppoPrezzi                decimal(5,0)    null,
        Famiglia                    decimal(5,0)    null,
        Reparto                     decimal(5,0)    null,
        Articolo                    varchar(80)     null,
        Escludi                     smallint        null,
        TipoCalcoloPremio           smallint        null default(0),
        BUDGET                      decimal(19, 6)  NULL,       
        PREMIOMATURATO              decimal(19, 6)  NULL,
        TotSpeseTraspRes            decimal(19,4)   null default(0),    
        TotImponibileEuro           decimal(19,4)   null default(0),
        PREMIOPERCENT               decimal(19,6)   null default(0)        
    )

    begin try

        -- INSERIMENTO DEI DICUI --
        Set @COMANDO = ' Insert into    #ElencoContributi(DiCui,Contratto,ProgressivoContributoCond,NrRifRigaCondDiCui,          '  + char(13) +
                       '                                  NrRigaContributoCond,DaData,AData,Valore,                              '  + char(13) +
                       '                                  Qta,Um,Qta2,Um2,ConsuntivatoQta,ConsuntivatoValore,Gruppo,Categoria,CategoriaS,GruppoPrezzi,Famiglia,Reparto,Articolo,Escludi,TipoCalcoloPremio, ' + char(13) +
                       '                                  BUDGET,PREMIOMATURATO,TotSpeseTraspRes,TotImponibileEuro,PREMIOPERCENT)'  + char(13) +
                       '    Select  1,  CONTCON.RIFCONTRATTO,                                                                    '  + char(13) +
                       '                CONTCON.PROGRESSIVO,                                                                     '  + char(13) +
                       '                CONTCONRANGEDICUI.RIFRIGA,                                                               '  + char(13) +
                       '                CONTCONRANGEDICUI.NRRIGA,                                                                '  + char(13) +
                       '                CONTCON.DADATA,                                                                          '  + char(13) +
                       '                CONTCON.ADATA,                                                                           '  + char(13) +
                       '                CONTCONRANGEDICUI.VALORE,                                                                '  + char(13) +
                       '                CONTCONRANGEDICUI.QTA,                                                                   '  + char(13) +
                       '                CONTCONRANGEDICUI.UM,                                                                    '  + char(13) +
                       '                CONTCONRANGEDICUI.QTA2,                                                                  '  + char(13) +
                       '                CONTCONRANGEDICUI.UM2,                                                                   '  + char(13) +
                       '                CONTCONRANGEDICUI.CONSUNTIVATOQTA,                                                       '  + char(13) +
                       '                CONTCONRANGEDICUI.CONSUNTIVATOVALORE,                                                    '  + char(13) +
                       '                Gruppo.Codice As Gruppo,                                                                 '  + char(13) +
                       '                Categoria.Codice as Categoria,                                                           '  + char(13) +
                       '                CategoriaS.Codice as CategoriaS,                                                         '  + char(13) +
                       '                GruppoPrezzi.Codice as GruppoPrezzi,                                                     '  + char(13) +
                       '                FamRep.Famiglia as Famiglia,                                                             '  + char(13) +
                       '                FamRep.Reparto as Reparto,                                                               '  + char(13) +
                       '                Articolo.Articolo as Articolo,                                                           '  + char(13) +
                       '                Articolo.ESCLUDI as Escludi,                                                             '  + char(13) +
                       '                CONTCON.TIPOCALCOLOPREMIO,                                                               '  + char(13) +
                       '                CONTCON.BUDGET_VALORE,                                                                   '  + char(13) +
                       '                CONTCONRANGEDICUI.PREMIOMATURATO,                                                        '  + char(13) +
                       '                0,                                                                                       '  + char(13) +
                       '                0,                                                                                       '  + char(13) +
                        '               CONTCONRANGEDICUI.PREMIOPERCENT                                                          '  + char(13) +
                       '    from        CONTRATTI_CON CONTCON                                                                    '  + char(13) +
                       '    inner join  ContrattiRange_CONDICUI CONTCONRANGEDICUI                                                '  + char(13) +
                       '    on          CONTCON.PROGRESSIVO = CONTCONRANGEDICUI.RIFPROGRESSIVO                                   '  + char(13) +
                       '    inner join  VISTA_TESTE_CONTRATTI TC                                                                 '  + char(13) +
                       '    On          TC.PROGRESSIVO = CONTCON.RIFCONTRATTO                                                    '  + char(13) +
                       '    left join   contrattigrp_condicui Gruppo                                                             '  + char(13) +
                       '    on          Gruppo.RIFPROGRESSIVO = CONTCON.Progressivo                                              '  + char(13) +
                       '    left join   Contratticat_Condicui Categoria                                                          '  + char(13) +
                       '    on          Categoria.RIFPROGRESSIVO = CONTCON.Progressivo                                           '  + char(13) +
                       '    left join   ContrattiCatSt_CONdicui CategoriaS                                                       '  + char(13) +
                       '    on          CategoriaS.RIFPROGRESSIVO = CONTCON.Progressivo                                          '  + char(13) +
                       '    left join   ContrattiGrpPrz_condicui GruppoPrezzi                                                    '  + char(13) +
                       '    on          GruppoPrezzi.RIFPROGRESSIVO = CONTCON.Progressivo                                        '  + char(13) +    
                       '    left join   ContrattiFamRep_condicui FamRep                                                          '  + char(13) +
                       '    on          FamRep.RIFPROGRESSIVO = CONTCON.Progressivo                                              '  + char(13) +
                       '    left join   ContrattiArt_condicui Articolo                                                           '  + char(13) +
                       '    on          Articolo.RIFPROGRESSIVO = CONTCON.Progressivo                                            '  + char(13) +        
                       '    where       (CONTCONRANGEDICUI.Valore > 0 Or CONTCONRANGEDICUI.Qta > 0 Or CONTCONRANGEDICUI.Qta2 > 0)'  + char(13) +
                       '    And         CONTCON.EMESSO = 0                                                                       '  + char(13) +    
                       '    And         CONTCON.ESCLUSOLOGICAMENTE = 0                                                           '  + char(13) +
                       
                       case when @ESCLLIQUIDATI = 1 then
                       (    
                            '   And         CONTCONRANGEDICUI.RIFPROGRESSIVO                                '  + char(13) +
                            '    Not In      (Select  RIFPROGRESSIVOCC From  CONTRATTICC_DATELIQ            '  + char(13) +
                            '                Where RIFPROGRESSIVOCC = CONTCONRANGEDICUI.RIFPROGRESSIVO      '  + char(13) +
                            '                And EMESSO = 1)                                                '  + char(13) )
                       else ''
                       end +

                       case when @WHERECOND <> '' then 
                        (   ' And ' + @WHERECOND ) 
                       else '' 
                       end +
                       '    Order by    CONTCON.RIFCONTRATTO,CONTCON.PROGRESSIVO '  

        Execute(@COMANDO)
    

        -- INSERIMENTO DEI NORMALI --
        Set @COMANDO = ' Insert into    #ElencoContributi(DiCui,Contratto,ProgressivoContributoCond,                             '  + char(13) +
                       '                                  NrRigaContributoCond,DaData,AData,Valore,                              '  + char(13) +
                       '                                  Qta,Um,Qta2,Um2,ConsuntivatoQta,ConsuntivatoValore,Gruppo,Categoria,CategoriaS,GruppoPrezzi,Famiglia,Reparto,Articolo,Escludi,TipoCalcoloPremio, '    + char(13) +
                       '                                  BUDGET,PREMIOMATURATO,TotSpeseTraspRes,TotImponibileEuro,PREMIOPERCENT)'  + char(13) +
                       '    Select  0,  CONTCON.RIFCONTRATTO,                                                                    '  + char(13) +
                       '                CONTCON.PROGRESSIVO,                                                                     '  + char(13) +
                       '                CONTCONRANGE.NRRIGA,                                                                     '  + char(13) +
                       '                CONTCON.DADATA,                                                                          '  + char(13) +
                       '                CONTCON.ADATA,                                                                           '  + char(13) +
                       '                CONTCONRANGE.VALORE,                                                                     '  + char(13) +
                       '                CONTCONRANGE.QTA,                                                                        '  + char(13) +
                       '                CONTCONRANGE.UM,                                                                         '  + char(13) +
                       '                CONTCONRANGE.QTA2,                                                                       '  + char(13) +
                       '                CONTCONRANGE.UM2,                                                                        '  + char(13) +
                       '                CONTCONRANGE.CONSUNTIVATOQTA,                                                            '  + char(13) +
                       '                CONTCONRANGE.CONSUNTIVATOVALORE,                                                         '  + char(13) +
                       '                Gruppo.Codice As Gruppo,                                                                 '  + char(13) +
                       '                Categoria.Codice as Categoria,                                                           '  + char(13) +
                       '                CategoriaS.Codice as CategoriaS,                                                         '  + char(13) +
                       '                GruppoPrezzi.Codice as GruppoPrezzi,                                                     '  + char(13) +
                       '                FamRep.Famiglia as Famiglia,                                                             '  + char(13) +
                       '                FamRep.Reparto as Reparto,                                                               '  + char(13) +
                       '                Articolo.Articolo as Articolo,                                                           '  + char(13) +
                       '                Articolo.ESCLUDI as Escludi,                                                             '  + char(13) +
                       '                CONTCON.TIPOCALCOLOPREMIO,                                                               '  + char(13) +
                       '                CONTCON.BUDGET_VALORE,                                                                   '  + char(13) +
                       '                CONTCONRANGE.PREMIOMATURATO,                                                             '  + char(13) +
                       '                0,                                                                                       '  + char(13) +
                       '                0,                                                                                       '  + char(13) +
                       '                CONTCONRANGE.PREMIOPERCENT                                                               '  + char(13) +
                       '    from        CONTRATTI_CON CONTCON                                                                    '  + char(13) +
                       '    inner join  ContrattiRange_CON CONTCONRANGE                                                          '  + char(13) +
                       '    on          CONTCON.PROGRESSIVO = CONTCONRANGE.RIFPROGRESSIVO                                        '  + char(13) +
                       '    inner join  VISTA_TESTE_CONTRATTI TC                                                                 '  + char(13) +
                       '    On          TC.PROGRESSIVO = CONTCON.RIFCONTRATTO                                                    '  + char(13) +
                       '    left join   contrattigrp_con Gruppo                                                                  '  + char(13) +
                       '    on          Gruppo.RIFPROGRESSIVO = CONTCON.Progressivo                                              '  + char(13) +
                       '    left join   Contratticat_Con Categoria                                                               '  + char(13) +
                       '    on          Categoria.RIFPROGRESSIVO = CONTCON.Progressivo                                           '  + char(13) +
                       '    left join   ContrattiCatSt_CON CategoriaS                                                            '  + char(13) +
                       '    on          CategoriaS.RIFPROGRESSIVO = CONTCON.Progressivo                                          '  + char(13) +
                       '    left join   ContrattiGrpPrz_con GruppoPrezzi                                                         '  + char(13) +
                       '    on          GruppoPrezzi.RIFPROGRESSIVO = CONTCON.Progressivo                                        '  + char(13) +    
                       '    left join   ContrattiFamRep_con FamRep                                                               '  + char(13) +
                       '    on          FamRep.RIFPROGRESSIVO = CONTCON.Progressivo                                              '  + char(13) +
                       '    left join   ContrattiArt_con Articolo                                                                '  + char(13) +
                       '    on          Articolo.RIFPROGRESSIVO = CONTCON.Progressivo                                            '  + char(13) +        
                       '    where       (CONTCONRANGE.Valore > 0 Or CONTCONRANGE.Qta > 0 Or CONTCONRANGE.Qta2 > 0)               '  + char(13) +
                       '    And         CONTCON.EMESSO = 0                                                                       '  + char(13) +    
                       '    And         CONTCON.ESCLUSOLOGICAMENTE = 0                                                           '  + char(13) +
                       '    And         CONTCONRANGE.RIFPROGRESSIVO                                                              '  + char(13) +
                       '    Not In      (Select  RIFPROGRESSIVOCC From  CONTRATTICC_DATELIQ                                      '  + char(13) +
                       '                 Where RIFPROGRESSIVOCC = CONTCONRANGE.RIFPROGRESSIVO                                    '  + char(13) +
                       '                 And EMESSO = 1)                                                                         '  + char(13) +
                       case when @WHERECOND <> '' then ( ' And ' + @WHERECOND ) else '' end +
                       '    Order by    CONTCON.RIFCONTRATTO,CONTCON.PROGRESSIVO '  

        Execute(@COMANDO)


        --select * from #ElencoContributi

        if (@@ROWCOUNT > 0)
        begin

            -- Epurazione dei contributi non validi di mancato reso --
            
            declare @RifContratto   Decimal(18,0)
            declare @RifProgressivo Decimal(10,0) 
            
            declare cur cursor forward_only read_only for 
                Select Distinct Contratto,ProgressivoContributoCond from #ElencoContributi Where DiCui = 0 

            open cur
    
            fetch next from cur into @RifContratto, @RifProgressivo

            while @@FETCH_STATUS = 0

                begin


                    Declare @RES_VERCONDIZIONATO            int
                    Declare @ERRORNR_VERCONDIZIONATO        int
                    Declare @ERRORMS_VERCONDIZIONATO        Varchar(2048)

                    -- Metter� a non valido il premio per i resi ...
                    exec CONTRATTI_VERCONDIZIONATON 
                         @RifContratto,
                         @RifProgressivo,
                         @RES_VERCONDIZIONATO OUT, 
                         @ERRORNR_VERCONDIZIONATO OUT, 
                         @ERRORMS_VERCONDIZIONATO OUT

                
            
                    fetch next from cur into @RifContratto, @RifProgressivo

                end

            close cur

            deallocate cur
            
    
            -- Per differenza cancella dalla tabella temporanea i contributi che per mancato reso non sono validi --
            /*
            delete  orig
            from    #ElencoContributi orig
            Left Join  (select  CONTCON.RIFCONTRATTO,
                                CONTCON.PROGRESSIVO,            
                                CONTCONRANGE.NRRIGA
                        from    CONTRATTI_CON CONTCON
                        inner join  ContrattiRange_CON CONTCONRANGE
                        on          CONTCON.PROGRESSIVO = CONTCONRANGE.RIFPROGRESSIVO 
                        where       (CONTCONRANGE.Valore > 0 Or CONTCONRANGE.Qta > 0 Or CONTCONRANGE.Qta2 > 0)
                        And         CONTCON.EMESSO = 0
                        And         CONTCON.ESCLUSOLOGICAMENTE = 0
                        And         CONTCONRANGE.PREMIONONVALIDO = 0
                        And         CONTCONRANGE.RIFPROGRESSIVO            
                        Not In      (Select  RIFPROGRESSIVOCC From  CONTRATTICC_DATELIQ 
                                     Where RIFPROGRESSIVOCC = CONTCONRANGE.RIFPROGRESSIVO 
                                     And EMESSO = 1) ) dest
            On  (orig.Contratto = dest.RIFCONTRATTO)
            And (orig.ProgressivoContributoCond = dest.PROGRESSIVO)
            And (orig.NrRigaContributoCond = dest.NRRIGA)
            Where dest.PROGRESSIVO is null
            And   dest.NRRIGA is null
            And   dest.RIFCONTRATTO is null
            */

        end 

        -- select * from #ElencoContributi

        --- fase finale --

        IF OBJECT_ID('tempdb..#RigheContributi') IS NOT NULL DROP TABLE #RigheContributi

        Create Table #RigheContributi(
            DiCui                       smallint        not null, 
            Contratto                   decimal(18,0)   not null,
            ProgressivoContributoCond   decimal(10,0)   not null,
            NrRifRigaCondDiCui          int             null,
            NrRigaContributoCond        int             not null,
            DaData                      datetime        not null,
            AData                       datetime        not null,
            Valore                      decimal(19,6)   not null,
            Qta                         decimal(19,6)   not null default(0),
            Um                          varchar(3)      not null default(''),
            Qta2                        decimal(19,6)   not null default(0),
            Um2                         varchar(3)      not null default(''),
            ConsuntivatoQta             decimal(19,6)   not null default(0),
            ConsuntivatoValore          decimal(19,6)   not null default(0),
            Gruppo                      decimal(5,0)    null,
            Categoria                   decimal(5,0)    null,
            CategoriaS                  decimal(5,0)    null,
            GruppoPrezzi                decimal(5,0)    null,
            Famiglia                    decimal(5,0)    null,
            Reparto                     decimal(5,0)    null,
            Articolo                    varchar(80)     null,
            Escludi                     smallint        null,
            Esercizio                   decimal(5,0)    not null,
            TipoDoc                     varchar(3)      not null,
            GGDataDoc                   int             not null,
            GGDaData                    int             not null,
            GGAData                     int             not null,
            IdTesta                     decimal(10,0)   not null,
            IdRiga                      int             not null,
            TipoRiga                    char(1)         null,
            RD_Gruppo                   decimal(5,0)    null,
            RD_Categoria                decimal(5,0)    null,
            RD_CategoriaS               decimal(5,0)    null,
            RD_GruppoPrezzi             decimal(5,0)    null,
            RD_Famiglia                 decimal(5,0)    null,
            RD_Reparto                  decimal(5,0)    null,
            RD_Articolo                 varchar(80)     null,
            UmGest                      varchar(3)      null,
            QtaGest                     decimal(16,6)   null default(0),
            PrezzoUnitLordo             decimal(19,6)   null default(0),
            TotNettoRiga                decimal(19,6)   null default(0),
            ScontoFinale                varchar(20)     null,
            PrcScontoIncond             varchar(10)     null,
            ScontoIncond                decimal(19,6)   null,
            TP_Formula_SCT              varchar(20)     null,
            QtaPrezzo                   decimal(16,6)   null default(0),
            TipoCalcoloPremio           smallint        null default(0),
            BUDGET                      decimal(19, 6)  NULL,       
            PREMIOMATURATO              decimal(19, 6)  NULL,
            TotSpeseTraspRes            decimal(19,4)   null default(0),    
            TotImponibileEuro           decimal(19,4)   null default(0),
            PREMIOPERCENT               decimal(19,6)   null default(0)                 
        )

        -- Butta nella tabella temporanea le righe che matchano con le righe contributi --
        insert into #RigheContributi (  DiCui,Contratto,ProgressivoContributoCond,NrRifRigaCondDiCui,NrRigaContributoCond,DaData,AData,                     
                                        Valore,Qta,Um,Qta2,Um2,ConsuntivatoQta,ConsuntivatoValore,Gruppo,Categoria,                   
                                        CategoriaS,GruppoPrezzi,Famiglia,Reparto,Articolo,Escludi,Esercizio,TipoDoc,                    
                                        GGDataDoc,GGDaData,GGAData,IdTesta,IdRiga,TipoRiga,RD_Gruppo,RD_Categoria,
                                        RD_CategoriaS,RD_GruppoPrezzi,RD_Famiglia,RD_Reparto,RD_Articolo,UmGest,QtaGest,
                                        PrezzoUnitLordo,TotNettoRiga,ScontoFinale,PrcScontoIncond,ScontoIncond,TP_Formula_SCT,QtaPrezzo,TipoCalcoloPremio,
                                        BUDGET,PREMIOMATURATO,TotSpeseTraspRes,TotImponibileEuro,PREMIOPERCENT)

            select Condiz.DiCui,Condiz.Contratto,Condiz.ProgressivoContributoCond,Condiz.NrRifRigaCondDiCui,Condiz.NrRigaContributoCond,Condiz.DaData,Condiz.AData,                     
                   Condiz.Valore,Condiz.Qta,Condiz.Um,Condiz.Qta2,Condiz.Um2,Condiz.ConsuntivatoQta,Condiz.ConsuntivatoValore,Condiz.Gruppo,
                   Condiz.Categoria,Condiz.CategoriaS,Condiz.GruppoPrezzi,Condiz.Famiglia,Condiz.Reparto,Condiz.Articolo,Condiz.Escludi,
                   Righe.Esercizio,Righe.TipoDoc,Righe.GGDataDoc,Righe.GGDaData,Righe.GGAData,Righe.IdTesta,Righe.IdRiga,Righe.TipoRiga,
                   Righe.Gruppo,Righe.Categoria,Righe.Categoria_Statistica,Righe.Gruppo_Prezzi,Righe.Famiglia,Righe.Reparto,Righe.CodiceArticolo,
                   Righe.UmGest,Righe.Qta,Righe.PREZZOUNITLORDO,Righe.IMPORTORIGA,Righe.SCONTOFINALE,Righe.PRCSCONTOINCOND,Righe.SCONTOINCOND,Righe.FORMULA_SCONTI_ACQ,Righe.QtaPrezzo,Condiz.TipoCalcoloPremio,
                   Condiz.BUDGET,Condiz.PREMIOMATURATO,Righe.TOTSPESETRASPRES,Righe.TOTIMPONIBILEEURO,Condiz.PREMIOPERCENT
            from #ElencoContributi Condiz
            inner join (
                Select  DV.PROGRESSIVO,RD.ESERCIZIO,RD.TIPODOC,RD.GGDATADOC,DV.GGDADATA,DV.GGADATA,
                        RD.IDTESTA,RD.IDRIGA,RD.TIPORIGA,
                        RD.GRUPPO,RD.CATEGORIA,RD.CATEGORIA_STATISTICA,RD.GRUPPO_PREZZI,RD.FAMIGLIA,RD.REPARTO,RD.CODICEARTICOLO,
                        Case DV.INSOTTRAZIONE When 0 then (RD.IMPORTORIGA * RD.SEGNO) Else (RD.IMPORTORIGA * RD.SEGNO) * (-1) End as IMPORTORIGA,
                        RD.UMGEST,RD.QTA * RD.SEGNO as Qta,RD.PREZZOUNITLORDO,RD.SCONTOFINALE,RD.PRCSCONTOINCOND,RD.SCONTOINCOND,RD.FORMULA_SCONTI_ACQ,RD.QtaPrezzo * RD.SEGNO as QtaPrezzo,
                        DV.ConsideraRigheValore,RD.SCONTORIGA,DV.CONSIDERARIGHEQTASCTMERCE,Rif.TOTSPESETRASPRES,Rif.TOTIMPONIBILEEURO
                from righecontratti RD Inner join 
                Contratti_RiferimentoDocumenti Rif
                On rif.KEYIDTIDR = rd.KEYIDTIDR
                Inner join [Contratti_Periodi_DocumentiValidi] DV ON DV.Progressivo = Rif.Progressivo and dv.tipodoc = rd.tipodoc  
            ) Righe 
            on      Condiz.Contratto = Righe.PROGRESSIVO 
            -- e la data del documento deve anche rientrare nel periodo del documento di osservazione che potrebbe essere per tutti gli esercizi se c'� il flag di vaido per tutti gli esercizi --
            And     Righe.GGDATADOC between Righe.GGDADATA 
                                    And     Case When datediff(DAY,'1990-1-1',@FINOADATA) < Righe.GGADATA Then 
                                                datediff(DAY,'1990-1-1',@FINOADATA) 
                                            Else Righe.GGADATA 
                                            End
            -- la data documento deve rientrare nel range del premio --
            And     Righe.GGDATADOC between datediff(DAY,'1990-1-1',Condiz.DaData) 
                                    And     Case When datediff(DAY,'1990-1-1',@FINOADATA) < datediff(DAY,'1990-1-1',Condiz.AData) Then 
                                                datediff(DAY,'1990-1-1',@FINOADATA) 
                                            Else datediff(DAY,'1990-1-1',Condiz.AData) 
                                            End
            -- esclusione delle righe a seconda del parametro di considerazione delle righe tipo V o N ecc..
            And 1 = Case When (Righe.tiporiga = 'V' And Righe.ConsideraRigheValore = 0) Then 
                        0                                                                                                          
                    Else                                                                                                                                                                                
                        Case When (Righe.tiporiga = 'N' And Righe.SCONTORIGA = 100 And Righe.CONSIDERARIGHEQTASCTMERCE = 0) Then                                                                        
                            0                                                                                                                                                                                                                                                     
                        Else                                                                                                                                                                            
                            1                                                                                                                                                                           
                        End  
                    End 
            -- testa le condizioni merceologiche --
            And     1 = Case When (Condiz.Gruppo is not null) Then --   Gruppo
                            Case When (Condiz.Gruppo = Righe.GRUPPO) Then               
                                Case When IsNull(Condiz.Articolo,'') <> '' then             
                                    Case When IsNull(Condiz.Escludi,0) = 1 then
                                        Case When (Righe.CODICEARTICOLO = Condiz.Articolo) then
                                            0 
                                        else
                                            1
                                        end
                                    Else
                                        1
                                    End
                                Else
                                    1
                                End
                            Else -- Or  
                                Case When IsNull(Condiz.Articolo,'') <> '' then             
                                    Case When IsNull(Condiz.Escludi,0) = 0 then
                                        Case When (Righe.CODICEARTICOLO like REPLACE(Condiz.Articolo,'?','_')) then
                                            1
                                        else
                                            0
                                        end
                                    Else
                                        0
                                    End
                                Else
                                    0
                                End
                
                            End         
                        Else

                            -- Categoria
                            Case When (Condiz.Categoria is not null) Then
                                Case When (Condiz.Categoria = Righe.CATEGORIA) Then             
                                    Case When IsNull(Condiz.Articolo,'') <> '' then             
                                        Case When IsNull(Condiz.Escludi,0) = 1 then
                                            Case When (Righe.CODICEARTICOLO = Condiz.Articolo) then
                                                0
                                            else
                                                1
                                            end
                                        Else
                                            1
                                        End
                                    Else
                                        1
                                    End
                                Else -- Or  
                                    Case When IsNull(Condiz.Articolo,'') <> '' then             
                                        Case When IsNull(Condiz.Escludi,0) = 0 then
                                            Case When (Righe.CODICEARTICOLO like REPLACE(Condiz.Articolo,'?','_')) then
                                                1
                                            else
                                                0
                                            end
                                        Else
                                            0
                                        End
                                    Else
                                        0
                                    End
                
                                End         
                            Else

                                -- Categoria Statistica
                                Case When (Condiz.CategoriaS is not null) Then
                                    Case When (Condiz.CategoriaS = Righe.CATEGORIA_STATISTICA) Then             
                                        Case When IsNull(Condiz.Articolo,'') <> '' then             
                                            Case When IsNull(Condiz.Escludi,0) = 1 then
                                                Case When (Righe.CODICEARTICOLO = Condiz.Articolo) then
                                                    0
                                                else
                                                    1
                                                end
                                            Else
                                                1
                                            End
                                        Else
                                            1
                                        End
                                    Else -- Or  
                                        Case When IsNull(Condiz.Articolo,'') <> '' then             
                                            Case When IsNull(Condiz.Escludi,0) = 0 then
                                                Case When (Righe.CODICEARTICOLO like REPLACE(Condiz.Articolo,'?','_')) then
                                                    1
                                                else
                                                    0
                                                end
                                            Else
                                                0
                                            End
                                        Else
                                            0
                                        End
                
                                    End         
                                Else


                                    -- Gruppo Prezzi
                                    Case When (Condiz.GruppoPrezzi is not null) Then
                                        Case When (Condiz.GruppoPrezzi = Righe.GRUPPO_PREZZI) Then              
                                            Case When IsNull(Condiz.Articolo,'') <> '' then             
                                                Case When IsNull(Condiz.Escludi,0) = 1 then
                                                    Case When (Righe.CODICEARTICOLO = Condiz.Articolo) then
                                                        0
                                                    else
                                                        1
                                                    end
                                                Else
                                                    1
                                                End
                                            Else
                                                1
                                            End
                                        Else -- Or  
                                            Case When IsNull(Condiz.Articolo,'') <> '' then             
                                                Case When IsNull(Condiz.Escludi,0) = 0 then
                                                    Case When (Righe.CODICEARTICOLO like REPLACE(Condiz.Articolo,'?','_')) then
                                                        1
                                                    else
                                                        0
                                                    end
                                                Else
                                                    0
                                                End
                                            Else
                                                0
                                            End
                
                                        End         
                                    Else


                                        -- Famiglia Reparto
                                        Case When (Condiz.Famiglia is not null) And (Condiz.Reparto is not null) Then
                                            Case When (Condiz.Famiglia = Righe.FAMIGLIA) And (Condiz.Reparto = Righe.REPARTO) Then              
                                                Case When IsNull(Condiz.Articolo,'') <> '' then             
                                                    Case When IsNull(Condiz.Escludi,0) = 1 then
                                                        Case When (Righe.CODICEARTICOLO = Condiz.Articolo) then
                                                            0
                                                        else
                                                            1
                                                        end
                                                    Else
                                                        1
                                                    End
                                                Else
                                                    1
                                                End
                                            Else -- Or  
                                                Case When IsNull(Condiz.Articolo,'') <> '' then             
                                                    Case When IsNull(Condiz.Escludi,0) = 0 then
                                                        Case When (Righe.CODICEARTICOLO like REPLACE(Condiz.Articolo,'?','_')) then
                                                            1
                                                        else
                                                            0
                                                        end
                                                    Else
                                                        0
                                                    End
                                                Else
                                                    0
                                                End
                
                                            End         
                                        Else

                                            -- Articolo
                                            Case When (Condiz.Articolo is not null) Then
                                                Case When (Condiz.Articolo = Righe.CODICEARTICOLO) Then             
                                                    Case When IsNull(Condiz.Articolo,'') <> '' then             
                                                        Case When IsNull(Condiz.Escludi,0) = 1 then
                                                            Case When (Righe.CODICEARTICOLO = Condiz.Articolo) then
                                                                0
                                                            else
                                                                1
                                                            end
                                                        Else
                                                            1
                                                        End
                                                    Else
                                                        1
                                                    End
                                                Else -- Or  
                                                    Case When IsNull(Condiz.Articolo,'') <> '' then             
                                                        Case When IsNull(Condiz.Escludi,0) = 0 then
                                                            Case When (Righe.CODICEARTICOLO like REPLACE(Condiz.Articolo,'?','_')) then
                                                                1
                                                            else
                                                                0
                                                            end
                                                        Else
                                                            0
                                                        End
                                                    Else
                                                        0
                                                    End
                
                                                End         
                                            Else

                                                1 -- Significa che non sono state impostate condizioni Merceologiche (tutto di tutto)

                                            End

                                        End

                                    End

                                End

                            End

                        End 
            


        -- Cancella tutte le righe dove la Um principale impostata per il contributo � diversa da UmGest delle righe documento
        Delete From #RigheContributi 
        Where (Um <> '') And (Um <> UmGest) 

        -- Cancella le righe che hanno regola contributo per um 2  e non si collegano con articoli um
        delete      RigheContr
        from        #RigheContributi RigheContr
        inner join  ArticoliFattoriConversione FattConv
        On          FattConv.CodArt = RigheContr.RD_Articolo
        And         FattConv.UM1 = RigheContr.UmGest 
        And         IsNull(RigheContr.Um2,'') <> '' 
        Where       FattConv.UM2 <> RigheContr.Um2

    end try

    begin catch
        set @RES        = 0
        set @ERRORNR    = ERROR_NUMBER()
        set @ERRORMS    = ERROR_MESSAGE()
        set @ERRORLINE  = ERROR_LINE()
    end catch

END

-- Se previsto applica gli sconti finali --
if  ( @SCONTIPIEDE = 1 )
begin
    update      #RigheContributi 
    set         TotNettoRiga = TotNettoRiga - (TotNettoRiga * dbo.FunCalcSconti(COALESCE(NULLIF(IsNull(ScontoFinale,''),''),'0'))/100)                                                                                                      
end

if  ( @SCONTIINCONDIZ = 1 )
begin

    update      #RigheContributi 
    set         TotNettoRiga = TotNettoRiga - ((TotNettoRiga * IsNull(ScontoIncond,0))/100)                                 

    update      #RigheContributi 
    set         TotNettoRiga = TotNettoRiga - ((TotNettoRiga * dbo.FunCalcSconti(COALESCE(NULLIF(IsNull(PrcScontoIncond,''),''),'0')))/100)                             

end

-- Scrive nella fissa temporanea --
Insert Into ContribCondizInElab(
                                Uid, 
                                SESSIONE,
                                DiCui, 
                                Contratto,
                                ProgressivoContributoCond,
                                NrRifRigaCondDiCui,
                                NrRigaContributoCond,
                                DaData,
                                AData,
                                Valore,
                                Qta,
                                Um,
                                Qta2,
                                Um2,
                                ConsuntivatoQta,
                                ConsuntivatoValore,
                                Gruppo,
                                Categoria,
                                CategoriaS,
                                GruppoPrezzi,
                                Famiglia,
                                Reparto,
                                Articolo,
                                Escludi,
                                Esercizio,
                                TipoDoc,
                                GGDataDoc,
                                GGDaData,
                                GGAData,
                                IdTesta,
                                IdRiga,
                                TipoRiga,
                                RD_Gruppo,
                                RD_Categoria,
                                RD_CategoriaS,
                                RD_GruppoPrezzi,
                                RD_Famiglia,
                                RD_Reparto,
                                RD_Articolo,
                                UmGest,
                                QtaGest,
                                PrezzoUnitLordo,
                                TotNettoRiga,
                                ScontoFinale,
                                PrcScontoIncond,
                                ScontoIncond,
                                TP_Formula_SCT,
                                QtaPrezzo,
                                TipoCalcoloPremio,  
                                BUDGET,     
                                PREMIOMATURATO,
                                TotSpeseTraspRes,   
                                TotImponibileEuro,
                                PREMIOPERCENT,
                                UtenteModifica,
                                DataModifica
                                ) 
Select NEWID(), @IDSESSIONE,*,@UTENTEMODIFICA,getdate() From #RigheContributi 
    
Drop Table #RigheContributi         
Drop Table #ElencoContributi


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[CONTRATTI_CONSUNTIVAZIONECONDIZIONATI] TO [Metodo98]
    AS [dbo];

