

CREATE procedure [dbo].[TP_OrdinatoArticolo](@Codice char(50),@Deposito char(10),@Ordinato decimal(16,6) output)
as
begin
  declare @dataG datetime
  declare @Ord1 decimal(16,6)
  declare @Ord2 decimal(16,6)
  declare @Prog decimal(10)
  select @Prog=valore from TP_Parametri where nome='UltimoProgressivoGOI'
  select @Ordinato=0
  select @Ord1=ordinato from TP_GOI where CodArt=@Codice and deposito=@Deposito
  select @Ord2=SUM(ordinato)
    from VistaGiacenze where CodArt=@Codice 
    and coddeposito=@Deposito group by CodArt
  if @Ord1 is null
    select @Ord1=0
  if @Ord2 is null
    select @Ord2=0
  select @Ordinato=@Ord1+@Ord2

end


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[TP_OrdinatoArticolo] TO [Metodo98]
    AS [dbo];

