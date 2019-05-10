

CREATE PROCEDURE [dbo].[CONTRATTI_CONSUNTIVAZIONEINCONDIZIONATI] 
    @WHERECOND          Varchar(8000),
    @FINOALLADATA       Varchar(8),
    @SCONTIPIEDE        smallint,
    @SCONTIINCONDIZ     smallint,
    @AZZERAAVANZAMENTI  SMALLINT,
    @IDSESSIONE         int,
    @UTENTEMODIFICA     varchar(20),
    @ESCLLIQUIDATI      smallint,
    @RES                int out,
    @ERRORNR            int out,
    @ERRORMS            Varchar(2048) out,
    @ERRORLINE          int out
--ENCRY--
AS
BEGIN

    set @RES = 1;

    DECLARE @FINOADATA  as datetime
    DECLARE @COMANDO AS VARCHAR(8000)   

    set @FINOADATA = convert(varchar(8), @FINOALLADATA ,112)

    begin try

        IF OBJECT_ID('ContribIncondizInElab') IS NOT NULL
        begin
            Delete From ContribIncondizInElab Where SESSIONE = @IDSESSIONE 
        end

        /*
        1) PREMI VALORE VALIDI  
        */
        IF OBJECT_ID('tempdb..#ElencoContributiIncondVal') IS NOT NULL DROP TABLE #ElencoContributiIncondVal

        Create Table #ElencoContributiIncondVal(
            RIFPROGRESSIVO                      decimal(10,0)   not null,
            NRRIGA                              decimal(10,0)   not null
        )

        Set @COMANDO = '    Insert Into #ElencoContributiIncondVal(RIFPROGRESSIVO,NRRIGA)   ' + char(13) +
                       '    Select      CL.RIFPROGRESSIVO,CL.NRRIGA                         ' + char(13) +
                       '    from        CONTRATTI_CL CL                                     ' + char(13) +
                       '    inner join  TESTE_CONTRATTI TC                                  ' + char(13) +
                       '    on          TC.PROGRESSIVO = CL.RIFPROGRESSIVO                  ' + char(13) +
                       '    Where       CL.VALORE > 0                                       ' + char(13) +
                       '    And         CL.bolisperc = 0                                    ' + char(13) +
                       Case When @WHERECOND = '' Then '' Else ' And ' + @WHERECOND End

        EXECUTE (@COMANDO)

        declare @RifProgressivo decimal(10,0)
        declare @NrRiga         decimal(10,0)

        declare cur cursor forward_only read_only for 
            Select      RIFPROGRESSIVO,NRRIGA 
            from        #ElencoContributiIncondVal

        open cur
    
        fetch next from cur into @RifProgressivo, @NrRiga

        while @@FETCH_STATUS = 0

            begin

                Declare @RES_VERCONDIZIONATO            int
                Declare @ERRORNR_VERCONDIZIONATO        int
                Declare @ERRORMS_VERCONDIZIONATO        Varchar(2048)

                -- Metter� a non valido il premio per i resi ...
                exec CONTRATTI_VERINCONDIZIONATO 
                        @RifProgressivo,
                        @NrRiga,
                        0,
                        @RES_VERCONDIZIONATO OUT, 
                        @ERRORNR_VERCONDIZIONATO OUT, 
                        @ERRORMS_VERCONDIZIONATO OUT

                fetch next from cur into @RifProgressivo, @NrRiga

            end

        close cur

        deallocate cur

        /*
            1.5) PREMI IN PERCENTUALE CON TOLLERANZA
        */
        IF OBJECT_ID('tempdb..#ElencoContributiIncondPercToll') IS NOT NULL DROP TABLE #ElencoContributiIncondPercToll

        Create Table #ElencoContributiIncondPercToll(
            Contratto                           decimal(10,0)   not null,
            NrRigaContributo                    decimal(10,0)   not null,
            NrRigaContributoPerc                decimal(10,0)   not null,
            DADATA                              datetime        NULL,
            ADATA                               datetime        NULL,
            PERCENTUALE                         decimal(19, 6)  NULL,
            BUDGET                              decimal(19, 6)  NULL,
            CONSUNTIVO                          decimal(19, 6)  NULL,
            PREMIOMATURATO                      decimal(19, 6)  NULL,
            CONSUNTIVOQTA                       decimal(19, 6)  NULL,
            PREMIONONVALIDO                     smallint        NULL,
            TIPOCALCOLOPREMIO                   smallint,
            CODICE                              varchar(200)    NULL,
            GGTOLLERANZA                        int             NULL,
            CPCALCSCAD                          smallint
        )

        Set @COMANDO =  '   Insert Into #ElencoContributiIncondPercToll(                ' + char(13) +
                        '           Contratto                           ,               ' + char(13) +
                        '           NrRigaContributo                    ,               ' + char(13) +
                        '           NrRigaContributoPerc                ,               ' + char(13) +  
                        '           DADATA                              ,               ' + char(13) +
                        '           ADATA                               ,               ' + char(13) +
                        '           PERCENTUALE                         ,               ' + char(13) +
                        '           BUDGET                              ,               ' + char(13) +
                        '           CONSUNTIVO                          ,               ' + char(13) +
                        '           PREMIOMATURATO                      ,               ' + char(13) +
                        '           CONSUNTIVOQTA                       ,               ' + char(13) +
                        '           PREMIONONVALIDO                     ,               ' + char(13) +  
                        '           TIPOCALCOLOPREMIO                   ,               ' + char(13) +          
                        '           CODICE                              ,               ' + char(13) +
                        '           GGTOLLERANZA                        ,               ' + char(13) +
                        '           CPCALCSCAD                                          ' + char(13) +
                        '       )                                                       ' + char(13) +
                        '   Select      CL.RIFPROGRESSIVO,                              ' + char(13) +
                        '               CLP.RIFPROGRESSIVO,                             ' + char(13) +
                        '               CLP.NRRIGA,                                     ' + char(13) +
                        '               CLP.DADATA,                                     ' + char(13) +
                        '               CLP.ADATA,                                      ' + char(13) +
                        '               CLP.PERCENTUALE,                                ' + char(13) +
                        '               CLP.BUDGET,                                     ' + char(13) +
                        '               CLP.CONSUNTIVO,                                 ' + char(13) +
                        '               CLP.PREMIOMATURATO,                             ' + char(13) +
                        '               CLP.CONSUNTIVOQTA,                              ' + char(13) +
                        '               CLP.PREMIONONVALIDO,                            ' + char(13) +
                        '               CL.TIPOCALCOLOPREMIO,                           ' + char(13) +
                        '               TC.CODICE,                                      ' + char(13) +
                        '               CL.GGTOLLERANZA,                                ' + char(13) +
                        '               CL.CPCALCSCAD                                   ' + char(13) +
                        '   From        VISTA_TESTE_CONTRATTI                       TC  ' + char(13) +
                        '   Inner Join  CONTRATTI_CL                                CL  ' + char(13) +
                        '   On          CL.RIFPROGRESSIVO = TC.PROGRESSIVO              ' + char(13) +
                        '   Inner Join  CONTRATTICL_QTA                             CLP ' + char(13) +
                        '   On          CLP.RIFPROGRESSIVOCL = CL.RIFPROGRESSIVO        ' + char(13) +
                        '   And         CLP.RIFPROGRESSIVO = CL.NRRIGA                  ' + char(13) +
                        '   Where       CL.ESCLUSOLOGICAMENTE = 0                       ' + char(13) +
                        '   And         CL.GGTOLLERANZA > 0                             ' + char(13) +
                        '   And         CL.BOLISPERC    = 1                             ' + char(13) +
                        case when @ESCLLIQUIDATI = 1 then 
                            '   And         ISNULL(CL.EMESSO,0) = 0                         ' + char(13) 
                        else    
                            ''
                        end +
                        Case When @WHERECOND = '' Then '' Else ' And ' + @WHERECOND End

        EXECUTE (@COMANDO)
    

        Update      CONTRATTICL_QTA
        Set         CONTRATTICL_QTA.CONSUNTIVO = S.Importo
        From        CONTRATTICL_QTA
        Inner Join  (
                        Select      Sum(Case When IncToll.CPCALCSCAD in(0,1) then
                                            Case Scadenze.SCADATTPASS 
                                                When 1 then Scadenze.IMPORTOSCEURO                                      
                                                Else
                                                    Scadenze.IMPORTOSCEURO * (-1)
                                                End
                                        Else
                                            Case Scadenze.SCADATTPASS 
                                                When 1 then Scadenze.IMPONIBSCEURO                                      
                                                Else
                                                    Scadenze.IMPONIBSCEURO * (-1)
                                                End
                                        end) as Importo,
                                    IncToll.Contratto,IncToll.NrRigaContributo,IncToll.NrRigaContributoPerc
                        From        #ElencoContributiIncondPercToll IncToll
                        Inner Join  (

                                        Select      scadattpass,imponibsceuro,importosceuro,codclifor,datafattura,datediff(dd,s.DATASCADENZA,s.DATAPAGEFF) As ritardo                                                                                                
                                        From        TABSCADENZE S                                                                                               
                                        Where       s.ESCLUDICALCPREMI in (0)
                               
                                        Union All 
    
                                        Select      scadattpass,imponibsceuro,importosceuro,codclifor,datafattura,0 As ritardo
                                        From        TABSCADENZE S 
                                        Where       s.ESCLUDICALCPREMI in (2) 

                                    ) Scadenze
                        On          Scadenze.codclifor COLLATE Latin1_General_CI_AS = IncToll.Codice COLLATE Latin1_General_CI_AS
                        And         Scadenze.DATAFATTURA 
                        Between     IncToll.DaData 
                        And         Case When IncToll.AData > @FINOADATA Then 
                                        @FINOADATA 
                                    Else 
                                        IncToll.AData 
                                    End 
                        And         IncToll.GGTOLLERANZA > Scadenze.ritardo
                        Group By    IncToll.Contratto,IncToll.NrRigaContributo,IncToll.NrRigaContributoPerc
                    ) S
        On  S.Contratto = CONTRATTICL_QTA.RIFPROGRESSIVOCL
        And S.NrRigaContributo = CONTRATTICL_QTA.RIFPROGRESSIVO 
        And S.NrRigaContributoPerc = CONTRATTICL_QTA.NRRIGA               


        /*
        2) PREMI IN PERCENTUALE 
        */

        IF OBJECT_ID('tempdb..#ElencoContributiIncondPerc') IS NOT NULL DROP TABLE #ElencoContributiIncondPerc

        Create Table #ElencoContributiIncondPerc(
            Contratto                           decimal(10,0)   not null,
            NrRigaContributo                    decimal(10,0)   not null,
            NrRigaContributoPerc                decimal(10,0)   not null,
            DADATA                              datetime        NULL,
            ADATA                               datetime        NULL,
            PERCENTUALE                         decimal(19, 6)  NULL,
            BUDGET                              decimal(19, 6)  NULL,
            CONSUNTIVO                          decimal(19, 6)  NULL,
            PREMIOMATURATO                      decimal(19, 6)  NULL,
            CONSUNTIVOQTA                       decimal(19, 6)  NULL,
            PREMIONONVALIDO                     smallint        NULL,
            TIPOCALCOLOPREMIO                   smallint
        )

        Set @COMANDO =  '   Insert Into #ElencoContributiIncondPerc (                   ' + char(13) +
                        '           Contratto                           ,               ' + char(13) +
                        '           NrRigaContributo                    ,               ' + char(13) +
                        '           NrRigaContributoPerc                ,               ' + char(13) +  
                        '           DADATA                              ,               ' + char(13) +
                        '           ADATA                               ,               ' + char(13) +
                        '           PERCENTUALE                         ,               ' + char(13) +
                        '           BUDGET                              ,               ' + char(13) +
                        '           CONSUNTIVO                          ,               ' + char(13) +
                        '           PREMIOMATURATO                      ,               ' + char(13) +
                        '           CONSUNTIVOQTA                       ,               ' + char(13) +
                        '           PREMIONONVALIDO                     ,               ' + char(13) +  
                        '           TIPOCALCOLOPREMIO                                   ' + char(13) +          
                        '       )                                                       ' + char(13) +
                        '   Select      CL.RIFPROGRESSIVO,                              ' + char(13) +
                        '               CLP.RIFPROGRESSIVO,                             ' + char(13) +
                        '               CLP.NRRIGA,                                     ' + char(13) +
                        '               CLP.DADATA,                                     ' + char(13) +
                        '               CLP.ADATA,                                      ' + char(13) +
                        '               CLP.PERCENTUALE,                                ' + char(13) +
                        '               CLP.BUDGET,                                     ' + char(13) +
                        '               CLP.CONSUNTIVO,                                 ' + char(13) +
                        '               CLP.PREMIOMATURATO,                             ' + char(13) +
                        '               CLP.CONSUNTIVOQTA,                              ' + char(13) +
                        '               CLP.PREMIONONVALIDO,                            ' + char(13) +
                        '               CL.TIPOCALCOLOPREMIO                            ' + char(13) +
                        '   From        VISTA_TESTE_CONTRATTI                       TC  ' + char(13) +
                        '   Inner Join  CONTRATTI_CL                                CL  ' + char(13) +
                        '   On          CL.RIFPROGRESSIVO = TC.PROGRESSIVO              ' + char(13) +
                        '   Inner Join  CONTRATTICL_QTA                             CLP ' + char(13) +
                        '   On          CLP.RIFPROGRESSIVOCL = CL.RIFPROGRESSIVO        ' + char(13) +
                        '   And         CLP.RIFPROGRESSIVO = CL.NRRIGA                  ' + char(13) +
                        '   Where       CL.ESCLUSOLOGICAMENTE = 0                       ' + char(13) +
                        '   And         CL.GGTOLLERANZA = 0                             ' + char(13) +
                        '   And         CL.BOLISPERC    = 1                             ' + char(13) +
                        '   And         ISNULL(CL.EMESSO,0) = 0                         ' + char(13) +
                        Case When @WHERECOND = '' Then '' Else ' And ' + @WHERECOND End

        EXECUTE (@COMANDO)

        /*
        3) Azzeramenti successivi alla data
        */

        if (    @AZZERAAVANZAMENTI = 1  )
        Begin

             Update         CONTRATTICL_QTA
             Set            CONTRATTICL_QTA.CONSUNTIVO = 0,
                            CONTRATTICL_QTA.CONSUNTIVOSTORICO = 0,
                            CONTRATTICL_QTA.PREMIOMATURATO = 0,
                            CONTRATTICL_QTA.CONSUNTIVOQTA=0,
                            CONTRATTICL_QTA.CONSUNTIVOSTORICOQTA = 0
             From           CONTRATTICL_QTA   
             Inner join     #ElencoContributiIncondPerc
             On             #ElencoContributiIncondPerc.Contratto = CONTRATTICL_QTA.RIFPROGRESSIVOCL
             And            #ElencoContributiIncondPerc.NrRigaContributo = CONTRATTICL_QTA.RIFPROGRESSIVO
             And            #ElencoContributiIncondPerc.NrRigaContributoPerc = CONTRATTICL_QTA.NRRIGA

        End

        /* 3.5 Mi serve poi per la costificazione (butto da dentro anche le righe dei premi a valore) */

        Set @COMANDO =  '   Insert Into #ElencoContributiIncondPerc (                   ' + char(13) +
                        '           Contratto                           ,               ' + char(13) +
                        '           NrRigaContributo                    ,               ' + char(13) +
                        '           NrRigaContributoPerc                ,               ' + char(13) +  
                        '           PREMIOMATURATO                      ,               ' + char(13) +
                        '           TIPOCALCOLOPREMIO                                   ' + char(13) +          
                        '       )                                                       ' + char(13) +
                        '   Select      CL.RIFPROGRESSIVO,                              ' + char(13) +
                        '               CL.NRRIGA,                                      ' + char(13) +
                        '               0,                                              ' + char(13) +
                        '               CL.VALORE,                                      ' + char(13) +
                        '               CL.TIPOCALCOLOPREMIO                            ' + char(13) +
                        '   From        VISTA_TESTE_CONTRATTI                       TC  ' + char(13) +
                        '   Inner Join  CONTRATTI_CL                                CL  ' + char(13) +
                        '   On          CL.RIFPROGRESSIVO = TC.PROGRESSIVO              ' + char(13) +
                        '   Where       CL.ESCLUSOLOGICAMENTE = 0                       ' + char(13) +
                        '   And         CL.GGTOLLERANZA = 0                             ' + char(13) +
                        '   And         CL.BOLISPERC    = 0                             ' + char(13) +
                        '   And         CL.VALORE       > 0                             ' + char(13) +
                        '   And         ISNULL(CL.EMESSO,0) = 0                         ' + char(13) +
                        Case When @WHERECOND = '' Then '' Else ' And ' + @WHERECOND End

        EXECUTE (@COMANDO)


        /*
        4) Recupero righe documenti interessate dalla consuntivazione
            Li butto in una temporanea per farci le elaborazioni sopra  
        */
                
        IF OBJECT_ID('tempdb..#RigheContributi') IS NOT NULL DROP TABLE #RigheContributi

        Create Table #RigheContributi(
            Contratto                           decimal(10,0)   not null,
            NrRigaContributo                    decimal(10,0)   not null,
            NrRigaContributoPerc                decimal(10,0)   not null,
            DADATA                              datetime        NULL,
            ADATA                               datetime        NULL,
            PERCENTUALE                         decimal(19, 6)  NULL,
            BUDGET                              decimal(19, 6)  NULL,
            CONSUNTIVO                          decimal(19, 6)  NULL,
            PREMIOMATURATO                      decimal(19, 6)  NULL,
            CONSUNTIVOQTA                       decimal(19, 6)  NULL,
            PREMIONONVALIDO                     smallint        NULL,
            IdTesta                             decimal(10,0)   not null,
            IdRiga                              int             not null,
            UmGest                              varchar(3)      null,
            QtaGest                             decimal(16,6)   null default(0),
            PrezzoUnitLordo                     decimal(19,6)   null default(0),
            TotNettoRiga                        decimal(19,6)   null default(0),
            ScontoFinale                        varchar(20)     null,
            PrcScontoIncond                     varchar(10)     null,
            ScontoIncond                        decimal(19,6)   null,
            TP_Formula_SCT                      varchar(20)     null,
            QtaPrezzo                           decimal(16,6)   null default(0),
            TipoCalcoloPremio                   smallint        null default(0),
            TotSpeseTraspRes                    decimal(19,4)   null default(0),    
            TotImponibileEuro                   decimal(19,4)   null default(0)
        )

        -- Gli a %
        Insert Into #RigheContributi(Contratto,NrRigaContributo,NrRigaContributoPerc,DADATA,ADATA,PERCENTUALE,BUDGET,
                                     CONSUNTIVO,PREMIOMATURATO,CONSUNTIVOQTA,PREMIONONVALIDO,IdTesta,IdRiga,UmGest,QtaGest,
                                     PrezzoUnitLordo,TotNettoRiga,ScontoFinale,PrcScontoIncond,ScontoIncond,TP_Formula_SCT,
                                     QtaPrezzo,TipoCalcoloPremio,TotSpeseTraspRes,TotImponibileEuro)

        Select      Incondiz.Contratto,Incondiz.NrRigaContributo,Incondiz.NrRigaContributoPerc,Incondiz.DADATA,Incondiz.ADATA,
                    Incondiz.PERCENTUALE,Incondiz.BUDGET,Incondiz.CONSUNTIVO,Incondiz.PREMIOMATURATO,Incondiz.CONSUNTIVOQTA,Incondiz.PREMIONONVALIDO,
                    Righe.IDTESTA,Righe.IDRIGA,Righe.UMGEST,Righe.Qta,Righe.PREZZOUNITLORDO,Righe.IMPORTORIGA,Righe.SCONTOFINALE,
                    Righe.PRCSCONTOINCOND,Righe.SCONTOINCOND,Righe.FORMULA_SCONTI_ACQ,Righe.QtaPrezzo,Incondiz.TIPOCALCOLOPREMIO,
                    Righe.TOTSPESETRASPRES,Righe.TOTIMPONIBILEEURO 
        From        #ElencoContributiIncondPerc Incondiz
        Inner Join  (                                                                                                                                                                            
                        Select      DV.PROGRESSIVO,RD.ESERCIZIO,RD.TIPODOC,RD.GGDATADOC,DV.GGDADATA,DV.GGADATA,
                                    RD.IDTESTA,RD.IDRIGA,RD.TIPORIGA,
                                    RD.GRUPPO,RD.CATEGORIA,RD.CATEGORIA_STATISTICA,RD.GRUPPO_PREZZI,RD.FAMIGLIA,RD.REPARTO,RD.CODICEARTICOLO,
                                    Case DV.INSOTTRAZIONE When 0 then (RD.IMPORTORIGA * RD.SEGNO) Else (RD.IMPORTORIGA * RD.SEGNO) * (-1) End as IMPORTORIGA,
                                    RD.UMGEST,RD.QTA * RD.SEGNO as Qta,RD.PREZZOUNITLORDO,RD.SCONTOFINALE,RD.PRCSCONTOINCOND,RD.SCONTOINCOND,RD.FORMULA_SCONTI_ACQ,RD.QtaPrezzo * RD.SEGNO as QtaPrezzo,
                                    DV.ConsideraRigheValore,RD.SCONTORIGA,DV.CONSIDERARIGHEQTASCTMERCE,Rif.TOTSPESETRASPRES,Rif.TOTIMPONIBILEEURO
                        from        righecontratti RD 
                        Inner join  Contratti_RiferimentoDocumenti Rif
                        On          rif.KEYIDTIDR = rd.KEYIDTIDR
                        Inner join  [Contratti_Periodi_DocumentiValidi] DV ON DV.Progressivo = Rif.Progressivo and dv.tipodoc = rd.tipodoc                                                                                                                          
                      ) Righe
        On           Righe.Progressivo = Incondiz.Contratto                    
        -- e la data del documento deve anche rientrare nel periodo del documento di osservazione che potrebbe essere per tutti gli esercizi se c'� il flag di vaido per tutti gli esercizi --
        And     Righe.GGDATADOC between Righe.GGDADATA 
                                And     Case When datediff(DAY,'1990-1-1',@FINOADATA) < Righe.GGADATA Then 
                                            datediff(DAY,'1990-1-1',@FINOADATA) 
                                        Else Righe.GGADATA 
                                        End
        -- la data documento deve rientrare nel range del premio --
        And     Righe.GGDATADOC between datediff(DAY,'1990-1-1',Incondiz.DaData) 
                                And     Case When datediff(DAY,'1990-1-1',@FINOADATA) < datediff(DAY,'1990-1-1',Incondiz.AData) Then 
                                            datediff(DAY,'1990-1-1',@FINOADATA) 
                                        Else datediff(DAY,'1990-1-1',Incondiz.AData) 
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
        And     Incondiz.NrRigaContributoPerc > 0

        -- Gli a Valore
        Insert Into #RigheContributi(Contratto,NrRigaContributo,NrRigaContributoPerc,DADATA,ADATA,PERCENTUALE,BUDGET,
                                     CONSUNTIVO,PREMIOMATURATO,CONSUNTIVOQTA,PREMIONONVALIDO,IdTesta,IdRiga,UmGest,QtaGest,
                                     PrezzoUnitLordo,TotNettoRiga,ScontoFinale,PrcScontoIncond,ScontoIncond,TP_Formula_SCT,
                                     QtaPrezzo,TipoCalcoloPremio,TotSpeseTraspRes,TotImponibileEuro)

        Select      Incondiz.Contratto,Incondiz.NrRigaContributo,Incondiz.NrRigaContributoPerc,Incondiz.DADATA,Incondiz.ADATA,
                    Incondiz.PERCENTUALE,Incondiz.BUDGET,Incondiz.CONSUNTIVO,Incondiz.PREMIOMATURATO,Incondiz.CONSUNTIVOQTA,Incondiz.PREMIONONVALIDO,
                    Righe.IDTESTA,Righe.IDRIGA,Righe.UMGEST,Righe.Qta,Righe.PREZZOUNITLORDO,Righe.IMPORTORIGA,Righe.SCONTOFINALE,
                    Righe.PRCSCONTOINCOND,Righe.SCONTOINCOND,Righe.FORMULA_SCONTI_ACQ,Righe.QtaPrezzo,Incondiz.TIPOCALCOLOPREMIO,
                    Righe.TOTSPESETRASPRES,Righe.TOTIMPONIBILEEURO  
        From        #ElencoContributiIncondPerc Incondiz
        Inner Join  (                                                                                                                                                                            
                        Select      DV.PROGRESSIVO,RD.ESERCIZIO,RD.TIPODOC,RD.GGDATADOC,DV.GGDADATA,DV.GGADATA,
                                    RD.IDTESTA,RD.IDRIGA,RD.TIPORIGA,
                                    RD.GRUPPO,RD.CATEGORIA,RD.CATEGORIA_STATISTICA,RD.GRUPPO_PREZZI,RD.FAMIGLIA,RD.REPARTO,RD.CODICEARTICOLO,
                                    Case DV.INSOTTRAZIONE When 0 then (RD.IMPORTORIGA * RD.SEGNO) Else (RD.IMPORTORIGA * RD.SEGNO) * (-1) End as IMPORTORIGA,
                                    RD.UMGEST,RD.QTA * RD.SEGNO as Qta,RD.PREZZOUNITLORDO,RD.SCONTOFINALE,RD.PRCSCONTOINCOND,RD.SCONTOINCOND,RD.FORMULA_SCONTI_ACQ,RD.QtaPrezzo * RD.SEGNO as QtaPrezzo,
                                    DV.ConsideraRigheValore,RD.SCONTORIGA,DV.CONSIDERARIGHEQTASCTMERCE,Rif.TOTSPESETRASPRES,Rif.TOTIMPONIBILEEURO 
                        from        righecontratti RD 
                        Inner join  Contratti_RiferimentoDocumenti Rif
                        On          rif.KEYIDTIDR = rd.KEYIDTIDR
                        Inner join  [Contratti_Periodi_DocumentiValidi] DV ON DV.Progressivo = Rif.Progressivo and dv.tipodoc = rd.tipodoc                                                                                                                          
                      ) Righe
        On           Righe.Progressivo = Incondiz.Contratto                    
        -- e la data del documento deve anche rientrare nel periodo del documento di osservazione che potrebbe essere per tutti gli esercizi se c'� il flag di vaido per tutti gli esercizi --
        And     Righe.GGDATADOC between Righe.GGDADATA 
                                And     Case When datediff(DAY,'1990-1-1',@FINOADATA) < Righe.GGADATA Then 
                                            datediff(DAY,'1990-1-1',@FINOADATA) 
                                        Else Righe.GGADATA 
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
        And     Incondiz.NrRigaContributoPerc = 0
        And     Incondiz.DaData             Is Null 
        And     Incondiz.AData              Is Null
        

        if (@SCONTIPIEDE = 1)
        begin
            update      #RigheContributi 
            set         TotNettoRiga = TotNettoRiga - ((TotNettoRiga * dbo.FunCalcSconti(COALESCE(NULLIF(IsNull(ScontoFinale,''),''),'0')))/100)                                
        end

        if (@SCONTIINCONDIZ = 1)
        begin

            update      #RigheContributi 
            set         TotNettoRiga = TotNettoRiga - ((TotNettoRiga * IsNull(ScontoIncond,0))/100)                                 

            update      #RigheContributi 
            set         TotNettoRiga = TotNettoRiga - ((TotNettoRiga * dbo.FunCalcSconti(COALESCE(NULLIF(IsNull(PrcScontoIncond,''),''),'0')))/100)                             

        end
        
        -- Scrive nella fissa temporanea --
        Insert Into ContribIncondizInElab 
        Select  NEWID(), 
                @IDSESSIONE,
                Contratto,
                NrRigaContributo,
                NrRigaContributoPerc,
                DADATA,
                ADATA,
                PERCENTUALE,
                BUDGET,
                CONSUNTIVO,
                PREMIOMATURATO,
                CONSUNTIVOQTA,
                PREMIONONVALIDO,
                IdTesta,
                IdRiga,
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
                @UTENTEMODIFICA,
                GETDATE(),
                TotSpeseTraspRes,   
                TotImponibileEuro
        From    #RigheContributi  

    end try

    begin catch
        print 'In errore'
        set @RES        = 0
        set @ERRORNR    = ERROR_NUMBER()
        set @ERRORMS    = ERROR_MESSAGE()
        set @ERRORLINE  = ERROR_LINE()
    end catch

Drop Table #RigheContributi         
Drop Table #ElencoContributiIncondVal
drop Table #ElencoContributiIncondPerc

END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[CONTRATTI_CONSUNTIVAZIONEINCONDIZIONATI] TO [Metodo98]
    AS [dbo];

