

CREATE VIEW [dbo].[TP_VISTAPROGRESSIVORIGADOCEURITMO]
AS


    SELECT 
        ROW_NUMBER() OVER (PARTITION BY IDTESTA ORDER BY IDTESTA,IDRIGA) AS NUMERORIGA,
        IDTESTA,
        IDRIGA,
        TIPODOC,
        NUMERODOC,
        ESERCIZIO,
        CODART 
    FROM 
        RIGHEDOCUMENTI 
    WHERE   idtesta   in (select progressivo from testedocumenti where esercizio in (Select codice from TabEserciziEuritmo) 
                                                                  and tipodoc    in (Select codice from TabDocumentiEuritmo)
                                                                  and codclifor  in (select codice from tabcliforeuritmo))
    AND     tiporiga In('N','O')
    UNION ALL
    SELECT 
        0 AS NUMERORIGA,
        IDTESTA,
        IDRIGA,
        TIPODOC,
        NUMERODOC,
        ESERCIZIO,
        CODART 
    FROM 
        RIGHEDOCUMENTI 
    WHERE   idtesta   in (select progressivo from testedocumenti where esercizio in (Select codice from TabEserciziEuritmo) 
                                                                  and tipodoc    in (Select codice from TabDocumentiEuritmo)
                                                                  and codclifor  in (select codice from tabcliforeuritmo))
    AND     tiporiga Not In('N','O')


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_VISTAPROGRESSIVORIGADOCEURITMO] TO [Metodo98]
    AS [dbo];

