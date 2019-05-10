CREATE PROCEDURE [dbo].[Ald_Temp_GiacenzaArticoloDA] (@IdSessione DECIMAL(10,0), @DataDA VARCHAR(20))
AS
BEGIN
	
	DELETE FROM Ald_TEMPGiacenzaArticoloDA WHERE NrTerminale=@IdSessione
	INSERT INTO Ald_TEMPGiacenzaArticoloDA (NRTERMINALE,CODART,QTA,UTENTEMODIFICA,DATAMODIFICA) 
	SELECT @IdSessione,CODART,SUM(ST.giacenza),'input',{fn NOW()} 
		   FROM vistastoricomagbase st , TABCAUSALIMAG CAUMAG
		   WHERE ST.CODCAUSALE=CAUMAG.CODICE and CAUMAG.GIACENZA <>0 and ST.DISPONIBILE=1 
				and DataMov <= EOMONTH(@DataDA)
	GROUP BY CodArt

	RETURN (0)
	
END



GO
GRANT EXECUTE
    ON OBJECT::[dbo].[Ald_Temp_GiacenzaArticoloDA] TO [Metodo98]
    AS [dbo];

