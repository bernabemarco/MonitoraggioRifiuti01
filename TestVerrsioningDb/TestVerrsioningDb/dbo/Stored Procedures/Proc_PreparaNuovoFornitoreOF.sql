

CREATE PROCEDURE [dbo].[Proc_PreparaNuovoFornitoreOF](@IdSessione Decimal(5,0), 
                                                       @ArticoloCorrente nVarchar(50),
                                                        @TipoDocumentoCorrente nVarchar(3),
                                                         @NuovoFornitore nVarchar(7))

AS

BEGIN

DECLARE @TipoUM                 Int

    SET NOCOUNT ON 
    
    /*Tipo UM Del Documento Corrente*/
    SET @TipoUM = 0
    SELECT @TipoUM = TIPOUM FROM PARAMETRIDOC WHERE CODICE =  @TipoDocumentoCorrente;
    
    /*Aggiorno la Tabella TabLottiRiordino*/
    INSERT INTO TABLOTTIRIORDINO(NUMERO,CODART,CODFOR,TP_FORNFATTURAZIONE,TP_CODDEP,UM,GGAPPROVV,GGAPPRONT,UTENTEMODIFICA,DATAMODIFICA)
    SELECT 
        NUMERO,
        CODART,
        CODFOR,
        CODFORFATT, 
        CodDeposito,
        UM,
        0,
        0,
        USER_NAME() AS UTENTEMODIFICA, 
        GETDATE() AS DATAMODIFICA
    FROM
    (
        SELECT
            TLR.NUMERO + (ROW_NUMBER() OVER(PARTITION BY TLR.CODART ORDER BY TLR.CODART)) AS NUMERO,
            TLR.CODART,
            @NuovoFornitore  AS CODFOR,
            @NuovoFornitore  AS CODFORFATT, 
            TTM.CodDeposito,
            AUP.UM,
            TABLOTTIRIORDINO.CODART AS ARTDASCARTARE
        FROM
        (
            SELECT DISTINCT
                TLR.CODART,
                MAX(TLR.NUMERO) AS NUMERO
            FROM
                TABLOTTIRIORDINO TLR
            WHERE
                ((TLR.CODART = @ArticoloCorrente) OR (@ArticoloCorrente = ''))
            GROUP BY TLR.CODART
        ) TLR
        CROSS APPLY
            TP_TABMagazzini TTM
        INNER JOIN
            ARTICOLIUMPREFERITE AUP
        ON
            AUP.CODART = TLR.CODART AND AUP.TIPOUM = @TipoUM
        LEFT JOIN TABLOTTIRIORDINO
        ON  
            TABLOTTIRIORDINO.CODART = TLR.CODART AND 
            TABLOTTIRIORDINO.TP_CODDEP = TTM.CodDeposito AND
            TABLOTTIRIORDINO.CODFOR = @NuovoFornitore AND 
            TABLOTTIRIORDINO.TP_FORNFATTURAZIONE = @NuovoFornitore
        WHERE
            TTM.USAPERORDINE = 1 AND TABLOTTIRIORDINO.CODART IS NULL
    ) FILTRATI;
    
    /*Aggiorno la Tabella Buyer*/
    INSERT INTO TP_CONFIGURAZIONIBUYER(CODBUYER,CODDEPOSITO,CODFORNITORE,TUTTIARTICOLI,UTENTEMODIFICA,DATAMODIFICA)
    SELECT
        CODICE,
        CodDeposito,
        CODFORNITORE,
        TUTTIARTICOLI,
        USER_NAME() AS UTENTEMODIFICA, 
        GETDATE() AS DATAMODIFICA
    FROM
    (
        SELECT
            TAB.CODICE,
            TTM.CodDeposito,
            @NuovoFornitore AS CODFORNITORE,
            1 AS TUTTIARTICOLI,
            TCB.CODBUYER AS CODICEDAESCLUDERE
        FROM
            TP_ANAGRAFICABUYER TAB
        CROSS APPLY
            TP_TABMagazzini TTM
        LEFT JOIN
            TP_CONFIGURAZIONIBUYER TCB
        ON
            TCB.CODBUYER = TAB.CODICE AND
            TCB.CODDEPOSITO = TTM.CodDeposito AND
            TCB.CODFORNITORE = @NuovoFornitore
        WHERE
            TAB.USERID = USER_NAME() AND TCB.CODBUYER IS NULL
    ) FILTRATI;

    /*Aggiorno la Tabella Ordine Corrente*/
    INSERT INTO [TP_OF_SUPPLIERS]
           ([IdSessione]
           ,[CodBuyer]
           ,[CodFornitore]
           ,[Selezionato]
           ,[UtenteModifica]
           ,[DataModifica])
    SELECT
        Fornitore.IdSessione,
        Fornitore.CodBuyer,
        Fornitore.CodFornitore,
        1 as Selezionato,
        USER_NAME() as UtenteModifica,
        GETDATE() as DataModifica
    FROM    
    (
        SELECT 
            @IdSessione As IdSessione,
            (SELECT TOP 1 CodBuyer FROM TP_OF_BUYERS WHERE IdSessione = @IdSessione And Selezionato = 1) As CodBuyer,
            @NuovoFornitore As CodFornitore
    ) Fornitore
    LEFT JOIN
        TP_OF_SUPPLIERS
    ON
        TP_OF_SUPPLIERS.IdSessione = Fornitore.IdSessione And
        TP_OF_SUPPLIERS.CodBuyer = Fornitore.CodBuyer And
        TP_OF_SUPPLIERS.CodFornitore = Fornitore.CodFornitore 
    WHERE
        TP_OF_SUPPLIERS.CodBuyer IS NULL;
    
    /*
    INSERT INTO [TP_OF_DOCKS]
           ([IdSessione]
           ,[CodBuyer]
           ,[CodDeposito]
           ,[Selezionato]
           ,[UtenteModifica]
           ,[DataModifica])
    SELECT
        Fornitore.IdSessione,
        Fornitore.CodBuyer,
        Fornitore.CodDeposito,
        1 as Selezionato,
        USER_NAME() as UtenteModifica,
        GETDATE() as DataModifica
    FROM    
    (
        SELECT 
            @IdSessione As IdSessione,
            (SELECT TOP 1 CodBuyer FROM TP_OF_BUYERS WHERE IdSessione = @IdSessione And Selezionato = 1) As CodBuyer,
            @NuovoFornitore As CodFornitore,
            TP_TABMagazzini.CodDeposito
        From
            TP_TABMagazzini
        Where
            TP_TABMagazzini.USAPERORDINE = 1
    ) Fornitore
    LEFT JOIN
        TP_OF_DOCKS
    ON
        TP_OF_DOCKS.IdSessione = Fornitore.IdSessione And
        TP_OF_DOCKS.CodBuyer = Fornitore.CodBuyer And
        TP_OF_DOCKS.CodDeposito = Fornitore.CodDeposito
    WHERE
        TP_OF_DOCKS.CodBuyer IS NULL;
    */

    UPDATE TP_OF_SUPPLIERS  
    SET Selezionato = 1 
    WHERE 
        TP_OF_SUPPLIERS.IdSessione = @IdSessione and 
        TP_OF_SUPPLIERS.CodFornitore = @NuovoFornitore and 
        TP_OF_SUPPLIERS.CodBuyer IN (SELECT TOP 1 CodBuyer FROM TP_OF_BUYERS WHERE IdSessione = @IdSessione And Selezionato = 1);
    
    /*  
    UPDATE TP_OF_DOCKS      
    SET Selezionato = 1 
    WHERE 
        TP_OF_DOCKS.IdSessione = @IdSessione and 
        TP_OF_DOCKS.CodBuyer IN (SELECT TOP 1 CodBuyer FROM TP_OF_BUYERS WHERE IdSessione = @IdSessione And Selezionato = 1);
    */
END
    



GO
GRANT EXECUTE
    ON OBJECT::[dbo].[Proc_PreparaNuovoFornitoreOF] TO [Metodo98]
    AS [dbo];

