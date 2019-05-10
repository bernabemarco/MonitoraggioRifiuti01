

CREATE PROCEDURE PREPARAARTICOLIPROMO(@PPROMO decimal(10,0),
                                      @ESERCIZIO decimal(5,0),
                                      @UTENTEMODIFICA varchar(20),
                                      @QTATOTALE smallint)
AS

BEGIN

    begin tran
    
        if OBJECT_ID('tempdb..#PROMOZIONI_ELENCOARTICOLI') is not null drop table #PROMOZIONI_ELENCOARTICOLI
    
        -- articolo --
        Select * Into #PROMOZIONI_ELENCOARTICOLI From
        (   
            -- Tutti gli articoli (con esclusione quelli con codice tappo e ?) --
            Select      NEWID() as [Guid],
                        PART.RIFPROGRESSIVO As PROGRESSIVO, 
                        PROMO.NUMEROCAMPAGNA,
                        PROMO.TIPO,
                        PROMO.DESCRIZIONE,
                        PROMO.CLIFOR,
                        PROMO.GRUPPOPRZCF   As GRUPPOPREZZICF,
                        PROMO.CODSETTORE,
                        PROMO.CODZONA,
                        PROMO.CODCATEGORIA,
                        PROMO.DATA_INIZIO,
                        PROMO.DATA_FINE,
                        ART.CODICE,
                        ART.DESCRIZIONE     As DESCART,
                        PART.NRRIGA         As RIGA,
                        0                   As TIPOLOGIA,
                        case when DETTARTOMAQTATOT.QTA_M_PRODOFF is null then 0 else DETTARTOMAQTATOT.QTA_M_PRODOFF end As QTATOTPRODOFF,
                        case when DETTARTOMAQTATOT.UM_M_PRODOFF is null then '' else DETTARTOMAQTATOT.UM_M_PRODOFF end As UMTOTPRODOFF,
                        PROMO.SCONTO_M_O    As TIPOSCONTO,
                        PROMO.PIUDICUI,
                        PROMO.NOTE,
                        PROMO.SUNONEVAD,
                        case when DETTARTOMAQTATOT.TIPOSCONTOARTOMA is null then 0 else DETTARTOMAQTATOT.TIPOSCONTOARTOMA end As TIPOPROMOARTOMA,
                        PROMO.ABILITAPRZARTOMA As ABILITAPRZARTOMA,
                        PROMO.ABILITASCTARTOMA As ABILITASCTARTOMA,
                        PROMO.VISPREZZI        As VISPREZZO,
                        user_name()            As UTENTEMODIFICA,
                        getdate()              As DATAMODIFICA,
                        PROMO.PRIORITA      
            from 
                        PROMOZIONI_ARTICOLO PART
            inner join  ANAGRAFICAARTICOLI ART
            on          ART.CODICE like replace(PART.CODICE,'?','_')
            inner join  TP_PROMOZIONI_TESTE PROMO
            on          PROMO.PROGRESSIVO = PART.RIFPROGRESSIVO
            left join   TP_PROMOZIONI_DETTARTOMA DETTARTOMAQTATOT
            on          DETTARTOMAQTATOT.RIFPROGRESSIVO = PART.RIFPROGRESSIVO
            and         DETTARTOMAQTATOT.NRRIGA = Case @QTATOTALE When 0 Then PART.NRRIGA When 1 Then 0 End
            where       PROMO.ATTIV_DISAT = 0
            and         PROMO.PROGRESSIVO = @PPROMO and PART.VARESPLICITE = '' 
        
            union 
            -- articoli con codice tappo e ?--
            select      NEWID(),
                          PART.RIFPROGRESSIVO, 
                          PROMO.NUMEROCAMPAGNA,
                          PROMO.TIPO,
                          PROMO.DESCRIZIONE,
                          PROMO.CLIFOR,
                          PROMO.GRUPPOPRZCF,
                          PROMO.CODSETTORE,
                          PROMO.CODZONA,
                          PROMO.CODCATEGORIA,
                          PROMO.DATA_INIZIO,
                          PROMO.DATA_FINE,
                          ART.CODICE,
                          ART.DESCRIZIONE,
                          PART.NRRIGA,
                          0,
                          case when DETTARTOMAQTATOT.QTA_M_PRODOFF is null then 0 else DETTARTOMAQTATOT.QTA_M_PRODOFF end ,
                          case when DETTARTOMAQTATOT.UM_M_PRODOFF is null then '' else DETTARTOMAQTATOT.UM_M_PRODOFF end,
                          PROMO.SCONTO_M_O,
                          PROMO.PIUDICUI,
                          PROMO.NOTE,
                          PROMO.SUNONEVAD,
                          case when DETTARTOMAQTATOT.TIPOSCONTOARTOMA is null then 0 else DETTARTOMAQTATOT.TIPOSCONTOARTOMA end,
                          PROMO.ABILITAPRZARTOMA,
                          PROMO.ABILITASCTARTOMA,
                          PROMO.VISPREZZI,
                          @UTENTEMODIFICA,
                          getdate(),
                          PROMO.PRIORITA            
          from 
                PROMOZIONI_ARTICOLO PART
          inner join  ANAGRAFICAARTICOLI ART
          on          ART.CODICEPRIMARIO = PART.CODICEPRIMARIO AND ART.VARESPLICITE like replace(PART.VARESPLICITE ,'?','_')
          inner join  TP_PROMOZIONI_TESTE PROMO
          on          PROMO.PROGRESSIVO = PART.RIFPROGRESSIVO
          left join   TP_PROMOZIONI_DETTARTOMA DETTARTOMAQTATOT
          on          DETTARTOMAQTATOT.RIFPROGRESSIVO = PART.RIFPROGRESSIVO
          and         DETTARTOMAQTATOT.NRRIGA = Case @QTATOTALE When 0 Then PART.NRRIGA When 1 Then 0 End
          where       PROMO.ATTIV_DISAT = 0
          and         PROMO.PROGRESSIVO = @PPROMO and PART.VARESPLICITE <> ''           
 
          union
        
            -- gruppo --
            select      NEWID(),
                        GRP.RIFPROGRESSIVO, 
                        PROMO.NUMEROCAMPAGNA,
                        PROMO.TIPO,
                        PROMO.DESCRIZIONE,
                        PROMO.CLIFOR,
                        PROMO.GRUPPOPRZCF,
                        PROMO.CODSETTORE,
                        PROMO.CODZONA,
                        PROMO.CODCATEGORIA,
                        PROMO.DATA_INIZIO,
                        PROMO.DATA_FINE,
                        ART.CODICE,
                        ART.DESCRIZIONE,
                        GRP.NRRIGA,
                        1,
                        case when DETTARTOMAQTATOT.QTA_M_PRODOFF is null then 0 else DETTARTOMAQTATOT.QTA_M_PRODOFF end ,
                        case when DETTARTOMAQTATOT.UM_M_PRODOFF is null then '' else DETTARTOMAQTATOT.UM_M_PRODOFF end,
                        PROMO.SCONTO_M_O,
                        PROMO.PIUDICUI,
                        PROMO.NOTE,
                        PROMO.SUNONEVAD,
                        case when DETTARTOMAQTATOT.TIPOSCONTOARTOMA is null then 0 else DETTARTOMAQTATOT.TIPOSCONTOARTOMA end,
                        PROMO.ABILITAPRZARTOMA,
                        PROMO.ABILITASCTARTOMA,
                        PROMO.VISPREZZI,
                        user_name(),
                        getdate(),
                        PROMO.PRIORITA          
            from 
                        PROMOZIONI_GRUPPO GRP
            inner join  ANAGRAFICAARTICOLI ART
            on          ART.GRUPPO = GRP.CODICE
            inner join  TP_PROMOZIONI_TESTE PROMO
            on          PROMO.PROGRESSIVO = GRP.RIFPROGRESSIVO
            left join   TP_PROMOZIONI_DETTARTOMA DETTARTOMAQTATOT
            on          DETTARTOMAQTATOT.RIFPROGRESSIVO = GRP.RIFPROGRESSIVO
            and         DETTARTOMAQTATOT.NRRIGA = Case @QTATOTALE When 0 Then GRP.NRRIGA When 1 Then 0 End
            where       PROMO.ATTIV_DISAT = 0
            and         PROMO.PROGRESSIVO = @PPROMO
        
            union
        
            -- categoria --
            select      NEWID(),
                        CAT.RIFPROGRESSIVO, 
                        PROMO.NUMEROCAMPAGNA,
                        PROMO.TIPO,
                        PROMO.DESCRIZIONE,
                        PROMO.CLIFOR,
                        PROMO.GRUPPOPRZCF,
                        PROMO.CODSETTORE,
                        PROMO.CODZONA,
                        PROMO.CODCATEGORIA,
                        PROMO.DATA_INIZIO,
                        PROMO.DATA_FINE,
                        ART.CODICE,
                        ART.DESCRIZIONE,
                        CAT.NRRIGA,
                        2,
                        case when DETTARTOMAQTATOT.QTA_M_PRODOFF is null then 0 else DETTARTOMAQTATOT.QTA_M_PRODOFF end ,
                        case when DETTARTOMAQTATOT.UM_M_PRODOFF is null then '' else DETTARTOMAQTATOT.UM_M_PRODOFF end,
                        PROMO.SCONTO_M_O,
                        PROMO.PIUDICUI,
                        PROMO.NOTE,
                        PROMO.SUNONEVAD,
                        case when DETTARTOMAQTATOT.TIPOSCONTOARTOMA is null then 0 else DETTARTOMAQTATOT.TIPOSCONTOARTOMA end,
                        PROMO.ABILITAPRZARTOMA,
                        PROMO.ABILITASCTARTOMA,
                        PROMO.VISPREZZI,
                        user_name(),
                        getdate(),
                        PROMO.PRIORITA
            from 
                        PROMOZIONI_CATEGORIA CAT
            inner join  ANAGRAFICAARTICOLI ART
            on          ART.CATEGORIA = CAT.CODICE
            inner join  TP_PROMOZIONI_TESTE PROMO
            on          PROMO.PROGRESSIVO = CAT.RIFPROGRESSIVO
            left join   TP_PROMOZIONI_DETTARTOMA DETTARTOMAQTATOT
            on          DETTARTOMAQTATOT.RIFPROGRESSIVO = CAT.RIFPROGRESSIVO
            and         DETTARTOMAQTATOT.NRRIGA = Case @QTATOTALE When 0 Then CAT.NRRIGA When 1 Then 0 End
            where       PROMO.ATTIV_DISAT = 0
            and         PROMO.PROGRESSIVO = @PPROMO
        
            union
        
            -- categoria stat --
            select      NEWID(),
                        CATS.RIFPROGRESSIVO, 
                        PROMO.NUMEROCAMPAGNA,
                        PROMO.TIPO,
                        PROMO.DESCRIZIONE,
                        PROMO.CLIFOR,
                        PROMO.GRUPPOPRZCF,
                        PROMO.CODSETTORE,
                        PROMO.CODZONA,
                        PROMO.CODCATEGORIA,
                        PROMO.DATA_INIZIO,
                        PROMO.DATA_FINE,
                        ART.CODICE,
                        ART.DESCRIZIONE,
                        CATS.NRRIGA,
                        3,
                        case when DETTARTOMAQTATOT.QTA_M_PRODOFF is null then 0 else DETTARTOMAQTATOT.QTA_M_PRODOFF end ,
                        case when DETTARTOMAQTATOT.UM_M_PRODOFF is null then '' else DETTARTOMAQTATOT.UM_M_PRODOFF end,
                        PROMO.SCONTO_M_O,
                        PROMO.PIUDICUI,
                        PROMO.NOTE,
                        PROMO.SUNONEVAD,
                        case when DETTARTOMAQTATOT.TIPOSCONTOARTOMA is null then 0 else DETTARTOMAQTATOT.TIPOSCONTOARTOMA end,
                        PROMO.ABILITAPRZARTOMA,
                        PROMO.ABILITASCTARTOMA,
                        PROMO.VISPREZZI,
                        user_name(),
                        getdate(),
                        PROMO.PRIORITA
            from 
                        PROMOZIONI_CATEGORIAS CATS
            inner join  ANAGRAFICAARTICOLI ART
            on          ART.CODCATEGORIASTAT = CATS.CODICE
            inner join  TP_PROMOZIONI_TESTE PROMO
            on          PROMO.PROGRESSIVO = CATS.RIFPROGRESSIVO
            left join   TP_PROMOZIONI_DETTARTOMA DETTARTOMAQTATOT
            on          DETTARTOMAQTATOT.RIFPROGRESSIVO = CATS.RIFPROGRESSIVO
            and         DETTARTOMAQTATOT.NRRIGA = Case @QTATOTALE When 0 Then CATS.NRRIGA When 1 Then 0 End
            where       PROMO.ATTIV_DISAT = 0
            and         PROMO.PROGRESSIVO = @PPROMO
        
            union
        
            -- famiglia reparto --
            select      NEWID(),
                        FR.RIFPROGRESSIVO, 
                        PROMO.NUMEROCAMPAGNA,
                        PROMO.TIPO,
                        PROMO.DESCRIZIONE,
                        PROMO.CLIFOR,
                        PROMO.GRUPPOPRZCF,
                        PROMO.CODSETTORE,
                        PROMO.CODZONA,
                        PROMO.CODCATEGORIA,
                        PROMO.DATA_INIZIO,
                        PROMO.DATA_FINE,
                        ART.CODICE,
                        ART.DESCRIZIONE,
                        FR.NRRIGA,
                        5,
                        case when DETTARTOMAQTATOT.QTA_M_PRODOFF is null then 0 else DETTARTOMAQTATOT.QTA_M_PRODOFF end ,
                        case when DETTARTOMAQTATOT.UM_M_PRODOFF is null then '' else DETTARTOMAQTATOT.UM_M_PRODOFF end,
                        PROMO.SCONTO_M_O,
                        PROMO.PIUDICUI,
                        PROMO.NOTE,
                        PROMO.SUNONEVAD,
                        case when DETTARTOMAQTATOT.TIPOSCONTOARTOMA is null then 0 else DETTARTOMAQTATOT.TIPOSCONTOARTOMA end,
                        PROMO.ABILITAPRZARTOMA,
                        PROMO.ABILITASCTARTOMA,
                        PROMO.VISPREZZI,
                        user_name(),
                        getdate(),
                        PROMO.PRIORITA
            from 
                        PROMOZIONI_FAMREP FR
            inner join  TP_EXTRAMAG EXTRA
            on          CODFAMIGLIAPOS = FR.FAMIGLIA
            and         CODREPARTOPOS = ISNULL(FR.REPARTO,CODREPARTOPOS)
            inner join  ANAGRAFICAARTICOLI ART
            on          ART.CODICE = EXTRA.CODART
            inner join  TP_PROMOZIONI_TESTE PROMO
            on          PROMO.PROGRESSIVO = FR.RIFPROGRESSIVO
            left join   TP_PROMOZIONI_DETTARTOMA DETTARTOMAQTATOT
            on          DETTARTOMAQTATOT.RIFPROGRESSIVO = FR.RIFPROGRESSIVO
            and         DETTARTOMAQTATOT.NRRIGA = Case @QTATOTALE When 0 Then FR.NRRIGA When 1 Then 0 End
            where       PROMO.ATTIV_DISAT = 0
            and         PROMO.PROGRESSIVO = @PPROMO
        
            union
        
            -- gruppo prezzi --
            select      NEWID(),
                        PR.RIFPROGRESSIVO, 
                        PROMO.NUMEROCAMPAGNA,
                        PROMO.TIPO,
                        PROMO.DESCRIZIONE,
                        PROMO.CLIFOR,
                        PROMO.GRUPPOPRZCF,
                        PROMO.CODSETTORE,
                        PROMO.CODZONA,
                        PROMO.CODCATEGORIA,
                        PROMO.DATA_INIZIO,
                        PROMO.DATA_FINE,
                        ART.CODICE,
                        ART.DESCRIZIONE,
                        PR.NRRIGA,
                        4,
                        case when DETTARTOMAQTATOT.QTA_M_PRODOFF is null then 0 else DETTARTOMAQTATOT.QTA_M_PRODOFF end ,
                        case when DETTARTOMAQTATOT.UM_M_PRODOFF is null then '' else DETTARTOMAQTATOT.UM_M_PRODOFF end,
                        PROMO.SCONTO_M_O,
                        PROMO.PIUDICUI,
                        PROMO.NOTE,
                        PROMO.SUNONEVAD,
                        case when DETTARTOMAQTATOT.TIPOSCONTOARTOMA is null then 0 else DETTARTOMAQTATOT.TIPOSCONTOARTOMA end,
                        PROMO.ABILITAPRZARTOMA,
                        PROMO.ABILITASCTARTOMA,
                        PROMO.VISPREZZI,
                        user_name(),
                        getdate(),
                        PROMO.PRIORITA
            from 
                        PROMOZIONI_GRUPPO_PREZZI PR
            inner join  ANAGRAFICAARTICOLICOMM COMM
            on          COMM.GRUPPOPRZPART = PR.CODICE
            inner join  ANAGRAFICAARTICOLI ART
            on          ART.CODICE = COMM.CODICEART
            inner join  TP_PROMOZIONI_TESTE PROMO
            on          PROMO.PROGRESSIVO = PR.RIFPROGRESSIVO
            left join   TP_PROMOZIONI_DETTARTOMA DETTARTOMAQTATOT
            on          DETTARTOMAQTATOT.RIFPROGRESSIVO = PR.RIFPROGRESSIVO
            and         DETTARTOMAQTATOT.NRRIGA = Case @QTATOTALE When 0 Then PR.NRRIGA When 1 Then 0 End
            where       PROMO.ATTIV_DISAT = 0
            and         COMM.ESERCIZIO in (Select ESERCIZIOATTIVO From TABUTENTI Where USERID=user_name())
            and         PROMO.PROGRESSIVO = @PPROMO
        
            union
        
            -- livelli merceologici --
            select      NEWID(),
                        LM.RIFPROGRESSIVO,
                        PROMO.NUMEROCAMPAGNA,
                        PROMO.TIPO,
                        PROMO.DESCRIZIONE,
                        PROMO.CLIFOR,
                        PROMO.GRUPPOPRZCF,
                        PROMO.CODSETTORE,
                        PROMO.CODZONA,
                        PROMO.CODCATEGORIA,
                        PROMO.DATA_INIZIO,
                        PROMO.DATA_FINE,
                        ART.CODICE,
                        ART.DESCRIZIONE,
                        1,
                        6,
                        case when DETTARTOMAQTATOT.QTA_M_PRODOFF is null then 0 else DETTARTOMAQTATOT.QTA_M_PRODOFF end ,
                        case when DETTARTOMAQTATOT.UM_M_PRODOFF is null then '' else DETTARTOMAQTATOT.UM_M_PRODOFF end,
                        PROMO.SCONTO_M_O,
                        PROMO.PIUDICUI,
                        PROMO.NOTE,
                        PROMO.SUNONEVAD,
                        case when DETTARTOMAQTATOT.TIPOSCONTOARTOMA is null then 0 else DETTARTOMAQTATOT.TIPOSCONTOARTOMA end,
                        PROMO.ABILITAPRZARTOMA,
                        PROMO.ABILITASCTARTOMA,
                        PROMO.VISPREZZI,
                        user_name(),
                        getdate(),
                        PROMO.PRIORITA
            from 
                        PROMOZIONI_LIVELLIMERCEOLOGICI LM
            inner join  TP_LIVELLIARTICOLI LA
            on          LA.CODLIVELLOINTERNO = REPLACE(LM.CODICE,'''','')
            inner join  ANAGRAFICAARTICOLI ART
            on          ART.CODICE = LA.CODICE
            inner join  TP_PROMOZIONI_TESTE PROMO
            on          PROMO.PROGRESSIVO = LM.RIFPROGRESSIVO
            left join   TP_PROMOZIONI_DETTARTOMA DETTARTOMAQTATOT
            on          DETTARTOMAQTATOT.RIFPROGRESSIVO = LM.RIFPROGRESSIVO
            and         DETTARTOMAQTATOT.NRRIGA = Case @QTATOTALE When 0 Then 1 When 1 Then 0 End
            where       PROMO.ATTIV_DISAT = 0
            and         PROMO.PROGRESSIVO = @PPROMO

            union
    
            -- Feature --
            select      NEWID(),
                        FT.RIFPROGRESSIVO, 
                        PROMO.NUMEROCAMPAGNA,
                        PROMO.TIPO,
                        PROMO.DESCRIZIONE,
                        PROMO.CLIFOR,
                        PROMO.GRUPPOPRZCF,
                        PROMO.CODSETTORE,
                        PROMO.CODZONA,
                        PROMO.CODCATEGORIA,
                        PROMO.DATA_INIZIO,
                        PROMO.DATA_FINE,
                        ART.CODICE,
                        ART.DESCRIZIONE,
                        FT.NRRIGA,
                        7,
                        case when DETTARTOMAQTATOT.QTA_M_PRODOFF is null then 0 else DETTARTOMAQTATOT.QTA_M_PRODOFF end ,
                        case when DETTARTOMAQTATOT.UM_M_PRODOFF is null then '' else DETTARTOMAQTATOT.UM_M_PRODOFF end,
                        PROMO.SCONTO_M_O,
                        PROMO.PIUDICUI,
                        PROMO.NOTE,
                        PROMO.SUNONEVAD,
                        case when DETTARTOMAQTATOT.TIPOSCONTOARTOMA is null then 0 else DETTARTOMAQTATOT.TIPOSCONTOARTOMA end,
                        PROMO.ABILITAPRZARTOMA,
                        PROMO.ABILITASCTARTOMA,
                        PROMO.VISPREZZI,
                        @UTENTEMODIFICA,
                        getdate(),
                        PROMO.PRIORITA            
            from 
                        PROMOZIONI_FEATURE FT
            inner join  ANAGRAFICAARTICOLI ART
            on          ART.CODFEATURE  = FT.CODFEATURE AND ART.VARESPLICITE like replace(FT.VARESPLICITE ,'?','_')
            inner join  TP_PROMOZIONI_TESTE PROMO
            on          PROMO.PROGRESSIVO = FT.RIFPROGRESSIVO
            left join   TP_PROMOZIONI_DETTARTOMA DETTARTOMAQTATOT
            on          DETTARTOMAQTATOT.RIFPROGRESSIVO = FT.RIFPROGRESSIVO
            and         DETTARTOMAQTATOT.NRRIGA = Case @QTATOTALE When 0 Then FT.NRRIGA When 1 Then 0 End
            where       PROMO.ATTIV_DISAT = 0
            and         PROMO.PROGRESSIVO = @PPROMO            



        ) TBPROMOART;
    

        if @@ERROR > 0 goto ERR_CODE
    
        
        begin try

            -- Cancellazione Articoli Particolari che non devono essere in Promo --
            delete from #PROMOZIONI_ELENCOARTICOLI where codice in (select codice from VISTADOARTICOLINOPROMO );

            -- CANCELLAZIONE RIGHE PROMOZIONI --

            -- LATO PERIFERIA --
            insert into PROMOZIONI_ELENCOARTICOLI_PERIFERIA(rowguid,
                                                            progressivo,
                                                            numerocampagna,
                                                            tipo,
                                                            descrizione,
                                                            clifor,
                                                            gruppoprezzicf,
                                                            codsettore,
                                                            codzona,
                                                            codcategoria, 
                                                            data_inizio,
                                                            data_fine,
                                                            codice,
                                                            descart,
                                                            riga,
                                                            tipologia,
                                                            qtatotprodoff,
                                                            umtotprodoff, 
                                                            tiposconto,   
                                                            piudicui,
                                                            note, 
                                                            sunonevad,
                                                            tipopromoartoma,
                                                            abilitaprzartoma,
                                                            abilitasctartoma,
                                                            visprezzo,    
                                                            utentemodifica,
                                                            datamodifica,
                                                            priorita)                                        
            Select      NEWID(),
                        O.progressivo,
                        O.numerocampagna,
                        O.tipo,
                        O.descrizione,
                        O.clifor,
                        O.gruppoprezzicf,
                        O.codsettore,
                        O.codzona,
                        O.codcategoria, 
                        O.data_inizio,
                        O.data_fine,
                        O.codice,
                        O.descart,
                        O.riga,
                        O.tipologia,
                        O.qtatotprodoff,
                        O.umtotprodoff, 
                        O.tiposconto,   
                        O.piudicui,
                        O.note, 
                        O.sunonevad,
                        O.tipopromoartoma,
                        O.abilitaprzartoma,
                        O.abilitasctartoma,
                        O.visprezzo,    
                        O.utentemodifica,
                        GETDATE(),
                        O.priorita
            From        PROMOZIONI_ELENCOARTICOLI O 
            Left Join   #PROMOZIONI_ELENCOARTICOLI N    
            ON          N.progressivo = O.progressivo
            And         N.numerocampagna = O.numerocampagna
            And         N.tipo = O.tipo
            And         N.clifor = O.clifor
            And         N.gruppoprezzicf = O.gruppoprezzicf
            And         N.CODSETTORE = O.CODSETTORE
            And         N.CODZONA = O.CODZONA
            And         N.CODCATEGORIA = O.CODCATEGORIA 
            And         N.codice = O.codice
            And         N.riga = O.riga
            And         N.tipologia = O.tipologia 
            And         N.piudicui = O.piudicui 
            And         N.tipopromoartoma = O.tipopromoartoma
            Where       N.progressivo is null
            And         O.progressivo = @PPROMO

            -- LATO CENTRALE --
            Delete      O 
            From        PROMOZIONI_ELENCOARTICOLI O 
            Left Join   #PROMOZIONI_ELENCOARTICOLI N    
            ON          N.progressivo = O.progressivo
            And         N.numerocampagna = O.numerocampagna
            And         N.tipo = O.tipo
            And         N.clifor = O.clifor
            And         N.gruppoprezzicf = O.gruppoprezzicf
            And         N.CODSETTORE = O.CODSETTORE
            And         N.CODZONA = O.CODZONA
            And         N.CODCATEGORIA = O.CODCATEGORIA 
            And         N.codice = O.codice
            And         N.riga = O.riga
            And         N.tipologia = O.tipologia 
            And         N.piudicui = O.piudicui 
            And         N.tipopromoartoma = O.tipopromoartoma
            And         N.priorita = O.priorita
            Where       N.progressivo is null
            And         O.progressivo = @PPROMO

            --PRINT 'Concluso Step Cancel'

            --PRINT 'Concluso Step Preparazione'
        
            -- INSERIMENTO NUOVE RIGHE PROMOZIONI NELLA TABELLA LATO CENTRALE --
            insert into PROMOZIONI_ELENCOARTICOLI(rowguid,
                                                  progressivo,
                                                  numerocampagna,
                                                  tipo,
                                                  descrizione,
                                                  clifor,
                                                  gruppoprezzicf,
                                                  codsettore,
                                                  codzona,
                                                  codcategoria, 
                                                  data_inizio,
                                                  data_fine,
                                                  codice,
                                                  descart,
                                                  riga,
                                                  tipologia,
                                                  qtatotprodoff,
                                                  umtotprodoff, 
                                                  tiposconto,   
                                                  piudicui,
                                                  note, 
                                                  sunonevad,
                                                  tipopromoartoma,
                                                  abilitaprzartoma,
                                                  abilitasctartoma,
                                                  visprezzo,    
                                                  utentemodifica,
                                                  datamodifica,
                                                  priorita)                                      
            Select  NEWID(),
                    N.progressivo,
                    N.numerocampagna,
                    N.tipo,
                    N.descrizione,
                    N.clifor,
                    N.gruppoprezzicf,
                    N.codsettore,
                    N.codzona,
                    N.codcategoria, 
                    N.data_inizio,
                    N.data_fine,
                    N.codice,
                    N.descart,
                    N.riga,
                    N.tipologia,
                    N.qtatotprodoff,
                    N.umtotprodoff, 
                    N.tiposconto,   
                    N.piudicui,
                    N.note, 
                    N.sunonevad,
                    N.tipopromoartoma,
                    N.abilitaprzartoma,
                    N.abilitasctartoma,
                    N.visprezzo,    
                    N.utentemodifica,
                    N.datamodifica,
                    N.priorita
            From    #PROMOZIONI_ELENCOARTICOLI N
            Left Join PROMOZIONI_ELENCOARTICOLI O
            On      N.progressivo = O.progressivo
            And     N.numerocampagna = O.numerocampagna
            /*And     N.tipo = O.tipo
            And     N.clifor = O.clifor
            And     N.gruppoprezzicf = O.gruppoprezzicf
            And     N.CODSETTORE = O.CODSETTORE
            And     N.CODZONA = O.CODZONA
            And     N.CODCATEGORIA = O.CODCATEGORIA
            And     N.riga = O.riga
            And     N.tipologia = O.tipologia 
            And     N.piudicui = O.piudicui 
            And     N.tipopromoartoma = O.tipopromoartoma*/
            And     N.codice = O.codice
            Where   O.progressivo Is Null;
    
            --PRINT 'Concluso Step Insert'
     
            -- UPDATE RIGHE PROMOZIONI LATO CENTRALE --
            Update      PROMOZIONI_ELENCOARTICOLI   
            Set         PROMOZIONI_ELENCOARTICOLI.descrizione = #PROMOZIONI_ELENCOARTICOLI.descrizione,
                        PROMOZIONI_ELENCOARTICOLI.descart = #PROMOZIONI_ELENCOARTICOLI.descart,
                        PROMOZIONI_ELENCOARTICOLI.qtatotprodoff = #PROMOZIONI_ELENCOARTICOLI.qtatotprodoff,
                        PROMOZIONI_ELENCOARTICOLI.umtotprodoff = #PROMOZIONI_ELENCOARTICOLI.umtotprodoff,
                        PROMOZIONI_ELENCOARTICOLI.data_inizio = #PROMOZIONI_ELENCOARTICOLI.data_inizio,
                        PROMOZIONI_ELENCOARTICOLI.data_fine = #PROMOZIONI_ELENCOARTICOLI.data_fine,
                        PROMOZIONI_ELENCOARTICOLI.tiposconto = #PROMOZIONI_ELENCOARTICOLI.tiposconto,   
                        PROMOZIONI_ELENCOARTICOLI.note = #PROMOZIONI_ELENCOARTICOLI.note, 
                        PROMOZIONI_ELENCOARTICOLI.sunonevad = #PROMOZIONI_ELENCOARTICOLI.sunonevad,
                        PROMOZIONI_ELENCOARTICOLI.abilitaprzartoma = #PROMOZIONI_ELENCOARTICOLI.abilitaprzartoma,
                        PROMOZIONI_ELENCOARTICOLI.abilitasctartoma = #PROMOZIONI_ELENCOARTICOLI.abilitasctartoma,
                        PROMOZIONI_ELENCOARTICOLI.visprezzo = #PROMOZIONI_ELENCOARTICOLI.visprezzo,
                        PROMOZIONI_ELENCOARTICOLI.datamodifica = #PROMOZIONI_ELENCOARTICOLI.datamodifica,
                        PROMOZIONI_ELENCOARTICOLI.priorita = #PROMOZIONI_ELENCOARTICOLI.priorita
            From        PROMOZIONI_ELENCOARTICOLI
            Inner Join  #PROMOZIONI_ELENCOARTICOLI 
            ON          #PROMOZIONI_ELENCOARTICOLI.progressivo = PROMOZIONI_ELENCOARTICOLI.progressivo
            And         #PROMOZIONI_ELENCOARTICOLI.numerocampagna = PROMOZIONI_ELENCOARTICOLI.numerocampagna
            And         #PROMOZIONI_ELENCOARTICOLI.tipo = PROMOZIONI_ELENCOARTICOLI.tipo
            And         #PROMOZIONI_ELENCOARTICOLI.clifor = PROMOZIONI_ELENCOARTICOLI.clifor
            And         #PROMOZIONI_ELENCOARTICOLI.gruppoprezzicf = PROMOZIONI_ELENCOARTICOLI.gruppoprezzicf
            And         #PROMOZIONI_ELENCOARTICOLI.CODSETTORE = PROMOZIONI_ELENCOARTICOLI.CODSETTORE
            And         #PROMOZIONI_ELENCOARTICOLI.CODZONA = PROMOZIONI_ELENCOARTICOLI.CODZONA
            And         #PROMOZIONI_ELENCOARTICOLI.CODCATEGORIA = PROMOZIONI_ELENCOARTICOLI.CODCATEGORIA 
            And         #PROMOZIONI_ELENCOARTICOLI.codice = PROMOZIONI_ELENCOARTICOLI.codice
            And         #PROMOZIONI_ELENCOARTICOLI.riga = PROMOZIONI_ELENCOARTICOLI.riga
            And         #PROMOZIONI_ELENCOARTICOLI.tipologia = PROMOZIONI_ELENCOARTICOLI.tipologia 
            And         #PROMOZIONI_ELENCOARTICOLI.piudicui = PROMOZIONI_ELENCOARTICOLI.piudicui 
            And         #PROMOZIONI_ELENCOARTICOLI.tipopromoartoma = PROMOZIONI_ELENCOARTICOLI.tipopromoartoma
            Where       #PROMOZIONI_ELENCOARTICOLI.descrizione <> PROMOZIONI_ELENCOARTICOLI.descrizione
            Or          #PROMOZIONI_ELENCOARTICOLI.descart <> PROMOZIONI_ELENCOARTICOLI.descart
            Or          #PROMOZIONI_ELENCOARTICOLI.data_inizio <> PROMOZIONI_ELENCOARTICOLI.data_inizio
            Or          #PROMOZIONI_ELENCOARTICOLI.data_fine <> PROMOZIONI_ELENCOARTICOLI.data_fine
            Or          #PROMOZIONI_ELENCOARTICOLI.TIPOLOGIA <> PROMOZIONI_ELENCOARTICOLI.tipologia
            Or          #PROMOZIONI_ELENCOARTICOLI.tiposconto <> PROMOZIONI_ELENCOARTICOLI.tiposconto
            Or          #PROMOZIONI_ELENCOARTICOLI.note <> PROMOZIONI_ELENCOARTICOLI.note
            Or          #PROMOZIONI_ELENCOARTICOLI.sunonevad <> PROMOZIONI_ELENCOARTICOLI.sunonevad
            Or          #PROMOZIONI_ELENCOARTICOLI.abilitaprzartoma <> PROMOZIONI_ELENCOARTICOLI.abilitaprzartoma
            Or          #PROMOZIONI_ELENCOARTICOLI.abilitasctartoma <> PROMOZIONI_ELENCOARTICOLI.abilitasctartoma
            Or          #PROMOZIONI_ELENCOARTICOLI.visprezzo <> PROMOZIONI_ELENCOARTICOLI.visprezzo
            Or          #PROMOZIONI_ELENCOARTICOLI.priorita <> PROMOZIONI_ELENCOARTICOLI.priorita
            
            --PRINT 'Concluso Step Update'


            if OBJECT_ID('tempdb..#PROMOZIONI_ELENCOARTICOLI') is not null drop table #PROMOZIONI_ELENCOARTICOLI

        end try

        begin catch

            goto ERR_CODE

        end catch

    commit tran

    return

ERR_CODE:
    
    rollback tran

    if OBJECT_ID('tempdb..#PROMOZIONI_ELENCOARTICOLI') is not null drop table #PROMOZIONI_ELENCOARTICOLI

END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[PREPARAARTICOLIPROMO] TO [Metodo98]
    AS [dbo];

