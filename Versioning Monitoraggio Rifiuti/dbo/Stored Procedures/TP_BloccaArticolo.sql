CREATE procedure TP_BloccaArticolo(@CodArt char(50),@Mag char(10),@Utente char(25),@Blocca smallint,@Bloccato smallint output)
as
begin
  set transaction isolation level serializable
  declare @codice char(50),
  @UT char(25)
  begin transaction
  if @Blocca=1
    begin
      select @codice=null
      select @codice=codice,@ut=utenteblocco from TP_BLOCCO_ARTICOLI where Codice=@codart and Magazzino=@Mag
      if @codice is null
        begin
          insert into TP_BLOCCO_ARTICOLI(Codice,Magazzino,UtenteBlocco,Datablocco) values(@CodArt,@Mag,@utente,getdate())
          select @bloccato=1
        end
      else
        begin
          if @ut=@Utente
            select @bloccato=1
          else
            select @bloccato=0
        end
    end
  else
    begin
      delete from TP_BLOCCO_ARTICOLI where Codice=@codart and Magazzino=@Mag and utenteblocco=@utente
      select @bloccato=1
    end
  commit transaction
end

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[TP_BloccaArticolo] TO [Metodo98]
    AS [dbo];

