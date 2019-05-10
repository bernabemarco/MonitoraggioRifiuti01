
CREATE FUNCTION [dbo].[zzFNGetIndicatoriQualita]
	(
		@Cliente VARCHAR(7),
		@Esercizio DECIMAL(5, 0)
	)
RETURNS @Stato TABLE
	(
		Descrizione VARCHAR(255) NOT NULL DEFAULT '',
		Valore VARCHAR(255) NOT NULL DEFAULT '',
		TipoValore SMALLINT NOT NULL DEFAULT 0,
		ColoreSfondo INT NOT NULL DEFAULT 0,
		ColoreCarattere INT NOT NULL DEFAULT 0
	)
AS
BEGIN
	/*
	Legenda TipoValore:

	0 - Testo Generico
	1 - Data
	2 - Numero Intero
	3 - Numero Decimale
	4 - Percentuale
	5 - Valuta

	Legenda Colore:

	0 - Colore di default

	*/

	DECLARE @ColoreSfondo INT
	DECLARE @ColoreCarattere INT
	
	SET @ColoreSfondo = 0
	SET @ColoreCarattere = 0
	
	/* 1 - Non Conformit� ricevute. */
	
	/* 2 - Delta tra data di conferma e data di consegna. */
	
	DECLARE @DiffGiorniConsegna DECIMAL(19, 6)
		
	SELECT @DiffGiorniConsegna = AVG(CONVERT(DECIMAL, ISNULL(DIFF, 0)))
	FROM zzDiffGiorniConsegna
	WHERE CODCLIFOR = @Cliente
			AND YEAR(DCBOLLA)=@ESERCIZIO
	
	INSERT INTO @Stato (
		Descrizione,
		Valore,
		TipoValore,
		ColoreSfondo,
		ColoreCarattere
		)
	VALUES (
		'Delta Data Conferma -> Data Consegna',
		CONVERT(VARCHAR, ISNULL(@DiffGiorniConsegna, 0)),
		3,
		@ColoreSfondo,
		@ColoreCarattere
		)
		
	/* 3 - Percentuale Ritardi di Consegna. */
	
	DECLARE @PercRitardi DECIMAL(19, 6)
	DECLARE @Ritardi DECIMAL(19, 6)
	DECLARE @NonRitardi DECIMAL(19, 6)

	set @Ritardi = (select count(*)  
					from zzDiffGiorniConsegna
					WHERE CODCLIFOR = @Cliente
					AND YEAR(DCBOLLA)=@ESERCIZIO and diff>0)

	set @NonRitardi = (select count(*)  
						from zzDiffGiorniConsegna
						WHERE CODCLIFOR = @Cliente
						AND YEAR(DCBOLLA)=@ESERCIZIO)

	if @NonRitardi<>0 set @PercRitardi=@Ritardi/@NonRitardi 
	if @NonRitardi=0 set @PercRitardi=0 

	INSERT INTO @Stato (
		Descrizione,
		Valore,
		TipoValore,
		ColoreSfondo,
		ColoreCarattere
		)
	VALUES (
		'Percentuale Ritardi di Consegna',
		CONVERT(VARCHAR, ISNULL(@PercRitardi, 0)),
		4,
		@ColoreSfondo,
		@ColoreCarattere
		)

    RETURN                
END

GO
GRANT SELECT
    ON OBJECT::[dbo].[zzFNGetIndicatoriQualita] TO [Metodo98]
    AS [dbo];

