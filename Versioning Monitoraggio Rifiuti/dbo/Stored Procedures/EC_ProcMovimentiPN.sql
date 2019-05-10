

CREATE PROCEDURE [dbo].[EC_ProcMovimentiPN](@IdSessione Decimal(5,0),
                                             @CodBanca Varchar(7) = '',
                                              @DaData Datetime = '19900101',
                                               @AData Datetime = '20991231',
                                                @Stato smallint = -1,
                                                 @Tipo smallint = 0) 
AS

    DELETE FROM [dbo].[EC_TabMovimentiPN_Tmp] WHERE IDSessione = @IdSessione;

    INSERT INTO [dbo].[EC_TabMovimentiPN_Tmp]
               ([IDSessione]
               ,[Progressivo]
               ,[RifLink]
               ,[RifNrReg]
               ,[RifRiga]
               ,[Descrizione]
               ,[CodBanca]
               ,[ContoCorrente]
               ,[CliForGen]
               ,[ABI]
               ,[CAB]
               ,[DataReg]
               ,[CodCausale]
               ,[CodCausAbiEC]
               ,[Segno]
               ,[Importo]
               ,[Stato]
               ,[SelRiconc]
               ,[ExistsScad]
               ,[IsNew]
               ,[RifMovimento]
               ,[UTENTEMODIFICA]
               ,[DATAMODIFICA])
    SELECT 
         @IdSessione
        ,Row_Number() Over(Order By Progressivo)
        ,'[' + CAST(Row_Number() Over(Order By Progressivo) As Varchar(7)) + ']'
        ,[PROGRESSIVO]
        ,[RifRiga]
        ,[Descrizione]
        ,[CODBANCA]
        ,[ContoCorrente]
        ,[CliForGen]
        ,[ABI]
        ,[CAB]
        ,[DATAREG]
        ,[CodCausale]
        ,ISNULL([CODCAUSABIEC],'')
        ,[SEGNO]
        ,[IMPORTO]
        ,[Stato]
        ,[Riconciliato]
        ,[ExistsScad]
        ,[IsNew]
        ,[RifMovimento]
        ,USER_NAME()
        ,GetDate()
    FROM 
        [dbo].[EC_ViewMovimentiPN]
    WHERE
            [DATAREG] Between @DaData And @AData
        AND ((CodBanca = @CodBanca) OR (@CodBanca = ''))
        AND ((Stato = @Stato) OR (@Stato = -1))
        AND ((@Tipo = 1 AND (CliForGen LIKE 'G%' OR RifRiga = 0)) OR (@Tipo = 0));


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[EC_ProcMovimentiPN] TO [Metodo98]
    AS [dbo];

