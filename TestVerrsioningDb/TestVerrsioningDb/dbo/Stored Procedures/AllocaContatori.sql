
 CREATE PROCEDURE [dbo].[AllocaContatori]
 @Esercizio DECIMAL(5,0) = 2013,
 @Codice DECIMAL(5,0) =1,
 @Progr DECIMAL(5,0) OUT
 AS

 DECLARE @tprogr AS TABLE(Progr decimal(10,0))

 MERGE dbo.TABCONTATORI AS target
 USING
 (
 SELECT
 @Esercizio,
 @Codice,
 @progr
 ) AS source (Esercizio, Codice, progr)
 ON
 target.ESERCIZIO = source.Esercizio
 AND target.CODICE = source.Codice
 WHEN MATCHED
 THEN UPDATE SET PROGR = target.progr+1
 OUTPUT Inserted.PROGR INTO @tprogr;

 SELECT @Progr = (SELECT progr FROM @tprogr)
 RETURN 0
 
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[AllocaContatori] TO [Metodo98]
    AS [dbo];

