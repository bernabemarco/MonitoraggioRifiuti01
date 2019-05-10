CREATE FUNCTION [Price].[FUSCheckChangeListPrice] 
(
    @CodCliFor varchar(7) ='',
    @CodArt varchar(50) ='',
    @Qta decimal(16,6),
    @DataDoc datetime = NULL,
    @Esercizio Decimal(5,0) = 1900,
    @List decimal(5,0)=0,
    @UM varchar(3)='',
    @VarEsplicite varchar(max) ='',
    @CodicePrimario VARCHAR(50),
    @CodFeature INT,
    @ArtUsaPrzPrv bit,
    @GruppoPrzArt int,
    @GruppoPrvArt int,
    @ScontoArt1 varchar(10),
    @ScontoArt2 varchar(10),
    @ScontoArt3 varchar(10),
    @CliUsaPrzPrv bit,
    @GruppoPrzCli int,
    @GruppoPrvCli int,
    @ScontoCli1 varchar(10),
    @AppScRiga varchar(10),
    @AppScFinale varchar(6),
    @ListinoCli decimal(5, 0),
    @NrContratto decimal(10, 0),
    @PagCli varchar(5)
)
RETURNS decimal(5,0)
--ENCRY-- 
AS
    -- Declare the return variable here
BEGIN

    DECLARE @Result varchar(max)
    DECLARE @Price decimal(19,6)
    DECLARE @PriceVal decimal(19,6)
    DECLARE @CGFPrice Int
    DECLARE @FunCheckPrice4Item Smallint
    DECLARE @CheckPrice4Customer Smallint
    DECLARE @TypePrice Bit = 0
            ,@PriceType as int = 0
            ,@UseNrListino decimal(5,0) 
            ,@NRList decimal(5,0)
            ,@Prezzo_Magg decimal(19,6)
            ,@Prezzo_MaggEuro decimal(19,6)
            ,@Progr decimal(12,0) = 0
    DECLARE @Prezzo decimal(19, 6)
            ,@PrezzoValuta decimal(19, 6)
            ,@NrListino decimal(5, 0)
            ,@QtaMinima decimal(16, 6)
            ,@Sconto varchar(20)
            ,@ScontoAgg varchar(20)
            ,@Tipo decimal(5, 0)
            ,@TipoArrot varchar(1)
            ,@ArrEuro decimal(19,4)
            ,@ArrVal decimal(19,4)
            ,@TipoRiga decimal(5,0)
        
                
    IF @Esercizio = 1900
        SET @Esercizio = YEAR(getdate())
    

    SET @FunCheckPrice4Item = (SELECT [Price].[FUSCheckSpecialPrice4Item] (@Codart, @Esercizio))
    SET @CheckPrice4Customer = (SELECT [Price].[FUSCheckSpecialPrice4Customer] (@CodClifor, @Esercizio))

    
        IF @CheckPrice4Customer >0 
            BEGIN
        
            IF Len(@CodCliFor) = 7
                BEGIN
                
                
                SELECT  TOP 1 @Progr = GR.IDRIGA
                            ,@NRList = GR.NRLISTINO
                            ,@Prezzo_Magg = GR.PREZZO_MAGG 
                            ,@Prezzo_MaggEuro = GR.PREZZO_MAGGEURO 
                            ,@UseNrListino = GT.USANRLISTINO
                    FROM GestionePrezzi GT Inner JOIN 
                         GESTIONEPREZZIRIGHE GR On GT.PROGRESSIVO = GR.RIFPROGRESSIVO
                    WHERE GT.PROGRESSIVO=GR.RIFPROGRESSIVO  
                            AND (GT.CodCliFor =@CodCliFor) 
                            AND (@CodArt LIKE GT.CODARTRIC OR Gt.CODART ='*' OR Gt.CODART ='') 
                            AND ((@VarEsplicite LIKE GT.VarEsplicite+'%') OR GT.VarEsplicite= '*')
                            AND ((@CodicePrimario LIKE GT.CodicePrimario) OR GT.CodicePrimario='*')
                            AND ((@CodFeature = GT.CODFEATURE) OR GT.CODFEATURE =0)
                            AND (Gt.CODGRUPPOPREZZIMAG =0 OR Gt.CODGRUPPOPREZZIMAG =@GruppoPrzArt)
                            AND @Qta >=GR.QtaMinima  
                            AND (GR.UM='' OR GR.UM= @UM)
                            AND @DataDoc BETWEEN GT.InizioValidita AND GT.FineValidita
                            AND (GR.NRLISTINO = 1 OR GR.NRLISTINO =@List) 
                            /* Anomalia 100198 */
                            AND GR.TIPO > 0
                        
                    ORDER BY 
                        CASE 
                            WHEN CODART =  '*' and CODGRUPPOPREZZIMAG  = 0  THEN 4
                            WHEN CODART =  ''  and CODGRUPPOPREZZIMAG <> 0  THEN 3
                            WHEN CODART =  ''  and CODFEATURE         <> 0  THEN 2
                            WHEN CODART <> ''  and CODGRUPPOPREZZIMAG  = 0  THEN 1
                        END 
                        , UTILS.EditDistance(@Codart,CODARTRIC)   ASC 
                        , NRLISTINO DESC
                        ,(@Qta - QTAMINIMA) ASC
                        ,GT.INIZIOVALIDITA DESC
                        --Anomalia 11843 ------
                        ,GR.IDRIGA DESC                                             
                
                END
                    
        
            IF @Progr = 0 And @GruppoPrzCli  > 0 
    
                BEGIN
                    SELECT  TOP 1 @Progr = GR.IDRIGA
                            ,@NRList = GR.NRLISTINO
                            ,@Prezzo_Magg = GR.PREZZO_MAGG 
                            ,@Prezzo_MaggEuro = GR.PREZZO_MAGGEURO 
                    FROM GestionePrezzi GT Inner JOIN 
                         GESTIONEPREZZIRIGHE GR On GT.PROGRESSIVO = GR.RIFPROGRESSIVO
                    WHERE GT.PROGRESSIVO=GR.RIFPROGRESSIVO  
                            AND (GT.CODGRUPPOPREZZICF =@GruppoPrzCli) 
                            AND (@CodArt LIKE GT.CODARTRIC OR Gt.CODART ='*' OR Gt.CODART ='') 
                            AND ((@VarEsplicite LIKE GT.VarEsplicite + '%' ) OR GT.VarEsplicite= '*')
                            AND ((@CodicePrimario LIKE GT.CodicePrimario) OR GT.CodicePrimario='*')
                            AND ((@CodFeature = GT.CODFEATURE) OR GT.CODFEATURE =0)
                            AND (Gt.CODGRUPPOPREZZIMAG =0  OR Gt.CODGRUPPOPREZZIMAG =@GruppoPrzArt) 
                            AND @Qta >=GR.QtaMinima  
                            AND (GR.UM='' OR GR.UM= @UM)
                            AND @DataDoc BETWEEN GT.InizioValidita AND GT.FineValidita 
                            AND (GR.NRLISTINO = 1 OR GR.NRLISTINO =@List)
                            /* Anomalia 100198 */
                            AND GR.TIPO > 0
                    ORDER BY 
                        CASE 
                            WHEN CODART =  '*' and CODGRUPPOPREZZIMAG  = 0  THEN 4
                            WHEN CODART =  ''  and CODGRUPPOPREZZIMAG <> 0  THEN 3
                            WHEN CODART =  ''  and CODFEATURE         <> 0  THEN 2
                            WHEN CODART <> ''  and CODGRUPPOPREZZIMAG  = 0  THEN 1
                        END 
                        , UTILS.EditDistance(@Codart,CODARTRIC)   ASC 
                        , NRLISTINO DESC
                        ,(@Qta - QTAMINIMA) ASC
                        ,GT.INIZIOVALIDITA DESC
                        --Anomalia 11843 ------
                        ,GR.IDRIGA DESC                         
                END 
            
       
            SET @CodClifor = LEFT(@CodClifor,1)
        
            
            IF @Progr = 0 
                BEGIN
                    SELECT  TOP 1 @Progr = GR.IDRIGA
                            ,@NRList = GR.NRLISTINO
                            ,@Prezzo_Magg = GR.PREZZO_MAGG 
                            ,@Prezzo_MaggEuro = GR.PREZZO_MAGGEURO 
                    FROM GestionePrezzi GT Inner JOIN 
                         GESTIONEPREZZIRIGHE GR On GT.PROGRESSIVO = GR.RIFPROGRESSIVO
                    WHERE GT.PROGRESSIVO=GR.RIFPROGRESSIVO  
                            AND (GT.CODCLIFOR ='*' OR GT.CODCLIFOR =@CodClifor)  
                            AND (@CodArt LIKE GT.CODARTRIC OR Gt.CODART ='*' OR Gt.CODART ='') 
                            AND ((@VarEsplicite LIKE GT.VarEsplicite + '%') OR GT.VarEsplicite= '*')
                            AND ((@CodicePrimario LIKE GT.CodicePrimario) OR GT.CodicePrimario='*')
                            AND ((@CodFeature = GT.CODFEATURE) OR GT.CODFEATURE =0)
                            AND (Gt.CODGRUPPOPREZZIMAG =0  OR Gt.CODGRUPPOPREZZIMAG =@GruppoPrzArt) 
                            AND @Qta >=GR.QtaMinima  
                            AND (GR.UM='' OR GR.UM= @UM)
                            AND @DataDoc BETWEEN GT.InizioValidita AND GT.FineValidita 
                            AND (GR.NRLISTINO = 1 OR GR.NRLISTINO =@List)
                            /* Anomalia 100198 */
                            AND GR.TIPO > 0
                    ORDER BY 
                        CASE 
                            WHEN CODART =  '*' and CODGRUPPOPREZZIMAG  = 0  THEN 4
                            WHEN CODART =  ''  and CODGRUPPOPREZZIMAG <> 0  THEN 3
                            WHEN CODART =  ''  and CODFEATURE         <> 0  THEN 2
                            WHEN CODART <> ''  and CODGRUPPOPREZZIMAG  = 0  THEN 1
                        END 
                        , UTILS.EditDistance(@Codart,CODARTRIC)   ASC 
                        , NRLISTINO DESC
                        ,(@Qta - QTAMINIMA) ASC
                        ,GT.INIZIOVALIDITA DESC
                        --Anomalia 11843 ------
                        ,GR.IDRIGA DESC                         
                END 
            
            
    

                    SET @TipoRiga = (SELECT  Tipo 
                            FROM GestionePrezzi GT, GestionePrezziRighe GR 
                            WHERE GT.PROGRESSIVO=GR.RIFPROGRESSIVO  AND IDRiga=@Progr) 

    
        END
        
    IF @Progr > 0
        BEGIN
            IF @TipoRiga > 0
                SET @List = @TipoRiga

    
        END
        
    set @Result =@List 
    RETURN @Result

END


GO
GRANT EXECUTE
    ON OBJECT::[Price].[FUSCheckChangeListPrice] TO [Metodo98]
    AS [dbo];

