
CREATE PROCEDURE [DBA_CaricaTipologieArticolo]
(
    @ARTICOLO           VARCHAR(50)
) AS
BEGIN

    DECLARE @POSSEP SMALLINT
    DECLARE @ARTICOLOPADRE VARCHAR(50)
    SET @POSSEP = CHARINDEX('#', @ARTICOLO)
    IF (@POSSEP = 0)
    BEGIN
        SET @ARTICOLOPADRE = @ARTICOLO
    END
    ELSE
    BEGIN
        SET @ARTICOLOPADRE = SUBSTRING(@ARTICOLO, 1, @POSSEP-1)
    END

    print 'articolo padre=' + @ARTICOLOPADRE

    DECLARE @ARTTIPOLOGIA SMALLINT
    SELECT @ARTTIPOLOGIA=ARTTIPOLOGIA 
    FROM ANAGRAFICAARTICOLI
    WHERE CODICE = @ARTICOLOPADRE

    IF (@ARTTIPOLOGIA=1)
    BEGIN
        -- tipologie standard
        print 'tipologie standard'
        SELECT 
            TA.NUMEROTIP
            ,TA.CODTIPOLOGIA
            ,TT.DESCRIZIONE
            ,TA.SELVARIANTI
            ,TA.AGGIUNGIDES
            ,TT.CTRLESISTENZA
            ,TT.LUNGVARIANTE 
        FROM 
            TipologieArticoli TA
            INNER JOIN TabTipologie TT 
                ON TA.CodTipologia = TT.Tipologia
        WHERE (TA.NUMEROTIP>0)
            AND (TA.CodiceArt=@ARTICOLOPADRE) 
        ORDER BY TA.NUMEROTIP
    END
    ELSE
    BEGIN
        -- tipologie commerciali
        print 'tipologie commerciali'
        SELECT
            TA.NRRIGA AS NUMEROTIP
            ,TA.CODTIPOLOGIA
            ,TT.DESCRIZIONE
            ,0 AS SELVARIANTI
            ,0 AS AGGIUNGIDES
            ,TT.CTRLESISTENZA
            ,TT.LUNGVARIANTE 
        FROM FEATUREARTICOLO TA
            INNER JOIN TabTipologie TT 
                ON TA.CodTipologia=TT.TIPOLOGIA
        WHERE
            (TA.CodArticolo=@ARTICOLOPADRE)
        ORDER BY
            TA.NRRIGA
    END

END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[DBA_CaricaTipologieArticolo] TO [Metodo98]
    AS [dbo];

