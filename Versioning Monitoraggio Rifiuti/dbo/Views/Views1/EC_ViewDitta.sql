

CREATE VIEW [dbo].[EC_ViewDitta]

AS
	select 
		 (RAGSOCCOGNOME + ' ' + RAGSOCNOME) As RagioneSociale 
		,(Case when PERSONAFG = 'G' then PARTITAIVA ELSE CODICEFISCALE END) As PartitaIVA
	from 
		TABDITTE

GO
GRANT SELECT
    ON OBJECT::[dbo].[EC_ViewDitta] TO [Metodo98]
    AS [dbo];

