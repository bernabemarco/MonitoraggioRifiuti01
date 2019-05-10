
CREATE FUNCTION [dbo].[IE_ExpFun_ComposerSelect](@RifProgressivo decimal(18,0) = 0)

RETURNS VARCHAR(MAX)
AS
BEGIN

    -- Declare the return variable here
    DECLARE @Result varchar(MAX) = NULL;

    --Select
    SELECT  
        /*SUBSTRING(R.FieldName,CHARINDEX('.',R.FieldName,1) + 1,(LEN(R.FieldName) - (CHARINDEX('.',R.FieldName,1))))*/
        @Result = COALESCE(@Result + ',', ' SELECT ')  + CHAR(13) + CHAR(10) + (CASE WHEN R.IsFixed = 1 THEN '''' + Replace(R.FixedValue,'''','''''') + '''' ELSE 'ISNULL(' + dbo.IE_ExpFun_ComposerField(@RifProgressivo, R.FieldName) + ',' + (case when R.FieldType = 0 then '0' when R.FieldType = 3 then '0.0' else '''''' end) + ')' END) + ' AS ' + IsNull(NullIf(R.FieldAlias,'') , 'F' + CAST(R.Progressivo as varchar) ) 
    FROM   
        IE_ExpProfileFieldsMap R
    INNER JOIN
    (
        select
            row_number() over(Partition by RifProgressivo Order By (Len(XmlNodePath) - LEN(REPLACE(XmlNodePath,'\', '')))) Sorting,
            Progressivo,
            RifProgressivo
        from 
            IE_ExpProfileFieldsMap 
        where
            RifProgressivo = @RifProgressivo
    ) S
    ON
        S.RifProgressivo = R.RifProgressivo And
        S.Progressivo = R.Progressivo
    where 
        R.RifProgressivo = @RifProgressivo And R.FieldName IS NOT NULL
    Order By
        S.Sorting;
    
    /*Equivale al print*/
    --select @Result as [processing-instruction(x)] FOR XML PATH;

    -- Return the result of the function
    RETURN @Result

END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[IE_ExpFun_ComposerSelect] TO [Metodo98]
    AS [dbo];

