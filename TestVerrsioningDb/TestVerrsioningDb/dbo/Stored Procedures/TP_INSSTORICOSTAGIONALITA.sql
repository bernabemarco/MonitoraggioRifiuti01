
CREATE PROCEDURE TP_INSSTORICOSTAGIONALITA @CodArt VarChar(50),@Deposito VarChar(10),
					             @Anno Smallint,@Mese Smallint, 
					               @Qta1 Decimal(19,6), @Qta2 Decimal(19,6),
					                 @Um1 VarChar(3),@Um2 VarChar(3), @Tipo Smallint
AS

DECLARE @COUNT_REC Smallint

	BEGIN
		SELECT @COUNT_REC=COUNT(*) 
		FROM TP_STORICOSTAGIONALITA 
		WHERE CODART = @CodArt AND DEPOSITO = @Deposito AND ANNO = @Anno AND MESE = @Mese

		IF (@Tipo = 0)
			BEGIN
				IF (@COUNT_REC = 0)
					BEGIN
						INSERT INTO TP_STORICOSTAGIONALITA(CODART,DEPOSITO,ANNO,MESE,CARICOQTA1,CARICOQTA2,UMCAR1,UMCAR2) 
						VALUES(@CodArt,@Deposito,@Anno,@Mese,@Qta1,@Qta2,@Um1,@Um2)
					END
				ELSE
					BEGIN
						UPDATE TP_STORICOSTAGIONALITA
						SET 	CARICOQTA1=@Qta1 ,
							CARICOQTA2=@Qta2 ,
							UMCAR1=@Um1 ,
							UMCAR2=@Um2
						WHERE CODART = @CodArt AND DEPOSITO = @Deposito AND ANNO = @Anno AND MESE = @Mese
					END
			END

		IF (@Tipo = 1)
			BEGIN
				IF (@COUNT_REC = 0)
					BEGIN
						INSERT INTO TP_STORICOSTAGIONALITA(CODART,DEPOSITO,ANNO,MESE,VENDUTOQTA1,VENDUTOQTA2,UMVEN1,UMVEN2) 
						VALUES(@CodArt,@Deposito,@Anno,@Mese,@Qta1,@Qta2,@Um1,@Um2)
					
					END
				ELSE
					BEGIN
						UPDATE TP_STORICOSTAGIONALITA
						SET 	VENDUTOQTA1=@Qta1 ,
							VENDUTOQTA2=@Qta2 ,
							UMVEN1=@Um1 ,
							UMVEN2=@Um2
						WHERE CODART = @CodArt AND DEPOSITO = @Deposito AND ANNO = @Anno AND MESE = @Mese
					END
			END
	END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[TP_INSSTORICOSTAGIONALITA] TO [Metodo98]
    AS [dbo];

