

CREATE PROCEDURE [dbo].[EC_ProcMovimentiEC](@IdSessione Decimal(5,0),
                                             @CodBanca Varchar(7) = '',
                                              @DaData Datetime = '19900101',
                                               @AData Datetime = '20991231',
                                                @Stato smallint = -1) 
AS

    DELETE FROM [dbo].[EC_EstrattoConto_Tmp] WHERE IDSessione = @IdSessione;

    INSERT INTO [dbo].[EC_EstrattoConto_Tmp]
           ([IDSessione]
           ,[Progressivo]
           ,[CodBanca]
           ,[CodFlusso]
           ,[ABIBanca]
           ,[ContoCorrente]
           ,[CliForGen]
           ,[DataOpBanca]
           ,[DataValuta]
           ,[Importo]
           ,[Segno]
           ,[CausaleABI]
           ,[NrAssegno]
           ,[RowKey]
           ,[Stato]
           ,[IsNew]
           ,[SelRiconc]
           ,[RifMovimento]
           ,[UTENTEMODIFICA]
           ,[DATAMODIFICA])
    SELECT  
         @IdSessione
        ,[Progressivo]
        ,[CodBanca]
        ,[CodFlusso]
        ,[ABIBanca]
        ,[ContoCorrente]
        ,[CliForGen]
        ,[DataOpBanca]
        ,[DataValuta]
        ,[Importo]
        ,[Segno]
        ,[CausaleABI]
        ,[NrAssegno]
        ,[RowKey]
        ,[Stato]
        ,[Type]
        ,[Riconciliato]
        ,[RifMovimento]
        ,USER_NAME()
        ,GetDate()
    FROM 
        [dbo].[EC_ViewMovimentiEC]
    WHERE
            [DataOpBanca] Between @DaData And @AData
        AND ((CodBanca = @CodBanca) OR (@CodBanca = ''))
        AND ((Stato = @Stato) OR (@Stato = -1));


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[EC_ProcMovimentiEC] TO [Metodo98]
    AS [dbo];

