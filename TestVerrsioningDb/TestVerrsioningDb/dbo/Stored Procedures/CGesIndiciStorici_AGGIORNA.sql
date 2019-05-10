
CREATE PROCEDURE CGesIndiciStorici_AGGIORNA(@Ambiente VarChar(3), @CodDestinazione VarChar(10), @Tipo SmallInt, @Anno INT, @Mese INT, @ValoreVariabile Decimal(19,6), @ValoreFisso Decimal(19,6), @QtaPrimaria Decimal(16,6), @QtaPrimaria2 Decimal(16,6), @QtaSecondaria Decimal(16,6), @QtaSecondaria2 Decimal(16,6), @TipoMisurazione SmallInt, @UMPrimaria VarChar(5), @UMPrimaria2 VarChar(5), @UMSecondaria VarChar(5), @UMSecondaria2 VarChar(5), @TipoRiclassificazione VarChar(5), @Note VarChar(30), @Utente VarChar(25)) AS

BEGIN
    
    DECLARE @ANNOAPP Decimal(5)
    
    SET @ANNOAPP=(SELECT Anno FROM CGesIndiciStorici WHERE Ambiente=@Ambiente AND CodDestinazione=@CodDestinazione AND Tipo=@Tipo AND Anno=@Anno AND Mese=@Mese)
    
    IF @ANNOAPP IS NULL 
        
        BEGIN
            
            INSERT INTO CGesIndiciStorici ( Ambiente, CodDestinazione, Tipo, Anno, Mese, ValoreVariabile, ValoreFisso, QtaPrimaria, QtaPrimaria2, QtaSecondaria, QtaSecondaria2, TipoMisurazione, UMPrimaria, UMPrimaria2, UMSecondaria, UMSecondaria2, TipoRiclassificazione, Note, UtenteModifica, DataModifica ) 
            VALUES ( @Ambiente, @CodDestinazione, @Tipo, @Anno, @Mese, @ValoreVariabile, @ValoreFisso, @QtaPrimaria, @QtaPrimaria2, @QtaSecondaria, @QtaSecondaria2, @TipoMisurazione, @UMPrimaria, @UMPrimaria2, @UMSecondaria, @UMSecondaria2, @TipoRiclassificazione, @Note, @Utente, GETDATE() )
            
        END
    
    ELSE
        
    BEGIN
    
        UPDATE CGesIndiciStorici SET ValoreVariabile = @ValoreVariabile, ValoreFisso = @ValoreFisso, QtaPrimaria = @QtaPrimaria, QtaPrimaria2 = @QtaPrimaria2, QtaSecondaria = @QtaSecondaria, QtaSecondaria2 = @QtaSecondaria2, TipoMisurazione = @TipoMisurazione, UMPrimaria = @UMPrimaria, UMPrimaria2 = @UMPrimaria2, UMSecondaria = @UMSecondaria, UMSecondaria2 = @UMSecondaria2, TipoRiclassificazione = @TipoRiclassificazione, Note = @Note, UtenteModifica = @Utente, DataModifica = GETDATE()
        WHERE Ambiente=@Ambiente AND CodDestinazione=@CodDestinazione AND Tipo=@Tipo AND Anno=@Anno AND Mese=@Mese
    
    END
        
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[CGesIndiciStorici_AGGIORNA] TO [Metodo98]
    AS [dbo];

