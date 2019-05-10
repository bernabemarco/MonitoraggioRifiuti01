
CREATE PROCEDURE [dbo].[CONTRATTI_COSTIFICAZIONEINCONDIZIONATI] 
    @IDSESSIONE         int,
    @SCONTIPIEDE        smallint,
    @UTENTEMODIFICA     varchar(20),
    @RES                int out,
    @ERRORNR            int out,
    @ERRORMS            Varchar(2048) out,
    @ERRORLINE          int out
--ENCRY--
AS
BEGIN

    -- 1) Lancia la fase che � uguale alla consuntivazione per avere le righe doc che interessano quei contratti --
    --    da METODO che mi riempie la tabella   ContribIncondizInElab

    DECLARE @COMANDO AS VARCHAR(8000)   

    Set @RES = 1
    set @ERRORMS = 'fase 1'

    BEGIN TRY

        IF OBJECT_ID('tempdb..#ElencoContributiIncondCostificazione') IS NOT NULL DROP TABLE #ElencoContributiIncondCostificazione

        Create Table #ElencoContributiIncondCostificazione(
            Uid                         uniqueidentifier                            NOT NULL,
            SESSIONE                    int                                         NOT NULL,
            Contratto                   decimal(10, 0)                              NOT NULL,
            NrRigaContributo            decimal(10, 0)                              NOT NULL,
            NrRigaContributoPerc        decimal(10, 0)                              NOT NULL,
            DADATA                      datetime                                    NULL,
            ADATA                       datetime                                    NULL,
            PERCENTUALE                 decimal(19, 6)                              NULL,
            BUDGET                      decimal(19, 6)                              NULL,
            CONSUNTIVO                  decimal(19, 6)                              NULL,
            PREMIOMATURATO              decimal(19, 6)                              NULL,
            PremioBudget                decimal(19, 6)                              NULL,   
            CONSUNTIVOQTA               decimal(19, 6)                              NULL,
            PREMIONONVALIDO             smallint                                    NULL,
            IdTesta                     decimal(10, 0)                              NOT NULL,
            IdRiga                      int                                         NOT NULL,
            UmGest                      varchar(3)      						    NULL,
            QtaGest                     decimal(16, 6)                              NULL,
            PrezzoUnitLordo             decimal(19, 6)                              NULL,
            TotNettoRiga                decimal(19, 6)                              NULL,
            ScontoFinale                varchar(20)     						    NULL,
            PrcScontoIncond             varchar(10)     	    					NULL,
            ScontoIncond                decimal(19, 6)                              NULL,
            TP_Formula_SCT              varchar(20)         						NULL,
            QtaPrezzo                   decimal(16, 6)                              NULL,
            TipoCalcoloPremio           smallint                                    NULL,
            UtenteModifica              varchar(25)         						NULL,
            DataModifica                datetime                                    NULL,
            CodSconto                   varchar(5)      						    NULL,
            GGTolleranza                int                                         NULL,
            FatturatoContratto          decimal(19,6)                               NULL        default(0),
            TotSpeseTrasp               decimal(19,4)                               NULL        default(0),
            TotImponibileEuro           decimal(19,4)                               NULL        default(0),     
            IncidenzaSpesaTrasporto     decimal(19,6)                               NULL        default(0),     
            PercIncPremio               decimal(19,6)                               NULL        default(0),
            PercIncidenzaRiga           decimal(19,6)                               NULL        default(0),
            PercIncidenzaPremio         decimal(19,6)                               NULL        default(0),
            ValoreRigaPremio            decimal(19,6)                               NULL        default(0),
            PercIncBudget               decimal(19,6)                               NULL        default(0),
            PercIncidenzaRigaBudget     decimal(19,6)                               NULL        default(0),
            PercIncidenzaPremioBudget   decimal(19,6)                               NULL        default(0),
            ValoreRigaBudget            decimal(19,6)                               NULL        default(0),     
            Provv1                      decimal(19,6)                               NULL        default(0),     
            Provv2                      decimal(19,6)                               NULL        default(0),     
            Provv3                      decimal(19,6)                               NULL        default(0),     
            ValProvv1                   decimal(19,6)                               NULL        default(0),     
            ValProvv2                   decimal(19,6)                               NULL        default(0),     
            ValProvv3                   decimal(19,6)                               NULL        default(0),     
            PRIMARY KEY 
            (
                Uid                     ASC,
                SESSIONE                ASC,
                Contratto               ASC,
                NrRigaContributo        ASC,
                NrRigaContributoPerc    ASC,
                IdTesta                 ASC,
                IdRiga                  ASC
            )

        )   

        Set @COMANDO =  '   Insert Into #ElencoContributiIncondCostificazione               ' + char(13) +
                        '   Select          C.Uid,                                          ' + char(13) +
                        '                   C.SESSIONE,                                     ' + char(13) +
                        '                   C.Contratto,                                    ' + char(13) +
                        '                   C.NrRigaContributo,                             ' + char(13) +
                        '                   C.NrRigaContributoPerc,                         ' + char(13) +
                        '                   C.DADATA,                                       ' + char(13) +
                        '                   C.ADATA,                                        ' + char(13) +
                        '                   C.PERCENTUALE,                                  ' + char(13) +
                        '                   C.BUDGET,                                       ' + char(13) +
                        '                   C.CONSUNTIVO,                                   ' + char(13) +
                        '                   C.PREMIOMATURATO,                               ' + char(13) +
                        '                   IsNull(C.BUDGET,0)*IsNull(C.PERCENTUALE,0)/100, ' + char(13) +
                        '                   C.CONSUNTIVOQTA,                                ' + char(13) +
                        '                   C.PREMIONONVALIDO,                              ' + char(13) +
                        '                   C.IdTesta,                                      ' + char(13) +
                        '                   C.IdRiga,                                       ' + char(13) +
                        '                   C.UmGest,                                       ' + char(13) +
                        '                   C.QtaGest,                                      ' + char(13) +
                        '                   C.PrezzoUnitLordo,                              ' + char(13) +
                        '                   C.TotNettoRiga,                                 ' + char(13) +
                        '                   C.ScontoFinale,                                 ' + char(13) +
                        '                   C.PrcScontoIncond,                              ' + char(13) +
                        '                   C.ScontoIncond,                                 ' + char(13) +
                        '                   C.TP_Formula_SCT,                               ' + char(13) +
                        '                   C.QtaPrezzo,                                    ' + char(13) +
                        '                   C.TipoCalcoloPremio,                            ' + char(13) +
                        '                   C.UtenteModifica,                               ' + char(13) +
                        '                   C.DataModifica,                                 ' + char(13) +
                        '                   CL.CodSconto,                                   ' + char(13) +
                        '                   CL.GGTolleranza,                                ' + char(13) +
                        '                   0,                                              ' + char(13) +
                        '                   C.TotSpeseTraspRes,                             ' + char(13) +
                        '                   C.TotImponibileEuro,                            ' + char(13) +
                        '                   0,                                              ' + char(13) +
                        '                   0,                                              ' + char(13) +
                        '                   0,                                              ' + char(13) +
                        '                   0,                                              ' + char(13) +
                        '                   0,                                              ' + char(13) +
                        '                   0,                                              ' + char(13) +
                        '                   0,                                              ' + char(13) +
                        '                   0,                                              ' + char(13) +
                        '                   0,                                              ' + char(13) +
                        '                   0,                                              ' + char(13) +
                        '                   0,                                              ' + char(13) +
                        '                   0,                                              ' + char(13) +
                        '                   0,                                              ' + char(13) +
                        '                   0,                                              ' + char(13) +
                        '                   0                                               ' + char(13) +
                        '   From            ContribIncondizInElab   C                       ' + char(13) +
                        '   Inner Join      Contratti_CL            CL                      ' + char(13) +
                        '   On              CL.RIFPROGRESSIVO = C.CONTRATTO                 ' + char(13) +
                        '   And             CL.NRRiga = C.NrRigaContributo                  ' + char(13) +
                        '   Where           C.SESSIONE =                                    ' + Cast(@IDSESSIONE as varchar(10))

        EXECUTE (@COMANDO)

        -- 1) Per i contributi a Valore
        Update      #ElencoContributiIncondCostificazione 
        Set         #ElencoContributiIncondCostificazione.FatturatoContratto = Fatt.Fatturato,
                    #ElencoContributiIncondCostificazione.Provv1 = IsNull(Provv.PROVVAG1,0),
                    #ElencoContributiIncondCostificazione.Provv2 = IsNull(Provv.PROVVAG2,0),
                    #ElencoContributiIncondCostificazione.Provv3 = IsNull(Provv.PROVVAG3,0)
        From        #ElencoContributiIncondCostificazione  
        Inner Join  (
                        Select      Contratto,SESSIONE, 
                                    Sum(TotNettoRiga) As Fatturato 
                        From        #ElencoContributiIncondCostificazione   
                        Where       SESSIONE = Cast(@IDSESSIONE As varchar(MAX))
                        And         NrRigaContributoPerc = 0
                        Group By    Contratto,SESSIONE
                    ) As Fatt   
        On          Fatt.SESSIONE   = #ElencoContributiIncondCostificazione.SESSIONE
        And         Fatt.Contratto  = #ElencoContributiIncondCostificazione.Contratto 
        left join   VISTA_CONTRATTI_INC_DECPROVV Provv
        On          Provv.Contratto = Fatt.Contratto
        And         Provv.Contributo = Fatt.Contratto
        Where       #ElencoContributiIncondCostificazione.NrRigaContributoPerc = 0
    
    
        -- 2) Per i contributi a % 
        Update      #ElencoContributiIncondCostificazione 
        Set         #ElencoContributiIncondCostificazione.FatturatoContratto = Fatt.Fatturato,
                    #ElencoContributiIncondCostificazione.Provv1 = IsNull(Provv.PROVVAG1,0),
                    #ElencoContributiIncondCostificazione.Provv2 = IsNull(Provv.PROVVAG2,0),
                    #ElencoContributiIncondCostificazione.Provv3 = IsNull(Provv.PROVVAG3,0)
        From        #ElencoContributiIncondCostificazione  
        Inner Join  (
                        Select      Contratto,SESSIONE,NrRigaContributo,NrRigaContributoPerc,
                                    Sum(TotNettoRiga) As Fatturato 
                        From        #ElencoContributiIncondCostificazione   
                        Where       SESSIONE = Cast(@IDSESSIONE As varchar(MAX))
                        And         NrRigaContributoPerc > 0
                        Group By    Contratto,SESSIONE,NrRigaContributo,NrRigaContributoPerc
                    ) As Fatt   
        On          Fatt.SESSIONE               = #ElencoContributiIncondCostificazione.SESSIONE
        And         Fatt.Contratto              = #ElencoContributiIncondCostificazione.Contratto
        And         Fatt.NrRigaContributo       = #ElencoContributiIncondCostificazione.NrRigaContributo
        And         Fatt.NrRigaContributoPerc   = #ElencoContributiIncondCostificazione.NrRigaContributoPerc
        left join   VISTA_CONTRATTI_INCP_DECPROVV Provv
        On          Provv.Contratto = Fatt.Contratto
        And         Provv.Contributo = Fatt.Contratto
        And         Provv.RifProgressivo = Fatt.NrRigaContributo
        And         Provv.NrRiga = Fatt.NrRigaContributoPerc
        Where       #ElencoContributiIncondCostificazione.NrRigaContributoPerc > 0

        -- 3) Calcolo della incidenza delle spese di trasporto
        if ( @SCONTIPIEDE = 1 )
        begin
        
            Update #ElencoContributiIncondCostificazione 
            set    IncidenzaSpesaTrasporto = (  (100 * (TotSpeseTrasp)) / TotImponibileEuro )

        end
            
        -- 4) Calcoli delle Incidenze sulle righe per i valori del fatturato
        update      #ElencoContributiIncondCostificazione
        set         PercIncPremio       =   Case When FatturatoContratto = 0 Then 
                                                0
                                            Else
                                                (   PREMIOMATURATO / FatturatoContratto ) * 100
                                            End,
                    PercIncidenzaRiga   =   Case When FatturatoContratto = 0 Then 
                                                0
                                            Else
                                                (   TotNettoRiga / FatturatoContratto   ) * 100
                                            End,
                    PercIncidenzaPremio =   Case When FatturatoContratto = 0 Then 
                                                0
                                            Else
                                                (   ( ( TotNettoRiga / FatturatoContratto   ) * 100 )  * PREMIOMATURATO ) / FatturatoContratto
                                            End,
                    ValoreRigaPremio    =   Case When FatturatoContratto = 0 Then
                                                0
                                            Else
                                                (   ( ( TotNettoRiga / FatturatoContratto   ) * 100 ) * PREMIOMATURATO  ) / 100
                                            End,
                    ValProvv1           =   Case When FatturatoContratto = 0 Then 
                                                0
                                            Else
                                                ((( TotNettoRiga / FatturatoContratto   ) * 100) * Provv1 / 100)
                                            End,
                    ValProvv2           =   Case When FatturatoContratto = 0 Then 
                                                0
                                            Else
                                                ((( TotNettoRiga / FatturatoContratto   ) * 100) * Provv2 / 100)
                                            End,
                    ValProvv3           =   Case When FatturatoContratto = 0 Then 
                                                0
                                            Else
                                                ((( TotNettoRiga / FatturatoContratto   ) * 100) * Provv3 / 100)
                                            End

        -- 5) Calcoli delle Incidenze sulle righe per i valori del budget
        update      #ElencoContributiIncondCostificazione
        set         PercIncBudget            =  Case When BUDGET = 0 Then 
                                                    0
                                                Else
                                                    (   PremioBudget / BUDGET   ) * 100
                                                End,
                    PercIncidenzaRigaBudget  =  Case When BUDGET = 0 Then 
                                                    0
                                                Else
                                                    (   TotNettoRiga / BUDGET   ) * 100
                                                End,
                    PercIncidenzaPremioBudget=  Case When BUDGET = 0 Then 
                                                    0
                                                Else
                                                    (   ( ( TotNettoRiga / BUDGET   ) * 100 )  * PremioBudget   ) / FatturatoContratto
                                                End,
                    ValoreRigaBudget         =  Case When BUDGET = 0 Then
                                                    0
                                                Else
                                                    (   ( ( TotNettoRiga / BUDGET   ) * 100 ) * PREMIOMATURATO  ) / 100
                                                End

        -- 6) Riporto in Tabella di Costificazione
        Insert Into CONTRATTI_COSTIFICAZIONERIGHE(
                                                    CONTRATTO,
                                                    IDTESTADOC,
                                                    IDRIGADOC,
                                                    DESCRIZIONECONTRATTO,
                                                    PERCTRASPORTO,
                                                    INCIDENZABUDGETINCOND,
                                                    INCIDENZAINCOND,
                                                    UTENTEMODIFICA,
                                                    DATAMODIFICA,
                                                    PERC_VAL,
                                                    CODICECOSTO,
                                                    valorerigapremio,
                                                    IDCOND,
                                                    TIPOCONTRIBUTO,
                                                    VALORERIGABUDGET,
                                                    VALRIGAPROVV1,
                                                    VALRIGAPROVV2,
                                                    VALRIGAPROVV3
                                                )
        Select      E.Contratto,
                    E.IdTesta,
                    E.IdRiga,
                    TC.DESCRIZIONECONTRATTO,
                    E.IncidenzaSpesaTrasporto,
                    E.PercIncBudget,
                    E.PercIncidenzaPremio,
                    @UTENTEMODIFICA,
                    GETDATE(),
                    0,
                    E.CodSconto,
                    E.ValoreRigaPremio,
                    E.NrRigaContributo,
                    'I',
                    E.ValoreRigaBudget,
                    E.ValProvv1,
                    E.ValProvv2,
                    E.ValProvv3
        From        #ElencoContributiIncondCostificazione E
        Inner Join  TESTE_CONTRATTI TC
        On          TC.PROGRESSIVO = E.Contratto
        Where       E.SESSIONE = @IDSESSIONE

        IF OBJECT_ID('tempdb..#ElencoContributiIncondCostificazione') IS NOT NULL DROP TABLE #ElencoContributiIncondCostificazione

    END TRY

    BEGIN CATCH

        print 'In errore'
        set @RES        = 0
        set @ERRORNR    = ERROR_NUMBER()
        set @ERRORMS    = ERROR_MESSAGE()
        set @ERRORLINE  = ERROR_LINE()

    END CATCH

END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[CONTRATTI_COSTIFICAZIONEINCONDIZIONATI] TO [Metodo98]
    AS [dbo];

