

CREATE FUNCTION [dbo].[FunCalcSconti](@List Varchar(Max))
RETURNS decimal(19,6)
AS
BEGIN

DECLARE   @ScontiEstesi VARCHAR(MAX)  = ''
DECLARE   @FixedValue   DECIMAL(19,6) = 100.00
DECLARE   @Result       DECIMAL(19,6) = 0.00
DECLARE   @Delimiter    NVARCHAR(255)
DECLARE   @ll           INT = 0
DECLARE   @ld           INT = 0
    
    --IF LEFT(@List,2) = '+('
    --    BEGIN
    --        SET @List = RIGHT(@List,LEN(@List)-2)
    --    END

    --IF LEFT(@List,1) = '+'
    --    BEGIN
    --        SET @List = RIGHT(@List,LEN(@List)-1)
    --    END

    IF (CHARINDEX('-', @List) = 0)
        BEGIN
            SET @ScontiEstesi = REPLACE(@List,'+(','+-')
            SET @ScontiEstesi = REPLACE(@ScontiEstesi,')','')
            SET @ScontiEstesi = REPLACE(@ScontiEstesi,',','.')
            SET @Delimiter = '+'
            SET @ll = LEN(@ScontiEstesi) + 1
            SET @ld = LEN(@Delimiter); 
   
            WITH a([Id],[start],[end],[value],[perc])
            AS
            (
               SELECT
                   [Id] = 1,
                   [start] = 1,
                   [end]   = COALESCE(NULLIF(CHARINDEX(@Delimiter, @ScontiEstesi, @ld), 0), @ll),
                   [value] = IsNull(NullIf(SUBSTRING(@ScontiEstesi, 1, COALESCE(NULLIF(CHARINDEX(@Delimiter, @ScontiEstesi, @ld), 0), @ll) - 1),''),'0'),
                   [perc] = @FixedValue * (1.000000 - cast(IsNull(NullIf(SUBSTRING(@ScontiEstesi, 1, COALESCE(NULLIF(CHARINDEX(@Delimiter, @ScontiEstesi, @ld), 0), @ll) - 1),''),'0') as decimal(19,6)) / @FixedValue)
               UNION ALL  
               SELECT
                   [Id] = [Id] + 1,
                   [start] = CONVERT(INT, [end]) + @ld,
                   [end]   = COALESCE(NULLIF(CHARINDEX(@Delimiter, @ScontiEstesi, [end] + @ld), 0), @ll),
                   [value] = SUBSTRING(@ScontiEstesi, [end] + @ld, COALESCE(NULLIF(CHARINDEX(@Delimiter, @ScontiEstesi, [end] + @ld), 0), @ll)-[end]-@ld),
                   [perc] = [perc] * (1.000000 - cast(SUBSTRING(@ScontiEstesi, [end] + @ld, COALESCE(NULLIF(CHARINDEX(@Delimiter, @ScontiEstesi, [end] + @ld), 0), @ll)-[end]-@ld) as decimal(19,6)) / @FixedValue)
               FROM a
               WHERE [end] < @ll
            )
            SELECT @Result = (100 - Perc)
            FROM a
            WHERE Id = (Select Max(id) From a)
            OPTION (MAXRECURSION 0);
        END

    RETURN(@Result)
END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[FunCalcSconti] TO [Metodo98]
    AS [dbo];

