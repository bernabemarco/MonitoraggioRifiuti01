
CREATE VIEW [dbo].[VISTA_GESTIONEPREZZIPARTICOLARI_VALIDI]
AS
SELECT DISTINCT Progressivo, 'Cliente su Articolo' As Tiporegola,
                      CASE WHEN GP.CODCLIFOR = '*' THEN 'Tutti' ELSE Gp.CodCLIFOR END AS CODCLIFOR, 
                      CASE WHEN GP.CODART = '*' THEN 'Tutti' ELSE Gp.CODART END AS CODART, 
                      GPR.QTAMINIMA,
                     (Select Price from price.GetSpecialPrice_Discount(
                        CODCLIFOR 
                      ,Gp.CODART 
                      , GPR.QTAMINIMA 
                       , CONVERT(date,GETDATE())
                       ,YEAR(getdate())
                       ,(Select LISTINO from ANAGRAFICARISERVATICF Where CODCONTO =CODCLIFOR  and ESERCIZIO = year(getdate()))
                      ,  (Select UM from articoliumpreferite UMP where tipoum =1 and UMP.CODART = Gp.CODART )
                      ,''
                      ,0
                      ,''
                      ,0
                      ,''
                      )
                      ) as PrezzoParticolare,
                  (Select DiscountEX from price.GetSpecialPrice_Discount(CODCLIFOR 
                      ,Gp.CODART 
                      , GPR.QTAMINIMA 
                       , CONVERT(date,GETDATE())
                       ,YEAR(getdate())
                       ,(Select LISTINO from ANAGRAFICARISERVATICF Where CODCONTO =CODCLIFOR  and ESERCIZIO = year(getdate()))
                      ,  (Select UM from articoliumpreferite UMP where tipoum =1 and UMP.CODART = Gp.CODART )
                    ,''
                      ,0
                      ,''
                      ,0
                      ,''
                         )) as Sconto 
                        ,GP.INIZIOVALIDITA, GP.FINEVALIDITA                   
    
FROM         dbo.GESTIONEPREZZI GP Inner Join 
            dbo.GESTIONEPREZZIRIGHE  GPR On  Gp.PROGRESSIVO = Gpr.RIFPROGRESSIVO
WHERE     (CODGRUPPOPREZZIMAG = 0) AND (CODGRUPPOPREZZICF = 0) AND GP.FINEVALIDITA >= CONVERT(DATE, GETDATE())
UNION ALL
SELECT DISTINCT Progressivo, 'Clienti su Gruppo Prezzi Articolo' As Tiporegola,
                      CASE WHEN Gp.CODCLIFOR = '*' THEN 'Tutti' ELSE GP.CodCLIFOR END AS CODCLIFOR
                      , ANAGRAFICAARTICOLICOMM.CODICEART AS CODART
                      ,GPR.QTAMINIMA
                      ,
                      (Select Price from price.GetSpecialPrice_Discount(CODCLIFOR 
                      ,ANAGRAFICAARTICOLICOMM.CODICEART
                      , GPR.QTAMINIMA
                       , CONVERT(date,GETDATE())
                       ,YEAR(getdate())
                       ,(Select LISTINO from ANAGRAFICARISERVATICF Where CODCONTO =GP.CODCLIFOR  and ESERCIZIO = year(getdate()))
                      ,(Select UM from articoliumpreferite UMP where tipoum =1 and UMP.CODART = Gp.CODART )
                       ,''
                      ,0
                      ,''
                      ,0
                      ,''
                         )) as PrezzoParticolare,
                    (Select DiscountEX from price.GetSpecialPrice_Discount(CODCLIFOR 
                      ,ANAGRAFICAARTICOLICOMM.CODICEART
                      , GPR.QTAMINIMA
                       , CONVERT(date,GETDATE())
                       ,YEAR(getdate())
                       ,(Select LISTINO from ANAGRAFICARISERVATICF Where CODCONTO =GP.CODCLIFOR  and ESERCIZIO = year(getdate()))
                      ,(Select UM from articoliumpreferite UMP where tipoum =1 and UMP.CODART = Gp.CODART )
                      ,''
                      ,0
                      ,''
                      ,0
                      ,''
                         )) as Sconto
                        ,GP.INIZIOVALIDITA, GP.FINEVALIDITA    


