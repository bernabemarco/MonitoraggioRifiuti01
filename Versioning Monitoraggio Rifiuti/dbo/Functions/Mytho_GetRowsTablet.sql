CREATE FUNCTION [dbo].[Mytho_GetRowsTablet] ( @Rows As Progressivi_GestionePrezzi READONLY , @Type bit)

RETURNS @returntable TABLE 
(
     Progressivo DECIMAL(10,0), 
     Tiporegola SMALLINT,
     UsaPrzCommerciali SMALLINT, 
     CODCLIFOR VARCHAR(7),
     Destinazione DECIMAL(5,0), 
     Codart VARCHAR(50), 
     Um VARCHAR(3), 
     QtaMinima DECIMAL(16,6),
     Prezzo DECIMAL (19,6),
     Sconto VARCHAR(20),
     Tipo SMALLINT,
     InizioValidita DATETIME,
     FineValidita DATETIME,
     UtenteModifica VARCHAR(25),
     Datamodifica DATETIME,
     DiscountXML XML
)
--ENCRY--
AS

BEGIN
    
    DECLARE @CliFor TABLE (CODCONTO VARCHAR(7), Listino DECIMAL(5,0), USAPRZCOMMERCIALI SMALLINT)

    
    INSERT INTO @CliFor (CODCONTO,Listino, USAPRZCOMMERCIALI)
    SELECT CODCONTO , LISTINO, UsaPrzPrvPart FROM AnagraficaClientitablet;
    

    
    WITH List  (Progressivo, Tiporegola, USAPRZCOMMERCIALI , CODCLIFOR, DESTINAZIONE,CODART, UM, QTAMINIMA, LISTINO,UMART, TIPO,INIZIOVALIDITA, FINEVALIDITA)
    AS
    (
    -----Prezzi-Classificati---------------------------------------
    --Cliente - Articolo -------------------------------------
    SELECT  GP.Progressivo 
            ,1 As Tiporegola
            ,CLIFOR.USAPRZCOMMERCIALI
            ,GP.CodCLIFOR  AS CODCLIFOR 
            ,ISNULL(DD.CODICE,0) AS DESTINAZIONE
            ,TEM.CODICE AS CODART
            ,GP.UM
            ,GP.QTAMINIMA
            ,CLIFOR.LISTINO AS LISTINO
            ,ISNULL(UMP.UM,'') AS UMART
            ,0 As tipo
            ,GP.INIZIOVALIDITA
            ,GP.FINEVALIDITA                   
    FROM dbo.REGOLEPREZZIESTESI GP 
        INNER JOIN @Rows S On S.ProgressivoIns = Gp.PROGRESSIVO
        INNER JOIN dbo.ANAGRAFICAARTICOLI TEM On  TEM.CODICE like GP.CODARTTIPOLOGIA
        LEFT OUTER JOIN dbo.ARTICOLIUMPREFERITE UMP ON UMP.CODART = TEM.CODICE AND UMP.TIPOUM =3
        LEFT OUTER JOIN @CliFor CLIFOR ON CLIFOR.CODCONTO =GP.CODCLIFOR          
        LEFT OUTER JOIN (SELECT 0 CODICE,CODCONTO FROM dbo.ANAGRAFICACF 
                             UNION     
                             SELECT CODICE, CODCONTO FROM dbo.DESTINAZIONIDIVERSE 
                             WHERE EXISTS(SELECT Codart FROM dbo.REGOLEPREZZIESTESI WHERE CODDESTINAZIONE <>0)) DD ON DD.CODCONTO = CLIFOR.CODCONTO 
    WHERE   USAPRZCOMMERCIALI=1 AND (CODGRUPPOPREZZIMAG = 0) 
        AND (CODGRUPPOPREZZICF = 0) 
        AND GP.FINEVALIDITA >= CONVERT(DATE, GETDATE()) 
        AND GP.CODART <>'' 
        AND GP.CODCLIFOR <>'' 
        AND (GP.CODCLIFOR <>'C'  AND GP.CODCLIFOR<>'F')
        AND CLIFOR.USAPRZCOMMERCIALI = 1
        AND @type =1

    UNION 
    --Cliente - Categorie Merceologiche -------------------------------------
    SELECT  GP.Progressivo 
            ,1 As Tiporegola
            ,CLIFOR.USAPRZCOMMERCIALI
            ,GP.CodCLIFOR  AS CODCLIFOR 
            ,ISNULL(DD.CODICE,0) AS DESTINAZIONE
            ,TEM.CODICE AS CODART
            ,GP.UM
            ,GP.QTAMINIMA
            ,CLIFOR.LISTINO AS LISTINO
            ,ISNULL(UMP.UM,'') AS UMART
            ,0 As tipo
            ,GP.INIZIOVALIDITA
            ,GP.FINEVALIDITA                   
    FROM dbo.REGOLEPREZZIESTESI GP 
        INNER JOIN @Rows S On S.ProgressivoIns = Gp.PROGRESSIVO
        INNER JOIN (SELECT  [CodFeature], [CodArticolo] FROM dbo.FEATUREARTICOLO GROUP BY [CodFeature], [CodArticolo] ) FEA ON FEA.[CodFeature] = GP.CodFeature
        INNER JOIN ANAGRAFICAARTICOLI ART ON ART.CODICE = FEA.CodArticolo AND ART.VARESPLICITE LIKE GP.VARESPLICITE
        INNER JOIN dbo.ANAGRAFICAARTICOLI TEM On  TEM.CODICE like ART.CODICE

        LEFT OUTER JOIN dbo.ARTICOLIUMPREFERITE UMP ON UMP.CODART = TEM.CODICE AND UMP.TIPOUM =3
        LEFT OUTER JOIN @CliFor CLIFOR ON CLIFOR.CODCONTO =GP.CODCLIFOR          
        LEFT OUTER JOIN (SELECT 0 CODICE,CODCONTO FROM dbo.ANAGRAFICACF 
                             UNION     
                             SELECT CODICE, CODCONTO FROM dbo.DESTINAZIONIDIVERSE 
                             WHERE EXISTS(SELECT Codart FROM dbo.REGOLEPREZZIESTESI WHERE CODDESTINAZIONE <>0)) DD ON DD.CODCONTO = CLIFOR.CODCONTO 
    WHERE   USAPRZCOMMERCIALI=1 AND (CODGRUPPOPREZZIMAG = 0) 
        AND (CODGRUPPOPREZZICF = 0) 
        AND GP.FINEVALIDITA >= CONVERT(DATE, GETDATE()) 
        AND ART.CODICE <>'' 
        AND GP.CODCLIFOR <>'' 
        AND (GP.CODCLIFOR <>'C'  AND GP.CODCLIFOR<>'F')
        AND CLIFOR.USAPRZCOMMERCIALI = 1
        --AND CLIFOR.ESERCIZIO = year(getdate())
        AND @type =1

    UNION 
    --Cliente - Gruppo Articoli ------------------------------
    SELECT  Progressivo
                    ,2 As Tiporegola
                    ,CLIFOR.USAPRZCOMMERCIALI
                    ,CASE WHEN (Gp.CODCLIFOR = '*') THEN 'Tutti' ELSE GP.CodCLIFOR END AS CODCLIFOR
                    ,ISNULL(DD.CODICE,0) AS DESTINAZIONE
                    ,ART.CODICEART AS CODART 
                    ,GP.UM
                    ,GP.QTAMINIMA
                    ,ISNULL(CLIFOR.LISTINO,0) LISTINO 
                    ,ISNULL(UMP.UM,0) UMART
                    ,0 As tipo
                    ,GP.INIZIOVALIDITA
                    ,GP.FINEVALIDITA
    FROM  REGOLEPREZZIESTESI GP
            INNER JOIN @Rows S On S.ProgressivoIns = Gp.PROGRESSIVO
            INNER JOIN ANAGRAFICAARTICOLICOMM ART ON GP.CODGRUPPOPREZZIMAG = ART.GRUPPOPRZPART
            INNER JOIN dbo.ANAGRAFICAARTICOLI TEM On  TEM.CODICE = ART.CODICEART
            LEFT OUTER JOIN @CliFor CLIFOR ON  CLIFOR.CODCONTO =GP.CODCLIFOR 
            LEFT OUTER JOIN dbo.ARTICOLIUMPREFERITE UMP ON UMP.CODART = TEM.CODICE AND UMP.TIPOUM =3
            LEFT OUTER JOIN (SELECT 0 CODICE,CODCONTO FROM dbo.ANAGRAFICACF 
                            UNION     
                            SELECT CODICE, CODCONTO FROM dbo.DESTINAZIONIDIVERSE 
                            WHERE EXISTS(SELECT Codart FROM dbo.REGOLEPREZZIESTESI WHERE CODDESTINAZIONE <>0)) DD ON DD.CODCONTO = CLIFOR.CODCONTO 

    WHERE   USAPRZCOMMERCIALI=1 
            AND (GP.CODGRUPPOPREZZIMAG > 0) 
            AND (CODGRUPPOPREZZICF = 0) 
            AND (ART.ESERCIZIO = YEAR(GETDATE()))
            AND GP.FINEVALIDITA >= CONVERT(DATE, GETDATE()) 
            AND CODCLIFOR <>'' 
            AND (GP.CODCLIFOR <> 'C' AND GP.CODCLIFOR <> 'F')
            AND CLIFOR.USAPRZCOMMERCIALI = 1
            AND @type =1
            AND Art.EXPORTECOMMERCE =1

    UNION 

    -- Cliente - Famiglia -----------------------------------


    SELECT  Progressivo
                    ,3 As Tiporegola
                    ,CLIFOR.USAPRZCOMMERCIALI
                    ,CASE WHEN (Gp.CODCLIFOR = '*') THEN 'Tutti' ELSE GP.CodCLIFOR END AS CODCLIFOR
                    ,ISNULL(DD.CODICE,0) AS DESTINAZIONE
                    ,TEM.CodArt AS CODART 
                    ,GP.UM
                    ,GP.QTAMINIMA
                    ,ISNULL(CLIFOR.LISTINO,0) LISTINO 
                    ,ISNULL(UMP.UM,0) UMART
                    ,0 As tipo
                    ,GP.INIZIOVALIDITA
                    ,GP.FINEVALIDITA
    FROM  REGOLEPREZZIESTESI GP
            INNER JOIN @Rows S On S.ProgressivoIns = Gp.PROGRESSIVO 
            INNER JOIN dbo.TP_EXTRAMAG TEM On  TEM.CodFamigliaPOS = GP.FAMIGLIA 
            INNER JOIN dbo.ANAGRAFICAARTICOLI ART On  TEM.CodArt = ART.CODICE
            /* Modifica regola gestione Reparto */
            and TEM.CodRepartoPOS = GP.REPARTO
            /* Modifica regola gestione Reparto */
            INNER JOIN  @CliFor CLIFOR ON  CLIFOR.CODCONTO =GP.CODCLIFOR
            LEFT OUTER JOIN dbo.ARTICOLIUMPREFERITE UMP ON UMP.CODART = TEM.CODART AND UMP.TIPOUM =3
            LEFT OUTER JOIN (SELECT 0 CODICE,CODCONTO FROM dbo.ANAGRAFICACF 
                            UNION     
                            SELECT CODICE, CODCONTO FROM dbo.DESTINAZIONIDIVERSE 
                            WHERE EXISTS(SELECT Codart FROM dbo.REGOLEPREZZIESTESI WHERE CODDESTINAZIONE <>0)) DD ON DD.CODCONTO = CLIFOR.CODCONTO
    WHERE   USAPRZCOMMERCIALI=1 
            AND (CODGRUPPOPREZZICF = 0) 
            AND GP.FINEVALIDITA >= CONVERT(DATE, GETDATE()) 
            AND CODCLIFOR <>'' 
            AND (GP.CODCLIFOR <> 'C' AND GP.CODCLIFOR <> 'F')
            AND CLIFOR.USAPRZCOMMERCIALI = 1
            AND TEM.CodFamigliaPOS >0
            AND @type =1

    UNION
    --Gruppo Clienti - Articolo ------------------------------
    
    SELECT  Progressivo
            ,4 As Tiporegola
            ,CLIFOR.USAPRZCOMMERCIALI
            ,CLIFOR.CODCLIFOR AS CODCLIFOR
            , 0 AS DESTINAZIONE
            ,TEM.CODICE AS CODART
            ,GP.UM
            ,GP.QTAMINIMA
            ,CLIFOR.LISTINO
            ,ISNULL(UMP.UM,0) UMART
            ,0 As tipo
            ,GP.INIZIOVALIDITA
            ,GP.FINEVALIDITA   
    FROM   dbo.REGOLEPREZZIESTESI GP
            INNER JOIN @Rows S On S.ProgressivoIns = Gp.PROGRESSIVO
            INNER JOIN dbo.View_AnagraficaCF CLIFOR ON GP.CODGRUPPOPREZZICF = CLIFOR.CODGRUPPOPREZZIPART
            Inner JOIN @Clifor C ON C.CODCONTO= Clifor.CODCONTO
            INNER JOIN  dbo.ANAGRAFICAARTICOLI  TEM On   TEM.CODICE LIKE GP.CODARTTIPOLOGIA
            LEFT OUTER JOIN dbo.ARTICOLIUMPREFERITE UMP ON UMP.CODART = TEM.CODICE AND UMP.TIPOUM =3

        
    WHERE   C.USAPRZCOMMERCIALI=1
            AND GP.CODGRUPPOPREZZIMAG = 0
            AND GP.CODGRUPPOPREZZICF > 0
            AND GP.FINEVALIDITA >= CONVERT(DATE, GETDATE())
            AND CLIFOR.UsaPrzPrvPart =1
            AND @type =1
            
    UNION
    --Gruppo Clienti - Famiglia Reparto -----------------------
 
        SELECT  Progressivo
                --  ,GPR.IDRIGA
                    ,5 As Tiporegola
                    ,CLIFOR.USAPRZCOMMERCIALI
                    ,CASE WHEN (Gp.CODCLIFOR = '*') THEN 'Tutti' ELSE CLIFOR.CODCLIFOR END AS CODCLIFOR
                    ,0 AS DESTINAZIONE
                    ,TEM.CodArt AS CODART 
                    ,GP.UM
                    ,GP.QTAMINIMA
                    ,ISNULL(CLIFOR.LISTINO,0) LISTINO 
                    ,ISNULL(UMP.UM,0) UMART
                    ,0 As tipo
                    ,GP.INIZIOVALIDITA
                    ,GP.FINEVALIDITA
    FROM  REGOLEPREZZIESTESI GP
            INNER JOIN @Rows S On S.ProgressivoIns = Gp.PROGRESSIVO
            INNER JOIN dbo.TP_EXTRAMAG TEM On  TEM.CodFamigliaPOS = GP.FAMIGLIA
                and TEM.CodRepartoPOS = GP.REPARTO
            
            LEFT OUTER JOIN dbo.ARTICOLIUMPREFERITE UMP ON UMP.CODART = TEM.CODART AND UMP.TIPOUM =3
            INNER JOIN dbo.View_AnagraficaCF CLIFOR ON GP.CODGRUPPOPREZZICF = CLIFOR.CODGRUPPOPREZZIPART
            Inner JOIN @Clifor C ON C.CODCONTO= Clifor.CODCONTO 
    WHERE   CLIFOR.USAPRZCOMMERCIALI=1 
            AND GP.CODGRUPPOPREZZICF > 0 
            AND GP.FINEVALIDITA >= CONVERT(DATE, GETDATE()) 
            AND CLIFOR.CODCONTO <>'' 
            
            AND c.USAPRZCOMMERCIALI = 1
            AND TEM.CodFamigliaPOS >0
            AND @type =1





    UNION

    --Gruppo Clienti - Gruppo Articoli -----------------------
 
      SELECT  Progressivo
                    --  ,GPR.IDRIGA
                        ,6 As Tiporegola
                        ,CLIFOR.USAPRZCOMMERCIALI
                        ,CLIFOR.CODCONTO AS CODCLIFOR
                        , 0 AS DESTINAZIONE
                        ,ART.CODICEART AS CODART 
                        ,GP.UM
                        ,GP.QTAMINIMA
                        ,ISNULL(CLIFOR.LISTINO,0) LISTINO 
                        ,ISNULL(UMP.UM,0) UMART
                        ,0 As tipo
                        ,GP.INIZIOVALIDITA
                        ,GP.FINEVALIDITA
        FROM   dbo.REGOLEPREZZIESTESI GP
                INNER JOIN @Rows S On S.ProgressivoIns = Gp.PROGRESSIVO
                INNER JOIN ANAGRAFICAARTICOLICOMM ART ON GP.CODGRUPPOPREZZIMAG = ART.GRUPPOPRZPART
                INNER JOIN ANAGRAFICARISERVATICF CLIFOR ON GP.CODGRUPPOPREZZICF = CLIFOR.CODGRUPPOPREZZIPART
                INNER JOIN dbo.ANAGRAFICAARTICOLI TEM On  TEM.CODICE = ART.CODICEART
                LEFT OUTER JOIN dbo.ARTICOLIUMPREFERITE UMP ON UMP.CODART = TEM.CODICE AND UMP.TIPOUM =3
        WHERE   USAPRZCOMMERCIALI=1
                AND (GP.CODGRUPPOPREZZIMAG > 0) 
                AND GP.CODGRUPPOPREZZICF > 0
                AND CLIFOR.ESERCIZIO = YEAR(GETDATE())
                AND GP.FINEVALIDITA >= CONVERT(DATE, GETDATE())
                AND ART.EXPORTECOMMERCE =1
                AND @type =1  

    UNION
    

    --Tutti Clenti -  Articolo -------------------------

    SELECT   Progressivo
                ,7 As Tiporegola
                , 1 USAPRZCOMMERCIALI
                ,CASE WHEN (Gp.CODCLIFOR = '*') THEN 'Tutti' ELSE CLIFOR.CODCLIFOR END AS CODCLIFOR
                ,ISNULL(DD.CODICE,0) AS DESTINAZIONE
                ,GP.CODART AS CODART
                ,GP.UM
                ,GP.QTAMINIMA
                ,ISNULL(CLIFOR.LISTINO,0) LISTINO 
                ,ISNULL(UMP.UM,0) UMART
                ,0 As tipo
                ,GP.INIZIOVALIDITA
                ,GP.FINEVALIDITA    
    FROM  dbo.REGOLEPREZZIESTESI GP
            INNER JOIN @Rows S On S.ProgressivoIns = Gp.PROGRESSIVO
            INNER JOIN dbo.ANAGRAFICAARTICOLI TEM On  TEM.CODICE like GP.CODARTTIPOLOGIA
            LEFT OUTER JOIN dbo.ARTICOLIUMPREFERITE UMP ON UMP.CODART = TEM.CODICE AND UMP.TIPOUM =3
            ,(SELECT  CODCLIFOR, LISTINO, USAPRZCOMMERCIALI FROM View_AnagraficaCF WHERE  USAPRZCOMMERCIALI=1)
              CLIFOR 
            
            LEFT OUTER JOIN (SELECT 0 CODICE,CODCONTO FROM dbo.ANAGRAFICACF 
                             UNION     
                             SELECT CODICE, CODCONTO FROM dbo.DESTINAZIONIDIVERSE 
                             WHERE EXISTS(SELECT Codart FROM dbo.REGOLEPREZZIESTESI WHERE CODDESTINAZIONE <>0)) DD ON DD.CODCONTO = CLIFOR.CODCLIFOR 
    WHERE    
            Clifor.USAPRZCOMMERCIALI=1 AND (CODGRUPPOPREZZIMAG = 0) 
        AND (CODGRUPPOPREZZICF = 0) 
        AND GP.FINEVALIDITA >= CONVERT(DATE, GETDATE()) 
        AND GP.CODART <>'' 
        AND (GP.CODCLIFOR ='C'  OR GP.CODCLIFOR='F')
        AND CLIFOR.USAPRZCOMMERCIALI=1
        AND @type =1

    UNION 

    --Tutti Clienti - Famglia/Reparto ------------------------
    SELECT  Progressivo
                    ,8 As Tiporegola
                    ,CLIFOR.USAPRZCOMMERCIALI
                    ,CASE WHEN (Gp.CODCLIFOR = '*') THEN 'Tutti' ELSE CLIFOR.CODCLIFOR END AS CODCLIFOR
                    ,ISNULL(DD.CODICE,0) AS DESTINAZIONE
                    ,TEM.CodArt AS CODART 
                    ,GP.UM
                    ,GP.QTAMINIMA
                    ,ISNULL(CLIFOR.LISTINO,0) LISTINO 
                    ,ISNULL(UMP.UM,0) UMART
                    ,0 As tipo
                    ,GP.INIZIOVALIDITA
                    ,GP.FINEVALIDITA
    FROM  REGOLEPREZZIESTESI GP
            INNER JOIN @Rows S On S.ProgressivoIns = Gp.PROGRESSIVO
                INNER JOIN dbo.TP_EXTRAMAG TEM On  TEM.CodFamigliaPOS = GP.FAMIGLIA
                and TEM.CodRepartoPOS = GP.REPARTO

            LEFT OUTER JOIN dbo.ARTICOLIUMPREFERITE UMP ON UMP.CODART = TEM.CODART AND UMP.TIPOUM =3
            ,(SELECT DISTINCT CODCLIFOR, LISTINO, USAPRZCOMMERCIALI FROM View_AnagraficaCF WHERE  USAPRZCOMMERCIALI=1)   CLIFOR 
            LEFT OUTER JOIN (SELECT 0 CODICE,CODCONTO FROM dbo.ANAGRAFICACF 
                             UNION     
                             SELECT CODICE, CODCONTO FROM dbo.DESTINAZIONIDIVERSE 
                             WHERE EXISTS(SELECT Codart FROM dbo.REGOLEPREZZIESTESI WHERE CODDESTINAZIONE <>0)
                             ) DD ON DD.CODCONTO = CLIFOR.CODCLIFOR 
    WHERE   CLIFOR.USAPRZCOMMERCIALI=1 
            AND (CODGRUPPOPREZZICF = 0) 
            AND GP.FINEVALIDITA >= CONVERT(DATE, GETDATE()) 
            AND CLIFOR.CODCLIFOR <>'' 
            AND (GP.CODCLIFOR = 'C' OR GP.CODCLIFOR = 'F')
            AND CLIFOR.USAPRZCOMMERCIALI=1
            AND TEM.CodFamigliaPOS >0
            AND @type =1


    UNION

    

    --Tutti Clenti - Gruppo Articoli -------------------------

    SELECT  Progressivo
            --  ,GPR.IDRIGA
                ,9 As Tiporegola
                , 1 USAPRZCOMMERCIALI
                ,GCF.CODCLIFOR AS CODCLIFOR
                , 0 AS DESTINAZIONE
                ,ART.CODICEART AS CODART
                ,GP.UM
                ,GP.QTAMINIMA
                ,ISNULL(GCF.LISTINO,0) LISTINO
                ,ISNULL(UMP.UM,0) UMART
                ,0 As tipo
                ,GP.INIZIOVALIDITA
                ,GP.FINEVALIDITA    
    FROM  dbo.REGOLEPREZZIESTESI GP
            INNER JOIN @Rows S On S.ProgressivoIns = Gp.PROGRESSIVO
            INNER JOIN ANAGRAFICAARTICOLICOMM ART ON GP.CODGRUPPOPREZZIMAG = ART.GRUPPOPRZPART
            INNER JOIN dbo.ARTICOLIUMPREFERITE UMP ON UMP.CODART = ART.CODICEART
            INNER JOIN  dbo.ANAGRAFICAARTICOLI  TEM On   TEM.CODICE = ART.CODICEART
            LEFT OUTER JOIN ANAGRAFICARISERVATICF CLIFOR ON  CLIFOR.CODCONTO =GP.CODCLIFOR and CLIFOR.ESERCIZIO = year(getdate())
        
            ,(SELECT DISTINCT CODCLIFOR, LISTINO FROM View_AnagraficaCF WHERE  USAPRZCOMMERCIALI=1) GCF 
    WHERE    
             (GP.CODGRUPPOPREZZIMAG > 0) 
            AND (CODGRUPPOPREZZICF = 0) 
            AND (ART.ESERCIZIO = YEAR(GETDATE()))
            AND GP.FINEVALIDITA >= CONVERT(DATE, GETDATE()) 
            AND (GP.CODCLIFOR ='C'  OR GP.CODCLIFOR ='*')
            AND ART.EXPORTECOMMERCE=1
            AND UMP.TIPOUM =3
            AND @type =1

    


    UNION


    --- Prezzi Particolari Std------------------------------------------------
    ----  Cliente - Articolo ------------------------------------------------
    SELECT  GP.Progressivo 
        --  ,GPR.IDRIGA
            ,1 As Tiporegola
            ,CLIFOR.USAPRZPRVPART
            ,GP.CodCLIFOR  AS CODCLIFOR 
            , 0 AS DESTINAZIONE
            ,TEM.CODICE AS CODART
            ,GPR.UM
            ,GPR.QTAMINIMA
            ,CLIFOR.LISTINO AS LISTINO
            ,ISNULL(UMP.UM,'') AS UMART
            ,GPR.TIPO
            ,GP.INIZIOVALIDITA
            ,GP.FINEVALIDITA                   
    FROM dbo.GESTIONEPREZZI GP 
        INNER JOIN @Rows S On S.ProgressivoIns = Gp.PROGRESSIVO
        INNER JOIN  dbo.GESTIONEPREZZIRIGHE  GPR On  Gp.PROGRESSIVO = Gpr.RIFPROGRESSIVO
        INNER JOIN dbo.ANAGRAFICAARTICOLI TEM On  TEM.CODICE like GP.CODARTRIC
        LEFT OUTER JOIN dbo.ARTICOLIUMPREFERITE UMP ON UMP.CODART = TEM.CODICE AND UMP.TIPOUM =3
        LEFT OUTER JOIN ANAGRAFICARISERVATICF CLIFOR ON CLIFOR.CODCONTO =GP.CODCLIFOR        
    WHERE   USAPRZCOMMERCIALI=0 AND (CODGRUPPOPREZZIMAG = 0) 
        AND (CODGRUPPOPREZZICF = 0) 
        AND GP.FINEVALIDITA >= CONVERT(DATE, GETDATE()) 
        AND GP.CODART <>'' 
        AND GP.CODCLIFOR <>'' 
        AND (GP.CODCLIFOR <>'C'  OR GP.CODCLIFOR<>'F')
        AND CLIFOR.USAPRZPRVPART=1
        AND CLIFOR.ESERCIZIO = year(getdate())
        AND @type =0

    UNION 
    ----  Cliente - Categorie Merceologiche ------------------------------------------------
    SELECT  GP.Progressivo 
            ,1 As Tiporegola
            ,CLIFOR.USAPRZCOMMERCIALI
            ,GP.CodCLIFOR  AS CODCLIFOR 
            , 0 AS DESTINAZIONE
            ,TEM.CODICE AS CODART
            ,GPR.UM
            ,GPR.QTAMINIMA
            ,CLIFOR.LISTINO AS LISTINO
            ,ISNULL(UMP.UM,'') AS UMART
            ,GPR.TIPO
            ,GP.INIZIOVALIDITA
            ,GP.FINEVALIDITA                   
    FROM dbo.GESTIONEPREZZI GP 
        INNER JOIN @Rows S On S.ProgressivoIns = Gp.PROGRESSIVO
        INNER JOIN  dbo.GESTIONEPREZZIRIGHE  GPR On  Gp.PROGRESSIVO = Gpr.RIFPROGRESSIVO
        INNER JOIN (SELECT  [CodFeature], [CodArticolo] FROM dbo.FEATUREARTICOLO GROUP BY [CodFeature], [CodArticolo] ) FEA ON FEA.[CodFeature] = GP.CodFeature
        INNER JOIN ANAGRAFICAARTICOLI ART ON ART.CODICE = FEA.CodArticolo AND ART.VARESPLICITE LIKE GP.VARESPLICITE
        INNER JOIN dbo.ANAGRAFICAARTICOLI TEM On  TEM.CODICE like ART.CODICE

        LEFT OUTER JOIN dbo.ARTICOLIUMPREFERITE UMP ON UMP.CODART = TEM.CODICE AND UMP.TIPOUM =3
        LEFT OUTER JOIN ANAGRAFICARISERVATICF CLIFOR ON CLIFOR.CODCONTO =GP.CODCLIFOR        
    WHERE   USAPRZCOMMERCIALI=0 AND (CODGRUPPOPREZZIMAG = 0) 
        AND (CODGRUPPOPREZZICF = 0) 
        AND GP.FINEVALIDITA >= CONVERT(DATE, GETDATE()) 
        AND ART.CODICE <>'' 
        AND GP.CODCLIFOR <>'' 
        AND (GP.CODCLIFOR <>'C'  OR GP.CODCLIFOR<>'F')
        AND CLIFOR.USAPRZPRVPART=1
        AND CLIFOR.ESERCIZIO = year(getdate())
        AND @type =0

    UNION 
    ----  Cliente - Gruppo Art ----------------------------------------------
    SELECT  Progressivo
            --      ,GPR.IDRIGA
                    ,2 As Tiporegola
                    ,CLIFOR.USAPRZCOMMERCIALI
                    ,CASE WHEN (Gp.CODCLIFOR = '*') THEN 'Tutti' ELSE GP.CodCLIFOR END AS CODCLIFOR
                    , 0 AS DESTINAZIONE
                    ,ART.CODICEART AS CODART 
                    ,GPR.UM
                    ,GPR.QTAMINIMA
                    ,ISNULL(CLIFOR.LISTINO,0) LISTINO 
                    ,ISNULL(UMP.UM,0) UMART
                    ,GPR.TIPO
                    ,GP.INIZIOVALIDITA
                    ,GP.FINEVALIDITA
    FROM  GESTIONEPREZZI GP
            INNER JOIN @Rows S On S.ProgressivoIns = Gp.PROGRESSIVO
            INNER JOIN dbo.GESTIONEPREZZIRIGHE  GPR On  Gp.PROGRESSIVO = Gpr.RIFPROGRESSIVO
            INNER JOIN ANAGRAFICAARTICOLICOMM ART ON GP.CODGRUPPOPREZZIMAG = ART.GRUPPOPRZPART
            INNER JOIN dbo.ANAGRAFICAARTICOLI TEM On  TEM.CODICE = ART.CODICEART
            LEFT OUTER JOIN ANAGRAFICARISERVATICF CLIFOR ON  CLIFOR.CODCONTO =GP.CODCLIFOR and CLIFOR.ESERCIZIO = year(getdate())
            LEFT OUTER JOIN dbo.ARTICOLIUMPREFERITE UMP ON UMP.CODART = TEM.CODICE AND UMP.TIPOUM =3

    WHERE   USAPRZCOMMERCIALI=0 
            AND (GP.CODGRUPPOPREZZIMAG > 0) 
            AND (CODGRUPPOPREZZICF = 0) 
            AND (ART.ESERCIZIO = YEAR(GETDATE()))
            AND GP.FINEVALIDITA >= CONVERT(DATE, GETDATE()) 
            AND CODCLIFOR <>'' 
            AND (GP.CODCLIFOR <> 'C' AND GP.CODCLIFOR <> 'F')
            AND CLIFOR.USAPRZPRVPART=1 
            AND ART.EXPORTECOMMERCE=1
            AND @type =0

    UNION
    ---- Tutti Clienti - Gruppo Art ----------------------------------------------
    SELECT  Progressivo
    --          ,GPR.IDRIGA
                ,3 As Tiporegola
                ,CLIFOR.USAPRZCOMMERCIALI
                ,GCF.CODCLIFOR AS CODCLIFOR
                , 0 AS DESTINAZIONE
                ,ART.CODICEART AS CODART
                ,GPR.UM
                ,GPR.QTAMINIMA
                ,ISNULL(GCF.LISTINO,0) LISTINO
                ,ISNULL(UMP.UM,0) UMART
                ,GPR.TIPO
                ,GP.INIZIOVALIDITA
                ,GP.FINEVALIDITA    
    FROM  GESTIONEPREZZI GP
            INNER JOIN @Rows S On S.ProgressivoIns = Gp.PROGRESSIVO
            INNER JOIN dbo.GESTIONEPREZZIRIGHE  GPR On  Gp.PROGRESSIVO = Gpr.RIFPROGRESSIVO
            INNER JOIN ANAGRAFICAARTICOLICOMM ART ON GP.CODGRUPPOPREZZIMAG = ART.GRUPPOPRZPART
            INNER JOIN dbo.ARTICOLIUMPREFERITE UMP ON UMP.CODART = ART.CODICEART
            INNER JOIN  dbo.ANAGRAFICAARTICOLI  TEM On   TEM.CODICE = ART.CODICEART
            LEFT OUTER JOIN ANAGRAFICARISERVATICF CLIFOR ON  CLIFOR.CODCONTO =GP.CODCLIFOR and CLIFOR.ESERCIZIO = year(getdate())
        
            ,(SELECT DISTINCT CODCLIFOR, LISTINO FROM View_AnagraficaCF WHERE  USAPRZCOMMERCIALI=0) GCF 
    WHERE     
             (GP.CODGRUPPOPREZZIMAG > 0) 
            AND (CODGRUPPOPREZZICF = 0) 
            AND (ART.ESERCIZIO = YEAR(GETDATE()))
            AND GP.FINEVALIDITA >= CONVERT(DATE, GETDATE()) 
            AND (GP.CODCLIFOR ='C'  OR GP.CODCLIFOR ='*')
            AND UMP.TIPOUM =3
            AND ART.EXPORTECOMMERCE=1
            AND @type =0


    UNION 

    ----  Gruppo Prezzi CL -  Art ----------------------------------------------
    SELECT  Progressivo
            ,4 As Tiporegola
            ,CLIFOR.USAPRZCOMMERCIALI
            ,CLIFOR.CODCONTO AS CODCLIFOR
            , 0 AS DESTINAZIONE
            ,TEM.CODICE AS CODART
            ,GPR.UM
            ,GPR.QTAMINIMA
            ,CLIFOR.LISTINO
            ,ISNULL(UMP.UM,0) UMART
            ,GPR.TIPO
            ,GP.INIZIOVALIDITA
            ,GP.FINEVALIDITA   
    FROM   GESTIONEPREZZI GP
            INNER JOIN @Rows S On S.ProgressivoIns = Gp.PROGRESSIVO
            INNER JOIN GESTIONEPREZZIRIGHE  GPR On  Gp.PROGRESSIVO = Gpr.RIFPROGRESSIVO
            INNER JOIN ANAGRAFICARISERVATICF CLIFOR ON GP.CODGRUPPOPREZZICF = CLIFOR.CODGRUPPOPREZZIPART
            INNER JOIN  dbo.ANAGRAFICAARTICOLI  TEM On   TEM.CODICE LIKE GP.CODARTRIC
            LEFT OUTER JOIN dbo.ARTICOLIUMPREFERITE UMP ON UMP.CODART = TEM.CODICE AND UMP.TIPOUM =3
        
    WHERE   USAPRZCOMMERCIALI=0 
            AND GP.CODGRUPPOPREZZIMAG = 0
            AND GP.CODGRUPPOPREZZICF > 0
            AND CLIFOR.ESERCIZIO = YEAR(GETDATE())
            AND GP.FINEVALIDITA >= CONVERT(DATE, GETDATE())
             AND CLIFOR.USAPRZPRVPART=1 
            AND @type =0


    UNION 
    --Tutti Clenti -  Articolo -------------------------

    SELECT  Progressivo
                ,5 As Tiporegola
                ,CLIFOR.USAPRZCOMMERCIALI
                ,CASE WHEN (Gp.CODCLIFOR = '*') THEN 'Tutti' ELSE CLIFOR.CODCLIFOR END AS CODCLIFOR
                ,0 AS DESTINAZIONE
                ,GP.CODART AS CODART
                ,GPR.UM
                ,GPR.QTAMINIMA
                ,ISNULL(CLIFOR.LISTINO,0) LISTINO 
                ,ISNULL(UMP.UM,0) UMART
                ,0 As tipo
                ,GP.INIZIOVALIDITA
                ,GP.FINEVALIDITA    
    FROM  dbo.GESTIONEPREZZI GP
            INNER JOIN @Rows S On S.ProgressivoIns = Gp.PROGRESSIVO
            INNER JOIN GESTIONEPREZZIRIGHE  GPR On  Gp.PROGRESSIVO = Gpr.RIFPROGRESSIVO
            INNER JOIN dbo.ANAGRAFICAARTICOLI TEM On  TEM.CODICE like Gp.CODARTRIC

            LEFT OUTER JOIN dbo.ARTICOLIUMPREFERITE UMP ON UMP.CODART = TEM.CODICE AND UMP.TIPOUM =3
            ,(SELECT  CODCLIFOR, LISTINO, USAPRZCOMMERCIALI FROM View_AnagraficaCF WHERE  USAPRZCOMMERCIALI=0)
              CLIFOR 
            
    WHERE    
            Clifor.USAPRZCOMMERCIALI=0 AND (CODGRUPPOPREZZIMAG = 0) 
        AND (CODGRUPPOPREZZICF = 0) 
        AND GP.FINEVALIDITA >= CONVERT(DATE, GETDATE()) 
        AND GP.CODART <>''
        AND (GP.CODCLIFOR ='C'  OR GP.CODCLIFOR='F')
       -- AND CLIFOR.USAPRZCOMMERCIALI=1
        AND @type =0

    

    
    )
        
            
