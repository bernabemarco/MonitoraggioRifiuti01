
/* Store procedure utilizzate per la compilazione delle tabelle temporanee in quanto filtrati dai dati di filtro della stampa */
CREATE PROCEDURE [dbo].[Ald_Temp_CaricoArticolo] (@IdSessione DECIMAL(10,0), @Esercizio DECIMAL(5,0), @DataMovDa VARCHAR(20),@DataMovA VARCHAR(20))
AS
BEGIN
	DECLARE
    @DataConvDa DATETIME,
	@DataConvA DATETIME
	        
	SET @DataConvDa = CONVERT(DATETIME,@DataMovDa,103)
	SET @DataConvA = CONVERT(DATETIME,@DataMovA,103)
	
	DELETE FROM Ald_TEMPCaricoArticolo WHERE NrTerminale=@IdSessione
	INSERT INTO Ald_TEMPCaricoArticolo (NRTERMINALE,CODART,CODDEPOSITO,NRIFPARTITA,ESERCIZIO,carico,UTENTEMODIFICA,DATAMODIFICA) 
	SELECT @IdSessione,CODART,0,'',@Esercizio,SUM(Carico - ResoDaCarico),'input',{fn NOW()} 
	FROM VistaInventario , AnagraficaDepositi Dep
	WHERE Coddeposito=dep.codice and disponibile=1 and DataMov between @DataConvDa and  @DataConvA
	GROUP BY CodArt

	RETURN (0)
	
END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[Ald_Temp_CaricoArticolo] TO [Metodo98]
    AS [dbo];

