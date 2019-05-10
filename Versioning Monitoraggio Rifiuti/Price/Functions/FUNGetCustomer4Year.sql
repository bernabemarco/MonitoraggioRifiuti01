

CREATE FUNCTION [Price].[FUNGetCustomer4Year] 
(
    @CodClifor varchar(7) ='',
    @TipoPrezzo BIT=0,
    @Esercizio int
)
RETURNS TABLE AS RETURN
(
    SELECT UsaPrzPrvPart  CliUsaPrzPrv
        ,CodGruppoPrezziPart GruppoPrzCli
        ,Sconto1 ScontoCli1
        ,CodSettore
        ,CodZona
        ,CodCategoria
        ,CODGRUPPOPROVPART GruppoPrvCli
        ,Provv1 ProvvCli1
        ,Provv2 ProvvCli2
        ,Provv3 ProvvCli3
        ,ApplScontoRiga AppScRiga
        ,ApplScontoFinale  AppScFinale
        ,CASE  @TIPOPREZZO WHEN 0 THEN  Listino ELSE (SELECT  NRLISTINO  from TABLISTINIFORTRASF where CODFOR =@CodClifor) END AS  ListinoCli
        ,NumeroContratto  NrContratto
        ,CODPAG
        ,IsNull(usaprzcommerciali,0) as UsaPrzCommerciali
        FROM AnagraficaRiservatiCF 
        WHERE Esercizio=@Esercizio and CODCONTO = @CodClifor
        AND LEN(@CodClifor)=7 
        AND (LEFT(@CODClifor,1)='C' OR LEFT(@CODClifor,1)='F') 
        
    UNION

    SELECT  
        UsaPrzPrvPart
        ,CodGruppoPrezziPart
        ,Sconto1
        ,Codsettore
        ,CodZona
        ,CodCategoria
        ,0
        ,''
        ,''
        ,''
        ,ApplScontoRiga
        ,ApplScontoFinale
        ,Listino
        ,0
        ,''
        ,IsNull(usaprzcommerciali,0) as UsaPrzCommerciali
        FROM dbo.View_AnagraficaCF
        WHERE CODCLIFOR =@CodClifor
        AND (LEFT(@CODClifor,1)='@' OR LEFT(@CODClifor,1)='?') 
        
    UNION
     
    SELECT  
        1
        ,0
        ,''
        ,0
        ,0
        ,0
        ,0
        ,''
        ,''
        ,''
        ,''
        ,''
        ,0
        ,0
        ,''
        ,0
        WHERE
          @CodClifor = '*' or @CodClifor ='C' 

)





GO
GRANT SELECT
    ON OBJECT::[Price].[FUNGetCustomer4Year] TO [Metodo98]
    AS [dbo];

