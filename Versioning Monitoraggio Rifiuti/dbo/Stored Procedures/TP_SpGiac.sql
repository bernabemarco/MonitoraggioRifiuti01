CREATE procedure TP_SpGiac
as
begin
  
	delete from TP_Giac
	insert into TP_Giac(CODART,Deposito,Giacenza,Ordinato,Impegnato)
	select anagraficaarticoli.Codice,VistaGiacenze.CODDeposito,
		sum(VistaGiacenze.Carico+VistaGiacenze.ResoDaScarico-VistaGiacenze.Scarico-VistaGiacenze.ResoDaCarico), /*GIACENZA*/
		sum(VistaGiacenze.Ordinato),
		sum(VistaGiacenze.Impegnato)
	from ANAGRAFICAARTICOLI join VistaGiacenze
	on ANAGRAFICAARTICOLI.Codice=VistaGiacenze.CodArt
	group by anagraficaarticoli.Codice,VistaGiacenze.CODDeposito
end


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[TP_SpGiac] TO [Metodo98]
    AS [dbo];

