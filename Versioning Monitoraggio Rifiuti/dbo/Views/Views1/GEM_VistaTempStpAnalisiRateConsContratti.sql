
create VIEW [dbo].[GEM_VistaTempStpAnalisiRateConsContratti]
AS
SELECT     GEM_TEMP_STP_AnalisiRate.UTENTEMODIFICA, GEM_TEMP_STP_AnalisiRate.IDCONTRATTO
FROM         GEM_TEMP_STP_AnalisiRate 
GROUP BY GEM_TEMP_STP_AnalisiRate.UTENTEMODIFICA,  GEM_TEMP_STP_AnalisiRate.IDCONTRATTO

GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_VistaTempStpAnalisiRateConsContratti] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_VistaTempStpAnalisiRateConsContratti] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GEM_VistaTempStpAnalisiRateConsContratti] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_VistaTempStpAnalisiRateConsContratti] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_VistaTempStpAnalisiRateConsContratti] TO [Metodo98]
    AS [dbo];

