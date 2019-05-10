
CREATE FUNCTION [dbo].[zzFNGetIndicatoriCommerciali]
    (
        @Cliente VARCHAR(7),
        @Esercizio DECIMAL(5, 0)
    )
RETURNS @Stato TABLE
    (
        Descrizione VARCHAR(255) NOT NULL DEFAULT '',
        Valore VARCHAR(255) NOT NULL DEFAULT '',
        TipoValore SMALLINT NOT NULL DEFAULT 0,
        ColoreSfondo INT NOT NULL DEFAULT 0,
        ColoreCarattere INT NOT NULL DEFAULT 0
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

    DECLARE @ColoreSfondo INT
    DECLARE @ColoreCarattere INT
    
    SET @ColoreSfondo = 0
    SET @ColoreCarattere = 0
    
    /* 1 - Fatturato del cliente */
    
        DECLARE @FattEsercizio DECIMAL(19, 4)

        SELECT  @FattEsercizio = COALESCE(SUM(R.TOTNETTORIGAEURO), 0)
        FROM    PARAMETRIDOC P WITH(NOLOCK)
            INNER JOIN TESTEDOCUMENTI T WITH(NOLOCK)
            ON T.TIPODOC = P.CODICE
            INNER JOIN RIGHEDOCUMENTI R WITH(NOLOCK)
            ON R.IDTESTA = T.PROGRESSIVO
        WHERE   P.TIPO = 'F'
            AND T.CODCLIFOR = @Cliente
            AND T.ESERCIZIO = @Esercizio
        
        INSERT INTO @Stato (
            Descrizione,
            Valore,
            TipoValore,
            ColoreSfondo,
            ColoreCarattere
            )
        VALUES (
            'Fatturato Esercizio Corrente (Euro)',
            CONVERT(VARCHAR, ISNULL(@FattEsercizio, 0)),
            5,
            @ColoreSfondo,
            @ColoreCarattere
            )
    
    /* 16 - Numero di offerte fatte per l'esercizio corrente. */
    
        DECLARE @NumeroOfferte INT
        
        SELECT  @NumeroOfferte =  COUNT(DISTINCT IDTESTA)
        FROM    VISTADOCUMENTIBASE
        WHERE   TIPODOC IN ('OFC', 'OFR')
                AND CODCLIFOR = @Cliente
                AND ESERCIZIO = @Esercizio
        
        INSERT INTO @Stato (
            Descrizione,
            Valore,
            TipoValore,
            ColoreSfondo,
            ColoreCarattere
            )
        VALUES (
            'Numero di offerte',
            CONVERT(VARCHAR, ISNULL(@NumeroOfferte, 0)),
            2,
            @ColoreSfondo,
            @ColoreCarattere
            )
    
    /* 2 - Numero di conferme d'ordine del cliente. */
    
        DECLARE @NumeroConfermeOrdine INT
        
        SELECT  @NumeroConfermeOrdine = COUNT(DISTINCT IDTESTA)
        FROM    VISTADOCUMENTIBASE
        WHERE   TIPODOC IN ('ORC', 'OCR')
                AND CODCLIFOR = @Cliente
                AND ESERCIZIO = @Esercizio
    
        INSERT INTO @Stato (
            Descrizione,
            Valore,
            TipoValore,
            ColoreSfondo,
            ColoreCarattere
            )
        VALUES (
            'Numero di conferme d''ordine',
            CONVERT(VARCHAR, ISNULL(@NumeroConfermeOrdine, 0)),
            2,
            @ColoreSfondo,
            @ColoreCarattere
            )

    /* 3 - Valore medio in Euro delle conferme. */
    
        DECLARE @ValoreMedioConferme DECIMAL(25, 4)
        
        SET @ValoreMedioConferme = 0
        
        IF (@NumeroConfermeOrdine > 0)
        BEGIN
            DECLARE @TotaleConfermeOrdine DECIMAL(25, 4)
                        
            SELECT  @TotaleConfermeOrdine = COALESCE(SUM(TOTNETTORIGAEURO), 0)
            FROM    VISTADOCUMENTIBASE
            WHERE   TIPODOC IN ('ORC', 'OCR')
                    AND CODCLIFOR = @Cliente
                    AND YEAR(DATACONSEGNA) = @Esercizio
            
            SET @ValoreMedioConferme = @TotaleConfermeOrdine / @NumeroConfermeOrdine
        END
        
        INSERT INTO @Stato (
            Descrizione,
            Valore,
            TipoValore,
            ColoreSfondo,
            ColoreCarattere
            )
        VALUES (
            'Valore Medio Conferme (Euro)',
            CONVERT(VARCHAR, ISNULL(@ValoreMedioConferme, 0)),
            5,
            @ColoreSfondo,
            @ColoreCarattere
            )
            
    /* 4 - Tipologia di pagamento attuale. */
    
        DECLARE @TipologiaPagamento VARCHAR(100)
        
        SELECT  @TipologiaPagamento = CODICE + ' - ' + DESCRIZIONE
        FROM    dbo.TABPAGAMENTI
        WHERE   CODICE IN (
            SELECT  CODPAG
            FROM    dbo.ANAGRAFICARISERVATICF
            WHERE   CODCONTO = @Cliente
                    AND ESERCIZIO = @Esercizio
            )
                
        INSERT INTO @Stato (
            Descrizione,
            Valore,
            TipoValore,
            ColoreSfondo,
            ColoreCarattere
            )
        VALUES (
            'Tipologia di pagamento',
            ISNULL(@TipologiaPagamento, ''),
            0,
            @ColoreSfondo,
            @ColoreCarattere
            )
            
    /* 5 - Giorni di pagamento medi reali. */
    /* 5A - Giorni medi di attesa previsti in fase di emissione fattura. */
    
        DECLARE @GiorniAttesaPrevisti DECIMAL(19, 6)
        
        SELECT  @GiorniAttesaPrevisti = AVG(CONVERT(DECIMAL, ISNULL(GGRICHIESTI, 0)))
        FROM    zzVerificaGiorniPagamento
        WHERE   CODCLIFOR = @Cliente

    
        INSERT INTO @Stato (
            Descrizione,
            Valore,
            TipoValore,
            ColoreSfondo,
            ColoreCarattere
            )
        VALUES (
            'Giorni medi di attesa previsti totali',
            CONVERT(VARCHAR, ISNULL(@GiorniAttesaPrevisti, 0)),
            3,
            @ColoreSfondo,
            @ColoreCarattere
            )

    /* 5A - Giorni medi di attesa previsti in fase di emissione fattura (esercizio corrente). */
    
        DECLARE @GiorniAttesaPrevistiEA DECIMAL(19, 6)
        
        SELECT  @GiorniAttesaPrevistiEA = AVG(CONVERT(DECIMAL, ISNULL(GGRICHIESTI, 0)))
        FROM    zzVerificaGiorniPagamento
        WHERE   CODCLIFOR = @Cliente
                AND ESERCIZIO = @Esercizio
    
        INSERT INTO @Stato (
            Descrizione,
            Valore,
            TipoValore,
            ColoreSfondo,
            ColoreCarattere
            )
        VALUES (
            'Giorni medi di attesa previsti totali (esercizio corrente)',
            CONVERT(VARCHAR, ISNULL(@GiorniAttesaPrevistiEA, 0)),
            3,
            @ColoreSfondo,
            @ColoreCarattere
            )


            
    /* 5B - Giorni medi di attesa per il pagamento effettivo. */
    
        DECLARE @GiorniAttesaEffettivi DECIMAL(19, 6)
        
        SELECT  @GiorniAttesaEffettivi = AVG(CONVERT(DECIMAL, ISNULL(GGPAGAMENTO, 0)))
        FROM    zzVerificaGiorniPagamento
        WHERE   CODCLIFOR = @Cliente
    
        INSERT INTO @Stato (
            Descrizione,
            Valore,
            TipoValore,
            ColoreSfondo,
            ColoreCarattere
            )
        VALUES (
            'Giorni medi di attesa effettivi',
            CONVERT(VARCHAR, ISNULL(@GiorniAttesaEffettivi, 0)),
            3,
            @ColoreSfondo,
            @ColoreCarattere
            )
    
    /* 5B - Giorni medi di attesa per il pagamento effettivo (esercizio attivo). */
    
        DECLARE @GiorniAttesaEffettiviEA DECIMAL(19, 6)
        
        SELECT  @GiorniAttesaEffettiviEA = AVG(CONVERT(DECIMAL, ISNULL(GGPAGAMENTO, 0)))
        FROM    zzVerificaGiorniPagamento
        WHERE   CODCLIFOR = @Cliente
                AND ESERCIZIO = @Esercizio
        INSERT INTO @Stato (
            Descrizione,
            Valore,
            TipoValore,
            ColoreSfondo,
            ColoreCarattere
            )
        VALUES (
            'Giorni medi di attesa effettivi (esercizio attivo)',
            CONVERT(VARCHAR, ISNULL(@GiorniAttesaEffettiviEA, 0)),
            3,
            @ColoreSfondo,
            @ColoreCarattere
            )



    /* 6 - Numero di insoluti per l'esercizio corrente. */
    
        DECLARE @NumeroInsoluti INT
        
        SELECT  @NumeroInsoluti = COUNT(*)
        FROM    dbo.TABSCADENZE
        WHERE   ESITO IN (3, 4)
                AND CODCLIFOR = @Cliente
                AND YEAR(DATASCADENZA) = @Esercizio
    
        INSERT INTO @Stato (
            Descrizione,
            Valore,
            TipoValore,
            ColoreSfondo,
            ColoreCarattere
            )
        VALUES (
            'Numero Insoluti Esercizio Corrente',
            CONVERT(VARCHAR, ISNULL(@NumeroInsoluti, 0)),
            2,
            @ColoreSfondo,
            @ColoreCarattere
            )
            
    /* 7 - Totale insoluti per l'esercizio corrente. */
    
        DECLARE @TotaleInsoluti DECIMAL(19, 4)
                
        SELECT  @TotaleInsoluti = SUM(IMPORTOSCEURO)
        FROM    dbo.TABSCADENZE
        WHERE   ESITO IN (3, 4)
                AND CODCLIFOR = @Cliente
                AND YEAR(DATASCADENZA) = @Esercizio
                        
        INSERT INTO @Stato (
            Descrizione,
            Valore,
            TipoValore,
            ColoreSfondo,
            ColoreCarattere
            )
        VALUES (
            'Totale Insoluti Esercizio Corrente (Euro)',
            CONVERT(VARCHAR, ISNULL(@TotaleInsoluti, 0)),
            5,
            @ColoreSfondo,
            @ColoreCarattere
            )
            
    /* 8 - Percentuale Solvibilita' per l'esercizio corrente. */
            
        DECLARE @TotaleScadenze DECIMAL(19, 4)
        
        SELECT  @TotaleScadenze = SUM(IMPORTOSCEURO)
        FROM    dbo.TABSCADENZE
        WHERE   CODCLIFOR = @Cliente
                AND YEAR(DATASCADENZA) = @Esercizio
        
        DECLARE @PrcSolvibilitaCliente DECIMAL(9, 6)
        
        SET @PrcSolvibilitaCliente = 1       

        IF (ISNULL(@TotaleScadenze, 0) <> 0) 
        BEGIN
            SET @PrcSolvibilitaCliente = 1 - (ISNULL(@TotaleInsoluti, 0) / @TotaleScadenze)
        END
        
        INSERT INTO @Stato (
            Descrizione,
            Valore,
            TipoValore,
            ColoreSfondo,
            ColoreCarattere
            )
        VALUES (
            'Percentuale Solvibilita'' Esercizio Corrente',
            CONVERT(VARCHAR, ISNULL(@PrcSolvibilitaCliente, 1)),
            4,
            @ColoreSfondo,
            @ColoreCarattere
            )
            
    /* 9 - Numero di articoli acquistati per provenienza. */
    /* 9A - Commerciali */
    
        DECLARE @ArtAcqCommerciali DECIMAL(22, 6)
        
        SELECT @ArtAcqCommerciali = SUM(VDB.QTAGEST)
        FROM    dbo.VISTADOCUMENTIBASE AS VDB INNER JOIN
                dbo.ANAGRAFICAARTICOLIPROD AS AAP ON VDB.ESERCIZIO = AAP.ESERCIZIO AND VDB.CODART = AAP.CODICEART
        WHERE   AAP.PROVENIENZA = 0
                AND VDB.TIPODOC IN ('FVC', 'FVV', 'FVI', 'NAC')
                AND VDB.CODCLIFOR = @Cliente
                AND YEAR(VDB.DATADOC) = @Esercizio
        GROUP BY AAP.PROVENIENZA
    
        INSERT INTO @Stato (
            Descrizione,
            Valore,
            TipoValore,
            ColoreSfondo,
            ColoreCarattere
            )
        VALUES (
            'Numero Articoli Commerciali Acquistati',
            CONVERT(VARCHAR, ISNULL(@ArtAcqCommerciali, 0)),
            3,
            @ColoreSfondo,
            @ColoreCarattere
            )
            
    /* 9B - Produzione */
    
        DECLARE @ArtAcqProduzione DECIMAL(22, 6)
        
        SELECT @ArtAcqProduzione = SUM(VDB.QTAGEST)
        FROM    dbo.VISTADOCUMENTIBASE AS VDB INNER JOIN
                dbo.ANAGRAFICAARTICOLIPROD AS AAP ON VDB.ESERCIZIO = AAP.ESERCIZIO AND VDB.CODART = AAP.CODICEART
        WHERE   AAP.PROVENIENZA = 1
                AND VDB.TIPODOC IN ('FVC', 'FVV', 'FVI', 'NAC')
                AND VDB.CODCLIFOR = @Cliente
                AND YEAR(VDB.DATADOC) = @Esercizio
        GROUP BY AAP.PROVENIENZA
    
        INSERT INTO @Stato (
            Descrizione,
            Valore,
            TipoValore,
            ColoreSfondo,
            ColoreCarattere
            )
        VALUES (
            'Numero Articoli Produzione Acquistati',
            CONVERT(VARCHAR, ISNULL(@ArtAcqProduzione, 0)),
            3,
            @ColoreSfondo,
            @ColoreCarattere
            )
            
    /* 9C - C/Lavoro */
    
        DECLARE @ArtAcqCLavoro DECIMAL(22, 6)
        
        SELECT @ArtAcqCLavoro = SUM(VDB.QTAGEST)
        FROM    dbo.VISTADOCUMENTIBASE AS VDB INNER JOIN
                dbo.ANAGRAFICAARTICOLIPROD AS AAP ON VDB.ESERCIZIO = AAP.ESERCIZIO AND VDB.CODART = AAP.CODICEART
        WHERE   AAP.PROVENIENZA = 2
                AND VDB.TIPODOC IN ('FVC', 'FVV', 'FVI', 'NAC')
                AND VDB.CODCLIFOR = @Cliente
                AND YEAR(VDB.DATADOC) = @Esercizio
        GROUP BY AAP.PROVENIENZA
    
        INSERT INTO @Stato (
            Descrizione,
            Valore,
            TipoValore,
            ColoreSfondo,
            ColoreCarattere
            )
        VALUES (
            'Numero Articoli C/Lavoro Acquistati',
            CONVERT(VARCHAR, ISNULL(@ArtAcqCLavoro, 0)),
            3,
            @ColoreSfondo,
            @ColoreCarattere
            )
            
    /* 10 - Numero di revisioni d'ordine. */
    
        DECLARE @NumeroRevisioniOrdine INT
        
        SELECT  @NumeroRevisioniOrdine = COUNT(DISTINCT IDTESTA)
        FROM    VISTADOCUMENTIBASE
        WHERE   TIPODOC IN ('ORC', 'OCR')
                AND CODCLIFOR = @Cliente
                AND YEAR(DATADOC) = @Esercizio
                AND BIS <> ''
        
        INSERT INTO @Stato (
            Descrizione,
            Valore,
            TipoValore,
            ColoreSfondo,
            ColoreCarattere
            )
        VALUES (
            'Numero di revisioni d''ordine',
            CONVERT(VARCHAR, ISNULL(@NumeroRevisioniOrdine, 0)),
            2,
            @ColoreSfondo,
            @ColoreCarattere
            )
            
    /* 11 - Numero di consegne effettuate. */
    
        DECLARE @NumeroConsegneEffettuate INT
        
        SELECT  @NumeroConsegneEffettuate = COUNT(DISTINCT IDTESTA)
        FROM    VISTADOCUMENTIBASE
        WHERE   TIPODOC IN ('DVC','RCL','DVO','DVV','DVP')
                AND CODCLIFOR = @Cliente
                AND YEAR(DATADOC) = @Esercizio
    
        INSERT INTO @Stato (
            Descrizione,
            Valore,
            TipoValore,
            ColoreSfondo,
            ColoreCarattere
            )
        VALUES (
            'Numero di consegne effettuate',
            CONVERT(VARCHAR, ISNULL(@NumeroConsegneEffettuate, 0)),
            2,
            @ColoreSfondo,
            @ColoreCarattere
            )
    
    /* 12 - Marginalita' media generale. */
    
        DECLARE @MarginalitaMediaGenerale DECIMAL(19, 6)
        
        SELECT  @MarginalitaMediaGenerale = ROUND(((SUM(PREZZO) - SUM(COSTO)) / SUM(PREZZO)), 4)
        FROM    zzMargineVendite
        WHERE   CODCLIFOR = @Cliente

        INSERT INTO @Stato (
            Descrizione,
            Valore,
            TipoValore,
            ColoreSfondo,
            ColoreCarattere
            )
        VALUES (
            'Marginalita'' generale',
            CONVERT(VARCHAR, ISNULL(@MarginalitaMediaGenerale, 0)),
            4,
            @ColoreSfondo,
            @ColoreCarattere
            )

/* 12 - Marginalita' media generale (esercizio attuale). */
    
        DECLARE @MarginalitaMediaGeneraleEA DECIMAL(19, 6)
        
        SELECT  @MarginalitaMediaGeneraleEA = ROUND(((SUM(PREZZO) - SUM(COSTO)) / SUM(PREZZO)), 4)
        FROM    zzMargineVendite
        WHERE   CODCLIFOR = @Cliente
                and YEAR(DATADOC)=@ESERCIZIO

        INSERT INTO @Stato (
            Descrizione,
            Valore,
            TipoValore,
            ColoreSfondo,
            ColoreCarattere
            )
        VALUES (
            'Marginalita'' esercizio corrente',
            CONVERT(VARCHAR, ISNULL(@MarginalitaMediaGeneraleEA, 0)),
            4,
            @ColoreSfondo,
            @ColoreCarattere
            )
            
    /* 14 - Numero di articoli di produzione nuovi. */
    
        DECLARE @NumeroArticoliNuovi INT
        
        SELECT  @NumeroArticoliNuovi = COUNT(DISTINCT CODART)
        FROM    zzCodiciPrimaProduzione
        WHERE   CODCLIFOR = @Cliente
                AND YEAR(DATADOC) = @Esercizio
    
        INSERT INTO @Stato (
            Descrizione,
            Valore,
            TipoValore,
            ColoreSfondo,
            ColoreCarattere
            )
        VALUES (
            'Numero Articoli Prima Produzione',
            CONVERT(VARCHAR, ISNULL(@NumeroArticoliNuovi, 0)),
            2,
            @ColoreSfondo,
            @ColoreCarattere
            )
            
    /* 15 - Inevaso di un cliente a 60 giorni */
    
        DECLARE @TotaleInevaso DECIMAL(25, 4)
        
        SELECT  @TotaleInevaso = COALESCE(SUM(TOTNETTORIGAEURORES), 0)
        FROM    VISTADOCUMENTIBASE
        WHERE   TIPODOC IN ('ORC', 'OCR')
                AND CODCLIFOR = @Cliente
                AND DATEDIFF(d, DATACONSEGNA, GETDATE()) > 60
                AND DOCCHIUSO = 0
                AND RIGACHIUSA = 0
            
        INSERT INTO @Stato (
            Descrizione,
            Valore,
            TipoValore,
            ColoreSfondo,
            ColoreCarattere
            )
        VALUES (
            'Inevaso a 60 giorni (Euro)',
            CONVERT(VARCHAR, ISNULL(@TotaleInevaso, 0)),
            5,
            @ColoreSfondo,
            @ColoreCarattere
            )
    
    RETURN
END

GO
GRANT SELECT
    ON OBJECT::[dbo].[zzFNGetIndicatoriCommerciali] TO [Metodo98]
    AS [dbo];

