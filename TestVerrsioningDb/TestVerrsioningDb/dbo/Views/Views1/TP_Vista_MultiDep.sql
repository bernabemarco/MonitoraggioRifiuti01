

Create View TP_Vista_MultiDep
AS
	Select TP_TabMagazzini.Progressivo,
	TP_TabMagazzini.CodDeposito,
	AnagraficaDepositi.Descrizione
	from TP_TabMagazzini
	inner join anagraficadepositi
		on AnagraficaDepositi.codice=TP_TabMagazzini.CodDeposito


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_Vista_MultiDep] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_Vista_MultiDep] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_Vista_MultiDep] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_Vista_MultiDep] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_Vista_MultiDep] TO [Metodo98]
    AS [dbo];

