﻿
CREATE PROCEDURE [dbo].[NUOVORAPPORTOINT] @PESERCIZIO DECIMAL(5), @PUTENTE VARCHAR(25), @PAGGIORNA SMALLINT, @PTIPORAPPORTO AS VARCHAR(3), @PPROGRESSIVO VARCHAR(20) OUTPUT AS
BEGIN
	DECLARE @PP    DECIMAL(10);
	DECLARE @SIGLARAPPORTI VARCHAR(3);
	DECLARE @SIGLASOCIETA  VARCHAR(2)
	SET @PP=-1
	SET @PPROGRESSIVO = ''
	SET @SIGLARAPPORTI = ''
	SET @SIGLASOCIETA = ''

	IF @PAGGIORNA=0
		BEGIN
					DECLARE CUR_ICONT CURSOR FOR 
                    SELECT   PROGR,SiglaRapporto,t2.SIGLASOCIETA
					FROM (TABCONTATORI t1 JOIN GRI_TIPOLOGIARAPPORTO t2 ON (t1.CODICE=t2.CONTATORERAPPORTI AND t1.ESERCIZIO=@PESERCIZIO AND t2.siglarapporto=@PTIPORAPPORTO))
								JOIN GEM_TabParametriAziendaGemma t3 ON (t3.IDSOCIETA=t2.IDSOCIETA)

					OPEN CUR_ICONT 
						FETCH NEXT FROM CUR_ICONT INTO @PP,@SIGLARAPPORTI,@SIGLASOCIETA

								IF @@FETCH_STATUS<>0  SET @PP = 0

								SET @PP=@PP + 1
								SET @PPROGRESSIVO = cast(@PESERCIZIO AS VARCHAR(4))+@SIGLARAPPORTI+right('00000'+cast(@PP AS VARCHAR(5)),5)+@SIGLASOCIETA

					CLOSE CUR_ICONT
					DEALLOCATE CUR_ICONT
		END
	ELSE
		BEGIN
					DECLARE CUR_ICONT CURSOR SCROLL SCROLL_LOCKS FOR
                   SELECT   PROGR,SiglaRapporto,t2.SIGLASOCIETA
					FROM (TABCONTATORI t1 JOIN GRI_TIPOLOGIARAPPORTO t2 ON (t1.CODICE=t2.CONTATORERAPPORTI AND t1.ESERCIZIO=@PESERCIZIO AND t2.siglarapporto=@PTIPORAPPORTO))
								JOIN GEM_TabParametriAziendaGemma t3 ON (t3.IDSOCIETA=t2.IDSOCIETA)
					FOR UPDATE
					OPEN CUR_ICONT 
						FETCH NEXT FROM CUR_ICONT INTO @PP,@SIGLARAPPORTI,@SIGLASOCIETA
								IF @@FETCH_STATUS<>0 SELECT @PP = 0
		
								SET @PP = @PP + 1
								SET @PPROGRESSIVO = cast(@PESERCIZIO AS VARCHAR(4))+@SIGLARAPPORTI+right('000000'+cast(@PP AS VARCHAR(5)),5)+@SIGLASOCIETA
					
								UPDATE   TABCONTATORI 
								SET     PROGR = @PP, UTENTEMODIFICA = @PUTENTE, DATAMODIFICA = GETDATE() 
								WHERE CURRENT OF CUR_ICONT

					CLOSE CUR_ICONT
					DEALLOCATE CUR_ICONT
		END
prINT @PPROGRESSIVO
END	
	


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[NUOVORAPPORTOINT] TO [Metodo98]
    AS [dbo];

