

CREATE  VIEW [dbo].[VISTA_GESTIONEPREZZIPARTICOLARI_XML_VALIDI]
--ENCRY--
AS
--1 = Clienti su Articoli
--2 = Clienti/Fornitori Puntuali su gruppo Prezzi Mag(sviluppo articoli)
--4 = Clienti/Fornitori (Sviluppati) e Articoli Puntuali 
--3 Tutti i Clienti e Articoli da Gruppo Prezzi Mag

SELECT DISTINCT Progressivo, 
					  1 As Tiporegola,
                      GP.CodCLIFOR  AS CODCLIFOR, 
                      TEM.CODART AS CODART, 
                      GPR.UM,
                      GPR.QTAMINIMA,
                     (Select Price from price.GetSpecialPrice_Discount(CODCLIFOR 
                      ,TEM.CODART 
                      , GPR.QTAMINIMA 
                       , GP.FINEVALIDITA
                       ,YEAR(getdate())
                       ,(Select LISTINO from ANAGRAFICARISERVATICF Where CODCONTO =CODCLIFOR  and ESERCIZIO = year(getdate()))
                      ,  ISNULL((Select UM from articoliumpreferite UMP where tipoum =1 and UMP.CODART = Gp.CODART ),'')
                      ,0
                        ,''
                         ,'')) as PrezzoParticolare,
				  (Select DiscountEX from price.GetSpecialPrice_Discount(CODCLIFOR 
                      ,TEM.CODART 
                      , GPR.QTAMINIMA 
                       ,GP.FINEVALIDITA
                       ,YEAR(getdate())
                       ,(Select LISTINO from ANAGRAFICARISERVATICF Where CODCONTO =CODCLIFOR  and ESERCIZIO = year(getdate()))
                      ,  ISNULL((Select UM from articoliumpreferite UMP where tipoum =1 and UMP.CODART = Gp.CODART ),'')
                      ,0
                        ,''
                         , CASE GP.CODART WHEN '*' THEN '@ForceItemIsEmpty' ELSE ''END  )
						) as Sconto 
						,GP.INIZIOVALIDITA, GP.FINEVALIDITA                   
	
FROM         dbo.GESTIONEPREZZI GP 
Inner Join 	dbo.GESTIONEPREZZIRIGHE  GPR On  Gp.PROGRESSIVO = Gpr.RIFPROGRESSIVO
Inner Join 	dbo.TP_EXTRAMAG  TEM On  TEM.ESPORTABILE = 0 AND TEM.CODART LIKE GP.CODARTRIC
WHERE     (CODGRUPPOPREZZIMAG = 0) AND (CODGRUPPOPREZZICF = 0) AND GP.FINEVALIDITA >= CONVERT(DATE, GETDATE()) and GP.CODART <>'' and CODCLIFOR <>'' AND (CODCLIFOR <>'C'  AND CODCLIFOR<>'F')

UNION ALL
SELECT DISTINCT Progressivo, 
					  2 As Tiporegola,
                      CASE WHEN (Gp.CODCLIFOR = '*') THEN 'Tutti' ELSE GP.CodCLIFOR END AS CODCLIFOR
                      , ANAGRAFICAARTICOLICOMM.CODICEART AS CODART
                      ,GPR.UM
                      ,GPR.QTAMINIMA
                      
                      ,
                      (Select Price from price.GetSpecialPrice_Discount(CODCLIFOR 
                      ,ANAGRAFICAARTICOLICOMM.CODICEART
                      , GPR.QTAMINIMA
                      -- , CONVERT(date,GETDATE())
                       ,GP.FINEVALIDITA
					   ,YEAR(getdate())
                       ,(Select LISTINO from ANAGRAFICARISERVATICF Where CODCONTO =GP.CODCLIFOR  and ESERCIZIO = year(getdate()))
                      ,(Select UM from articoliumpreferite UMP where tipoum =1 and UMP.CODART = Gp.CODART )
                      ,0
                        ,''
                         ,'')) as PrezzoParticolare,
					(Select DiscountEX from price.GetSpecialPrice_Discount(CODCLIFOR 
                      ,ANAGRAFICAARTICOLICOMM.CODICEART
                      , GPR.QTAMINIMA
                       , GP.FINEVALIDITA
                       ,YEAR(getdate())
                       ,(Select LISTINO from ANAGRAFICARISERVATICF Where CODCONTO =GP.CODCLIFOR  and ESERCIZIO = year(getdate()))
                      ,(Select UM from articoliumpreferite UMP where tipoum =1 and UMP.CODART = Gp.CODART )
                      ,0
                        ,''
                         ,'')) as Sconto
						,GP.INIZIOVALIDITA, GP.FINEVALIDITA    


FROM  GESTIONEPREZZI GP
		INNER JOIN 
		dbo.GESTIONEPREZZIRIGHE  GPR On  Gp.PROGRESSIVO = Gpr.RIFPROGRESSIVO
		INNER JOIN
        TABRAGGRUPPAPREZZI ON GP.CODGRUPPOPREZZIMAG = TABRAGGRUPPAPREZZI.CODICE 
        INNER JOIN
        ANAGRAFICAARTICOLICOMM ON TABRAGGRUPPAPREZZI.CODICE = ANAGRAFICAARTICOLICOMM.GRUPPOPRZPART
WHERE     (GP.CODGRUPPOPREZZIMAG > 0) AND (CODGRUPPOPREZZICF = 0) AND (ANAGRAFICAARTICOLICOMM.ESERCIZIO = YEAR(GETDATE()))
AND GP.FINEVALIDITA >= CONVERT(DATE, GETDATE()) and CODCLIFOR <>'' 
AND (GP.CODCLIFOR <> 'C' AND GP.CODCLIFOR <> 'F')

