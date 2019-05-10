
CREATE View [dbo].[VISTA_TRASPORTO_CODICI]
AS 
	SELECT        
		CODICE, 
		TIPO, 
		DESCRIZIONE
	FROM            
		TRASPORTO_CAD_CODICI
	Where 
		Left(Codice ,1) <>'B'
	UNION ALL
	SELECT 
		CODSCONTO AS CODICE,  
		20 as Tipo,
		DescrizioneSconto
	FROM 
		ScontiEstesi
	UNION ALL 
	SELECT 
		CODICE, 
		Tipo +30, 
		Descrizione
	FROM 
		Contratti_ConfigSconti



GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTA_TRASPORTO_CODICI] TO [Metodo98]
    AS [dbo];

