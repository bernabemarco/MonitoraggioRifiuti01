create view VISTATIPIECCEZIONI as
	select top 1 1 CODICE,'Consegna Scaduta' DESCRIZIONE from NUMERI
	union select top 1 2 CODICE,'Impegno Scaduto' DESCRIZIONE from NUMERI
	union select top 1 3 CODICE,'Fabbisogno Scaduto' DESCRIZIONE from NUMERI
	union select top 1 4 CODICE,'Proposta in Ritardo' DESCRIZIONE from NUMERI
	union select top 1 5 CODICE,'Anticipa Totale' DESCRIZIONE from NUMERI
	union select top 1 6 CODICE,'Anticipa Parziale' DESCRIZIONE from NUMERI
	union select top 1 7 CODICE,'Residuo Anticipo' DESCRIZIONE from NUMERI
	union select top 1 8 CODICE,'Riduci' DESCRIZIONE from NUMERI
	union select top 1 9 CODICE,'Annulla' DESCRIZIONE from NUMERI

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTATIPIECCEZIONI] TO [Metodo98]
    AS [dbo];

