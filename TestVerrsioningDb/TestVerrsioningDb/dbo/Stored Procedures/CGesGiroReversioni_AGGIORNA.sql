
CREATE PROCEDURE CGesGiroReversioni_AGGIORNA(@NrTerminale Decimal(5), @Anno INT, @Mese INT, @Occorrenze Decimal(7), @CodDestinazione VarChar(10), @CodConto VarChar(20), @ValoreVariabile Decimal(19,6), @ValoreFisso Decimal(19,6), @ModalitaCosto SmallInt) AS

BEGIN
    
    DECLARE @NTERM Decimal(5)
    
    SET @NTERM=(SELECT NrTerminale FROM CGesGiroReversioni WHERE NrTerminale=@NrTerminale AND Anno=@Anno AND Mese=@Mese AND Occorrenze=@Occorrenze AND CodDestinazione=@CodDestinazione AND CodConto=@CodConto)
    
    IF @NTERM IS NULL 
        
        BEGIN
            
            INSERT INTO CGesGiroReversioni ( NrTerminale, Anno, Mese, Occorrenze, CodDestinazione, CodConto, SorgenteVariabile, SorgenteFisso, CedutaVariabile, CedutaFisso, RicevutaVariabile, RicevutaFisso, Validita, Segno, FlagGiro ) 
            VALUES ( @NrTerminale, @Anno, @Mese, @Occorrenze, @CodDestinazione, @CodConto, @ValoreVariabile, @ValoreFisso, 0, 0, 0, 0, 0, 1, @ModalitaCosto )
            
        END
    
    ELSE
    
        BEGIN
            
            UPDATE CGesGiroReversioni SET SorgenteVariabile = SorgenteVariabile + @ValoreVariabile, SorgenteFisso = SorgenteFisso + @ValoreFisso
            WHERE NrTerminale=@NrTerminale AND Anno=@Anno AND Mese=@Mese AND Occorrenze=@Occorrenze AND CodDestinazione=@CodDestinazione AND CodConto=@CodConto
            
        END

END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[CGesGiroReversioni_AGGIORNA] TO [Metodo98]
    AS [dbo];

