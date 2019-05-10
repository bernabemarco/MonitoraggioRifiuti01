create procedure TP_AllocaContatore @CodDoc varchar(3),@Esercizio decimal(4),@NumDoc decimal(10) output 
as
begin
  set transaction isolation level serializable
  declare @codicetappo decimal(5)
  begin transaction
  select @NumDoc=null
  select @NumDoc=tabcontatori.progr,@codicetappo=tabcontatori.codice
    from Parametridoc join tabcontatori
    on Parametridoc.codicetappo=tabcontatori.codice
    where Parametridoc.codice=@CODDOC and tabcontatori.ESERCIZIO=@Esercizio
  if @NumDoc is not null
    begin
      select @NumDoc=@NumDoc+1
      update tabcontatori set progr=@NumDoc where tabcontatori.codice=@codicetappo and tabcontatori.ESERCIZIO=@Esercizio
    end
  else
    select @NumDoc=0
  commit transaction
end

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[TP_AllocaContatore] TO [Metodo98]
    AS [dbo];

