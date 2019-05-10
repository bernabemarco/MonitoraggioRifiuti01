
CREATE FUNCTION [dbo].[zzFNGetStatoClienteMetodo]
    (
      @Cliente VARCHAR(7) ,
      @EsercizioCorrente DECIMAL(5, 0)
    )
RETURNS @Stato TABLE
    (
      Descrizione VARCHAR(255) NOT NULL
                               DEFAULT '' ,
      Valore VARCHAR(255) NOT NULL
                          DEFAULT '' ,
      TipoValore SMALLINT NOT NULL
                          DEFAULT 0 ,
      ColoreSfondo INT NOT NULL
                       DEFAULT 0 ,
      ColoreCarattere INT NOT NULL
                          DEFAULT 0
    )
AS 
    BEGIN

	  /*
	  Legenda TipoValore:
      
	  0 - Testo Generico
	  1 - Data
	  2 - Numero Intero
	  3 - Numero Decimale
	  4 - Percentuale
	  5 - Valuta
      
	  Legenda Colore:
      
	  0 - Colore di default
      
	  */

        DECLARE @ColoreCarattere INT
        DECLARE @ColoreSfondo INT
		
        SET @ColoreCarattere = 0
        SET @ColoreSfondo = 0

	  -- ======================================
	  -- Calcolo durata media dei crediti
      
        DECLARE @NumeroScadenze INT
        SET @NumeroScadenze = 0
        
        DECLARE @TotaleGiorniPagamento INT
        SET @TotaleGiorniPagamento = 0
        
        DECLARE @DurataMediaCrediti DECIMAL(16, 6)
        SET @DurataMediaCrediti = 0
      
	  -- Calcolo il numero delle scadenze pagate
        SELECT  @NumeroScadenze = ISNULL(COUNT(PROGRESSIVO), 0)
        FROM    dbo.TABSCADENZE
        WHERE   CODCLIFOR = @Cliente
                AND ESITO = 2

	  -- Calcolo il numero totale dei giorni di pagamento
        SELECT  @TotaleGiorniPagamento = SUM(ISNULL(DATEDIFF(DAY, DATAFATTURA,
                                                             DATAPAGEFF), 0))
        FROM    dbo.TABSCADENZE
        WHERE   ESITO = 2
                AND DATAFATTURA IS NOT NULL
                AND DATAPAGEFF IS NOT NULL
                AND CODCLIFOR = @Cliente
      
	  -- Calcolo la durata media dei crediti
        IF ( @NumeroScadenze <> 0 ) 
            BEGIN
                SET @DurataMediaCrediti = @TotaleGiorniPagamento
                    / @NumeroScadenze
            END         

        INSERT  INTO @Stato
                ( Descrizione ,
                  Valore ,
                  TipoValore 
				)
        VALUES  ( 'Durata Media dei Crediti' ,
                  CONVERT(VARCHAR, @DurataMediaCrediti) ,
                  3 
				)

	  -- ======================================
	  -- Calcolo solvibilit� media del cliente

        DECLARE @TotaleScadenze DECIMAL(19, 4)
        DECLARE @TotaleInsoluti DECIMAL(19, 4)
        DECLARE @PrcSolvibilitaCliente DECIMAL(9, 6)
                  
        SET @TotaleScadenze = 0
        SET @TotaleInsoluti = 0
        SET @PrcSolvibilitaCliente = 1

			-- Calcolo il totale degli insoluti
        SELECT  @TotaleInsoluti = SUM(IMPORTOSCEURO)
        FROM    dbo.TABSCADENZE
        WHERE   ESITO IN ( 3, 4 )
                AND CODCLIFOR = @Cliente

	-- Imposto i colori
        SET @ColoreCarattere = 0
        SET @ColoreSfondo = 0	       
		
        IF ( @TotaleInsoluti > 0 ) 
            BEGIN
                SET @ColoreSfondo = -4194304
                SET @ColoreCarattere = -1
            END

        INSERT  INTO @Stato
                ( Descrizione ,
                  Valore ,
                  TipoValore ,
                  ColoreSfondo ,
                  ColoreCarattere
				)
        VALUES  ( 'Totale Insoluti' ,
                  CONVERT(VARCHAR, ISNULL(@TotaleInsoluti, 0)) ,
                  5,
                  @ColoreSfondo ,
                  @ColoreCarattere
				)

			-- Calcolo il totale delle scadenze
        SELECT  @TotaleScadenze = SUM(IMPORTOSCEURO)
        FROM    dbo.TABSCADENZE
        WHERE   CODCLIFOR = @Cliente

        INSERT  INTO @Stato
                ( Descrizione ,
                  Valore ,
                  TipoValore 
				)
        VALUES  ( 'Totale Scadenze' ,
                  CONVERT(VARCHAR, ISNULL(@TotaleScadenze, 0)) ,
                  5
				)

        IF ( @TotaleScadenze <> 0 ) 
            BEGIN
                SET @PrcSolvibilitaCliente = 1 - ISNULL(@TotaleInsoluti, 0)
                    / ISNULL(@TotaleScadenze, 0)
            END         

        INSERT  INTO @Stato
                ( Descrizione ,
                  Valore ,
                  TipoValore 
				)
        VALUES  ( 'Percentuale Solvibilit� Cliente' ,
                  CONVERT(VARCHAR, ISNULL(@PrcSolvibilitaCliente, 1)) ,
                  4
				)

	  -- ======================================
	  -- Fatturato dell'anno in corso e di quello precedente
	  
        DECLARE @FattEsercizio DECIMAL(19, 4)
        DECLARE @FattEsercizioPrec DECIMAL(19, 4)
	  
        SET @FattEsercizio = 0
        SET @FattEsercizioPrec = 0
	  
		-- Calcolo il fatturato dell'anno in corso
        SELECT  @FattEsercizio = ISNULL(SUM(TD.SEGNO * RD.TOTNETTORIGAEURO), 0)
        FROM    dbo.TESTEDOCUMENTI AS TD
                INNER JOIN dbo.RIGHEDOCUMENTI AS RD ON TD.PROGRESSIVO = RD.IDTESTA
        WHERE   TD.TIPODOC IN ( SELECT  CODICE
                                FROM    dbo.PARAMETRIDOC
                                WHERE   TIPO IN ( 'F', 'N' ) )
                AND TD.ESERCIZIO = @EsercizioCorrente
                AND TD.CODCLIFOR = @Cliente        
                
        -- Calcolo il fatturato di quello precedente
        SELECT  @FattEsercizioPrec = ISNULL(SUM(TD.SEGNO * RD.TOTNETTORIGAEURO),
                                            0)
        FROM    dbo.TESTEDOCUMENTI AS TD
                INNER JOIN dbo.RIGHEDOCUMENTI AS RD ON TD.PROGRESSIVO = RD.IDTESTA
        WHERE   TD.TIPODOC IN ( SELECT  CODICE
                                FROM    dbo.PARAMETRIDOC
                                WHERE   TIPO IN ( 'F', 'N' ) )
                AND TD.ESERCIZIO = ( @EsercizioCorrente - 1 )
                AND TD.CODCLIFOR = @Cliente                        

		-- Imposto i colori
        SET @ColoreCarattere = 0
        SET @ColoreSfondo = 0
		
        IF ( @FattEsercizio > @FattEsercizioPrec ) 
            BEGIN
                SET @ColoreSfondo = -16728064
                SET @ColoreCarattere = -1
            END
		
        IF ( @FattEsercizio < @FattEsercizioPrec ) 
            BEGIN
                SET @ColoreSfondo = -4194304
                SET @ColoreCarattere = -1
            END

        INSERT  INTO @Stato
                ( Descrizione ,
                  Valore ,
                  TipoValore ,
                  ColoreSfondo ,
                  ColoreCarattere
				)
        VALUES  ( 'Fatturato Esercizio Corrente (Euro)' ,
                  CONVERT(VARCHAR, ISNULL(@FattEsercizio, 0)) ,
                  5 ,
                  @ColoreSfondo ,
                  @ColoreCarattere
				)
				
        INSERT  INTO @Stato
                ( Descrizione ,
                  Valore ,
                  TipoValore ,
                  ColoreSfondo ,
                  ColoreCarattere
				)
        VALUES  ( 'Fatturato Esercizio Precedente (Euro)' ,
                  CONVERT(VARCHAR, ISNULL(@FattEsercizioPrec, 0)) ,
                  5 ,
                  @ColoreSfondo ,
                  @ColoreCarattere
				)

        RETURN                
    END

GO
GRANT SELECT
    ON OBJECT::[dbo].[zzFNGetStatoClienteMetodo] TO [Metodo98]
    AS [dbo];

