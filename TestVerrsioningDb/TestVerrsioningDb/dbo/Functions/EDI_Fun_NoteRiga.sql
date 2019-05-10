

CREATE FUNCTION [dbo].[EDI_Fun_NoteRiga] ()
	RETURNS @TableOfValues table 
				(IDTESTA DECIMAL(10,0),
				 Posizione  INT,
				 DescrizioneArt varchar(350)
				) 
AS 
BEGIN
	INSERT INTO @TableOfValues(IdTesta,Posizione,DescrizioneArt)
	select 
		IdTesta, 
		Row_Number() Over(Partition By IdTesta Order By IdTesta,IdRiga) As Posizione, 
		SUBSTRING(DescrizioneArt,1,350) AS DescrizioneArt
	from 
		righedocumenti 
	where 
		tiporiga IN('D') and DescrizioneArt <> '' 
	Order By POSIZIONE

RETURN 

END


GO
GRANT SELECT
    ON OBJECT::[dbo].[EDI_Fun_NoteRiga] TO [Metodo98]
    AS [dbo];

