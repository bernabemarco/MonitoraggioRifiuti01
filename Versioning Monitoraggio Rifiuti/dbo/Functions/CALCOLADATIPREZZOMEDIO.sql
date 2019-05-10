
CREATE FUNCTION [dbo].[CALCOLADATIPREZZOMEDIO](@CodArt VARCHAR(MAX), @Esercizio AS SMALLINT, @AllaData DATETIME, @TipoQta VARCHAR(1), @MovRipVal VARCHAR(1))
RETURNS @TMPPRM TABLE 
(
    CODART              VARCHAR(MAX),
    QTACARICO           DECIMAL(16, 6),
    QTASCARICO          DECIMAL(16, 6),
    VALORECARICO        DECIMAL(19, 6),
    VALORECARICOEURO    DECIMAL(19, 6)
)
AS
BEGIN
    DECLARE @TMPVALORECARICO DECIMAL(19, 6)
    DECLARE @NUMREC SMALLINT

    IF @MovRipVal='0'
        BEGIN
        INSERT INTO @TMPPRM(CODART,QTACARICO,QTASCARICO,VALORECARICO,VALORECARICOEURO)
        SELECT 
            CODART,
            (CASE WHEN @TipoQta='1' THEN SUM(QTACARICO) ELSE SUM(QTACARICO2UM) END) AS QTACARICO, 
            (CASE WHEN @TipoQta='1' THEN SUM(QTASCARICO) ELSE SUM(QTASCARICO2UM) END) AS QTASCARICO, 
            SUM(VALORECARICO) AS VALORECARICO, 
            SUM(VALORECARICOEURO) AS VALORECARICOEURO
        FROM 
            VistaGiacenze 
        WHERE 
            CodArt = @CodArt AND 
            Esercizio = @Esercizio AND
            DataMov <= @AllaData AND
            RipValGiac0 = 0 AND
            (SELECT RipresaValore FROM TabCausaliMag WHERE TabCausaliMag.Codice=CodCausale)=0
        GROUP BY 
            CodArt

        SELECT @TMPVALORECARICO = VALORECARICOEURO FROM @TMPPRM
        IF ISNULL(@TMPVALORECARICO,0) = 0 
            BEGIN
            DELETE FROM @TMPPRM

            INSERT INTO @TMPPRM(CODART,QTACARICO,QTASCARICO,VALORECARICO,VALORECARICOEURO)
            SELECT 
                CODART,
                (CASE WHEN @TipoQta='1' THEN SUM(QTACARICO) ELSE SUM(QTACARICO2UM) END) AS QTACARICO, 
                (CASE WHEN @TipoQta='1' THEN SUM(QTASCARICO) ELSE SUM(QTASCARICO2UM) END) AS QTASCARICO, 
                SUM(VALORECARICO) AS VALORECARICO, 
                SUM(VALORECARICOEURO) AS VALORECARICOEURO
            FROM 
                VistaGiacenze 
            WHERE 
                CodArt = @CodArt AND 
                Esercizio = @Esercizio AND
                DataMov <= @AllaData AND
                (SELECT RipresaValore FROM TabCausaliMag WHERE TabCausaliMag.Codice=CodCausale)=0
            GROUP BY 
                CodArt
            END
        END
    ELSE
        BEGIN
        INSERT INTO @TMPPRM(CODART,QTACARICO,QTASCARICO,VALORECARICO,VALORECARICOEURO)
        SELECT 
            CODART,
            (CASE WHEN @TipoQta='1' THEN SUM(QTACARICO) ELSE SUM(QTACARICO2UM) END) AS QTACARICO, 
            (CASE WHEN @TipoQta='1' THEN SUM(QTASCARICO) ELSE SUM(QTASCARICO2UM) END) AS QTASCARICO, 
            SUM(VALORECARICO) AS VALORECARICO, 
            SUM(VALORECARICOEURO) AS VALORECARICOEURO
        FROM 
            VistaGiacenze 
        WHERE 
            CodArt = @CodArt AND 
            Esercizio = @Esercizio AND
            DataMov <= @AllaData AND
            RipValGiac0 = 0 
        GROUP BY 
            CodArt
        
        SELECT @TMPVALORECARICO = VALORECARICOEURO FROM @TMPPRM
        IF ISNULL(@TMPVALORECARICO,0) = 0 
            BEGIN
            DELETE FROM @TMPPRM

            INSERT INTO @TMPPRM(CODART,QTACARICO,QTASCARICO,VALORECARICO,VALORECARICOEURO)
            SELECT 
                CODART,
                (CASE WHEN @TipoQta='1' THEN SUM(QTACARICO) ELSE SUM(QTACARICO2UM) END) AS QTACARICO, 
                (CASE WHEN @TipoQta='1' THEN SUM(QTASCARICO) ELSE SUM(QTASCARICO2UM) END) AS QTASCARICO, 
                SUM(VALORECARICO) AS VALORECARICO, 
                SUM(VALORECARICOEURO) AS VALORECARICOEURO
            FROM 
                VistaGiacenze 
            WHERE 
                CodArt = @CodArt AND 
                Esercizio = @Esercizio AND
                DataMov <= @AllaData
            GROUP BY 
                CodArt
            END
        END

    SELECT @NUMREC=COUNT(*) FROM @TMPPRM
    IF @NUMREC=0
        INSERT INTO @TMPPRM(CODART,QTACARICO,QTASCARICO,VALORECARICO,VALORECARICOEURO) VALUES (@CodArt,0,0,0,0)
    RETURN
END

GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CALCOLADATIPREZZOMEDIO] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CALCOLADATIPREZZOMEDIO] TO [Metodo98]
    AS [dbo];

