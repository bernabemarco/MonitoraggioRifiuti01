
CREATE PROCEDURE CGesTransazioniDistribuite_ANNULLA(@Tipo SmallInt, @NumeroTransazione Int, @Utente VarChar(25), @Segno SmallInt, @Tipologia SmallInt) AS

BEGIN
    
    DECLARE @Usa SmallInt
    DECLARE @ValoreVariabile Decimal(19,6)
    DECLARE @ValoreFisso Decimal(19,6)
    DECLARE @Ambiente VarChar(3)
    DECLARE @CodDestinazione VarChar(10)
    DECLARE @CodConto VarChar(20)
    DECLARE @Anno Decimal(5)
    DECLARE @Mese SmallInt
    DECLARE @AMB VarChar(3)
    
    DECLARE ElencoDistr CURSOR FOR 
        SELECT Usa, ValoreVariabile, ValoreFisso, Ambiente, CodDestinazione, CodConto, Anno, Mese
        FROM CGesTransazioniDistribuite
        WHERE Origine=@Tipo AND RifProgressivo=@NumeroTransazione ORDER BY CodConto, CodDestinazione, Anno, Mese
    
    OPEN ElencoDistr
    
    FETCH NEXT FROM ElencoDistr INTO @Usa, @ValoreVariabile, @ValoreFisso, @Ambiente, @CodDestinazione, @CodConto, @Anno, @Mese
    
    WHILE @@FETCH_STATUS = 0
        
        BEGIN
            
            IF @Usa = 1
                
                BEGIN
                    
                    SET @AMB=(SELECT Ambiente FROM CGesValoriStorici WHERE Ambiente=@Ambiente AND CodDestinazione=@CodDestinazione AND CodConto=@CodConto AND CodDestinazioneRev=@CodDestinazione AND Tipo=0 AND Anno=@Anno AND Mese=@Mese)
                    
                    IF @AMB IS NULL 
                        
                        BEGIN
                            
                            INSERT INTO CGesValoriStorici ( Ambiente, CodDestinazione, CodConto, CodDestinazioneRev, Tipo, Anno, Mese, ValoreVariabile, ValoreFisso, Segno, Tipologia, UtenteModifica, DataModifica ) 
                            VALUES ( @Ambiente, @CodDestinazione, @CodConto, @CodDestinazione, 0, @Anno, @Mese, 0, 0, @Segno, @Tipologia, @Utente, GETDATE() )
                            
                        END
                        
                    BEGIN
                        
                        UPDATE CGesValoriStorici SET ValoreVariabile = ValoreVariabile - @ValoreVariabile, ValoreFisso = ValoreFisso - @ValoreFisso
                        WHERE Ambiente=@Ambiente AND CodDestinazione=@CodDestinazione AND CodConto=@CodConto AND CodDestinazioneRev=@CodDestinazione AND Tipo=0 AND Anno=@Anno AND Mese=@Mese
                        
                    END
                    
                END
                
            FETCH NEXT FROM ElencoDistr INTO @Usa, @ValoreVariabile, @ValoreFisso, @Ambiente, @CodDestinazione, @CodConto, @Anno, @Mese
            
        END
    
    DELETE FROM CGesTransazioniDistribuite
    WHERE Origine=@Tipo AND RifProgressivo=@NumeroTransazione
    
    CLOSE ElencoDistr
    
    DEALLOCATE ElencoDistr
    
    
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[CGesTransazioniDistribuite_ANNULLA] TO [Metodo98]
    AS [dbo];

