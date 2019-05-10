
CREATE PROCEDURE [dbo].[zzGetAttivitaScadenzeClienti]
(
    @IdScadenza decimal(18,0) = -1
)
AS
BEGIN
    SELECT * FROM [dbo].[zzCtVistaAttivitaScadenzeClienti]
    WHERE [IdScadenza] = @IdScadenza OR @IdScadenza = -1

    RETURN
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[zzGetAttivitaScadenzeClienti] TO [Metodo98]
    AS [dbo];

