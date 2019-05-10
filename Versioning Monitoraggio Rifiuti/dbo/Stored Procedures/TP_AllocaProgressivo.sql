create procedure TP_AllocaProgressivo(@PTABELLA varchar(80),@PPROG decimal(10) output)
as
begin
  set transaction isolation level serializable
  select @PPROG=null
  begin transaction
  if @PTABELLA='NUMDOCPROVVISORIO'
    begin
      select @PPROG=valore from tp_parametri where nome=@PTABELLA
      select @PPROG=@PPROG-1
      update tp_parametri set valore=@PPROG where nome=@PTABELLA
    end
  else
    begin
      select @PPROG=null
      select @PPROG=progr from tabprogressivi where nometabella=@ptabella
      if @PPROG is null
        begin
          select @PPROG=1
          insert into tabprogressivi(nometabella,progr) values(@ptabella,1)
        end
      else
        begin
          select @PPROG=@PPROG+1
          update tabprogressivi set progr=@PPROG where nometabella=@ptabella
        end
    end
  commit transaction
end

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[TP_AllocaProgressivo] TO [Metodo98]
    AS [dbo];

