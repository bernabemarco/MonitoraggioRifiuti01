

CREATE VIEW dbo.VISTASTORICOMAG_OFNPROD
AS
SELECT     STMAG.*, (CASE WHEN STMAG.TIPOMOV BETWEEN 5 AND 8 THEN STMAG.IDTESTA ELSE
                          (SELECT     RIFTESTA
                            FROM          STORICOMOVPROD
                            WHERE      STORICOMOVPROD.PROGRESSIVO = STMAG.IDTESTA) END) AS IDTESTAORD, (CASE WHEN STMAG.TIPOMOV BETWEEN 5 AND 
                      8 THEN STMAG.RIGADOC ELSE
                          (SELECT     RIFRIGA
                            FROM          STORICOMOVORDPROD
                            WHERE      STORICOMOVORDPROD.RIFPROGRESSIVO = STMAG.IDTESTA AND STORICOMOVORDPROD.RIGAMOVORD = STMAG.RIGADOC) END) 
                      AS IDRIGAORD, (CASE WHEN STMAG.TIPOMOV BETWEEN 5 AND 8 THEN STMAG.RIGACOMP ELSE
                          (SELECT     RIFIMPEGNO
                            FROM          STORICOMOVIMPPROD
                            WHERE      STORICOMOVIMPPROD.RIFPROGRESSIVO = STMAG.IDTESTA AND STORICOMOVIMPPROD.RIGAMOVORD = STMAG.RIGADOC AND 
                                                   STORICOMOVIMPPROD.RIGAMOVIMP = STMAG.RIGACOMP) END) AS IDIMPEGNOORD,
                          (SELECT     CODICEORD
                            FROM          RIGHEORDPROD ROP
                            WHERE      ROP.IDTESTA = (CASE WHEN STMAG.TIPOMOV BETWEEN 5 AND 8 THEN STMAG.IDTESTA ELSE
                                                       (SELECT     RIFTESTA
                                                         FROM          STORICOMOVPROD
                                                         WHERE      STORICOMOVPROD.PROGRESSIVO = STMAG.IDTESTA) END) AND ROP.IDRIGA = (CASE WHEN STMAG.TIPOMOV BETWEEN 
                                                   5 AND 8 THEN STMAG.RIGADOC ELSE
                                                       (SELECT     RIFRIGA
                                                         FROM          STORICOMOVORDPROD
                                                         WHERE      STORICOMOVORDPROD.RIFPROGRESSIVO = STMAG.IDTESTA AND 
                                                                                STORICOMOVORDPROD.RIGAMOVORD = STMAG.RIGADOC) END)) AS CODICEORD
FROM         STORICOMAG STMAG


GO
GRANT DELETE
    ON OBJECT::[dbo].[VISTASTORICOMAG_OFNPROD] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[VISTASTORICOMAG_OFNPROD] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[VISTASTORICOMAG_OFNPROD] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTASTORICOMAG_OFNPROD] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[VISTASTORICOMAG_OFNPROD] TO [Metodo98]
    AS [dbo];

