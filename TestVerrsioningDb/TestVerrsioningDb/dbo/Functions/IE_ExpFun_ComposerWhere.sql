
CREATE FUNCTION [dbo].[IE_ExpFun_ComposerWhere](@RifProgressivo decimal(18,0) = 0, @AdditionalFilter varchar(max) = '')

RETURNS VARCHAR(MAX)
AS
BEGIN
    -- Declare the return variable here
    DECLARE @Result varchar(MAX) = NULL;

    IF NULLIF(@AdditionalFilter,'') IS NOT NULL
    SET @Result = ' WHERE ' + @AdditionalFilter
    --Filter (Condition)
    /*
    'Esportazione XMl (Derwid)

    'Valori che pu� assumere il campo [Operator]
    '"="        , "Uguale"          , "0")
    '"<>"       , "Diverso"         , "1")
    '">"        , "Maggiore"        , "2")
    '"<"        , "Minore"          , "3")
    '">="       , "Maggiore-Uguale" , "4")
    '"<="       , "Minore-Uguale"   , "5")
    '"In"       , "Compreso"        , "6")
    '"Not In"   , "Non Compreso"    , "7")
    */
    select 
        @Result = COALESCE(@Result + ' AND ', ' WHERE ') + CHAR(13) + CHAR(10) + R.FieldTable + '.' + R.FieldName + (CASE R.Operator 
                                                                                                                      WHEN 0 THEN ' = ''' + R.FieldValue + ''''
                                                                                                                      WHEN 1 THEN ' <> ''' + R.FieldValue + ''''
                                                                                                                      WHEN 2 THEN ' > ''' + R.FieldValue + ''''
                                                                                                                      WHEN 3 THEN ' < ''' + R.FieldValue + ''''
                                                                                                                      WHEN 4 THEN ' >= ''' + R.FieldValue + ''''
                                                                                                                      WHEN 5 THEN ' =< ''' + R.FieldValue + ''''
                                                                                                                      WHEN 6 THEN ' In (''' + Replace(R.FieldValue,',',''',''') + ''')'
                                                                                                                      WHEN 7 THEN ' Not In (''' + R.FieldValue + ''')'
                                                                                                                     END)
    from 
        IE_ExpProfilesFilter R
    where
        R.RifProgressivo = @RifProgressivo;
    
    /*Equivale al print*/
    --select @Result as [processing-instruction(x)] FOR XML PATH;

    -- Return the result of the function
    RETURN ISNULL(@Result,'')

END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[IE_ExpFun_ComposerWhere] TO [Metodo98]
    AS [dbo];

