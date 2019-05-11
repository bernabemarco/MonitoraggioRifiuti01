﻿

CREATE  VIEW [dbo].[VISTA_TRASPORTO_LINK_TREEVIEWFILTRI]
AS

SELECT
    TCT.PROGRESSIVO,
    ISNULL(TCR.PROGRESSIVO,0) AS PROGRESSIVOREGOLA,
    TCT.RIFPROGRESSIVO,
    TCT.RIFPROGPADRE,
    TCT.RIFNODOPADRE,
    TCT.RIFNODO,
    TCT.TIPONODO,
    TCT.LIVELLONODO,
    TCT.RIFTIPOLOGIE,
    TCF.CodZonaSpedizione,
    TCF.CodZona,
    TCF.CodRegione,
    TCF.Provincia,
    TCF.CodSettore,
    TCF.CodCategoria,
    TCF.CodGruppoPrezzi,
    TCF.CodClienteFatt,
    TCF.CodCliente,
    TCF.CodDestinazione,
    TCF.CodGruppoArt,
    TCF.CodCategoriaArt,
    TCF.CodCategoriaStat,
    TCF.CodGruppoPrezziArt,
    TCF.CodFamiglia,
    TCF.CodReparto,
    TCF.CodArt
FROM
    TRASPORTO_CAD_TREEVIEW TCT
LEFT JOIN
    TRASPORTO_CAD_FILTRI TCF
ON
    TCF.RIFPROGRESSIVOTV = TCT.PROGRESSIVO
LEFT JOIN
    TRASPORTO_CAD_REGOLE TCR
ON
    TCR.PROGRESSIVOTV = TCT.PROGRESSIVO

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTA_TRASPORTO_LINK_TREEVIEWFILTRI] TO [Metodo98]
    AS [dbo];
