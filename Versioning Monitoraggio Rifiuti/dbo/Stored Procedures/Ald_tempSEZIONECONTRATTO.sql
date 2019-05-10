/* Procedura per eliminazione automatica della tabella temporanea - pianificata da SQL */
CREATE PROCEDURE [dbo].[Ald_tempSEZIONECONTRATTO]  

AS

    --DELETE FROM  GEM_TEMP_SEZIONECONTRATTORAPPORTIMEZZI
	 TRUNCATE TABLE [Sicura].[dbo].[GEM_TEMP_SEZIONECONTRATTORAPPORTIMEZZI]

RETURN 0 


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[Ald_tempSEZIONECONTRATTO] TO [Metodo98]
    AS [dbo];

