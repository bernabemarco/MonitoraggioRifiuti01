
CREATE PROCEDURE CGesGiroReversioni_UPDATE2(@NrTerminale Decimal(5), @AnnoRev INT, @MeseRev INT, @CodDestinazione VarChar(10), @CodConto VarChar(20), @ValoreVariabile Decimal(19,6), @ValoreFisso Decimal(19,6)) AS

BEGIN
    
    DECLARE @NTERM Decimal(5)
    DECLARE @Codice VarChar(3)
    DECLARE @TipoReversione SmallInt
    DECLARE @ModalitaCosto SmallInt
    DECLARE @Occo Int
    DECLARE @ContoAppoggio VarChar(20)
    
    SET @NTERM=(SELECT NrTerminale FROM CGesGiroReversioni WHERE NrTerminale=@NrTerminale AND Anno=@AnnoRev AND Mese=@MeseRev AND CodDestinazione=@CodDestinazione AND CodConto=@CodConto)
    
    IF @NTERM IS NULL
    
        BEGIN
            
            SET @Codice=(SELECT CGesTipiDestinazione.Codice FROM CGesDestinazioni INNER JOIN CGesTipiDestinazione ON CGesDestinazioni.TipoDestinazione=CGesTipiDestinazione.Codice WHERE CGesTipiDestinazione.Tipologia<>2 AND CGesDestinazioni.CodDestinazione=@CodDestinazione)
            
            IF @Codice IS NOT NULL
                
                BEGIN
                    
                    SELECT @TipoReversione=TipoReversione, @ModalitaCosto=ModalitaCosto FROM CGesWReversioni WHERE NrTerminale=@NrTerminale AND CodDestOrigine=@CodDestinazione AND CodConto=@CodConto
                    
                    IF @TipoReversione IS NULL
                        
                        BEGIN
                            
                            SELECT @TipoReversione=TipoReversione, @ModalitaCosto=ModalitaCosto FROM CGesWReversioni WHERE NrTerminale=@NrTerminale AND CodDestOrigine=@CodDestinazione AND (CodConto = '' OR CodConto IS NULL)
                            
                        END
                    
                    IF @TipoReversione IS NOT NULL
                        
                        BEGIN
                            
                            SET @Occo=(SELECT COUNT(*) AS NRighe FROM CGesWReversioni TDM INNER JOIN CGesReversioniRighe RDM ON TDM.Progressivo = RDM.RifProgressivo WHERE TDM.NrTerminale=@NrTerminale AND RDM.CodDestinazione=@CodDestinazione)
                            
                            IF @TipoReversione = 1
                                BEGIN
                                    SET @ContoAppoggio = @CodConto
                                END
                            ELSE
                                BEGIN
                                    SET @ContoAppoggio = '*'
                                END
                            
                            SET @NTERM=(SELECT NrTerminale FROM CGesGiroReversioni WHERE NrTerminale=@NrTerminale AND Anno=@AnnoRev AND Mese=@MeseRev AND CodDestinazione=@CodDestinazione AND CodConto=@ContoAppoggio)
                            
                            IF @NTERM IS NULL
                                
                                BEGIN
                                    
                                    INSERT INTO CGesGiroReversioni ( NrTerminale, Anno, Mese, Occorrenze, CodDestinazione, CodConto, SorgenteVariabile, SorgenteFisso, CedutaVariabile, CedutaFisso, RicevutaVariabile, RicevutaFisso, Validita, Segno, FlagGiro ) 
                                    VALUES ( @NrTerminale, @AnnoRev, @MeseRev, @Occo, @CodDestinazione, @ContoAppoggio, 0, 0, 0, 0, @ValoreVariabile, @ValoreFisso, 0, 1, @ModalitaCosto )
                                    
                                END
                                
                            ELSE
                                
                                BEGIN
                                    
                                    UPDATE CGesGiroReversioni SET RicevutaVariabile = RicevutaVariabile + @ValoreVariabile, RicevutaFisso = RicevutaFisso + @ValoreFisso
                                    WHERE NrTerminale=@NrTerminale AND Anno=@AnnoRev AND Mese=@MeseRev AND CodDestinazione=@CodDestinazione AND CodConto=@ContoAppoggio
                                    
                                END
                            
                        END
                        
                END
            
        END
    
    ELSE
    
        BEGIN
            
            UPDATE CGesGiroReversioni SET RicevutaVariabile = RicevutaVariabile + @ValoreVariabile, RicevutaFisso = RicevutaFisso + @ValoreFisso
            WHERE NrTerminale=@NrTerminale AND Anno=@AnnoRev AND Mese=@MeseRev AND CodDestinazione=@CodDestinazione AND CodConto=@CodConto
            
        END
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[CGesGiroReversioni_UPDATE2] TO [Metodo98]
    AS [dbo];

