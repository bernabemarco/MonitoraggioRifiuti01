CREATE procedure TP_CGOISINGOLO(@codart char(50),@mag char(10))
as
begin
  declare @Prog decimal(10)
	delete from TP_GOI where codart=@codart and deposito=@mag
	select @prog=valore from tp_parametri where nome='UltimoProgressivoGOI'
	insert into TP_GOI(CODART,Deposito,Giacenza,Ordinato,Impegnato,NumOrdFor)
	select anagraficaarticoli.Codice,VistaGiacenze.CODDeposito,
	          sum(VistaGiacenze.Carico+VistaGiacenze.ResoDaScarico-VistaGiacenze.Scarico-VistaGiacenze.ResoDaCarico), /*GIACENZA*/
	          sum(VistaGiacenze.Ordinato),
	          sum(VistaGiacenze.Impegnato),
                       (select sum(case when esercizio<>year(getdate()) or ordinato is null or ordinato=0 then 0 else 1 end) as nof
	           from    righedocumenti join tabcausalimag on righedocumenti.causalemag=tabcausalimag.codice 
                        where righedocumenti.Codart=ANAGRAFICAARTICOLI.Codice and righedocumenti.coddeposito=VistaGiacenze.CODDeposito 
	           group by righedocumenti.Codart,righedocumenti.coddeposito)
	from ANAGRAFICAARTICOLI join VistaGiacenze
	on ANAGRAFICAARTICOLI.Codice=VistaGiacenze.CodArt
	where VistaGiacenze.progressivo<=@prog 
             AND ANAGRAFICAARTICOLI.Codice=@codart
             AND VistaGiacenze.CODDeposito=@mag
             group by anagraficaarticoli.Codice,VistaGiacenze.CODDeposito
	/* azzera i campi null di tp_goi*/
	update TP_GOI set numordfor=0 where numordfor is null
/* Se modifichi questa Procedura vedi anche trigger in storicomag (TP_AggiornaGOI) e metodo salva nello stddoc*/
end

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[TP_CGOISINGOLO] TO [Metodo98]
    AS [dbo];

