




--EXEC _FEGetRigaProvenienza 575, 3
-- select codiceCIG, codiceCup,TESTEDOCUMENTI.*,RIGHEDOCUMENTI.RIFCOMMCLI from TESTEDOCUMENTI, RIGHEDOCUMENTI where progressivo = IDTESTA and IDTESTA = 578 AND IDRIGA =  1
CREATE PROCEDURE [dbo].[_FEGetRigaProvenienza]      (@Chiave1 as varchar(100), @Chiave2 as varchar(100)) AS

	IF (select FlagAggCampiB2B from ALD_TabDittaDatiAggiuntivi) =1
	BEGIN
	
	EXECUTE sp_executesql   
          N'SELECT TESTEDOCUMENTI.*, left(TestoSuXML,100) as RIFCOMMCLI
	from TESTEDOCUMENTI, RIGHEDOCUMENTI, ALD_V_RifCommesse
	where progressivo = IDTESTA and ALD_V_RifCommesse.RifComm=RIGHEDOCUMENTI.RIFCOMMCLI 
	and IDTESTA = @ChiaveE1 AND IDRIGA = @ChiaveE2 ',
	N'@ChiaveE1 varchar(100), @ChiaveE2 varchar(100)', 
    @ChiaveE1 = @Chiave1,
	@ChiaveE2 = @Chiave2  ;  
	END
	else 
	
	SELECT TESTEDOCUMENTI.*,RIGHEDOCUMENTI.RIFCOMMCLI
	from TESTEDOCUMENTI, RIGHEDOCUMENTI
	where progressivo = IDTESTA and IDTESTA = @Chiave1 AND IDRIGA = @Chiave2




