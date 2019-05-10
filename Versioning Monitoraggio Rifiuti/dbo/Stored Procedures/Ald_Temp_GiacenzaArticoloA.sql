
CREATE PROCEDURE [dbo].[Ald_Temp_GiacenzaArticoloA] (@IdSessione DECIMAL(10,0), @DataA VARCHAR(20))
AS
BEGIN
	
	DELETE FROM Ald_TEMPGiacenzaArticoloA WHERE NrTerminale=@IdSessione
	INSERT INTO Ald_TEMPGiacenzaArticoloA (NRTERMINALE,CODART,QTA,UTENTEMODIFICA,DATAMODIFICA) 
	SELECT @IdSessione,CODART,SUM(ST.giacenza),'input',{fn NOW()} 
		   FROM vistastoricomagbase st , TABCAUSALIMAG CAUMAG
		   WHERE ST.CODCAUSALE=CAUMAG.CODICE and CAUMAG.GIACENZA <>0 and ST.DISPONIBILE=1 
				and DataMov <= EOMONTH(@DataA)
	GROUP BY CodArt

	RETURN (0)
	
END



GO
GRANT EXECUTE
    ON OBJECT::[dbo].[Ald_Temp_GiacenzaArticoloA] TO [Metodo98]
    AS [dbo];

