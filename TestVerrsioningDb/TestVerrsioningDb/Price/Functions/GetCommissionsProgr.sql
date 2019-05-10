
CREATE FUNCTION [Price].[GetCommissionsProgr] 
(
    @IsAdd SMALLINT,
    @Qta DECIMAL(16,6),
    @CodAge AS VARCHAR(7) ,
    @CodCli AS VARCHAR(7),
    @CodArt AS VARCHAR(50),
    @Date AS DATETIME,
    @UM varchar(3),
    @DaSconto DECIMAL(8,5),
    @DaImporto DECIMAL(19,4)=0,
    @DaImportoEuro DECIMAL(19,4)=0,
    @DaFatturatoEuro DECIMAL(19,4)=0,  
    @GruppoPrvArt int,
    @GruppoPrvCli int,
    @NCampagna VARCHAR(3),
    @NPromozione VARCHAR(3),
    @CodFeature INT,
    @VarEsplicite varchar(max) =''
    
)


RETURNS 
@Table TABLE
(
Progr DECIMAL(10,0),
IdRiga smallint
)

--ENCRY--
AS
BEGIN


    DECLARE @Progr DECIMAL (10,0)=0, @NRIGA  SMALLINT =0, @ProvvAgg SMALLINT , @CodicePrimario VARCHAR(50)

    
    SET @CodicePrimario= SUBSTRING(@Codart, 0, CHARINDEX('#',@Codart,1))
        

                --Gestione Campagne e Provvigioni 
                IF @NCampagna <>'' OR @NPromozione <>''
                    BEGIN
                            SELECT  TOP 1  @Progr=PT.Progressivo
                                ,@Nriga = PR.NrRiga
                                ,@ProvvAgg=ProvvAgg 
                            FROM TabProvvigioni PT INNER JOIN 
                             RigheProvvigioni PR
                              ON PT.Progressivo = PR.RifProgressivo 
                              WHERE PT.CodAgente = @CodAge 
                                  AND (PT.CODCLIENTE =@CodCli OR PT.CODCLIENTE ='*' OR PT.CODCLIENTE='') 
                                  AND (@CodArt LIKE PT.CODARTRIC OR PT.CODARTICOLO ='*' OR PT.CODARTICOLO ='')
                                  AND (PR.NCampagna = @NCampagna OR PR.NCampagna ='*' ) 
                                  AND (PR.NPromozione = @NPromozione OR PR.NPromozione ='*' )   

                                  --Gestione caretteristiche --------------------------------------------------
                                  AND ((@VarEsplicite LIKE PT.VarEsplicite+'%') OR PT.VarEsplicite= '*')
                                  AND ((@CodicePrimario LIKE PT.CodicePrimario) OR PT.CodicePrimario='*')
                                  AND ((@CodFeature = PT.CODFEATURE) OR PT.CODFEATURE =0)
                                  -----------------------------------------------------------------------------

                                  AND (PT.CODGRUPPOPROVMAG =0 OR PT.CODGRUPPOPROVMAG =@GruppoPrvArt)
                                  AND (PR.UM='' OR PR.UM=@UM ) 
                                  AND @Date BETWEEN InizioValidita AND FineValidita 
                                  AND DaSconto <= @dasconto
                                  AND DaImporto <= @DaImporto
                                  AND DaImportoEuro <= @DaImportoEuro
                                  AND DaQta <= @Qta
                                  AND (NCampagna = @NCampagna OR NCampagna='*') 
                                  AND (NPromozione= @Npromozione OR NCampagna='*')
                                  AND DaFatturatoEuro <=@DaFatturatoEuro
                                  AND (@IsAdd =ProvvAgg OR ProvvAgg IS NULL)
                            ORDER BY 
                                    CASE 
                                        WHEN CODARTICOLO =  '*' and CODGRUPPOPROVMAG  = 0  THEN 3
                                        WHEN CODARTICOLO =  ''  and CODGRUPPOPROVMAG <> 0  THEN 2
                                        WHEN CODARTICOLO <> ''  and CODGRUPPOPROVMAG  = 0  THEN 1
                                    END 
                                    , UM DESC, DaSconto DESC
                                    , DaImporto DESC
                                    , DaQta DESC
                                    , DaFatturatoEuro DESC
                    
                    END                  
  
                -- Geston Clienti
            
                IF @Progr = 0 AND Len(@CodCli) = 7
                    BEGIN      
                        SELECT  TOP 1  @Progr=PT.Progressivo
                        , @Nriga = PR.NrRiga
                        ,@ProvvAgg=ProvvAgg 
                        FROM TabProvvigioni PT INNER JOIN 
                         RigheProvvigioni PR
                          ON PT.Progressivo = PR.RifProgressivo 
                          WHERE PT.CodAgente = @CodAge 
                              AND (PT.CODCLIENTE =@CodCli) 
                              AND (@CodArt LIKE PT.CODARTRIC OR PT.CODARTICOLO ='*' OR PT.CODARTICOLO ='')
                            

                              --Gestione caretteristiche --------------------------------------------------
                               AND ((@VarEsplicite LIKE PT.VarEsplicite+'%') OR PT.VarEsplicite= '*')
                               AND ((@CodicePrimario LIKE PT.CodicePrimario) OR PT.CodicePrimario='*')
                               AND ((@CodFeature = PT.CODFEATURE) OR PT.CODFEATURE =0)
                              -----------------------------------------------------------------------------

                              AND (PT.CODGRUPPOPROVMAG =0 OR PT.CODGRUPPOPROVMAG =@GruppoPrvArt)
                              AND (PR.UM='' OR PR.UM=@UM ) 
                              AND @Date BETWEEN InizioValidita AND FineValidita 
                              AND DaSconto <= @dasconto
                              AND DaImporto <= @DaImporto
                              AND DaImportoEuro <= @DaImportoEuro
                              AND DaQta <= @Qta
                              AND (NCampagna = '' OR NPromozione='')
                              AND DaFatturatoEuro <=@DaFatturatoEuro
                              AND (@IsAdd =ProvvAgg OR ProvvAgg IS NULL)
                        ORDER BY 
                                CASE 
                                    WHEN CODARTICOLO =  '*' and CODGRUPPOPROVMAG  = 0  THEN 3
                                    WHEN CODARTICOLO =  ''  and CODGRUPPOPROVMAG <> 0  THEN 2
                                    WHEN CODARTICOLO <> ''  and CODGRUPPOPROVMAG  = 0  THEN 1
                                END 
                                , UM DESC, DaSconto DESC
                                , DaImporto DESC
                                , DaQta DESC
                                , DaFatturatoEuro DESC
                    END
                       
                --Gestione Gruppi Clienti

                  
                IF @Progr = 0 And @GruppoPrvCli  > 0 
                    BEGIN
                        SELECT  TOP 1  @Progr=PT.Progressivo
                        , @Nriga = PR.NrRiga
                        ,@ProvvAgg=ProvvAgg  
                        FROM TabProvvigioni PT INNER JOIN 
                         RigheProvvigioni PR
                          ON PT.Progressivo = PR.RifProgressivo 
                          WHERE PT.CodAgente = @CodAge 
                              AND CodGruppoProvCF = @GruppoPrvCli
                              -- Bug 169 -- AND (@CodArt LIKE PT.CODARTRIC OR PT.CODARTICOLO ='*')
                              AND (@CodArt LIKE PT.CODARTRIC OR PT.CODARTICOLO ='*' OR PT.CODARTICOLO ='') 
                              -------------------------------------------------------------------------------
                              AND (PR.NCampagna = @NCampagna OR PR.NCampagna ='*' OR NCampagna='')  
                              AND (PR.NPromozione = @NPromozione OR PR.NPromozione ='*' OR NPromozione='')
                              
                              --Gestione caretteristiche --------------------------------------------------
                              AND ((@VarEsplicite LIKE PT.VarEsplicite+'%') OR PT.VarEsplicite= '*')
                              AND ((@CodicePrimario LIKE PT.CodicePrimario) OR PT.CodicePrimario='*')
                              AND ((@CodFeature = PT.CODFEATURE) OR PT.CODFEATURE =0)
                              -----------------------------------------------------------------------------


                              AND (PT.CODGRUPPOPROVMAG =0 OR PT.CODGRUPPOPROVMAG =@GruppoPrvArt)
                              AND (PR.UM='' OR PR.UM=@UM ) 
                              AND @Date BETWEEN InizioValidita AND FineValidita 
                              AND DaSconto <= @dasconto
                              AND DaImporto <= @DaImporto
                              AND DaImportoEuro <= @DaImportoEuro
                              AND DaQta <= @Qta
                              AND (NCampagna = '' OR NPromozione='')
                              AND DaFatturatoEuro <=@DaFatturatoEuro
                              AND (@IsAdd =ProvvAgg OR ProvvAgg IS NULL)
                        ORDER BY 
                                CASE 
                                    WHEN CODARTICOLO =  '*' and CODGRUPPOPROVMAG  = 0  THEN 3
                                    WHEN CODARTICOLO =  ''  and CODGRUPPOPROVMAG <> 0  THEN 2
                                    WHEN CODARTICOLO <> ''  and CODGRUPPOPROVMAG  = 0  THEN 1
                                END 
                                , UM DESC, DaSconto DESC
                                , DaImporto DESC
                                , DaQta DESC
                                , DaFatturatoEuro DESC
  
                    
                    END    
    
                --Gestione tutti            


    
                IF @Progr = 0 
                    BEGIN
                        SELECT  TOP 1  @Progr=PT.Progressivo
                        , @Nriga = PR.NrRiga
                        ,@ProvvAgg=ProvvAgg 
                        FROM TabProvvigioni PT INNER JOIN 
                         RigheProvvigioni PR
                          ON PT.Progressivo = PR.RifProgressivo 
                          WHERE PT.CodAgente = @CodAge 
                              AND (PT.CODCLIENTE ='*' OR PT.CODCLIENTE='C')  
                              
                              --Bug 156 -- AND (PT.CODARTICOLO = @codart  OR PT.CODARTICOLO ='*' )
                              AND (@CodArt LIKE PT.CODARTRIC OR PT.CODARTICOLO ='*' OR PT.CODARTICOLO ='') 
                              --Gestione caretteristiche --------------------------------------------------
                              AND ((@VarEsplicite LIKE PT.VarEsplicite+'%') OR PT.VarEsplicite= '*')
                              AND ((@CodicePrimario LIKE PT.CodicePrimario) OR PT.CodicePrimario='*')
                              AND ((@CodFeature = PT.CODFEATURE) OR PT.CODFEATURE =0)
                              -----------------------------------------------------------------------------


                              AND (PT.CODGRUPPOPROVMAG =0 OR PT.CODGRUPPOPROVMAG =@GruppoPrvArt)
                              AND (PR.UM='' OR PR.UM=@UM ) 
                              AND @Date BETWEEN InizioValidita AND FineValidita 
                              AND DaSconto <= @dasconto
                              AND DaImporto <= @DaImporto
                              AND DaImportoEuro <= @DaImportoEuro
                              AND DaQta <= @Qta
                              AND (NCampagna = '' OR NPromozione='')
                              AND DaFatturatoEuro <=@DaFatturatoEuro
                              AND (@IsAdd =ProvvAgg OR ProvvAgg IS NULL)
                        ORDER BY 
                                CASE 
                                    WHEN CODARTICOLO =  '*' and CODGRUPPOPROVMAG  = 0  THEN 3
                                    WHEN CODARTICOLO =  ''  and CODGRUPPOPROVMAG <> 0  THEN 2
                                    WHEN CODARTICOLO <> ''  and CODGRUPPOPROVMAG  = 0  THEN 1
                                END 
                                , UM DESC, DaSconto DESC
                                , DaImporto DESC
                                , DaQta DESC
                                , DaFatturatoEuro DESC
  
                    
                    END     

    Insert INTO @Table (Progr, IdRiga)
    Values (@Progr, @Nriga)
    
    RETURN 

END

