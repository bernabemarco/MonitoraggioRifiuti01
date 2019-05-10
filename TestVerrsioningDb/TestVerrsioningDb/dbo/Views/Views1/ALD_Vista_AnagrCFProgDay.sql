﻿




CREATE VIEW [dbo].[ALD_Vista_AnagrCFProgDay]
AS
SELECT        TESTEDOCUMENTI.CODCFFATT AS CODCLIFOR
FROM            TESTEDOCUMENTI INNER JOIN
                         PARAMETRIDOC ON TESTEDOCUMENTI.TIPODOC = PARAMETRIDOC.CODICE
WHERE        (TESTEDOCUMENTI.DOCCHIUSO = 0) AND (PARAMETRIDOC.TIPO = 'O') and YEAR(TESTEDOCUMENTI.DATADOC)>=2013
union all
SELECT     TESTEDOCUMENTI.CODCFFATT AS CODCLIFOR
FROM         TESTEDOCUMENTI INNER JOIN
                      PARAMETRIDOC ON TESTEDOCUMENTI.TIPODOC = PARAMETRIDOC.CODICE
WHERE     (TESTEDOCUMENTI.DOCCHIUSO = 0) AND (PARAMETRIDOC.TIPO = 'B') and YEAR(TESTEDOCUMENTI.DATADOC)>=2013
union all
SELECT     TESTEDOCUMENTI.CODCFFATT AS CODCLIFOR
FROM         TESTEDOCUMENTI INNER JOIN
                      PARAMETRIDOC ON TESTEDOCUMENTI.TIPODOC = PARAMETRIDOC.CODICE
WHERE     (TESTEDOCUMENTI.DOCCHIUSO = 0) AND (PARAMETRIDOC.TIPO IN ('F', 'N')) AND (TESTEDOCUMENTI.DATADOC > CONVERT(DATETIME, 
                      '2013-01-01 00:00:00', 102))
union all
SELECT     CODCLIFOR
FROM         TABSCADENZE
WHERE     (ESITO IN (0, 1, 3))
union all
SELECT     RIGHECONTABILITA.CONTO AS CodCliFor
FROM         TESTECONTABILITA INNER JOIN
                      RIGHECONTABILITA ON TESTECONTABILITA.PROGRESSIVO = RIGHECONTABILITA.NRREG INNER JOIN
                      EXTRACLIENTI ON RIGHECONTABILITA.CONTO = EXTRACLIENTI.CODCONTO
WHERE     (TESTECONTABILITA.PROVVISORIO = 1) AND (TESTECONTABILITA.CAUSALE = 38 OR
                      TESTECONTABILITA.CAUSALE = 39)
union all
SELECT        CODCLIFAT AS CodClifor
FROM            GEM_TESTACONTRATTO
WHERE        (IdStato = 1)




GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_Vista_AnagrCFProgDay] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_Vista_AnagrCFProgDay] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_Vista_AnagrCFProgDay] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_Vista_AnagrCFProgDay] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_Vista_AnagrCFProgDay] TO [Metodo98]
    AS [dbo];

