
CREATE  FUNCTION [price].[FUNGetItem4Year] 
(
    @Codart varchar(50) ='',
    @Esercizio int=1990
)
RETURNS TABLE AS RETURN
(

    SELECT UsaPrezziPart ArtUsaPrzPrv
                    ,GruppoPrzPart GruppoPrzArt
                    ,GruppoPrvPart GruppoPrvArt
                    ,Sconto1 ScontoArt1
                    ,Sconto2 ScontoArt2
                    ,Sconto3 ScontoArt3
                    ,Provv PrvArt
                    ,ART.VarEsplicite
                    ,(Select APPLICAMAGGIORAZIONI FROM ANAGRAFICAARTICOLI Where Codice =  (Select CodicePrimario FROM ANAGRAFICAARTICOLI WHERE CODICE =@Codart)) AddPlusVariant
                    ,ART.Codfeature
                    ,ISNULL(EX.CodFamigliaPOS,0) AS Famiglia
                    ,ISNULL(EX.CodRepartoPOS,0) AS Reparto
                    FROM ANAGRAFICAARTICOLICOMM  AR LEFT OUTER JOIN TP_ExtraMag EX
                    ON AR.CODICEART = EX.CodArt
                    INNER JOIN dbo.ANAGRAFICAARTICOLI ART 
                    ON Ar.CODICEART = ART.CODICE
                    WHERE ESERCIZIO = @Esercizio And CODICEART = @Codart AND @Codart <>''
    UNION           
    SELECT 1 ArtUsaPrzPrv
                    ,0 
                    ,0
                    ,''
                    ,''
                    ,''
                    ,''
                    ,''
                    ,0
                    ,''
                    ,0
                    ,0
                    
                    WHERE @Codart = '*' 

    
)


GO
GRANT SELECT
    ON OBJECT::[Price].[FUNGetItem4Year] TO [Metodo98]
    AS [dbo];

