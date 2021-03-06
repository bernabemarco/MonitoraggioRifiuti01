﻿CREATE VIEW VISTACODICINEUTRI AS
select CODICE+'#' as CODICE,DESCRIZIONE,GRUPPO,
    CATEGORIA,CODCATEGORIASTAT,PESONETTO,SUPERFICIE,
    CUBATURA,NOMENCLCOMBINATA1,NOMENCLCOMBINATA2,
    ORIGINEINTRA,CODICEARTIMBALLO,NRPEZZIIMBALLO,
    RIFERIMIMBALLO,AGGIORNAMAG,MOVIMENTAPARTITE,
    MOVIMENTAMATRICOLE,CODDEPOSITO,
    NRTIPRAGGRUPPATE,VARESPLICITE,CODICEPRIMARIO,
    ARTTIPOLOGIA
    from ANAGRAFICAARTICOLI
    where(ARTTIPOLOGIA<>0)

GO
GRANT DELETE
    ON OBJECT::[dbo].[VISTACODICINEUTRI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[VISTACODICINEUTRI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTACODICINEUTRI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[VISTACODICINEUTRI] TO [Metodo98]
    AS [dbo];

