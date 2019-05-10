

Create View [dbo].[EDI_View_NoteRiga]
AS
	SELECT 
		IdTesta,Posizione,DescrizioneArt 
	FROM [dbo].[EDI_Fun_NoteRiga]()

GO
GRANT SELECT
    ON OBJECT::[dbo].[EDI_View_NoteRiga] TO [Metodo98]
    AS [dbo];

