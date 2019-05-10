create view VistaBarCode as 
(
	select 
		AA.*,
		BB.Barcode,
		BB.Descrizione DscBarCode,
		BB.UM UMBarCode,
		BB.Preferenziale
	from
		AnagraficaArticoli AA LEFT OUTER JOIN BarCodePos BB ON AA.Codice=BB.Codart
)

GO
GRANT DELETE
    ON OBJECT::[dbo].[VistaBarCode] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[VistaBarCode] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[VistaBarCode] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[VistaBarCode] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[VistaBarCode] TO [Metodo98]
    AS [dbo];

