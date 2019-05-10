

CREATE FUNCTION [dbo].[PADL]
(
    @cSrting nvarchar(4000), 
    @nLen smallint, 
    @cPadCharacter nvarchar(4000) = ' ' 
)
returns nvarchar(4000)
as
      begin
        declare @length smallint, @lengthPadCharacter smallint
        select  @length = datalength(@cSrting)/(case SQL_VARIANT_PROPERTY(@cSrting,'BaseType') when 'nvarchar' then 2  else 1 end) -- for unicode
        select  @lengthPadCharacter = datalength(@cPadCharacter)/(case SQL_VARIANT_PROPERTY(@cPadCharacter,'BaseType') when 'nvarchar' then 2  else 1 end) -- for unicode

        if @length >= @nLen
           set  @cSrting = left(@cSrting, @nLen)
        else
       begin
              declare @nLeftLen smallint,  @nRightLen smallint
              set @nLeftLen = @nLen - @length  -- Quantity of characters, added at the left
              set @cSrting = left(replicate(@cPadCharacter, ceiling(@nLeftLen/@lengthPadCharacter) + 2), @nLeftLen)+ @cSrting
           end

    return (@cSrting)
   end

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[PADL] TO [Metodo98]
    AS [dbo];

