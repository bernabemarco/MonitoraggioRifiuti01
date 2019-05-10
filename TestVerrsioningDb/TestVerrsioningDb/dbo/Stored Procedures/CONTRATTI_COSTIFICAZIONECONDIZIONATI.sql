
CREATE PROCEDURE [dbo].[CONTRATTI_COSTIFICAZIONECONDIZIONATI]
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

    BEGIN TRY

        IF OBJECT_ID('tempdb..#ElencoContributiCondCostificazione') IS NOT NULL DROP TABLE #ElencoContributiCondCostificazione

        Create Table #ElencoContributiCondCostificazione(
            Uid                             uniqueidentifier, 
            SESSIONE                        INT             NOT NULL,
            DiCui                           smallint        not null, 
            Contratto                       decimal(18,0)   not null,
            ProgressivoContributoCond       decimal(10,0)   not null,
            NrRifRigaCondDiCui              int             null,
            NrRigaContributoCond            int             not null,
            PREMIOPERCENT                   decimal(19,6)   null        default(0),
            ConsuntivatoQta                 decimal(19,6)   not null    default(0),
            ConsuntivatoValore              decimal(19,6)   not null    default(0),
            IdTesta                         decimal(10,0)   not null,
            IdRiga                          int             not null,
            TotNettoRiga                    decimal(19,6)   null        default(0),
            CodSconto                       varchar(5)      NULL,
            BUDGET                          decimal(19, 6)  NULL,       
            PREMIOMATURATO                  decimal(19, 6)  NULL,
            FatturatoContributo             decimal(19,6)   NULL        default(0),
            PremioBUDGETContributo          decimal(19,6)   NULL        default(0),
            PremioContributo                decimal(19,6)   NULL        default(0),
            TotSpeseTrasp                   decimal(19,4)   null        default(0), 
            TotImponibileEuro               decimal(19,4)   null        default(0),
            PremioBudget                    decimal(19, 6)  NULL,   
            IncidenzaSpesaTrasporto         decimal(19,6)   NULL        default(0),     
            PercIncPremio                   decimal(19,6)   NULL        default(0),
            PercIncidenzaRiga               decimal(19,6)   NULL        default(0),
            PercIncidenzaPremio             decimal(19,6)   NULL        default(0),
            ValoreRigaPremio                decimal(19,6)   NULL        default(0),
            PercIncBudget                   decimal(19,6)   NULL        default(0),
            PercIncidenzaRigaBudget         decimal(19,6)   NULL        default(0),
            PercIncidenzaPremioBudget       decimal(19,6)   NULL        default(0),
            ValoreRigaBudget                decimal(19,6)   NULL        default(0),     
            Provv1                          decimal(19,6)   NULL        default(0),     
            Provv2                          decimal(19,6)   NULL        default(0),     
            Provv3                          decimal(19,6)   NULL        default(0),     
            ValProvv1                       decimal(19,6)   NULL        default(0),     
            ValProvv2                       decimal(19,6)   NULL        default(0),     
            ValProvv3                       decimal(19,6)   NULL        default(0),                         
            PRIMARY KEY (Uid,SESSIONE,DiCui,Contratto,ProgressivoContributoCond,NrRigaContributoCond,IdTesta,IdRiga)
        )   

        Set @COMANDO =  '   Insert Into #ElencoContributiCondCostificazione                     ' + char(13) +
                        '   Select          C.Uid,                                              ' + char(13) +
                        '                   C.SESSIONE,                                         ' + char(13) +
                        '                   C.DiCui,                                            ' + char(13) +
                        '                   C.Contratto,                                        ' + char(13) +
                        '                   C.ProgressivoContributoCond,                        ' + char(13) +
                        '                   C.NrRifRigaCondDiCui,                               ' + char(13) +
                        '                   C.NrRigaContributoCond,                             ' + char(13) +
                        '                   C.PREMIOPERCENT,                                    ' + char(13) +
                        '                   C.ConsuntivatoQta,                                  ' + char(13) +
                        '                   C.ConsuntivatoValore,                               ' + char(13) +
                        '                   C.IdTesta,                                          ' + char(13) +
                        '                   C.IdRiga,                                           ' + char(13) +
                        '                   C.TotNettoRiga,                                     ' + char(13) +
                        '                   Con.CodSconto,                                      ' + char(13) +              
                        '                   C.BUDGET,                                           ' + char(13) +              
                        '                   C.PREMIOMATURATO,                                   ' + char(13) +
                        '                   0,                                                  ' + char(13) +
                        '                   0,                                                  ' + char(13) +
                        '                   0,                                                  ' + char(13) +
                        '                   C.TotSpeseTraspRes,                                 ' + char(13) +  
                        '                   C.TotImponibileEuro,                                ' + char(13) +
                        '                   0,                                                  ' + char(13) +
                        '                   0,                                                  ' + char(13) +
                        '                   0,                                                  ' + char(13) +
                        '                   0,                                                  ' + char(13) +
                        '                   0,                                                  ' + char(13) +
                        '                   0,                                                  ' + char(13) +
                        '                   0,                                                  ' + char(13) +
                        '                   0,                                                  ' + char(13) +
                        '                   0,                                                  ' + char(13) +
                        '                   0,                                                  ' + char(13) +
                        '                   0,                                                  ' + char(13) +
                        '                   0,                                                  ' + char(13) +
                        '                   0,                                                  ' + char(13) +
                        '                   0,                                                  ' + char(13) +
                        '                   0,                                                  ' + char(13) +
                        '                   0                                                   ' + char(13) +
                        '   From            ContribCondizInElab C                               ' + char(13) +
                        '   Inner Join      Contratti_Con Con                                   ' + char(13) +
                        '   On              Con.Progressivo = C.ProgressivoContributoCond       ' + char(13) +
                        '   And             Con.RifContratto = C.Contratto                      ' + char(13) +
                        '   Where           C.SESSIONE =                                        ' + Cast(@IDSESSIONE As varchar(MAX))


        EXECUTE (@COMANDO)
            

        -- Per differenza cancella dalla tabella temporanea i contributi che per mancato reso non sono validi --            
        delete      orig
        from        #ElencoContributiCondCostificazione orig
        Left Join   ContrattiRange_CON  dest
        On          orig.ProgressivoContributoCond = dest.RIFPROGRESSIVO
        And         orig.NrRigaContributoCond = dest.NRRIGA
        And         orig.DiCui = 0
        Where       dest.PREMIONONVALIDO = 1


            
        -- 1) Fa le Sommatorie x il fatturato e il premio budget totale per contributo con
        Update      #ElencoContributiCondCostificazione 
        Set         #ElencoContributiCondCostificazione.FatturatoContributo = Fatt.Fatturato_Contributo,
                    #ElencoContributiCondCostificazione.Provv1 = IsNull(Provv.PROVVAG1,0),
                    #ElencoContributiCondCostificazione.Provv2 = IsNull(Provv.PROVVAG2,0),
                    #ElencoContributiCondCostificazione.Provv3 = IsNull(Provv.PROVVAG3,0)           
        From        #ElencoContributiCondCostificazione  
        Inner Join  (
                        Select distinct Contratto,ProgressivoContributoCond,
                                        Sum(TotNettoRiga) As Fatturato_Contributo
                        From            #ElencoContributiCondCostificazione 
                        Group By        Contratto,ProgressivoContributoCond
                    ) As Fatt   
        On          Fatt.Contratto                      = #ElencoContributiCondCostificazione.Contratto     
        And         Fatt.ProgressivoContributoCond      = #ElencoContributiCondCostificazione.ProgressivoContributoCond
        left join   VISTA_CONTRATTI_C_DECPROVV Provv
        On          Provv.Contratto = Fatt.Contratto
        And         Provv.Contributo = Fatt.ProgressivoContributoCond

        -- 1.5) Fa le Sommatorie x premio maturato totale per contributo con
        Update      #ElencoContributiCondCostificazione 
        Set         #ElencoContributiCondCostificazione.PremioContributo = Fatt.Premio_Contributo,
                    #ElencoContributiCondCostificazione.PremioBUDGETContributo = Fatt.PremioBudget_Contributo   
        From        #ElencoContributiCondCostificazione  
        Inner Join  (
                        Select          CO.RIFCONTRATTO As Contratto,
                                        CR.RifProgressivo As ProgressivoContributoCond,
                                        Sum(CR.PREMIOMATURATO) As Premio_Contributo,
                                        Sum(IsNull(CR.PREMIOPERCENT,0) * IsNull(CO.BUDGET_VALORE,0)/100) as PremioBudget_Contributo
                        From            ContrattiRange_CON CR
                        Inner Join      Contratti_CON CO
                        On              CO.PROGRESSIVO = CR.RIFPROGRESSIVO  
                        Group By        CO.RIFCONTRATTO, CR.RifProgressivo  
                    ) As Fatt   
        On          Fatt.Contratto                      = #ElencoContributiCondCostificazione.Contratto     
        And         Fatt.ProgressivoContributoCond      = #ElencoContributiCondCostificazione.ProgressivoContributoCond

        -- 2) Calcolo della incidenza delle spese di trasporto
        if ( @SCONTIPIEDE = 1 )
        begin
        
            Update #ElencoContributiCondCostificazione 
            set    IncidenzaSpesaTrasporto = (  (100 * (TotSpeseTrasp)) / TotImponibileEuro )

        end         

        -- 3) Calcoli delle Incidenze sulle righe per i valori del fatturato
        update      #ElencoContributiCondCostificazione
        set         PercIncPremio       =   Case When FatturatoContributo = 0 Then 
                                                0
                                            Else
                                                (   PremioContributo / FatturatoContributo  ) * 100
                                            End,
                    PercIncidenzaRiga   =   Case When FatturatoContributo = 0 Then 
                                                0
                                            Else
                                                (   TotNettoRiga / FatturatoContributo  ) * 100
                                            End,
                    PercIncidenzaPremio =   Case When FatturatoContributo = 0 Then 
                                                0
                                            Else
                                                (   ( ( TotNettoRiga / FatturatoContributo  ) * 100 )  * PremioContributo   ) / FatturatoContributo
                                            End,
                    ValoreRigaPremio    =   Case When FatturatoContributo = 0 Then
                                                0
                                            Else
                                                (   ( ( TotNettoRiga / FatturatoContributo  ) * 100 ) * PremioContributo    ) / 100
                                            End,
                    ValProvv1           =   Case When FatturatoContributo = 0 Then 
                                                0
                                            Else
                                                ((( TotNettoRiga / FatturatoContributo  ) * 100) * Provv1 / 100)
                                            End,
                    ValProvv2           =   Case When FatturatoContributo = 0 Then 
                                                0
                                            Else
                                                ((( TotNettoRiga / FatturatoContributo  ) * 100) * Provv2 / 100)
                                            End,
                    ValProvv3           =   Case When FatturatoContributo = 0 Then 
                                                0
                                            Else
                                                ((( TotNettoRiga / FatturatoContributo  ) * 100) * Provv3 / 100)
                                            End


        -- 4) Calcoli delle Incidenze sulle righe per i valori del budget
        update      #ElencoContributiCondCostificazione
        set         PercIncBudget            =  Case When BUDGET = 0 Then 
                                                    0
                                                Else
                                                    (   PremioBUDGETContributo / BUDGET ) * 100
                                                End,
                    PercIncidenzaRigaBudget  =  Case When BUDGET = 0 Then 
                                                    0
                                                Else
                                                    (   TotNettoRiga / BUDGET   ) * 100
                                                End,
                    PercIncidenzaPremioBudget=  Case When BUDGET = 0 Then 
                                                    0
                                                Else
                                                    (   ( ( TotNettoRiga / BUDGET   ) * 100 )  * PremioBUDGETContributo ) / FatturatoContributo
                                                End,
                    ValoreRigaBudget         =  Case When BUDGET = 0 Then
                                                    0
                                                Else
                                                    (   ( ( TotNettoRiga / BUDGET   ) * 100 ) * PremioContributo    ) / 100
                                                End

            
        -- 5) Riporto in Tabella di Costificazione
        Insert Into CONTRATTI_COSTIFICAZIONERIGHE(
                                                    CONTRATTO,
                                                    IDTESTADOC,
                                                    IDRIGADOC,
                                                    DESCRIZIONECONTRATTO,
                                                    PERCTRASPORTO,
                                                    INCIDENZABUDGETCOND,
                                                    INCIDENZACOND,
                                                    UTENTEMODIFICA,
                                                    DATAMODIFICA,
                                                    PERC_VAL,
                                                    incidenzabudgetcondriga,
                                                    incidenzacondriga,
                                                    incidenzapremiomaturato,
                                                    incidenzapremiomaturatobudget,
                                                    premiocondizionato,
                                                    idcond,
                                                    valorerigapremio,
                                                    CODICECOSTO,
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
                    E.PercIncPremio,
                    @UTENTEMODIFICA,
                    GETDATE(),
                    1,
                    E.PercIncidenzaRigaBudget,
                    E.PercIncidenzaRiga,
                    E.PercIncidenzaPremio,
                    E.PercIncidenzaPremioBudget,
                    E.PremioContributo,
                    E.ProgressivoContributoCond,
                    E.ValoreRigaPremio,
                    E.CodSconto,
                    E.ValoreRigaBudget,
                    E.ValProvv1,
                    E.ValProvv2,
                    E.ValProvv3
        From        #ElencoContributiCondCostificazione E
        Inner Join  TESTE_CONTRATTI TC
        On          TC.PROGRESSIVO = E.Contratto

        
        IF OBJECT_ID('tempdb..#ElencoContributiCondCostificazione') IS NOT NULL DROP TABLE #ElencoContributiCondCostificazione

    END TRY

    BEGIN CATCH

        set @RES        = 0
        set @ERRORNR    = ERROR_NUMBER()
        set @ERRORMS    = ERROR_MESSAGE()
        set @ERRORLINE  = ERROR_LINE()

    END CATCH

END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[CONTRATTI_COSTIFICAZIONECONDIZIONATI] TO [Metodo98]
    AS [dbo];

