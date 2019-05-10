
CREATE PROCEDURE CGesWDettaglioFogliRiepilogo_AGGIORNA(@NrTerminale Decimal(5), @CodDestinazione VarChar(10), @CodConto VarChar(20), @NumFoglio INT, @Colonna INT, @Importo01 Decimal(19,6), @Importo02 Decimal(19,6), @Importo03 Decimal(19,6), @Importo04 Decimal(19,6), @Importo05 Decimal(19,6), @Importo06 Decimal(19,6), @Importo07 Decimal(19,6), @Importo08 Decimal(19,6), @Importo09 Decimal(19,6), @Importo10 Decimal(19,6), @Importo11 Decimal(19,6), @Importo12 Decimal(19,6), @Tipo INT) AS

BEGIN
    
    DECLARE @NTERM Decimal(5)
    
    SET @NTERM=(SELECT NrTerminale FROM CGesWDettaglioFogliRiepilogo WHERE NrTerminale=@NrTerminale AND CodDestinazione=@CodDestinazione AND CodConto=@CodConto AND NumFoglio=@NumFoglio)
    
    IF @NTERM IS NULL 
        
        BEGIN
            
            INSERT INTO CGesWDettaglioFogliRiepilogo ( NrTerminale, CodDestinazione, CodConto, NumFoglio, Importo01, Importo02, Importo03, Importo04, Importo05, Importo06, Importo07, Importo08, Importo09, Importo10, Importo11, Importo12 ) 
            VALUES ( @NrTerminale, @CodDestinazione, @CodConto, @NumFoglio, @Importo01, @Importo02, @Importo03, @Importo04, @Importo05, @Importo06, @Importo07, @Importo08, @Importo09, @Importo10, @Importo11, @Importo12 )
            
        END
    
    ELSE
        
        IF @Tipo = 0
        
        BEGIN
        
            UPDATE CGesWDettaglioFogliRiepilogo SET Importo01 = Importo01 + @Importo01, Importo02 = Importo02 + @Importo02, Importo03 = Importo03 + @Importo03,
               Importo04 = Importo04 + @Importo04, Importo05 = Importo05 + @Importo05, Importo06 = Importo06 + @Importo06,
               Importo07 = Importo07 + @Importo07, Importo08 = Importo08 + @Importo08, Importo09 = Importo09 + @Importo09,
               Importo10 = Importo10 + @Importo10, Importo11 = Importo11 + @Importo11, Importo12 = Importo12 + @Importo12
            WHERE NrTerminale=@NrTerminale AND CodDestinazione=@CodDestinazione AND CodConto=@CodConto AND NumFoglio=@NumFoglio
        
        END
        

END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[CGesWDettaglioFogliRiepilogo_AGGIORNA] TO [Metodo98]
    AS [dbo];

