
CREATE PROCEDURE CGesCalcoloReversioni_AGGIORNA(@NrTerminale Decimal(5), @CodDestinazione VarChar(10), @CodConto VarChar(20), @CodDestinazioneRev VarChar(10), @AnnoRev INT, @MeseRev INT, @ValoreVariabile Decimal(19,6), @ValoreFisso Decimal(19,6), @FlagValido SmallInt, @Tipologia SmallInt, @TipoReversioni SmallInt) AS

BEGIN
    
    DECLARE @NTERM Decimal(5)
    
    SET @NTERM=(SELECT NrTerminale FROM CGesCalcoloReversioni WHERE NrTerminale=@NrTerminale AND CodDestinazione=@CodDestinazioneRev AND CodConto=@CodConto AND CodDestinazioneRev=@CodDestinazione AND Tipo=@TipoReversioni AND Anno=@AnnoRev AND Mese=@MeseRev)
    
    IF @NTERM IS NULL 
        
        BEGIN
            
            INSERT INTO CGesCalcoloReversioni ( NrTerminale, CodDestinazione, CodConto, CodDestinazioneRev, Tipo, Anno, Mese, ValoreVariabile, ValoreFisso, Segno, Tipologia, FlagReversione, NumReversione ) 
            VALUES ( @NrTerminale, @CodDestinazioneRev, @CodConto, @CodDestinazione, @TipoReversioni, @AnnoRev, @MeseRev, @ValoreVariabile, @ValoreFisso, 1, @Tipologia, 0, 0 )
            
        END
    
    ELSE
    
        BEGIN
            
            UPDATE CGesCalcoloReversioni SET ValoreVariabile = ValoreVariabile + @ValoreVariabile, ValoreFisso = ValoreFisso + @ValoreFisso, Tipologia = @Tipologia
            WHERE NrTerminale=@NrTerminale AND CodDestinazione=@CodDestinazioneRev AND CodConto=@CodConto AND CodDestinazioneRev=@CodDestinazione AND Tipo=@TipoReversioni AND Anno=@AnnoRev AND Mese=@MeseRev
            
        END

END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[CGesCalcoloReversioni_AGGIORNA] TO [Metodo98]
    AS [dbo];

