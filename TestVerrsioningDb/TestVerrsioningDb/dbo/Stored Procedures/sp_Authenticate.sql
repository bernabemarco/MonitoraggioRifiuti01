CREATE PROCEDURE [dbo].[sp_Authenticate]
@compileYear INT NULL, @value INT NULL, @licenzedb NVARCHAR (MAX) NULL, @dittacorrente NVARCHAR (MAX) NULL, @errors INT NULL OUTPUT, @text NVARCHAR (MAX) NULL OUTPUT, @warning NVARCHAR (MAX) NULL OUTPUT
AS EXTERNAL NAME [MetodoSecurity].[Autenticazione].[sp_Authenticate]


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[sp_Authenticate] TO [Metodo98]
    AS [dbo];

