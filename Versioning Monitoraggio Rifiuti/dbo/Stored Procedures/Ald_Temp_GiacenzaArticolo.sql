CREATE PROCEDURE [dbo].[Ald_Temp_GiacenzaArticolo] (@IdSessione DECIMAL(10,0), @Esercizio DECIMAL(5,0), @DataMov VARCHAR(20),@NrListino DECIMAL(5,0) )
AS
BEGIN
	
	DELETE FROM Ald_TEMPGiacenzaArticolo WHERE NrTerminale=@IdSessione
	INSERT INTO Ald_TEMPGiacenzaArticolo (NRTERMINALE,CODART,CODDEPOSITO,NRIFPARTITA,ESERCIZIO,QTA,IMPEGNATO,ORDINATO,MESISEL,DATAINIZIO,DATAFINE,UTENTEMODIFICA,DATAMODIFICA) 
	SELECT @IdSessione,CODART,0,'',@Esercizio,SUM(Carico - Scarico + ResoDaScarico - ResoDaCarico),SUM(Impegnato),SUM(Ordinato),0,0,'','input',{fn NOW()} 
	FROM VistaInventario , AnagraficaDepositi Dep
	WHERE Coddeposito=dep.codice and disponibile=1 and DataMov <= @DataMov 
	GROUP BY CodArt

	RETURN (0)
	
END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[Ald_Temp_GiacenzaArticolo] TO [Metodo98]
    AS [dbo];

