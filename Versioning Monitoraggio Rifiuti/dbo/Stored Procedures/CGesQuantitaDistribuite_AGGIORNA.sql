
CREATE PROCEDURE CGesQuantitaDistribuite_AGGIORNA(@NumeroTransazione Int, @CodDestOrigine VarChar(10), @CodDestDestinazione VarChar(10), @UnitaMisura VarChar(5), @Anno INT, @Mese INT, @FlagCalcolo SmallInt, @Quantita Decimal(19,6), @Ambiente VarChar(3), @Utente VarChar(25), @Tipo SmallInt) AS

BEGIN
    
    DECLARE @RifProgressivo Decimal(10)
    DECLARE @AMB VarChar(3)
    
    SET @RifProgressivo=(SELECT RifProgressivo FROM CGesQuantitaDistribuite WHERE Origine=0 AND RifProgressivo=@NumeroTransazione AND CodDestOrigine=@CodDestOrigine AND CodDestDestinazione=@CodDestDestinazione AND UnitaMisura=@UnitaMisura AND Anno=@Anno AND Mese=@Mese)
    
    IF @RifProgressivo IS NULL 
        
        BEGIN
            
            INSERT INTO CGesQuantitaDistribuite ( Origine, RifProgressivo, CodDestOrigine, CodDestDestinazione, UnitaMisura, Anno, Mese, Calcolo, Quantita, Ambiente, UtenteModifica, DataModifica ) 
            VALUES ( 0, @NumeroTransazione, @CodDestOrigine, @CodDestDestinazione, @UnitaMisura, @Anno, @Mese, @FlagCalcolo, @Quantita, @Ambiente, @Utente, GETDATE() )
            
        END
    
    ELSE
    
        BEGIN
            
            UPDATE CGesQuantitaDistribuite SET Calcolo = @FlagCalcolo, Quantita = Quantita + @Quantita, Ambiente = @Ambiente, UtenteModifica = @Utente, DataModifica = GETDATE()
            WHERE Origine=0 AND RifProgressivo=@NumeroTransazione AND CodDestOrigine=@CodDestOrigine AND CodDestDestinazione=@CodDestDestinazione AND UnitaMisura=@UnitaMisura AND Anno=@Anno AND Mese=@Mese
            
        END
    
    SET @AMB=(SELECT Ambiente FROM CGesStoricoQuantita WHERE Ambiente=@Ambiente AND CodDestinazione=@CodDestDestinazione AND UnitaMisura=@UnitaMisura AND CodDestinazioneOrig=@CodDestOrigine AND Anno=@Anno AND Mese=@Mese)
    
    IF @AMB IS NULL 
        
        BEGIN
            
            INSERT INTO CGesStoricoQuantita ( Ambiente, CodDestinazione, UnitaMisura, CodDestinazioneOrig, Anno, Mese, Tipo, Valore, UtenteModifica, DataModifica ) 
            VALUES ( @Ambiente, @CodDestDestinazione, @UnitaMisura, @CodDestOrigine, @Anno, @Mese, @Tipo, @Quantita, @Utente, GETDATE() )
            
        END
        
    ELSE
        
        BEGIN
            
            UPDATE CGesStoricoQuantita SET Valore = Valore + @Quantita, UtenteModifica = @Utente, DataModifica = GETDATE()
            WHERE Ambiente=@Ambiente AND CodDestinazione=@CodDestDestinazione AND UnitaMisura=@UnitaMisura AND CodDestinazioneOrig=@CodDestOrigine AND Anno=@Anno AND Mese=@Mese
            
        END
        
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[CGesQuantitaDistribuite_AGGIORNA] TO [Metodo98]
    AS [dbo];

