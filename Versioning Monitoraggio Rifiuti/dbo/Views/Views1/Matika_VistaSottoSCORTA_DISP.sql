﻿
CREATE VIEW dbo.Matika_VistaSottoSCORTA_DISP
AS
SELECT ANAGRAFICAARTICOLIPROD.ESERCIZIO, 
    ANAGRAFICAARTICOLIPROD.CODICEART, 
    ANAGRAFICAARTICOLI.DESCRIZIONE, 
    ANAGRAFICAARTICOLIPROD.SCORTAMIN, 
    ANAGRAFICAARTICOLIPROD.SCORTAMAX, 
    ISNULL(Matika_VistaSottoSCORTA1.giacenza, 0) 
    AS GIACENZA, ISNULL(Matika_VistaSottoSCORTA1.ordinato, 0) 
    AS ORDINATO, ISNULL(Matika_VistaSottoSCORTA1.impegnato, 
    0) AS IMPEGNATO, 
    ISNULL(Matika_VistaSottoSCORTA1.giacenza, 0) 
    + ISNULL(Matika_VistaSottoSCORTA1.ordinato, 0) 
    - ISNULL(Matika_VistaSottoSCORTA1.impegnato, 0) 
    - ANAGRAFICAARTICOLIPROD.SCORTAMIN AS disponibile
FROM Matika_VistaSottoSCORTA1_DISP AS Matika_VistaSottoSCORTA1 RIGHT OUTER JOIN
    ANAGRAFICAARTICOLIPROD ON 
    Matika_VistaSottoSCORTA1.CODART = ANAGRAFICAARTICOLIPROD.CODICEART
     INNER JOIN
    ANAGRAFICAARTICOLI ON 
    ANAGRAFICAARTICOLIPROD.CODICEART = ANAGRAFICAARTICOLI.CODICE
WHERE (ISNULL(Matika_VistaSottoSCORTA1.giacenza, 0) 
    + ISNULL(Matika_VistaSottoSCORTA1.ordinato, 0) 
    - ISNULL(Matika_VistaSottoSCORTA1.impegnato, 0) 
    - ANAGRAFICAARTICOLIPROD.SCORTAMIN < 0)




GO
GRANT DELETE
    ON OBJECT::[dbo].[Matika_VistaSottoSCORTA_DISP] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Matika_VistaSottoSCORTA_DISP] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Matika_VistaSottoSCORTA_DISP] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Matika_VistaSottoSCORTA_DISP] TO [Metodo98]
    AS [dbo];

