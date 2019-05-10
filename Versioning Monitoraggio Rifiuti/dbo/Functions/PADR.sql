
CREATE function [dbo].[PADR]  (@cSrting nvarchar(4000), @nLen smallint, @cPadCharacter nvarchar(4000) = ' ' )
returns nvarchar(4000)
as
     begin
       declare @length smallint, @lengthPadCharacter smallint
       select  @length  = datalength(@cSrting)/(case SQL_VARIANT_PROPERTY(@cSrting,'BaseType') when 'nvarchar' then 2  else 1 end) -- for unicode
       select  @lengthPadCharacter  = datalength(@cPadCharacter)/(case SQL_VARIANT_PROPERTY(@cPadCharacter,'BaseType') when 'nvarchar' then 2  else 1 end) -- for unicode

       if @length >= @nLen
          set  @cSrting = left(@cSrting, @nLen)
       else
          begin
             declare  @nRightLen smallint
             set @nRightLen  =  @nLen - @length -- Quantity of characters, added on the right
             set @cSrting =  @cSrting + left(replicate(@cPadCharacter, ceiling(@nRightLen/@lengthPadCharacter) + 2), @nRightLen)
	  end

     return (@cSrting)
    end

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[PADR] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[PADR] TO [Metodo98]
    AS [dbo];

