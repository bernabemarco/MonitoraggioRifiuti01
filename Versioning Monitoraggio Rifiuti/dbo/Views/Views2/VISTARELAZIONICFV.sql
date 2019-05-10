

CREATE VIEW VISTARELAZIONICFV
AS
SELECT     CODCLIFOR, RIFERIMENTO, ARTICOLO, VARIANTI, DESCRIZIONE, TIPOREL, MOSTRAVARIANTI, UTENTEMODIFICA, DATAMODIFICA, 

                      (CASE WHEN VARIANTI = '' OR VARIANTI IS NULL OR CHARINDEX('?', VARIANTI) > 0 THEN
                          (SELECT     DESCRIZIONE
                            FROM      ANAGRAFICAARTICOLI
                            WHERE     CODICE = ARTICOLO) 
                       ELSE 
                           CASE WHEN VARESPLICITE = '' THEN
                              (SELECT     DESCRIZIONE
                               FROM       ANAGRAFICAARTICOLI
                               WHERE      CODICE = ARTICOLO + '#' + VARIANTI) 
                           ELSE     
                              (SELECT DESCRIZIONE 
                               FROM   ANAGRAFICAARTICOLI 
                               WHERE  CODICE =  (select dbo.FUSRicercaArticolo_Varianti(RELAZIONICFV.ARTICOLO,RELAZIONICFV.VARESPLICITE)))
                           END
                       END) AS DSCART, 
                     
                      (CASE WHEN VARIANTI = '' OR VARIANTI IS NULL OR CHARINDEX('?', VARIANTI) > 0 THEN
                          (SELECT    ARTTIPOLOGIA
                           FROM      ANAGRAFICAARTICOLI
                           WHERE     CODICE = ARTICOLO) 
                       ELSE
                          CASE WHEN VARESPLICITE = '' THEN 
                           (SELECT    ARTTIPOLOGIA
                            FROM      ANAGRAFICAARTICOLI
                            WHERE     CODICE = ARTICOLO + '#' + VARIANTI) 
                          ELSE   
                            (SELECT    ARTTIPOLOGIA
                             FROM      ANAGRAFICAARTICOLI
                             WHERE CODICE = (select dbo.FUSRicercaArticolo_Varianti(RELAZIONICFV.ARTICOLO,RELAZIONICFV.VARESPLICITE)))   
                          END
                       END) AS ARTTIPOLOGIA, 
                     
                     (CASE WHEN VARIANTI = '' OR VARIANTI IS NULL OR CHARINDEX('?', VARIANTI) > 0 THEN
                          (SELECT    CODICE
                           FROM      ANAGRAFICAARTICOLI
                           WHERE     CODICE = ARTICOLO) 
                      ELSE
                          CASE WHEN VARESPLICITE = '' THEN   
                            (SELECT     CODICEPRIMARIO
                             FROM       ANAGRAFICAARTICOLI
                             WHERE      CODICE = ARTICOLO + '#' + VARIANTI) 
                          ELSE
                            (SELECT     CODICEPRIMARIO
                             FROM       ANAGRAFICAARTICOLI
                             WHERE      CODICE = (select dbo.FUSRicercaArticolo_Varianti(RELAZIONICFV.ARTICOLO,RELAZIONICFV.VARESPLICITE)))
                          END      
                      END) AS CODICEPRIMARIO, 
                      (CASE WHEN TIPOREL = 1 THEN ARTICOLO ELSE RIFERIMENTO END) AS CODICERIF, 
                      (CASE WHEN Varianti = '' OR VARIANTI IS NULL THEN 
                        Articolo 
                       ELSE 
                         CASE WHEN VARESPLICITE = ''  THEN   
                           (Articolo + '#' + replace(Varianti, '?', '%')) 
                         ELSE
                           (select dbo.FUSRicercaArticolo_Varianti(RELAZIONICFV.ARTICOLO,RELAZIONICFV.VARESPLICITE))
                         END
                       END) CodArticolo, 
                       
                       escludiperperiodo,VARESPLICITE 

FROM         RELAZIONICFV


GO
GRANT DELETE
    ON OBJECT::[dbo].[VISTARELAZIONICFV] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[VISTARELAZIONICFV] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTARELAZIONICFV] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[VISTARELAZIONICFV] TO [Metodo98]
    AS [dbo];

