
CREATE FUNCTION [dbo].[FunConvSconti]
(
   @List       NVARCHAR(MAX)
)
RETURNS @Items TABLE (Id INT IDENTITY(0,1),ValoreSconto NVARCHAR(4000))
WITH SCHEMABINDING
AS
BEGIN
    
   DECLARE @Delimiter  NVARCHAR(255)
        
        SET @Delimiter = '+'
        
   DECLARE @ll INT = LEN(@List) + 1, @ld INT = LEN(@Delimiter);
 
   WITH a AS
   (
       SELECT
           [start] = 1,
           [end]   = COALESCE(NULLIF(CHARINDEX(@Delimiter, 
                       @List, @ld), 0), @ll),
           [value] = SUBSTRING(@List, 1, 
                     COALESCE(NULLIF(CHARINDEX(@Delimiter, 
                       @List, @ld), 0), @ll) - 1)
       UNION ALL  
       SELECT
           [start] = CONVERT(INT, [end]) + @ld,
           [end]   = COALESCE(NULLIF(CHARINDEX(@Delimiter, 
                       @List, [end] + @ld), 0), @ll),
           [value] = SUBSTRING(@List, [end] + @ld, 
                     COALESCE(NULLIF(CHARINDEX(@Delimiter, 
                       @List, [end] + @ld), 0), @ll)-[end]-@ld)
       FROM a
       WHERE [end] < @ll
   )
   INSERT @Items SELECT [value]
   FROM a
   WHERE LEN([value]) > 0
   OPTION (MAXRECURSION 0);
 
   RETURN;
END

GO
GRANT SELECT
    ON OBJECT::[dbo].[FunConvSconti] TO [Metodo98]
    AS [dbo];

