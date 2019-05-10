

CREATE PROCEDURE [dbo].[CONTRATTI_CONSUNTIVAZIONEINCONDIZIONATI_SEDIM]
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
                
            -- Sommatoria --
            Update      ContrattiCL_QTA
            Set         ContrattiCL_QTA.CONSUNTIVO = SM.TotNettoRiga,
                        ContrattiCL_QTA.CONSUNTIVOQTA = SM.TotQta,
                        ContrattiCL_QTA.PREMIOMATURATO = 0
            From        ContrattiCL_QTA 
            Inner Join  (
                    
                        Select      C.Contratto,
                                    C.NrRigaContributo, 
                                    C.NrRigaContributoPerc,
                                    Sum(C.QtaGest) as TotQta,
                                    Sum(C.TotNettoRiga) as TotNettoRiga

                        From        ContribInCondizInElab C

                        Where       C.SESSIONE = @IDSESSIONE

                        Group By    C.Contratto,
                                    C.NrRigaContributo,
                                    C.NrRigaContributoPerc
                        ) SM 

            On  SM.Contratto = CONTRATTICL_QTA.RIFPROGRESSIVOCL
            And SM.NrRigaContributo = CONTRATTICL_QTA.RIFPROGRESSIVO
            And SM.NrRigaContributoPerc = CONTRATTICL_QTA.NRRIGA
            
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
    ON OBJECT::[dbo].[CONTRATTI_CONSUNTIVAZIONEINCONDIZIONATI_SEDIM] TO [Metodo98]
    AS [dbo];

