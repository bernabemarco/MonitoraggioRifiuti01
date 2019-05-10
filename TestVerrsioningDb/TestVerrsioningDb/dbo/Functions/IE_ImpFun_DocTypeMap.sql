

CREATE FUNCTION IE_ImpFun_DocTypeMap(@Progressivo decimal(18,0), @CodDocExt Varchar(5))

RETURNS VARCHAR(3)
AS
BEGIN

-- Declare the return variable here
declare @Result         varchar(3) = '';
    
    
    --Query
    select 
        @Result = IsNull(IsNull(Cnv.CodDocMet,Def.CodiceDoc),'')
    from 
        IE_ImpProfiles Def
    Outer Apply
        (Select CodDocMet From IE_ImpProfileDocTypeMap Where CodDocExt = @CodDocExt) Cnv
    Where Progressivo = @Progressivo
    
    /*Equivale al print*/
    --select @Result as [processing-instruction(x)] FOR XML PATH;

    -- Return the result of the function
    RETURN @Result

END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[IE_ImpFun_DocTypeMap] TO [Metodo98]
    AS [dbo];

