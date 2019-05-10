
CREATE VIEW [dbo].[GEM_VistaTotaliContrattoSecondarie]
AS
SELECT     IDCONTRATTO, SEZIONECONTRATTO, Data_Prev, Quantita, 
                      TotImportoVisita, TotProvvVisita
FROM         GEM_VistaTotaliContrattoRevisioni
UNION
SELECT     IDCONTRATTO, SEZIONECONTRATTO, Data_Prev, Quantita, 
                      TotImportoVisita, TotProvvVisita
FROM         GEM_VistaTotaliContrattoCollaudi

GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_VistaTotaliContrattoSecondarie] TO [Metodo98]
    AS [dbo];