INSERT INTO @ReturnTable (Progressivo, Tiporegola , UsaPrzCommerciali, CODCLIFOR, Destinazione, Codart,Um ,QtaMinima, Prezzo, Sconto ,Tipo ,InizioValidita ,FineValidita ,UtenteModifica, Datamodifica ,DiscountXML )

SELECT        Progressivo, Tiporegola,USAPRZCOMMERCIALI, CODCLIFOR, DESTINAZIONE, CODART, List.UM, QTAMINIMA
    ,CASE USAPRZCOMMERCIALI WHEN 0 THEN  Prezzo.Price WHEN 1 THEN PrezzoEsteso.Price END AS Prezzo
    ,CASE USAPRZCOMMERCIALI WHEN 0 THEN  prezzo.DiscountEX   WHEN 1 THEN PrezzoEsteso.discount END Sconto
    ,TIPO
    ,INIZIOVALIDITA
    ,ISNULL(Fv.FINE, List.FINEVALIDITA) FINEVALIDITA
    ,USER_NAME() AS utenteModifica
    ,GETDATE() AS datamodifica
    ,CASE USAPRZCOMMERCIALI WHEN 1 THEN  PrezzoEsteso.DiscountXML  WHEN 0 THEN '' END DiscountXML
FROM     List  

    /* Inizio gestione esclusione clienti che nopn hanno configurazione agenti 16-09-2014 richiesta claudio per corman */ 
    LEFT OUTER JOIN  (SELECT RSE.PROGRESSIVOREGOLETESTE ID, FINEVALIDITA FINE 
                 FROM REGOLESCONTIESTESI RSE 
                 WHERE FINEVALIDITA >=GETDATE() 
                 GROUP BY FINEVALIDITA, RSE.PROGRESSIVOREGOLETESTE) FV
                 ON FV.ID = List.Progressivo
    CROSS APPLY price.GetSpecialPrice_Discount (List.CODCLIFOR , List.CODART ,List.QTAMINIMA,List.FINEVALIDITA,YEAR(getdate()),List.LISTINO,List.UMART,0,0,'',0,'') as Prezzo
    -- Versione 9 -- CROSS APPLY price.GetSpecialPrice_Discount (List.CODCLIFOR , List.CODART ,List.QTAMINIMA,List.FINEVALIDITA,YEAR(getdate()),List.LISTINO,List.UMART,0,'','') as Prezzo
    
    CROSS APPLY price.GetSpecialPrice_Discount_Extensive_sintetic(CODCLIFOR,list.destinazione,CODART, QTAMINIMA,  ISNULL(FV.FINE,List.FINEVALIDITA), YEAR(GETDATE()),Listino, List.UMART) PrezzoEsteso
    
    RETURN

END


