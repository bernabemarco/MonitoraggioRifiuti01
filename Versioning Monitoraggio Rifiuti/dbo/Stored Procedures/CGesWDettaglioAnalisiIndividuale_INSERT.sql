
CREATE PROCEDURE CGesWDettaglioAnalisiIndividuale_INSERT(@NrTerminale Decimal(5), @CodDestinazione VarChar(10), @CodConto VarChar(20), @ImportoVariabile Decimal(19,6), @ImportoFisso Decimal(19,6), @Importo01 Decimal(19,6), @Importo02 Decimal(19,6), @Importo03 Decimal(19,6), @Importo04 Decimal(19,6), @Importo05 Decimal(19,6), @Importo06 Decimal(19,6), @Importo07 Decimal(19,6), @Importo08 Decimal(19,6), @Importo09 Decimal(19,6), @Importo10 Decimal(19,6), @Importo11 Decimal(19,6), @Importo12 Decimal(19,6), @ImportoTotale Decimal(19,6)) AS

BEGIN
    
    DECLARE @NTERM Decimal(5)
    
    SET @NTERM=(SELECT NrTerminale FROM CGesWDettaglioAnalisiIndividuale WHERE NrTerminale=@NrTerminale AND CodDestinazione=@CodDestinazione AND CodConto=@CodConto)
    
    IF @NTERM IS NULL 
        
        BEGIN
            
			INSERT INTO CGesWDettaglioAnalisiIndividuale ( NrTerminale, CodDestinazione, CodConto, ImportoVariabile, ImportoFisso, Importo01, Importo02, Importo03, Importo04, Importo05, Importo06, Importo07, Importo08, Importo09, Importo10, Importo11, Importo12, ImportoTotale ) 
			VALUES ( @NrTerminale, @CodDestinazione, @CodConto, @ImportoVariabile, @ImportoFisso, @Importo01, @Importo02, @Importo03, @Importo04, @Importo05, @Importo06, @Importo07, @Importo08, @Importo09, @Importo10, @Importo11, @Importo12, @ImportoTotale )
            
        END
    
    ELSE
        
        BEGIN
        
            UPDATE CGesWDettaglioAnalisiIndividuale SET Importo01 = Importo01 + @Importo01, Importo02 = Importo02 + @Importo02, Importo03 = Importo03 + @Importo03,
               Importo04 = Importo04 + @Importo04, Importo05 = Importo05 + @Importo05, Importo06 = Importo06 + @Importo06,
               Importo07 = Importo07 + @Importo07, Importo08 = Importo08 + @Importo08, Importo09 = Importo09 + @Importo09,
               Importo10 = Importo10 + @Importo10, Importo11 = Importo11 + @Importo11, Importo12 = Importo12 + @Importo12,
               ImportoVariabile = ImportoVariabile + @ImportoVariabile, ImportoFisso = ImportoFisso + @ImportoFisso, ImportoTotale = ImportoTotale + @ImportoTotale
            WHERE NrTerminale=@NrTerminale AND CodDestinazione=@CodDestinazione AND CodConto=@CodConto
        
        END
    
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[CGesWDettaglioAnalisiIndividuale_INSERT] TO [Metodo98]
    AS [dbo];

