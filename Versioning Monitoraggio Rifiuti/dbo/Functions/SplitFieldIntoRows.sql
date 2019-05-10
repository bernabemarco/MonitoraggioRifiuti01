

CREATE FUNCTION [dbo].[SplitFieldIntoRows]
(
  @FieldValue Varchar(MAX),
  @RemoveSpaces Bit,
  @ReturnEmptyString Bit,
  @Delimiter Char(1)
)
RETURNS @ReturnedTable TABLE (ReturnedValue Varchar(MAX))

AS

BEGIN

DECLARE @i int
DECLARE @j int

    SELECT @i = 0, @j = (LEN(@FieldValue) - LEN(REPLACE(@FieldValue,@Delimiter,'')));

    WITH CTE
    AS
    (
        SELECT
            i = @i + 1,
            s = @FieldValue, 
            n = substring(@FieldValue, 0, charindex(@Delimiter, @FieldValue)),
            m = substring(@FieldValue, charindex(@Delimiter, @FieldValue)+1, len(@FieldValue) - charindex(@Delimiter, @FieldValue))
        UNION ALL
        SELECT 
            i = CTE.i + 1,
            s = CTE.m, 
            n = substring(CTE.m, 0, charindex(@Delimiter, CTE.m)),
            m = substring(CTE.m,charindex(@Delimiter, CTE.m) + 1,len(CTE.m)-charindex(@Delimiter, CTE.m))
        FROM 
            CTE
        WHERE 
            i <= @j
    )
    INSERT INTO @ReturnedTable (ReturnedValue)
    SELECT pieces
    FROM
    (
        SELECT 
            CASE    WHEN @RemoveSpaces = 1
                    THEN LTRIM(RTRIM(CASE WHEN i <= @j THEN n ELSE m END))
                    ELSE CASE WHEN i <= @j THEN n ELSE m END
            END AS pieces
        FROM 
            CTE
    ) t
    WHERE
           (@ReturnEmptyString = 0 and len(pieces) > 0)
        or (@ReturnEmptyString = 1)
    OPTION (MAXRECURSION 0)

RETURN

END



GO
GRANT SELECT
    ON OBJECT::[dbo].[SplitFieldIntoRows] TO [Metodo98]
    AS [dbo];

