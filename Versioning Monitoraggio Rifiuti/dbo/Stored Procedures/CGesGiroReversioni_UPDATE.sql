
CREATE PROCEDURE CGesGiroReversioni_UPDATE(@NrTerminale Decimal(5), @AnnoRev INT, @MeseRev INT, @CodDestinazione VarChar(10), @CodConto VarChar(20), @ValoreVariabile Decimal(19,6), @ValoreFisso Decimal(19,6), @FlagValido SmallInt) AS

BEGIN
    
    UPDATE CGesGiroReversioni SET CedutaVariabile = CedutaVariabile + @ValoreVariabile, CedutaFisso = CedutaFisso + @ValoreFisso, Validita = @FlagValido
    WHERE NrTerminale=@NrTerminale AND Anno=@AnnoRev AND Mese=@MeseRev AND CodDestinazione=@CodDestinazione AND CodConto=@CodConto

END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[CGesGiroReversioni_UPDATE] TO [Metodo98]
    AS [dbo];

