

CREATE VIEW VistaRelazioniCfvGdo
AS
SELECT     CODCLIFOR, RIFERIMENTO, ARTICOLO, VARIANTI, DESCRIZIONE, TIPOREL, MOSTRAVARIANTI, 
           (CASE WHEN VARIANTI <> '' THEN
              CASE WHEN VARESPLICITE = '' THEN
                  (SELECT     Descrizione
                   FROM       AnagraficaArticoli
                   WHERE      Codice = ARTICOLO + '#' + VARIANTI) 
              ELSE
                  (SELECT DESCRIZIONE 
                   FROM   ANAGRAFICAARTICOLI 
                   WHERE  CODICE =  (select dbo.FUSRicercaArticolo_Varianti(RELAZIONICFV.ARTICOLO,RELAZIONICFV.VARESPLICITE)))
              END
            ELSE
              (SELECT     Descrizione
               FROM       AnagraficaArticoli
               WHERE      Codice = ARTICOLO) 
            END) AS DSCART, 
                           
           (CASE WHEN VARIANTI <> '' THEN
               CASE WHEN VARESPLICITE = '' THEN
                   (SELECT     ArtTipologia
                    FROM       AnagraficaArticoli
                    WHERE      Codice = ARTICOLO + '#' + VARIANTI) 
               ELSE
                   (SELECT    ARTTIPOLOGIA
                    FROM      ANAGRAFICAARTICOLI
                    WHERE CODICE = (select dbo.FUSRicercaArticolo_Varianti(RELAZIONICFV.ARTICOLO,RELAZIONICFV.VARESPLICITE)))
               END 
            ELSE
              (SELECT     ArtTipologia
               FROM       AnagraficaArticoli
               WHERE      Codice = ARTICOLO) 
            END) AS ARTTIPOLOGIA, 
            
            (CASE WHEN VARIANTI <> '' THEN
               CASE WHEN VARESPLICITE = '' THEN
                  (SELECT    CodicePrimario
                   FROM      AnagraficaArticoli
                   WHERE     Codice = ARTICOLO + '#' + VARIANTI) 
               ELSE
                  (SELECT     CODICEPRIMARIO
                   FROM       ANAGRAFICAARTICOLI
                   WHERE      CODICE = (select dbo.FUSRicercaArticolo_Varianti(RELAZIONICFV.ARTICOLO,RELAZIONICFV.VARESPLICITE)))
               END 
             ELSE
               (SELECT     CodicePrimario
                FROM       AnagraficaArticoli
                WHERE      Codice = ARTICOLO) 
             END) AS CODICEPRIMARIO, 
                            
             (CASE WHEN TIPOREL = 1 THEN ARTICOLO ELSE RIFERIMENTO END) AS CODICERIF, 
             
             (CASE WHEN Varianti = '' OR Varianti IS NULL THEN 
                Articolo 
              ELSE 
                CASE WHEN VARESPLICITE = ''  THEN   
                  (Articolo + '#' + Varianti)
                ELSE
                  (select dbo.FUSRicercaArticolo_Varianti(RELAZIONICFV.ARTICOLO,RELAZIONICFV.VARESPLICITE))
                END
              END) CodArticolo,
              escludiperperiodo,VARESPLICITE 

FROM         RELAZIONICFV


GO
GRANT DELETE
    ON OBJECT::[dbo].[VistaRelazioniCfvGdo] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[VistaRelazioniCfvGdo] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[VistaRelazioniCfvGdo] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[VistaRelazioniCfvGdo] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[VistaRelazioniCfvGdo] TO [Metodo98]
    AS [dbo];

