
CREATE PROCEDURE [Utils].[SetLogs] 
    @Type int = 0, 
    @Message varchar(500),
    @File varchar(500)
AS
BEGIN

    SET NOCOUNT ON;
    DECLARE @ActionName varchar(50)
    BEGIN
        IF @Type < 0
            SET @ActionName = 'ERROR'
        ELSE
            SET @ActionNAme = 'NORMAL'
                    
    END

    Insert INTO Utils.Logs (Type, ActionName, Message, FileName) VALUES (@Type, @ActionName, @Message, @File)

END


GO
GRANT EXECUTE
    ON OBJECT::[Utils].[SetLogs] TO [Metodo98]
    AS [dbo];

