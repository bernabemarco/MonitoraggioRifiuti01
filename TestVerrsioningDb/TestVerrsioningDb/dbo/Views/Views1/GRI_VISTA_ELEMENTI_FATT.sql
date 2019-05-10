

-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ GRI_VISTA_ELEMENTI_FATT
CREATE VIEW [dbo].[GRI_VISTA_ELEMENTI_FATT] AS
	SELECT 
		EF.IdRapporto,
		RI.IdContratto,
		RI.SezioneContratto,
		EF.TipologiaElemento,
		CASE EF.TipologiaElemento WHEN 'S' THEN 1000 WHEN 'M' THEN 2000 WHEN 'O' THEN 3000 WHEN 'R' THEN 3000 WHEN 'D' THEN 
			CASE DscrizioneRiga WHEN 'Riepilogo SERVIZI ACCESSORI' THEN 999 WHEN 'Riepilogo MATERIALI' THEN 1999 WHEN 'Riepilogo ORE LAVORO' THEN 2999 else 0 END
		END as IDRIga,
		EF.CodArticolo,
		EF.DscrizioneRiga,
		SUM(EF.QTA) as qta,
		EF.Prezzo,
		EF.Sconto,
		ROUND(ISNULL(EF.prezzo,0) * (1-(ISNULL(EF.sconto,0)/100)),5) AS PREZZONETTO,
		ROUND((ISNULL(EF.prezzo,0) * (1-(ISNULL(EF.sconto,0)/100))*SUM(EF.QTA)),2) AS TOTNETTORIGA,
		ROUND((ISNULL(EF.prezzo,0) *SUM(EF.QTA)),2) AS TOTLORDORIGA,
		EF.Provvigione1,
		EF.Provvigione2,
		EF.Provvigione3,
		EF.Posizione,
		ISNULL(RI.IdDivisione,0) IdDivisione
	FROM dbo.GRI_RAPPORTI_ELEMENTI_DA_FATTURARE EF
	INNER JOIN dbo.GRI_RAPPORTI RI ON RI.IDRAPPORTO=EF.IDRAPPORTO
	GROUP BY 
		EF.IdRapporto,
		RI.IdContratto,
		RI.SezioneContratto,
		EF.TipologiaElemento,
		EF.CodArticolo,
		EF.DscrizioneRiga,
		EF.Prezzo,
		EF.Sconto,
		EF.Provvigione1,
		EF.Provvigione2,
		EF.Provvigione3,
		EF.Posizione,
		RI.IdDivisione

GO
GRANT DELETE
    ON OBJECT::[dbo].[GRI_VISTA_ELEMENTI_FATT] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GRI_VISTA_ELEMENTI_FATT] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GRI_VISTA_ELEMENTI_FATT] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GRI_VISTA_ELEMENTI_FATT] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GRI_VISTA_ELEMENTI_FATT] TO [Metodo98]
    AS [dbo];