UNION ALL
SELECT DISTINCT Progressivo, 4 As Tiporegola,
                      A.CODCONTO AS CODCLIFOR, 
                      --CASE WHEN Gp.CODART = '*' THEN 'Tutti' ELSE TEM.CODART END AS CODART,
                    TEM.CODART AS CODART,
                      GPR.UM,
                      GPR.QTAMINIMA,
                      (Select Price from price.GetSpecialPrice_Discount(  A.CODCONTO
                      ,TEM.CODART 
                      , GPR.QTAMINIMA
                       ,GP.FINEVALIDITA
                       ,YEAR(getdate())
                       ,(Select LISTINO from ANAGRAFICARISERVATICF Where CODCONTO = A.CODCONTO and ESERCIZIO = year(getdate()))
                      ,(Select UM from articoliumpreferite UMP where tipoum =1 and UMP.CODART = Gp.CODART )
                      ,0
                        ,''
                         ,'')) as PrezzoParticolare,
               (Select DiscountEX from price.GetSpecialPrice_Discount(  A.CODCONTO
                      ,TEM.CODART 
                      , GPR.QTAMINIMA
                       , GP.FINEVALIDITA
                       ,YEAR(getdate())
                       ,(Select LISTINO from ANAGRAFICARISERVATICF Where CODCONTO = A.CODCONTO and ESERCIZIO = year(getdate()))
                      ,(Select UM from articoliumpreferite UMP where tipoum =1 and UMP.CODART = Gp.CODART )
                      ,0
                        ,''
                         ,'')) as Sconto   
						,GP.INIZIOVALIDITA, GP.FINEVALIDITA   

FROM         GESTIONEPREZZI  GP
INNER JOIN 
		GESTIONEPREZZIRIGHE  GPR On  Gp.PROGRESSIVO = Gpr.RIFPROGRESSIVO
		INNER JOIN
			TABRAGGRPREZZICF ON GP.CODGRUPPOPREZZICF = TABRAGGRPREZZICF.CODICE 
		INNER JOIN
            ANAGRAFICARISERVATICF A ON TABRAGGRPREZZICF.CODICE = A.CODGRUPPOPREZZIPART
Inner Join 	dbo.TP_EXTRAMAG  TEM On  TEM.ESPORTABILE = 0 AND TEM.CODART LIKE GP.CODARTRIC
WHERE     (GP.CODGRUPPOPREZZIMAG = 0) AND (GP.CODGRUPPOPREZZICF > 0) AND 
                      (A.ESERCIZIO = YEAR(GETDATE()))
AND GP.FINEVALIDITA >= CONVERT(DATE, GETDATE())

UNION ALL

--------------------------------


SELECT DISTINCT Progressivo, 
					  3 As Tiporegola,
                      CF.CODCONTO AS CODCLIFOR
                      , ART.CODICEART AS CODART
                      ,GPR.UM
                      ,GPR.QTAMINIMA
                      
                      ,
                      (Select Price from price.GetSpecialPrice_Discount(CF.CODCONTO 
                      ,ART.CODICEART
                      , GPR.QTAMINIMA
                       , GP.FINEVALIDITA
                       ,YEAR(getdate())
                       ,(Select LISTINO from ANAGRAFICARISERVATICF ACF Where ACF.CODCONTO =CF.CODCONTO  and ACF.ESERCIZIO = year(getdate()))
                      ,(Select UM from articoliumpreferite UMP where tipoum =1 and UMP.CODART = Gp.CODART )
                      ,0
                        ,''
                         ,'')) as PrezzoParticolare,
					(Select DiscountEX from price.GetSpecialPrice_Discount(CF.CODCONTO 
                      ,ART.CODICEART
                      , GPR.QTAMINIMA
                       , GP.FINEVALIDITA
                       ,YEAR(getdate())
                       ,(Select LISTINO from ANAGRAFICARISERVATICF ACF Where ACF.CODCONTO =CF.CODCONTO  and ACF.ESERCIZIO = year(getdate()))
                      ,(Select UM from articoliumpreferite UMP where tipoum =1 and UMP.CODART = Gp.CODART )
                      ,0
                        ,''
                         ,'')) as Sconto
						,GP.INIZIOVALIDITA, GP.FINEVALIDITA    


FROM  GESTIONEPREZZI GP
		INNER JOIN 
		dbo.GESTIONEPREZZIRIGHE  GPR On  Gp.PROGRESSIVO = Gpr.RIFPROGRESSIVO
		INNER JOIN
        TABRAGGRUPPAPREZZI ON GP.CODGRUPPOPREZZIMAG = TABRAGGRUPPAPREZZI.CODICE 
        INNER JOIN
        ANAGRAFICAARTICOLICOMM ART ON TABRAGGRUPPAPREZZI.CODICE = ART.GRUPPOPRZPART,
        ANAGRAFICACF CF
        
WHERE     (GP.CODGRUPPOPREZZIMAG > 0) AND (CODGRUPPOPREZZICF = 0) AND (ART.ESERCIZIO = YEAR(GETDATE()))
AND GP.FINEVALIDITA >= CONVERT(DATE, GETDATE()) and (GP.CODCLIFOR ='C'  OR GP.CODCLIFOR ='*')
AND CF.TIPOCONTO ='C'


--------------------------------


GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTA_GESTIONEPREZZIPARTICOLARI_XML_VALIDI] TO [Metodo98]
    AS [dbo];

