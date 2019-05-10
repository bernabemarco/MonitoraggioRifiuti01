create view TP_VISTA_TIPOLISTINI
AS
  SELECT       
  	NRLISTINO, DESCRIZIONE, TP_TIPO, 
  	(CASE WHEN tp_tipo = 'A' THEN 'Acquisto' ELSE 'Vendita' END) AS Desc_TIPO
  FROM       
  	Tablistini

GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_VISTA_TIPOLISTINI] TO [Metodo98]
    AS [dbo];

