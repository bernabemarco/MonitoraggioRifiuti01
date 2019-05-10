
create view CRM_Vista_Tab1RapportoMaxOfferte
as
SELECT     idRapporto, MAX(idOffertaCRM) AS idOffertaCRM
FROM         CRM_ALD_TabRiffOffertaIdRapportoGemma AS TRappOfferte
GROUP BY idRapporto

GO
GRANT DELETE
    ON OBJECT::[dbo].[CRM_Vista_Tab1RapportoMaxOfferte] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CRM_Vista_Tab1RapportoMaxOfferte] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CRM_Vista_Tab1RapportoMaxOfferte] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CRM_Vista_Tab1RapportoMaxOfferte] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CRM_Vista_Tab1RapportoMaxOfferte] TO [Metodo98]
    AS [dbo];

