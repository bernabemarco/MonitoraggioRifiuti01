CREATE FUNCTION StatoCespite (@Cespite VARCHAR(10))
RETURNS SMALLINT
AS

BEGIN
DECLARE @Tipo SMALLINT
DECLARE @CompQtaRes DECIMAL(16,6)
DECLARE @CompQtaEli DECIMAL(16,6)
DECLARE @ImpImmRes DECIMAL(16,4)
DECLARE @CompetenzaImp DECIMAL(16,4)
DECLARE @TipoRiv SMALLINT
DECLARE @PercRivSva DECIMAL(8,5)
DECLARE @ImpDocumentoIniz DECIMAL(16,4)

DECLARE @Stato SMALLINT
DECLARE @MovVendita SMALLINT
DECLARE @MovEliminato SMALLINT
DECLARE @MovDistrutto SMALLINT
DECLARE @TOTQtaRes DECIMAL(16,6)
DECLARE @TOTImmRes DECIMAL(16,4)

DECLARE Movimenti_Cursor CURSOR FOR	SELECT Tipo,CompQtaRes,CompQtaEli,ImpImmResEuro,CompetenzaImpEuro,ImpDocumentoInizEuro,TipoRiv,PercRivSva FROM MovimentiCes WHERE Cespite=@Cespite ORDER BY DtaEffettiva, Progressivo
OPEN Movimenti_Cursor
FETCH NEXT FROM Movimenti_Cursor INTO @Tipo,@CompQtaRes,@CompQtaEli,@ImpImmRes,@CompetenzaImp,@ImpDocumentoIniz,@TipoRiv,@PercRivSva
SET @MovVendita = 0
SET @MovEliminato = 0
SET @MovDistrutto = 0
WHILE @@FETCH_STATUS = 0
	BEGIN
	IF @Tipo = 2    --Riporto Iniziale
		BEGIN
		SET @TOTQtaRes = @CompQtaRes
		SET @TOTImmRes = @ImpImmRes
		END

	IF @Tipo = 3   --Acquisizione
		BEGIN
		SET @TOTQtaRes = @CompQtaRes
		SET @TOTImmRes = @ImpImmRes
		END

	IF (@Tipo = 4) OR (@Tipo = 6)  --Costi Aggiuntivi, Integrazioni
		BEGIN
		SET @TOTImmRes = @TOTImmRes + @CompetenzaImp
		END

	IF @Tipo = 7  --Rivalutazione
		BEGIN
		IF (@TipoRiv <= 1) AND (@TOTImmRes > 0)
			BEGIN
			SET @TOTImmRes = @TOTImmRes + Round((@TOTImmRes * @PercRivSva / 100), 2)
			END
		END

	IF @Tipo = 8  --Eliminazione
		BEGIN
		IF @TOTQtaRes > 0
			BEGIN
			SET @TOTImmRes = @TOTImmRes - Round((@TOTImmRes / @TOTQtaRes * @CompQtaEli), 2)
			END
		SET @TOTQtaRes = @TOTQtaRes - @CompQtaEli
		SET @MovEliminato = 1
		END

	IF @Tipo = 9  --Distruzione
		BEGIN
		IF @TOTQtaRes > 0
			BEGIN
			SET @TOTImmRes = @TOTImmRes - Round((@TOTImmRes / @TOTQtaRes * @CompQtaRes), 2)
			END
		SET @TOTQtaRes = @TOTQtaRes - @CompQtaRes
		SET @MovDistrutto = 1
		END

	IF @Tipo = 10  --Vendita
		BEGIN
		IF @TOTQtaRes > 0
			BEGIN
			SET @TOTImmRes = @TOTImmRes - Round((@TOTImmRes / @TOTQtaRes * @CompQtaRes), 2)
			END
		SET @TOTQtaRes = @TOTQtaRes - @CompQtaRes
		SET @MovVendita = 1
		END

	IF @Tipo = 13  --Rivalutazione a valore
		BEGIN
		IF (@TipoRiv <= 1) AND (@TOTImmRes > 0)
			BEGIN
			SET @TOTImmRes = @TOTImmRes + @CompetenzaImp
			END
		END

	IF @Tipo = 14  --Vendita a Valore
		BEGIN
		IF @TOTImmRes > 0
			BEGIN
			IF @ImpDocumentoIniz = @TOTImmRes
				BEGIN
				SET @TOTQtaRes = 0
				END
			SET @TOTImmRes = @TOTImmRes - @ImpDocumentoIniz
			END
		SET @MovVendita = 1
		END

	IF @Tipo = 15  --Distruzione a Valore
		BEGIN
		IF (@TOTImmRes > 0) AND (@CompetenzaImp > 0)
			BEGIN
			SET @TOTImmRes = @TOTImmRes - @CompetenzaImp
			END
		SET @MovDistrutto = 1
		END

	IF @Tipo = 16  --Eliminazione a Valore
		BEGIN
		IF (@TOTImmRes > 0) AND (@CompetenzaImp > 0)
			BEGIN
			SET @TOTImmRes = @TOTImmRes - @CompetenzaImp
			IF @TOTImmRes = 0
				BEGIN
				SET @TOTQtaRes = 0
				END
			END
		SET @MovEliminato = 1
		END

	FETCH NEXT FROM Movimenti_Cursor INTO @Tipo,@CompQtaRes,@CompQtaEli,@ImpImmRes,@CompetenzaImp,@ImpDocumentoIniz,@TipoRiv,@PercRivSva
END

CLOSE Movimenti_Cursor
DEALLOCATE Movimenti_Cursor

SET @Stato = 0

IF (@MovVendita = 1) 
	BEGIN
	IF (@TOTQtaRes = 0) 
		BEGIN
		SET @Stato = 1     --Venduto 
		END
	ELSE	
		BEGIN
		SET @Stato = 2     --Venduto Parzialmente
		END
	END
IF (@MovEliminato = 1) 
	BEGIN
	SET @Stato = 3        --Eliminato
	END
IF (@MovDistrutto = 1) 
	BEGIN
	SET @Stato = 4        --Distrutto
	END

RETURN(@Stato)

END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[StatoCespite] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[StatoCespite] TO [Metodo98]
    AS [dbo];

