
CREATE PROCEDURE CGesQuantitaDistribuite_ANNULLA(@Tipo SmallInt, @NumeroTransazione Int, @Utente VarChar(25)) AS

BEGIN
    
    DECLARE @Quantita Decimal(19,6)
    DECLARE @Ambiente VarChar(3)
    DECLARE @CodDestDestinazione VarChar(10)
    DECLARE @UnitaMisura VarChar(5)
    DECLARE @CodDestOrigine VarChar(10)
    DECLARE @Anno Decimal(5)
    DECLARE @Mese SmallInt
    DECLARE @AMB VarChar(3)
    
    DECLARE ElencoDistr CURSOR FOR 
        SELECT Quantita, Ambiente, CodDestDestinazione, UnitaMisura, CodDestOrigine, Anno, Mese
        FROM CGesQuantitaDistribuite
        WHERE Origine=@Tipo AND RifProgressivo=@NumeroTransazione ORDER BY CodDestOrigine, CodDestDestinazione, UnitaMisura, Anno, Mese
    
    OPEN ElencoDistr
    
    FETCH NEXT FROM ElencoDistr INTO @Quantita, @Ambiente, @CodDestDestinazione, @UnitaMisura, @CodDestOrigine, @Anno, @Mese
    
    WHILE @@FETCH_STATUS = 0
        
        BEGIN
            
            SET @AMB=(SELECT Ambiente FROM CGesStoricoQuantita WHERE Ambiente=@Ambiente AND CodDestinazione=@CodDestDestinazione AND UnitaMisura=@UnitaMisura AND CodDestinazioneOrig=@CodDestOrigine AND Anno=@Anno AND Mese=@Mese)
            
            IF @AMB IS NULL 
                
                BEGIN
                    
                    INSERT INTO CGesStoricoQuantita ( Ambiente, CodDestinazione, UnitaMisura, CodDestinazioneOrig, Anno, Mese, Tipo, Valore, UtenteModifica, DataModifica ) 
                    VALUES ( @Ambiente, @CodDestDestinazione, @UnitaMisura, @CodDestOrigine, @Anno, @Mese, 0, 0, @Utente, GETDATE() )
                    
                END
            
            BEGIN
                
                UPDATE CGesStoricoQuantita SET Valore = Valore - @Quantita
                WHERE Ambiente=@Ambiente AND CodDestinazione=@CodDestDestinazione AND UnitaMisura=@UnitaMisura AND CodDestinazioneOrig=@CodDestOrigine AND Anno=@Anno AND Mese=@Mese
                
            END
            
            FETCH NEXT FROM ElencoDistr INTO @Quantita, @Ambiente, @CodDestDestinazione, @UnitaMisura, @CodDestOrigine, @Anno, @Mese
            
        END
    
    DELETE FROM CGesQuantitaDistribuite
    WHERE Origine=@Tipo AND RifProgressivo=@NumeroTransazione
    
    CLOSE ElencoDistr
    
    DEALLOCATE ElencoDistr
    
    
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[CGesQuantitaDistribuite_ANNULLA] TO [Metodo98]
    AS [dbo];

