
CREATE VIEW [dbo].[GEM_TEMP_Vista_RapportiInStampa]
AS
select IDRAPPORTO, utentemodifica_stp from GEM_TEMP_SEZIONECONTRATTORAPPORTIMEZZI group by IDRAPPORTO, utentemodifica_stp


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_TEMP_Vista_RapportiInStampa] TO [Metodo98]
    AS [dbo];

