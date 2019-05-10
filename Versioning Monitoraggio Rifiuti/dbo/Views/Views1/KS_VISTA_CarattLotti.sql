create view KS_VISTA_CarattLotti as
	select cardescrizione as descrizione ,cartipo as tipo from tabcarattlotti
	group by cardescrizione,cartipo

GO
GRANT SELECT
    ON OBJECT::[dbo].[KS_VISTA_CarattLotti] TO [Metodo98]
    AS [dbo];