FROM  GESTIONEPREZZI GP
        INNER JOIN 
        dbo.GESTIONEPREZZIRIGHE  GPR On  Gp.PROGRESSIVO = Gpr.RIFPROGRESSIVO
        INNER JOIN
        TABRAGGRUPPAPREZZI ON GP.CODGRUPPOPREZZIMAG = TABRAGGRUPPAPREZZI.CODICE 
        INNER JOIN
        ANAGRAFICAARTICOLICOMM ON TABRAGGRUPPAPREZZI.CODICE = ANAGRAFICAARTICOLICOMM.GRUPPOPRZPART
WHERE     (GP.CODGRUPPOPREZZIMAG > 0) AND (CODGRUPPOPREZZICF = 0) AND (ANAGRAFICAARTICOLICOMM.ESERCIZIO = YEAR(GETDATE()))
AND GP.FINEVALIDITA >= CONVERT(DATE, GETDATE())

UNION ALL
SELECT DISTINCT Progressivo, 'Gruppo Prezzi Clienti su Articolo' As Tiporegola,
                      A.CODCONTO AS CODCLIFOR, CASE WHEN Gp.CODART = '*' THEN 'Tutti' ELSE GP.CODART END AS CODART,
                      GPR.QTAMINIMA,
                      (Select Price from price.GetSpecialPrice_Discount(  A.CODCONTO
                      ,Gp.CODART 
                      , GPR.QTAMINIMA
                       , CONVERT(date,GETDATE())
                       ,YEAR(getdate())
                       ,(Select LISTINO from ANAGRAFICARISERVATICF Where CODCONTO = A.CODCONTO and ESERCIZIO = year(getdate()))
                      ,(Select UM from articoliumpreferite UMP where tipoum =1 and UMP.CODART = Gp.CODART )
                      ,''
                      ,0
                      ,''
                      ,0
                      ,''
                         
                         )) as PrezzoParticolare,
               (Select DiscountEX from price.GetSpecialPrice_Discount(  A.CODCONTO
                      ,Gp.CODART 
                      , GPR.QTAMINIMA
                       , CONVERT(date,GETDATE())
                       ,YEAR(getdate())
                       ,(Select LISTINO from ANAGRAFICARISERVATICF Where CODCONTO = A.CODCONTO and ESERCIZIO = year(getdate()))
                      ,(Select UM from articoliumpreferite UMP where tipoum =1 and UMP.CODART = Gp.CODART )
                      ,''
                      ,0
                      ,''
                      ,0
                      ,''
                         )) as Sconto   
                        ,GP.INIZIOVALIDITA, GP.FINEVALIDITA   

FROM         GESTIONEPREZZI  GP
INNER JOIN 
        GESTIONEPREZZIRIGHE  GPR On  Gp.PROGRESSIVO = Gpr.RIFPROGRESSIVO
        INNER JOIN
            TABRAGGRPREZZICF ON GP.CODGRUPPOPREZZICF = TABRAGGRPREZZICF.CODICE 
        INNER JOIN
            ANAGRAFICARISERVATICF A ON TABRAGGRPREZZICF.CODICE = A.CODGRUPPOPREZZIPART
WHERE     (GP.CODGRUPPOPREZZIMAG = 0) AND (GP.CODGRUPPOPREZZICF > 0) AND 
                      (A.ESERCIZIO = YEAR(GETDATE()))
AND GP.FINEVALIDITA >= CONVERT(DATE, GETDATE())


GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTA_GESTIONEPREZZIPARTICOLARI_VALIDI] TO [Metodo98]
    AS [dbo];

