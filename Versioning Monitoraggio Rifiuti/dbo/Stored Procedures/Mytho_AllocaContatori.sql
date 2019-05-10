

 CREATE PROCEDURE [dbo].[Mytho_AllocaContatori]
 @Progr DECIMAL(5,0) OUT
 AS

 DECLARE @tprogr AS TABLE(Progr decimal(10,0))

 MERGE [dbo].[MYTHO_Parametri] AS target
 USING
 (
 SELECT
 @progr
 ) AS source (progr)
 ON
 target.progressivo > 0
 WHEN MATCHED
 THEN UPDATE SET SKU_PROGRESSIVO = target.SKU_PROGRESSIVO+1
 OUTPUT Inserted.SKU_PROGRESSIVO INTO @tprogr;

 SELECT @Progr = (SELECT progr FROM @tprogr)
 RETURN 0
 



GO
GRANT EXECUTE
    ON OBJECT::[dbo].[Mytho_AllocaContatori] TO [Metodo98]
    AS [dbo];

