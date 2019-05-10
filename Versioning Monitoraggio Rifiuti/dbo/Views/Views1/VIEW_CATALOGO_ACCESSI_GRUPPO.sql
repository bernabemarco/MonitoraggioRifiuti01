

 CREATE VIEW [dbo].[VIEW_CATALOGO_ACCESSI_GRUPPO]
 AS

 SELECT
 UT.CodTipo,
 UT.GruppoID,
 UT.DSCGruppoUtente,
 C.Id,
 C.FlagAbilita
 FROM
 (
 SELECT
 T.Codice As CodTipo,
 U.Codice AS GruppoID,
 U.Descrizione AS DSCGruppoUtente
 FROM
 TABGRUPPIUTENTE U,
 CATALOGO_TIPI_ENTITA T
 ) UT
 LEFT OUTER JOIN
 CATALOGO_ACCESSI_GRUPPO C
 ON
 C.GruppoID = UT.GruppoID AND
 C.CodTipo = UT.CodTipo


 
GO
GRANT SELECT
    ON OBJECT::[dbo].[VIEW_CATALOGO_ACCESSI_GRUPPO] TO [Metodo98]
    AS [dbo];

