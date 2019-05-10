

CREATE PROCEDURE [dbo].[GL_Proc_ModificaListiniNonAggiornati](@IdSessione Decimal(5,0))

AS

BEGIN

SET NOCOUNT ON 
    
    /*STEP 1 - Inserisco le Righe dove sono state cambiate le date di validit�*/
    DELETE
        TP_LISTINIART
    FROM
        TP_LISTINIART
    INNER JOIN
        GL_ElencoListiniNonAggiornati GLE
    ON
        GLE.CODART = TP_LISTINIART.CODART And
        GLE.NRLISTINO = TP_LISTINIART.NRLISTINO And
        GLE.UM = TP_LISTINIART.UM And
        GLE.DataVal_New = TP_LISTINIART.DataVal
    WHERE 
        GLE.IDSESSIONE = @IdSessione And
        GLE.Aggiornato = 1 And
        GLE.DataVal <> TP_LISTINIART.DataVal;

    INSERT INTO [dbo].[TP_LISTINIART] ([CODART],[NRLISTINO],[UM],[DataVal],[TP_CodConto],[PREZZO],[PREZZOEURO],[AGGIORNATO],[UTENTEMODIFICA],[DATAMODIFICA])
    SELECT 
        GLE.[CODART],GLE.[NRLISTINO],GLE.[UM],GLE.[DataVal_New],GLE.[CodConto],GLE.[PREZZO],GLE.[PREZZOEURO],0,User_Name(),GetDate()
    FROM 
        [dbo].[GL_ElencoListiniNonAggiornati] GLE
    INNER JOIN
        TP_LISTINIART
    ON
        TP_LISTINIART.CODART = GLE.CODART And
        TP_LISTINIART.NRLISTINO = GLE.NRLISTINO And
        TP_LISTINIART.UM = GLE.UM And
        TP_LISTINIART.DataVal = GLE.DataVal
    WHERE 
        GLE.IDSESSIONE = @IdSessione And
        GLE.Aggiornato = 1 And
        GLE.DataVal_New <> TP_LISTINIART.DataVal;

    /*STEP 2 - Aggiorno i Prezzi dove non sono state cambiate le date di validit�*/
    UPDATE
        TP_LISTINIART
    SET
        TP_LISTINIART.PREZZO = GLE.PREZZO,
        TP_LISTINIART.PREZZOEURO = GLE.PREZZOEURO
    FROM
        TP_LISTINIART
    INNER JOIN
        GL_ElencoListiniNonAggiornati GLE
    ON
        GLE.CODART = TP_LISTINIART.CODART And
        GLE.NRLISTINO = TP_LISTINIART.NRLISTINO And
        GLE.UM = TP_LISTINIART.UM And
        GLE.DataVal = TP_LISTINIART.DataVal
    WHERE 
        GLE.IDSESSIONE = @IdSessione And
        GLE.Aggiornato = 1 And
        GLE.DataVal_New = TP_LISTINIART.DataVal;

    /*STEP 3 - Elimino le righe dove sono state cambiate le date di validit�*/
    DELETE
        TP_LISTINIART
    FROM
        TP_LISTINIART
    INNER JOIN
        GL_ElencoListiniNonAggiornati GLE
    ON
        GLE.CODART = TP_LISTINIART.CODART And
        GLE.NRLISTINO = TP_LISTINIART.NRLISTINO And
        GLE.UM = TP_LISTINIART.UM And
        GLE.DataVal = TP_LISTINIART.DataVal
    WHERE 
        GLE.IDSESSIONE = @IdSessione And
        GLE.Aggiornato = 1 And
        GLE.DataVal_New <> TP_LISTINIART.DataVal;

    --DELETE FROM GL_ElencoListiniNonAggiornati WHERE IDSESSIONE = @IdSessione;    
END
    

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[GL_Proc_ModificaListiniNonAggiornati] TO [Metodo98]
    AS [dbo];

