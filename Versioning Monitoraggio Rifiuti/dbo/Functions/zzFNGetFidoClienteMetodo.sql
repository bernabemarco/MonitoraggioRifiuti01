
CREATE FUNCTION [zzFNGetFidoClienteMetodo] ( @codCliente VARCHAR(7) )
RETURNS @TabellaFido TABLE
    (
      Descrizione VARCHAR(255) NOT NULL
                               DEFAULT '' ,
      Valore DECIMAL(19, 4) NOT NULL
                            DEFAULT 0 ,
      ColoreSfondo INT NOT NULL
                       DEFAULT 0 ,
      ColoreCarattere INT NOT NULL
                          DEFAULT 0
    )
AS 
    BEGIN

        DECLARE @Esercizio DECIMAL(5) ,
            @ESITO0 SMALLINT ,
            @ESITO1 SMALLINT ,
            @ESITO2 SMALLINT ,
            @ESITO3 SMALLINT ,
            @ESITO4 SMALLINT ,
            @BOLLE VARCHAR(1) ,
            @FATTURE VARCHAR(1) ,
            @ORDINI VARCHAR(1) ,
            @NOTEACCR VARCHAR(1) ,
            @ALTRO VARCHAR(1) ,
            @USACLIFATT SMALLINT ,
            @DATAINIZIOCALCOLOFIDO DATETIME ,
            @FidoEuro DECIMAL(18, 6)
      
        DECLARE @VaroleESITO0 DECIMAL(18, 6) ,
            @VaroleESITO1 DECIMAL(18, 6) ,
            @VaroleESITO2 DECIMAL(18, 6) ,
            @VaroleESITO3 DECIMAL(18, 6) ,
            @VaroleESITO4 DECIMAL(18, 6) ,
            @VaroleBOLLE DECIMAL(18, 6) ,
            @VaroleFATTURE DECIMAL(18, 6) ,
            @VaroleORDINI DECIMAL(18, 6) ,
            @VaroleNOTEACCR DECIMAL(18, 6) ,
            @VaroleALTRO DECIMAL(18, 6) ,
            @FidoResiduo DECIMAL(18, 6)
            
        DECLARE @ColoreCarattere INT
        DECLARE @ColoreSfondo INT

        SET @ColoreCarattere = 0
        SET @ColoreSfondo = 0

        SET @Esercizio = YEAR(GETDATE())

        -- Memorizzo le regole per il calcolo del fido
        SELECT TOP 1
                @ESITO0 = ( CASE WHEN ESITO0 = 'S' THEN 0
                                 ELSE -1
                            END ) ,
                @ESITO1 = ( CASE WHEN ESITO1 = 'S' THEN 1
                                 ELSE -1
                            END ) ,
                @ESITO2 = ( CASE WHEN ESITO2 = 'S' THEN 2
                                 ELSE -1
                            END ) ,
                @ESITO3 = ( CASE WHEN ESITO3 = 'S' THEN 3
                                 ELSE -1
                            END ) ,
                @ESITO4 = ( CASE WHEN ESITO4 = 'S' THEN 4
                                 ELSE -1
                            END ) ,
                @BOLLE = ( CASE WHEN BOLLE = 'S' THEN 'B'
                                ELSE ''
                           END ) ,
                @FATTURE = ( CASE WHEN FATTURE = 'S' THEN 'F'
                                  ELSE ''
                             END ) ,
                @ORDINI = ( CASE WHEN ORDINI = 'S' THEN 'O'
                                 ELSE ''
                            END ) ,
                @NOTEACCR = ( CASE WHEN NOTEACCR = 'S' THEN 'N'
                                   ELSE ''
                              END ) ,
                @ALTRO = ( CASE WHEN ALTRO = 'S' THEN 'A'
                                ELSE ''
                           END ) ,
                @USACLIFATT = USACLIFATT
        FROM    PARAMETRIFIDO WITH ( NOLOCK )
        WHERE   esercizio = @Esercizio

      -- Carico il fido iniziale cliente e da quando vale
        SELECT  @DATAINIZIOCALCOLOFIDO = DATAINIZIOCALCOLOFIDO ,
                @FidoEuro = ISNULL(FidoEuro, 0)
        FROM    AnagraficaRiservatiCF
        WHERE   CodConto = @codCliente
                AND Esercizio = @Esercizio

        SET @DATAINIZIOCALCOLOFIDO = ISNULL(@DATAINIZIOCALCOLOFIDO,
                                            {d '1990-01-01'})

      -- Carico i valori dallo scadenziario
        SELECT  @VaroleESITO0 = ISNULL(SUM(CASE WHEN ( esito = 0 )
                                                THEN ImportoScEuro
                                                     * ( CASE WHEN scadattpass = 1
                                                              THEN 1
                                                              ELSE -1
                                                         END )
                                                ELSE 0
                                           END), 0) ,
                @VaroleESITO1 = ISNULL(SUM(CASE WHEN ( esito = 1 )
                                                THEN ImportoScEuro
                                                     * ( CASE WHEN scadattpass = 1
                                                              THEN 1
                                                              ELSE -1
                                                         END )
                                                ELSE 0
                                           END), 0) ,
                @VaroleESITO2 = ISNULL(SUM(CASE WHEN ( esito = 2 )
                                                THEN ImportoScEuro
                                                     * ( CASE WHEN scadattpass = 1
                                                              THEN 1
                                                              ELSE -1
                                                         END )
                                                ELSE 0
                                           END), 0) ,
                @VaroleESITO3 = ISNULL(SUM(CASE WHEN ( esito = 3 )
                                                THEN ImportoScEuro
                                                     * ( CASE WHEN scadattpass = 1
                                                              THEN 1
                                                              ELSE -1
                                                         END )
                                                ELSE 0
                                           END), 0) ,
                @VaroleESITO4 = ISNULL(SUM(CASE WHEN ( esito = 4 )
                                                THEN ImportoScEuro
                                                     * ( CASE WHEN scadattpass = 1
                                                              THEN 1
                                                              ELSE -1
                                                         END )
                                                ELSE 0
                                           END), 0)
        FROM    TabScadenze WITH ( NOLOCK )
        WHERE   CodCliFor = @codCliente
                AND DataFattura >= @DATAINIZIOCALCOLOFIDO
                AND Esito IN ( @ESITO0, @ESITO1, @ESITO2, @ESITO3, @ESITO4 )

      -- carico i valori dai documenti
        SELECT  @VaroleBOLLE = ISNULL(SUM(CASE WHEN ( p.tipo = 'B' )
                                               THEN ( TotImponibileEuroRes
                                                      + TotImpostaEuroRes )
                                               ELSE 0
                                          END), 0) ,
                @VaroleFATTURE = ISNULL(SUM(CASE WHEN ( p.tipo = 'F' )
                                                 THEN ( TotImponibileEuroRes
                                                        + TotImpostaEuroRes )
                                                 ELSE 0
                                            END), 0) ,
                @VaroleORDINI = ISNULL(SUM(CASE WHEN ( p.tipo = 'O' )
                                                THEN ( TotImponibileEuroRes
                                                       + TotImpostaEuroRes )
                                                ELSE 0
                                           END), 0) ,
                @VaroleNOTEACCR = ISNULL(SUM(CASE WHEN ( p.tipo = 'N' )
                                                  THEN ( TotImponibileEuroRes
                                                         + TotImpostaEuroRes )
                                                  ELSE 0
                                             END), 0) ,
                @VaroleALTRO = ISNULL(SUM(CASE WHEN ( p.tipo = 'A' )
                                               THEN ( TotImponibileEuroRes
                                                      + TotImpostaEuroRes )
                                               ELSE 0
                                          END), 0)
        FROM    TESTEDOCUMENTI t WITH ( NOLOCK )
                INNER JOIN PARAMETRIDOC p WITH ( NOLOCK ) ON t.tipodoc = p.codice
        WHERE   datadoc >= @DATAINIZIOCALCOLOFIDO
                AND ( ( @USACLIFATT = 0
                        AND CodCliFor = @codCliente
                      )
                      OR ( @USACLIFATT = 1
                           AND CodCfFatt = @codCliente
                         )
                    )
                AND p.Tipo IN ( @BOLLE, @FATTURE, @ORDINI, @NOTEACCR, @ALTRO )
                AND t.TipoDoc NOT in (SELECT CodDoc FROM ESCLUDIDOC_FIDO WHERE Esercizio=@Esercizio)
                AND t.DocChiuso = 0
                
        SET @FidoEuro = ISNULL(@FidoEuro,0)
        SET @VaroleESITO0 = ISNULL(@VaroleESITO0,0)
        SET @VaroleESITO1 = ISNULL(@VaroleESITO1,0)
        SET @VaroleESITO2 = ISNULL(@VaroleESITO2,0)
        SET @VaroleESITO3 = ISNULL(@VaroleESITO3,0)
        SET @VaroleESITO4 = ISNULL(@VaroleESITO4,0)
        SET @VaroleBOLLE = ISNULL(@VaroleBOLLE,0)
        SET @VaroleFATTURE = ISNULL(@VaroleFATTURE,0)
        SET @VaroleORDINI = ISNULL(@VaroleORDINI,0)
        SET @VaroleNOTEACCR = ISNULL(@VaroleNOTEACCR,0)
        SET @VaroleALTRO = ISNULL(@VaroleALTRO,0)
            
        SET @FidoResiduo = @FidoEuro - @VaroleESITO0 - @VaroleESITO1
            - @VaroleESITO2 - @VaroleESITO3 - @VaroleESITO4 - @VaroleBOLLE
            - @VaroleFATTURE - @VaroleORDINI - @VaroleNOTEACCR - @VaroleALTRO
            
        SET @FidoResiduo = ISNULL(@FidoResiduo,0)
        
        INSERT  INTO @TabellaFido
                ( Descrizione, Valore )
        VALUES  ( 'Fido Cliente', @FidoEuro )
        INSERT  INTO @TabellaFido
                ( Descrizione ,
                  Valore
                )
        VALUES  ( 'Scadenze Non Emesse (Esito 0)' ,
                  @VaroleESITO0
                )
        INSERT  INTO @TabellaFido
                ( Descrizione ,
                  Valore
                )
        VALUES  ( 'Scadenze Emesse (Esito 1)' ,
                  @VaroleESITO1
                )
        INSERT  INTO @TabellaFido
                ( Descrizione ,
                  Valore
                )
        VALUES  ( 'Scadenze Pagate (Esito 2)' ,
                  @VaroleESITO2
                )
        INSERT  INTO @TabellaFido
                ( Descrizione ,
                  Valore
                )
        VALUES  ( 'Scadenze Insolute (Esito 3)' ,
                  @VaroleESITO3
                )
        INSERT  INTO @TabellaFido
                ( Descrizione ,
                  Valore
                )
        VALUES  ( 'Scadenze Insolute Pagate (Esito 4)' ,
                  @VaroleESITO4
                )
        INSERT  INTO @TabellaFido
                ( Descrizione ,
                  Valore
                )
        VALUES  ( 'Tipo Documento Bolla' ,
                  @VaroleBOLLE
                )
        INSERT  INTO @TabellaFido
                ( Descrizione ,
                  Valore
                )
        VALUES  ( 'Tipo Documento Fattura' ,
                  @VaroleFATTURE
                )
        INSERT  INTO @TabellaFido
                ( Descrizione ,
                  Valore
                )
        VALUES  ( 'Tipo Documento Ordine' ,
                  @VaroleORDINI
                )
        INSERT  INTO @TabellaFido
                ( Descrizione ,
                  Valore
                )
        VALUES  ( 'Tipo Documento Nota Accredito' ,
                  @VaroleNOTEACCR
                )
        INSERT  INTO @TabellaFido
                ( Descrizione ,
                  Valore
                )
        VALUES  ( 'Tipo Documento Altro' ,
                  @VaroleALTRO
                )
                
        -- Imposto i colori
        SET @ColoreCarattere = 0
        SET @ColoreSfondo = 0

        IF ( @FidoResiduo > 0 ) 
            BEGIN
                SET @ColoreSfondo = -16728064
                SET @ColoreCarattere = -1
            END

        IF ( @FidoResiduo < 0 ) 
            BEGIN
                SET @ColoreSfondo = -4194304
                SET @ColoreCarattere = -1
            END


        INSERT  INTO @TabellaFido
                ( Descrizione ,
                  Valore ,
                  ColoreSfondo ,
                  ColoreCarattere
                )
        VALUES  ( 'Fido Disponibile' ,
                  @FidoResiduo ,
                  @ColoreSfondo ,
                  @ColoreCarattere
                )
        
        RETURN
    END

GO
GRANT SELECT
    ON OBJECT::[dbo].[zzFNGetFidoClienteMetodo] TO [Metodo98]
    AS [dbo];

