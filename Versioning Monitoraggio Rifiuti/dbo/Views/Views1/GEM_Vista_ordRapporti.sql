
CREATE VIEW GEM_Vista_ordRapporti
AS
SELECT     IDRAPPORTO, cast(rp.DATA_EFF as decimal(18,9)) as num_dataEff, 
cast(rp.DATA_ULT_MOD as decimal(18,9)) as num_data_ULT_MOD, 
cast(rp.DataSync as decimal(18,9)) as num_dataSync
FROM         GEM_SEZIONECONTRATTORAPPORTI AS rp

GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_Vista_ordRapporti] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_Vista_ordRapporti] TO [Metodo98]
    AS [dbo];

