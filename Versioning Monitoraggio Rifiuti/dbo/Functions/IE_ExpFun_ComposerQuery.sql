

CREATE FUNCTION IE_ExpFun_ComposerQuery(@RifProgressivo decimal(18,0) = 0, @AdditionalFilter varchar(max) = '')

RETURNS VARCHAR(MAX)
AS
BEGIN

-- Declare the return variable here
declare @Select         varchar(max) = '';
declare @From           varchar(max) = '';
declare @Join           varchar(max) = '';
declare @Where          varchar(max) = '';
declare @Result         varchar(max) = '';

    --Query
    select @Result = (        dbo.IE_ExpFun_ComposerSelect(@RifProgressivo)     /*Select*/
                      + ' ' + dbo.IE_ExpFun_ComposerFrom(@RifProgressivo)       /*From*/
                      + ' ' + dbo.IE_ExpFun_ComposerJoin(@RifProgressivo)       /*Join*/
                      + ' ' + dbo.IE_ExpFun_ComposerWhere(@RifProgressivo,@AdditionalFilter)    /*Where*/
                      + ' ' + dbo.IE_ExpFun_ComposerOrderBy(@RifProgressivo)    /*OrderBy*/
                     );
        
    
    /*Equivale al print*/
    --select @Result as [processing-instruction(x)] FOR XML PATH;

    -- Return the result of the function
    RETURN @Result

END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[IE_ExpFun_ComposerQuery] TO [Metodo98]
    AS [dbo];

