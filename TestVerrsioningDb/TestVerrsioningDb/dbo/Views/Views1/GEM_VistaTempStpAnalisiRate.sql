
create VIEW [dbo].[GEM_VistaTempStpAnalisiRate]
AS
SELECT     GEM_TEMP_STP_AnalisiRate.UTENTEMODIFICA, SUM(GEM_SEZIONECONTRATTO_RATE.IMPRATASFS) 
                      AS TotaleIMPRATASFS
FROM         GEM_TEMP_STP_AnalisiRate INNER JOIN
                      GEM_SEZIONECONTRATTO_RATE ON GEM_TEMP_STP_AnalisiRate.IDCONTRATTO = GEM_SEZIONECONTRATTO_RATE.IDCONTRATTO AND 
                      GEM_TEMP_STP_AnalisiRate.NUMERORATA = GEM_SEZIONECONTRATTO_RATE.NUMERORATA
GROUP BY GEM_TEMP_STP_AnalisiRate.UTENTEMODIFICA

GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_VistaTempStpAnalisiRate] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_VistaTempStpAnalisiRate] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GEM_VistaTempStpAnalisiRate] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_VistaTempStpAnalisiRate] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_VistaTempStpAnalisiRate] TO [Metodo98]
    AS [dbo];

