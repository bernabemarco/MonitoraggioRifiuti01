

CREATE PROCEDURE [dbo].[IE_ExpProc_ComposerData](@RifProgressivo decimal(18,0) = 0, @AdditionalFilter varchar(max) = '') 
AS

declare @Result         varchar(max) = '';

    select @Result = dbo.IE_ExpFun_ComposerQuery(@RifProgressivo,@AdditionalFilter);

    /*Equivale al print*/
    --select @Result as [processing-instruction(x)] FOR XML PATH;

    exec(@Result);


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[IE_ExpProc_ComposerData] TO [Metodo98]
    AS [dbo];

