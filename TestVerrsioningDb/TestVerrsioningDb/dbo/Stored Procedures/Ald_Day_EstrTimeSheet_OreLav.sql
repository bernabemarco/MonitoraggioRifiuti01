
CREATE PROCEDURE [dbo].[Ald_Day_EstrTimeSheet_OreLav](
	@DataEstr 		VARCHAR(10),
	@TestoTestata	VARCHAR(35),
	@AltreDesc 		VARCHAR(50),
	@WhereFiltro	VARCHAR(500),
	@Sovrascrivi	BIT,
	@Utente        VARCHAR(25)) AS
BEGIN
	DECLARE
		@Sql NVarChar(2000),
		@TipoMittente CHAR(3),
		@OrdineInternoMittente VARCHAR(20),
		@TipoDestinatario CHAR(3),
		@OrdineInternoDestinatario VARCHAR(20);
	
	SET @TipoMittente="CDC"
	SET @OrdineInternoMittente=""
	SET @TipoDestinatario="WBS"
	SET @OrdineInternoDestinatario=""
	
	
	IF @Sovrascrivi=1
		DELETE FROM dbo.CONS_ALD_FI_AA_TimeSheetRilOre
		
	SET @SQL = ""
	SET @SQL =@SQL+" INSERT INTO [CONS_ALD_FI_AA_TimeSheetRilOre]"
	SET @SQL =@SQL+"	   	([TestoTestataDoc]"
	SET @SQL =@SQL+"	   	,[DataMov]"
	SET @SQL =@SQL+"	   	,[TipoMittente]"
	SET @SQL =@SQL+"	   	,[OggettoMittente]"
	SET @SQL =@SQL+"	   	,[OrdineInternoMittente]"
	SET @SQL =@SQL+"	   	,[TipoDestinatario]"
	SET @SQL =@SQL+"	   	,[OggettoDestinatario]"
	SET @SQL =@SQL+"	   	,[OrdineInternoDestinatario]"
	SET @SQL =@SQL+"	   	,[idVDC]"
	SET @SQL =@SQL+"	   	,[ImportoPeriodo]"
	SET @SQL =@SQL+"	   	,[QuantitaOre]"
	SET @SQL =@SQL+"	   	,[AltreDescrizioni]"
	SET @SQL =@SQL+"	   	,[IdRespCid], [UtenteModifica], [DataModifica])"
	SET @SQL =@SQL+" SELECT '"+@TestoTestata+"'"
	SET @SQL =@SQL+"	  	,'"+@DataEstr+"'"
	SET @SQL =@SQL+"	  	,'"+@TipoMittente+"'"
	SET @SQL =@SQL+"	  	,ISNULL([OggettoMittente],'')"
	SET @SQL =@SQL+"	  	,'"+@OrdineInternoMittente+"'"
	SET @SQL =@SQL+"	  	,'"+@TipoDestinatario+"'"
	SET @SQL =@SQL+"	  	,ISNULL([OggettoDestinatario],'')"
	SET @SQL =@SQL+"	  	,'"+@OrdineInternoDestinatario+"'"
	SET @SQL =@SQL+"	  	,[idVDC]"
	SET @SQL =@SQL+"	  	,SUM([ImportoPeriodo])"
	SET @SQL =@SQL+"	  	,SUM([QuantitaOre])"
	SET @SQL =@SQL+"	  	,'"+@AltreDesc+"'"
	SET @SQL =@SQL+"	  	,ISNULL([IdRespCid],''), '" + @Utente + "', getdate()"
	SET @SQL =@SQL+"	FROM [Ald_Day_Vista_EstrTimeSheet_OreLav] as VSD"
	SET @SQL =@SQL+"	WHERE "+@WhereFiltro
	SET @SQL =@SQL+"		AND ISNULL(OggettoMittente,'')<>'' AND ISNULL(OggettoDestinatario,'')<>'' AND ISNULL(IdRespCid,'')<>''"
	SET @SQL =@SQL+"	GROUP BY OggettoDestinatario, IdRespcid, OggettoMittente, idVDC"
	--PRINT @SQL
	EXECUTE sp_executesql @SQL
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[Ald_Day_EstrTimeSheet_OreLav] TO [Metodo98]
    AS [dbo];

