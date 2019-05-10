CREATE procedure TP_ImpegnatoArticolo @Codice char(50),@Deposito char(10),@Impegnato decimal(16,6) output
as
begin
  /* Dopo sistemata questa sistemare anche tp_ordinato*/
  declare @Prog decimal(10)
  declare @Imp1 decimal(16,6)
  declare @Imp2 decimal(16,6)
  select @Prog=valore from TP_Parametri where nome='UltimoProgressivoGOI'
  select @Impegnato=0
  select @Imp1=Impegnato from TP_GOI where CodArt=@Codice and deposito=@Deposito
  select @Imp2=SUM(Impegnato)
    from VistaGiacenze where  progressivo>@Prog and CodArt=@Codice and coddeposito=@Deposito
    group by CodArt
  if @Imp1 is null
    select @Imp1=0
  if @Imp2 is null
    select @Imp2=0
  select @Impegnato=@Imp1+@Imp2
 /* if @Impegnato<0
    select @Impegnato=0*/
end

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[TP_ImpegnatoArticolo] TO [Metodo98]
    AS [dbo];

