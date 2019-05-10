CREATE VIEW [dbo].[AldVistaContatori] AS
        SELECT *  
        FROM tabcontatori 
        WHERE ESERCIZIO = (SELECT ESERCIZIOATTIVO FROM TABUTENTI WHERE USERDB = CAST(USER_NAME() AS VARCHAR(25)))


GO
GRANT DELETE
    ON OBJECT::[dbo].[AldVistaContatori] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[AldVistaContatori] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[AldVistaContatori] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[AldVistaContatori] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[AldVistaContatori] TO [Metodo98]
    AS [dbo];

