

CREATE FUNCTION IE_ExpFun_ComposerFrom(@RifProgressivo decimal(18,0) = 0)

RETURNS VARCHAR(MAX)
AS
BEGIN


    -- Declare the return variable here
    DECLARE @Result varchar(MAX) = '';

    --From
    Select Top 1
        @Result = @Result + ' FROM ' + CHAR(13) + CHAR(10) + T.TableName + ' AS ' + T.TableCaption + ' '
    From 
        IE_ExpProfileTables T
    inner join
        Sys.Objects o
    on
        o.name = t.TableName and o.[type] in('V','U')
    Where
        T.RifProgressivo = @RifProgressivo And
        T.TableCaption Not In(Select Distinct DestinationTable From IE_ExpProfileTablesLink S1 Where S1.RifProgressivo = T.RifProgressivo);
    
    /*Equivale al print*/
    --select @Result as [processing-instruction(x)] FOR XML PATH;

    -- Return the result of the function
    RETURN @Result

END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[IE_ExpFun_ComposerFrom] TO [Metodo98]
    AS [dbo];

