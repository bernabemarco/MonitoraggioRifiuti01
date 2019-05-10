
CREATE FUNCTION dbo.ALDSEGNOSCAD (@clifor varchar(1),@attpass integer,@importo as numeric(19,4) )  
RETURNS NUMERIC(19,4)
BEGIN 
/*	@RET_IMPORTO =importo scadenza con segno cambiato in base alla tipologia C/F e al tipo di scadenza ATT/PASS */
/*	@clifor = C per cliente F per fornitore */
/*	@attpass = campo della tabella TABScadenze ( clienti = segno + se attpass=0 altrimenti -  /// fornitori = segno - se attpass=0 altrimenti + */

DECLARE @RET_IMPORTO AS NUMERIC(19,4)
DECLARE @RET_IMPORTOSTRINGA AS VARCHAR(50)
IF @attpass=0
BEGIN
	SET @RET_IMPORTO=@importo * -1
END
ELSE
BEGIN
	SET @RET_IMPORTO=@importo
END	
SET @RET_IMPORTOSTRINGA=CAST(@RET_IMPORTO AS VARCHAR(50)) 
RETURN @RET_IMPORTO

END



GO
GRANT EXECUTE
    ON OBJECT::[dbo].[ALDSEGNOSCAD] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALDSEGNOSCAD] TO [Metodo98]
    AS [dbo];

