
CREATE PROCEDURE CGesTransazioniDistribuite_AGGIORNA(@NumeroTransazione Int, @CodConto VarChar(20), @CodDestinazione VarChar(10), @Anno INT, @Mese INT, @CodContoRaccordo VarChar(30), @TipoTransazione SmallInt, @Usa SmallInt, @ValoreVariabile Decimal(19,6), @ValoreFisso Decimal(19,6), @Ambiente VarChar(3), @Utente VarChar(25), @CodDestinazioneRev VarChar(10), @Tipo SmallInt, @Segno SmallInt, @Tipologia SmallInt) AS

BEGIN
    
    DECLARE @RifProgressivo Decimal(10)
    DECLARE @AMB VarChar(3)
    
    SET @RifProgressivo=(SELECT RifProgressivo FROM CGesTransazioniDistribuite WHERE Origine=0 AND RifProgressivo=@NumeroTransazione AND CodConto=@CodConto AND CodDestinazione=@CodDestinazione AND Anno=@Anno AND Mese=@Mese)
    
    IF @RifProgressivo IS NULL 
        
        BEGIN
            
            INSERT INTO CGesTransazioniDistribuite ( Origine, RifProgressivo, CodConto, CodDestinazione, Anno, Mese, CodContoRaccordo, TipoTransazione, Usa, ValoreVariabile, ValoreFisso, Ambiente, UtenteModifica, DataModifica ) 
            VALUES ( 0, @NumeroTransazione, @CodConto, @CodDestinazione, @Anno, @Mese, @CodContoRaccordo, @TipoTransazione, @Usa, @ValoreVariabile, @ValoreFisso, @Ambiente, @Utente, GETDATE() )
            
        END
    
    ELSE
    
        BEGIN
            
            UPDATE CGesTransazioniDistribuite SET CodContoRaccordo = @CodContoRaccordo, TipoTransazione = @TipoTransazione, Usa = @Usa, ValoreVariabile = ValoreVariabile + @ValoreVariabile, ValoreFisso = ValoreFisso + @ValoreFisso, Ambiente = @Ambiente, UtenteModifica = @Utente, DataModifica = GETDATE()
            WHERE Origine=0 AND RifProgressivo=@NumeroTransazione AND CodConto=@CodConto AND CodDestinazione=@CodDestinazione AND Anno=@Anno AND Mese=@Mese
            
        END
    
    IF @Usa = 1
        
        BEGIN
            
            SET @AMB=(SELECT Ambiente FROM CGesValoriStorici WHERE Ambiente=@Ambiente AND CodDestinazione=@CodDestinazione AND CodConto=@CodConto AND CodDestinazioneRev=@CodDestinazioneRev AND Tipo=@Tipo AND Anno=@Anno AND Mese=@Mese)
            
            IF @AMB IS NULL 
                
                BEGIN
                    
                    INSERT INTO CGesValoriStorici ( Ambiente, CodDestinazione, CodConto, CodDestinazioneRev, Tipo, Anno, Mese, ValoreVariabile, ValoreFisso, Segno, Tipologia, UtenteModifica, DataModifica ) 
                    VALUES ( @Ambiente, @CodDestinazione, @CodConto, @CodDestinazioneRev, @Tipo, @Anno, @Mese, @ValoreVariabile, @ValoreFisso, @Segno, @Tipologia, @Utente, GETDATE() )
                    
                END
                
            ELSE
                
                BEGIN
                    
                    UPDATE CGesValoriStorici SET ValoreVariabile = ValoreVariabile + @ValoreVariabile, ValoreFisso = ValoreFisso + @ValoreFisso, Segno = @Segno, Tipologia = @Tipologia, UtenteModifica = @Utente, DataModifica = GETDATE()
                    WHERE Ambiente=@Ambiente AND CodDestinazione=@CodDestinazione AND CodConto=@CodConto AND CodDestinazioneRev=@CodDestinazioneRev AND Tipo=@Tipo AND Anno=@Anno AND Mese=@Mese
                    
                END
                
        END
        
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[CGesTransazioniDistribuite_AGGIORNA] TO [Metodo98]
    AS [dbo];

