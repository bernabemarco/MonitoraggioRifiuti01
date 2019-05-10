

-- EXEC _FEGetAllegati '575'
CREATE PROCEDURE _FEGetAllegati  (@Chiave1 as varchar(100)) AS 

	declare @NomeFilePDF as varchar(100)
	select @NomeFilePDF = (Tipodoc+cast(esercizio as varchar(4))+numrifdoc+'-'+replace(CODCLIFOR,' ','_')) +'.pdf'
	from testedocumenti where progressivo = @Chiave1
	SELECT PathPDF+'\'+@NomeFilePDF as NomeFile, 'S' as TipoFile from ALD_B2B_PARAMETRI
	--SELECT 'path completo ' as NomeFile, 'S' as TipoFile  where 1 = 0
	-- Se TipoFile = 'Z' il NomeFile verrà zippato


