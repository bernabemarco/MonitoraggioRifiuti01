

CREATE PROCEDURE [dbo].[CONTRATTI_CONSUNTIVAZIONECONDIZIONATI_SEDIM]
    @IDSESSIONE     int,
    @UTENTEMODIFICA varchar(20),
    @RES            int out,
    @ERRORNR        int out,
    @ERRORMS        Varchar(2048) out,
    @ERRORLINE      int out
--ENCRY--
AS
BEGIN
    
        set @RES = 1;

        begin try
            
            -- SEDIMENTA L'AVANZAMENTO SULLE RIGHE DEI CONTRIBUTI --
            -- 1) Pulisce la tabella delle sedimentazioni per ogni contributo del contratto
            Merge CONTRATTI_ANALISIRIGHECONSUNTIVATECONDIZIONATE as trgt
            Using (
                    select      C.Contratto,C.ProgressivoContributoCond
                    from        ContribCondizInElab C
                    Where       C.DiCui = 0
                    And         C.Sessione = @IDSESSIONE
                    Group By    C.Contratto,C.ProgressivoContributoCond
                  ) as src 
            on (trgt.contratto = src.Contratto)
            and (trgt.condizionato = src.ProgressivoContributoCond)
            when matched then
                delete;
            
            -- 2) Rif� gli inserimenti totalizzati per contratto/contributo/articolo
            Merge CONTRATTI_ANALISIRIGHECONSUNTIVATECONDIZIONATE as trgt
            Using (
                    select   C.Contratto,C.ProgressivoContributoCond,C.RD_Articolo Articolo,Sum(C.TotNettoRiga) AS ValoreRiga
                    from     ContribCondizInElab C
                    Where    C.DiCui = 0
                    And      C.Sessione = @IDSESSIONE
                    Group By C.Contratto,C.ProgressivoContributoCond, C.RD_Articolo
                  ) as src 
            on (trgt.contratto = src.Contratto)
            and (trgt.condizionato = src.ProgressivoContributoCond)
            and (trgt.articolo = src.Articolo)
            when not matched then
                insert (contratto,condizionato,articolo,valoreavanzamentoarticolo,utentemodifica,datamodifica) 
                values(src.Contratto,src.ProgressivoContributoCond,src.Articolo,src.ValoreRiga,@UTENTEMODIFICA,getdate());

            -- 3) Updata ogni riga articolo coi totali dell'avanzamento dell'intero contributo in question (lo ripete riga per riga di articolo il totale dell'intero contributo)
            Merge CONTRATTI_ANALISIRIGHECONSUNTIVATECONDIZIONATE as trgt
            Using (
                    select      C.Contratto,C.ProgressivoContributoCond,sum(C.TotNettoRiga) as ValoreAvanzamentoContributo
                    from        ContribCondizInElab C 
                    Where       C.DiCui = 0
                    And         C.Sessione = @IDSESSIONE
                    group by    C.Contratto,C.ProgressivoContributoCond
                  ) as src 
            on (trgt.contratto = src.Contratto)
            and (trgt.condizionato = src.ProgressivoContributoCond)
            when matched then
                update set valoreavanzamentocontributo = src.ValoreAvanzamentoContributo;

                
            -- Sommatoria dei condizionati Non DiCui --
            Update      ContrattiRange_CON
            Set         ContrattiRange_CON.CONSUNTIVATOVALORE = SM.TotNettoRiga,
                        ContrattiRange_CON.CONSUNTIVATOQTA = SM.TotQta,
                        ContrattiRange_CON.PREMIOMATURATO = 0
            From        ContrattiRange_CON 
            Inner Join  (
                    
                        Select      C.ProgressivoContributoCond,
                                    C.NrRigaContributoCond, 
                                    Sum(C.QtaGest) as TotQta,
                                    Sum(C.TotNettoRiga) as TotNettoRiga

                        From        ContribCondizInElab C

                        Where       C.SESSIONE = @IDSESSIONE
                        And         C.DiCui = 0

                        Group By    C.ProgressivoContributoCond,
                                    C.NrRigaContributoCond
                        ) SM 

            On  SM.ProgressivoContributoCond = ContrattiRange_CON.RIFPROGRESSIVO
            And SM.NrRigaContributoCond = ContrattiRange_CON.NRRIGA 

            -- Sommatoria dei condizionati DiCui --
            Update      ContrattiRange_CONDICUI 
            Set         ContrattiRange_CONDICUI.CONSUNTIVATOVALORE = SM.TotNettoRiga,
                        ContrattiRange_CONDICUI.CONSUNTIVATOQTA = SM.TotQta,
                        ContrattiRange_CONDICUI.PREMIOMATURATO = 0
            From        ContrattiRange_CONDICUI 
            Inner Join  (
                    
                        Select      C.ProgressivoContributoCond,
                                    C.NrRifRigaCondDiCui,
                                    C.NrRigaContributoCond, 
                                    Sum(C.QtaGest) as TotQta,
                                    Sum(C.TotNettoRiga) as TotNettoRiga

                        From        ContribCondizInElab C

                        Where       C.SESSIONE = @IDSESSIONE
                        And         C.DiCui = 1

                        Group By    C.ProgressivoContributoCond,
                                    C.NrRifRigaCondDiCui,
                                    C.NrRigaContributoCond
                        ) SM 

            On  SM.ProgressivoContributoCond = ContrattiRange_CONDICUI.RIFPROGRESSIVO
            And SM.NrRifRigaCondDiCui = ContrattiRange_CONDICUI.RIFRIGA 
            And SM.NrRigaContributoCond = ContrattiRange_CONDICUI.NRRIGA 
            
            -- Calcolo dei Premi --


        end try

        begin catch

            set @RES        = 0
            set @ERRORNR    = ERROR_NUMBER()
            set @ERRORMS    = ERROR_MESSAGE()
            set @ERRORLINE  = ERROR_LINE()
                    
        end catch
END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[CONTRATTI_CONSUNTIVAZIONECONDIZIONATI_SEDIM] TO [Metodo98]
    AS [dbo];

