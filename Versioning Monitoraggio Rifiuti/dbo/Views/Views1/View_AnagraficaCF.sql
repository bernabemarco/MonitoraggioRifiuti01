
CREATE VIEW [dbo].[View_AnagraficaCF]
AS
    SELECT
         CODCLIFOR
        ,CodConto
        ,UsaPrzPrvPart 
        ,CodGruppoPrezziPart
        ,CodSettore
        ,CodZona
        ,CodCategoria
        ,Sconto1
        ,ApplScontoRiga
        ,ApplScontoFinale 
        ,Listino
        ,USAPRZCOMMERCIALI
    FROM ANAGRAFICACLIENTITABLET


GO
GRANT SELECT
    ON OBJECT::[dbo].[View_AnagraficaCF] TO [Metodo98]
    AS [dbo];

