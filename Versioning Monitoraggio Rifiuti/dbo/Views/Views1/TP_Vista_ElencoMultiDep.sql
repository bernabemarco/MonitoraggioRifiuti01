
Create View TP_Vista_ElencoMultiDep
AS
	Select MagPr.Progressivo, MagPr.CodDeposito As Deposito, Anagraficadepositi.Descrizione, 0 as Ordine
	From TP_TABMagazzini As MagPr
	Inner join Anagraficadepositi
		On Anagraficadepositi.Codice=MagPr.CodDeposito
	Union
	Select MagAss1.Progressivo, MagAss1.CodDepAss1 As Deposito, Anagraficadepositi.Descrizione, 1 as Ordine 
	From TP_TABMagazzini as MagAss1 
	Inner join Anagraficadepositi
		On Anagraficadepositi.Codice=MagAss1.CodDepAss1
	where MagAss1.CodDepAss1<>''
	Union
	Select MagAss2.Progressivo, MagAss2.CodDepAss2 As Deposito, Anagraficadepositi.Descrizione, 2 as Ordine 
	From TP_TABMagazzini as MagAss2
	Inner join Anagraficadepositi
		On Anagraficadepositi.Codice=MagAss2.CodDepAss2
	where MagAss2.CodDepAss2<>''
	Union
	Select MagAss3.Progressivo, MagAss3.CodDepAss3 As Deposito, Anagraficadepositi.Descrizione, 3 as Ordine 
	From TP_TABMagazzini as MagAss3
	Inner join Anagraficadepositi
		On Anagraficadepositi.Codice=MagAss3.CodDepAss3
	where MagAss3.CodDepAss3<>''

GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_Vista_ElencoMultiDep] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_Vista_ElencoMultiDep] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_Vista_ElencoMultiDep] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_Vista_ElencoMultiDep] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_Vista_ElencoMultiDep] TO [Metodo98]
    AS [dbo];

