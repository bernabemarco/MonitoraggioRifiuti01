
CREATE PROCEDURE [dbo].[Proc_ScontiAcq_DuplicaConfigurazione](@ProgressivoOld Decimal(5,0),
                                                               @ProgressivoNew Decimal(5,0),
                                                                @CodFor varchar(7),
                                                                 @Esercizio Decimal(5,0),
                                                                  @DaData varchar(8),
                                                                   @AData varchar(8))
AS

BEGIN

SET NOCOUNT ON;
    
    BEGIN TRAN  
    
    IF EXISTS(SELECT [Progressivo] FROM [dbo].[TP_ConfigSconti] WHERE [Progressivo] = @ProgressivoOld)
    INSERT INTO [dbo].[TP_ConfigSconti]([Progressivo],[CodFor],[Esercizio],[DaData],[AData],[CodContratto],[Attiva],[UtenteModifica],[DataModifica])
    SELECT @ProgressivoNew,@CodFor,@Esercizio,@DaData,@AData,[CodContratto],0,User_Name(),GetDate() FROM [dbo].[TP_ConfigSconti] WHERE [Progressivo] = @ProgressivoOld;

    IF EXISTS(SELECT [IdTesta] FROM [dbo].[TP_ConfigScontiTeste] WHERE [IdTesta] = @ProgressivoOld)
    INSERT INTO [dbo].[TP_ConfigScontiTeste]([IdTesta],[IdRiga],[Posizione],[FlagRiga],[IdFormula],[IdSconto],[FlagScalare],[Segno],[TipoSconto1],[TipoSconto2],[FlagSconto],[ValoreSconto],[NrListino],[Formula],[FormulaFF],[USAPERIMPONIBILE],[UtenteModifica],[DataModifica])
    SELECT @ProgressivoNew,[IdRiga],[Posizione],[FlagRiga],[IdFormula],[IdSconto],[FlagScalare],[Segno],[TipoSconto1],[TipoSconto2],[FlagSconto],[ValoreSconto],[NrListino],[Formula],[FormulaFF],[USAPERIMPONIBILE],User_Name(),GetDate() FROM [dbo].[TP_ConfigScontiTeste] WHERE [IdTesta] = @ProgressivoOld;

    IF EXISTS(SELECT [RifProgressivo] FROM [dbo].[TP_ConfigScontiRighe_1Grp] WHERE [RifProgressivo] = @ProgressivoOld)
    INSERT INTO [dbo].[TP_ConfigScontiRighe_1Grp]([RifProgressivo],[IdTesta],[IdRiga],[Posizione],[FlagRiga],[Codice],[FlagSconto],[ValoreSconto],[UtenteModifica],[DataModifica])
    SELECT @ProgressivoNew,[IdTesta],[IdRiga],[Posizione],[FlagRiga],[Codice],[FlagSconto],[ValoreSconto],User_Name(),GetDate() FROM [dbo].[TP_ConfigScontiRighe_1Grp] WHERE [RifProgressivo] = @ProgressivoOld;

    IF EXISTS(SELECT [RifProgressivo] FROM [dbo].[TP_ConfigScontiRighe_2Cat] WHERE [RifProgressivo] = @ProgressivoOld)
    INSERT INTO [dbo].[TP_ConfigScontiRighe_2Cat]([RifProgressivo],[IdTesta],[IdRiga],[Posizione],[FlagRiga],[Codice],[FlagSconto],[ValoreSconto],[UtenteModifica],[DataModifica])
    SELECT @ProgressivoNew,[IdTesta],[IdRiga],[Posizione],[FlagRiga],[Codice],[FlagSconto],[ValoreSconto],User_Name(),GetDate() FROM [dbo].[TP_ConfigScontiRighe_2Cat] WHERE [RifProgressivo] = @ProgressivoOld;

    IF EXISTS(SELECT [RifProgressivo] FROM [dbo].[TP_ConfigScontiRighe_3CatSt] WHERE [RifProgressivo] = @ProgressivoOld)
    INSERT INTO [dbo].[TP_ConfigScontiRighe_3CatSt]([RifProgressivo],[IdTesta],[IdRiga],[Posizione],[FlagRiga],[Codice],[FlagSconto],[ValoreSconto],[UtenteModifica],[DataModifica])
    SELECT @ProgressivoNew,[IdTesta],[IdRiga],[Posizione],[FlagRiga],[Codice],[FlagSconto],[ValoreSconto],User_Name(),GetDate() FROM [dbo].[TP_ConfigScontiRighe_3CatSt] WHERE [RifProgressivo] = @ProgressivoOld;

    IF EXISTS(SELECT [RifProgressivo] FROM [dbo].[TP_ConfigScontiRighe_4GrpPrz] WHERE [RifProgressivo] = @ProgressivoOld)
    INSERT INTO [dbo].[TP_ConfigScontiRighe_4GrpPrz]([RifProgressivo],[IdTesta],[IdRiga],[Posizione],[FlagRiga],[Codice],[FlagSconto],[ValoreSconto],[UtenteModifica],[DataModifica])
    SELECT @ProgressivoNew,[IdTesta],[IdRiga],[Posizione],[FlagRiga],[Codice],[FlagSconto],[ValoreSconto],User_Name(),GetDate() FROM [dbo].[TP_ConfigScontiRighe_4GrpPrz] WHERE [RifProgressivo] = @ProgressivoOld;

    IF EXISTS(SELECT [RifProgressivo] FROM [dbo].[TP_ConfigScontiRighe_5FamRep] WHERE [RifProgressivo] = @ProgressivoOld)
    INSERT INTO [dbo].[TP_ConfigScontiRighe_5FamRep]([RifProgressivo],[IdTesta],[IdRiga],[Posizione],[FlagRiga],[CodFam],[CodRep],[FlagSconto],[ValoreSconto],[UtenteModifica],[DataModifica])
    SELECT @ProgressivoNew,[IdTesta],[IdRiga],[Posizione],[FlagRiga],[CodFam],[CodRep],[FlagSconto],[ValoreSconto],User_Name(),GetDate() FROM [dbo].[TP_ConfigScontiRighe_5FamRep] WHERE [RifProgressivo] = @ProgressivoOld;

    IF EXISTS(SELECT [RifProgressivo] FROM [dbo].[TP_ConfigScontiRighe_6Art] WHERE [RifProgressivo] = @ProgressivoOld)
    INSERT INTO [dbo].[TP_ConfigScontiRighe_6Art]([RifProgressivo],[IdTesta],[IdRiga],[Posizione],[FlagRiga],[Codice],[FlagSconto],[ValoreSconto],[UtenteModifica],[DataModifica])
    SELECT @ProgressivoNew,[IdTesta],[IdRiga],[Posizione],[FlagRiga],[Codice],[FlagSconto],[ValoreSconto],User_Name(),GetDate() FROM [dbo].[TP_ConfigScontiRighe_6Art] WHERE [RifProgressivo] = @ProgressivoOld;

    IF @@ERROR <> 0 GOTO ErrorHandler
    COMMIT TRAN
    RETURN(0)
  
ErrorHandler:
    ROLLBACK TRAN
    PRINT @@ERROR
    RETURN(@@ERROR)
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[Proc_ScontiAcq_DuplicaConfigurazione] TO [Metodo98]
    AS [dbo];

