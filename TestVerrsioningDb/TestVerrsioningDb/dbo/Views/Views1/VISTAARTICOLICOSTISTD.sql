CREATE VIEW VISTAARTICOLICOSTISTD AS
SELECT 
	Codice, Descrizione, TipoProdotto, (CASE TipoProdotto WHEN 0 THEN 'Finito' ELSE (CASE TipoProdotto WHEN 1 THEN 'Semilavorato' ELSE 'Materiale di base' END) END) As DesTipoProdotto, 
	Provenienza, (CASE Provenienza WHEN 0 THEN 'Acquisti' ELSE (CASE Provenienza WHEN 1 THEN 'Produzione' ELSE 'Conto Lavoro' END) END) As DesProvenienza,
	Categoria,
	CodCategoriaStat,
	Gruppo
FROM 
	VISTAANAGRAFICAARTICOLI

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTAARTICOLICOSTISTD] TO [Metodo98]
    AS [dbo];

