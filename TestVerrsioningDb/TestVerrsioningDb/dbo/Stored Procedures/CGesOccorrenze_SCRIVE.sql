
CREATE PROCEDURE CGesOccorrenze_SCRIVE(@NrTerminale Decimal(5), @CodDestinazione VarChar(10), @Anno INT, @Mese INT) AS

BEGIN
    
    DECLARE @Progressivo Decimal(10)
    DECLARE @NumeroOccorrenze Int
    
    SET @Progressivo=(SELECT TOP 1 Progressivo FROM CGesWReversioni WHERE NrTerminale=@NrTerminale AND CodDestOrigine=@CodDestinazione)
    
    IF @Progressivo IS NULL 
        
        BEGIN
            
            INSERT INTO CGesOccorrenze ( NrTerminale, CodDestinazione, Anno, Mese, Occorrenze ) 
            VALUES ( @NrTerminale, @CodDestinazione, @Anno, @Mese, 9999999 )
            
        END
    
    ELSE
    
        BEGIN
            
            SET @NumeroOccorrenze = 0
            
            SET @NumeroOccorrenze=(SELECT COUNT(*) AS NRighe FROM CGesWReversioni TDM INNER JOIN CGesReversioniRighe RDM ON TDM.Progressivo = RDM.RifProgressivo WHERE TDM.NrTerminale=@NrTerminale AND RDM.CodDestinazione=@CodDestinazione)
            
            INSERT INTO CGesOccorrenze ( NrTerminale, CodDestinazione, Anno, Mese, Occorrenze ) 
            VALUES ( @NrTerminale, @CodDestinazione, @Anno, @Mese, @NumeroOccorrenze )
            
        END

END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[CGesOccorrenze_SCRIVE] TO [Metodo98]
    AS [dbo];

