
CREATE VIEW dbo.VistaRelazioniCodArtComm
AS
SELECT RELAZIONICFV.*
FROM RELAZIONICFV
WHERE (CODCLIFOR = 'C')


GO
GRANT DELETE
    ON OBJECT::[dbo].[VistaRelazioniCodArtComm] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[VistaRelazioniCodArtComm] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[VistaRelazioniCodArtComm] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[VistaRelazioniCodArtComm] TO [Metodo98]
    AS [dbo];

