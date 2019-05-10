

CREATE FUNCTION [price].[FUNGetSpecialDiscount_Extensive] (
    @CodCliFor varchar(7) ='',
    @CodArt varchar(50) ='',
    @Qta decimal(16,6),
    @DataDoc datetime = NULL,
    @Esercizio Decimal(5,0) = 1900,
    @List decimal(5,0)=0,
    @UM varchar(3)='',
    @Pagamento varchar(5) ,
    @VarEsplicite varchar(max) ='',
    @CustomScript varchar(max) ='',
    @ArtUsaPrzPrv bit,
    @GruppoPrzArt int,
    @CodSettore decimal(5,0),
    @CodZona decimal(5,0),
    @CodCategoria decimal(5,0),
    @Coddest decimal(5,0) =0,
    @GruppoPrvArt int,
    @ScontoArt1 varchar(10),
    @ScontoArt2 varchar(10),
    @ScontoArt3 varchar(10),
    @CliUsaPrzPrv bit,
    @GruppoPrzCli int,
    @GruppoPrvCli int,
    @Famiglia int,
    @Reparto int,
    @ScontoCli1 varchar(10),
    @AppScRiga varchar(10),
    @AppScFinale varchar(6),
    @ListinoCli decimal(5, 0),
    @NrContratto decimal(10, 0),
    @PagCli varchar(5),
    @CodFeature int
    
)
RETURNS @TempTable
 TABLE 
(idRegola int, codDiscount varchar(5),strSpecialDiscount varchar(255), strStdDiscount varchar(255), NRSequenza int)
--ENCRY--
As
BEGIN
    DECLARE @CodicePrimario VARCHAR(50)
    
    DECLARE @Result varchar(max)
    DECLARE @Discount varchar(255) ='',
            @DiscountADD varchar(255) ='',
            @DiscountEx varchar(255) ='',
            @StrDiscount varchar(255)=''
    DECLARE @CGFPrice Int
    DECLARE @FunCheckPrice4Item Smallint
    DECLARE @CheckPrice4Customer Smallint
    DECLARE @TypePrice Bit
    DECLARE @PriceType as int = 0
    
    ---------------------------------------------------------------------------------------------
    SET @CodicePrimario= SUBSTRING(@Codart, 0, CHARINDEX('#',@Codart,1))
    


    -- Esercizio non impostato, esercizio in corso ---------------------------------------------    
    IF @Esercizio = 1900
        SET @Esercizio = YEAR(getdate())
    

    SET @FunCheckPrice4Item = (SELECT [Price].[FUSCheckSpecialPrice4Item] (@Codart, @Esercizio))
    SET @CheckPrice4Customer = (SELECT [Price].[FUSCheckSpecialPrice4Customer] (@CodClifor, @Esercizio))

    ------------------Inizio ------------------------------------------------------------

    DECLARE @ParmDefinition nvarchar(500)
        ,@Res decimal(12,0) 
        ,@Prezzo_Magg decimal(19,6)
        ,@Prezzo_MaggEuro decimal(19,6)
        
    DECLARE @Prezzo decimal(19, 6),
        @PrezzoValuta decimal(19, 6),
        @NrListino decimal(5, 0),
        @QtaMinima decimal(16, 6),
        @CodSconto varchar(5)='',
        @Sconto varchar(255)='',
        @ScontoAgg varchar(255)='',
        @TipoSconto decimal(5, 0)=1,
        @TipoArrot varchar(1),
        @ArrEuro decimal(19,4),
        @ArrVal decimal(19,4),
        @TipoRiga decimal(5,0)

    IF LEFT(@CodCliFor,1) = '?' OR  LEFT(@CodCliFor,1)='@'
        SET @CodClifor='C'


IF  @CheckPrice4Customer =1 And @FunCheckPrice4Item =1 
    BEGIN
        DECLARE @Progr decimal(12,0) = 0
                
                                
    IF Len(@CodCliFor) = 7
        BEGIN
                
                    SELECT  TOP 1 @Progr = PR.PROGRESSIVOREGOLETESTE,
                                  @TipoSconto = PT.TIPOSCONTO
                    FROM dbo.REGOLEPREZZIESTESI PT Inner JOIN 
                         dbo.REGOLESCONTIESTESI PR On PT.PROGRESSIVO = PR.PROGRESSIVOREGOLETESTE
                    WHERE   (PT.CodCliFor =@CodCliFor) 
                            AND ( @CodArt LIKE PT.CODARTTIPOLOGIA OR PT.CODART ='*'  OR PT.CODART ='')
                            AND ((@VarEsplicite LIKE PT.VarEsplicite+'%') OR PT.VarEsplicite= '*')
                            AND ((@CodicePrimario = PT.CodicePrimario) OR PT.CodicePrimario='*')
                            AND ((@CodFeature = PT.CODFEATURE) OR PT.CODFEATURE =0)
                            AND  (PT.CODGRUPPOPREZZIMAG =0 OR PT.CODGRUPPOPREZZIMAG=@GruppoPrzArt )
                            AND (PR.Sconto <> '')  
                            AND @Qta >=PT.QtaMinima  
                            AND (PT.UM='' OR PT.UM= @UM)
                            AND @DataDoc BETWEEN PR.InizioValidita AND PR.FineValidita
                            AND (PT.CODDESTINAZIONE =0 OR PT.CODDESTINAZIONE =@Coddest)
                            AND (PT.FAMIGLIA = 0 OR PT.FAMIGLIA =@Famiglia)
                            AND (PT.REPARTO = 0 OR PT.REPARTO = @Reparto)
                    ORDER BY 
                        CASE 
                            WHEN CODART =  '*' and PT.CODGRUPPOPREZZIMAG  = 0  THEN 6
                            WHEN CODART =  ''  and PT.CODGRUPPOPREZZIMAG <> 0  THEN 4
                            WHEN CODART <> ''  and PT.CODGRUPPOPREZZIMAG  = 0  THEN 2
                            WHEN CODART =  '*' and PT.FAMIGLIA            = 0  THEN 5
                            WHEN CODART =  ''  and PT.FAMIGLIA           <> 0  THEN 3
                            WHEN CODART <> ''  and PT.FAMIGLIA            = 0  THEN 1
                        END
                        ,Utils.EditDistance(@Codart,PT.CODARTTIPOLOGIA) ASC
                        ,(@Qta - PT.QTAMINIMA) ASC
                            ,PT.CODDESTINAZIONE
            
                
        
        END

                            
        IF @Progr = 0  AND (@GruppoPrzCli  > 0 OR @CodSettore >0 OR @CodZona >0 OR @CodCategoria > 0)   
        
                BEGIN
                    SELECT  TOP 1 @Progr = PR.PROGRESSIVOREGOLETESTE,
                                  @TipoSconto = PT.TIPOSCONTO
                    FROM dbo.REGOLEPREZZIESTESI PT Inner JOIN 
                         dbo.REGOLESCONTIESTESI PR On PT.PROGRESSIVO = PR.PROGRESSIVOREGOLETESTE
                    WHERE   ((@CodArt LIKE PT.CODARTTIPOLOGIA OR PT.CODART = @codart  OR PT.CODART ='*' OR  PT.COdart =''))
                            AND ((@VarEsplicite LIKE PT.VarEsplicite+'%') OR PT.VarEsplicite= '*')
                            AND ((@CodicePrimario = PT.CodicePrimario) OR PT.CodicePrimario='*')
                            AND ((@CodFeature = PT.CODFEATURE) OR PT.CODFEATURE =0)
                            AND (PT.CODGRUPPOPREZZICF =@GruppoPrzCli OR PT.CODGRUPPOPREZZICF=0)
                            AND (PT.CODGRUPPOPREZZIMAG =@GruppoPrzArt OR PT.CODGRUPPOPREZZIMAG=0)
                            AND (PT.CodSettore= @CodSettore OR PT.CODSETTORE= 0)
                            AND (PT.CODZONA=@CodZona OR PT.Codzona =0)
                            AND (PT.CODCATEGORIA =@CodCategoria OR PT.CODCATEGORIA = 0)
                            -- AND  (PT.CODSETTORE + PT.CODCATEGORIA  + PT.CODZONA) >0
						    AND  (PT.CODGRUPPOPREZZICF+PT.CODSETTORE + PT.CODCATEGORIA  + PT.CODZONA) >0
                            AND (PR.Sconto <> '') 
                            AND @Qta >=PT.QtaMinima  
                            AND (PT.UM='' OR PT.UM= @UM)
                            AND @DataDoc BETWEEN PR.InizioValidita AND PR.FineValidita 
                            AND (PT.CODDESTINAZIONE =0 OR PT.CODDESTINAZIONE =@Coddest)
                            AND (PT.FAMIGLIA = 0 OR PT.FAMIGLIA =@Famiglia)
                            AND (PT.REPARTO = 0 OR PT.REPARTO = @Reparto)                           
                            
                    ORDER BY 
                        CASE 
                            WHEN CODART =  '*' and PT.CODGRUPPOPREZZIMAG  = 0  THEN 6
                            WHEN CODART =  ''  and PT.CODGRUPPOPREZZIMAG <> 0  THEN 4
                            WHEN CODART <> ''  and PT.CODGRUPPOPREZZIMAG  = 0  THEN 2
                            WHEN CODART =  '*' and PT.FAMIGLIA            = 0  THEN 5
                            WHEN CODART =  ''  and PT.FAMIGLIA           <> 0  THEN 3
                            WHEN CODART <> ''  and PT.FAMIGLIA            = 0  THEN 1
                            
                        END  
                        ,Utils.EditDistance(@Codart, PT.CODARTTIPOLOGIA) ASC 
                        ,PT.CODGRUPPOPREZZICF DESC, PT.CODSETTORE DESC, PT.CODZONA DESC, PT.CODCATEGORIA DESC
                        ,(@Qta - QTAMINIMA) ASC
                        ,PT.CODDESTINAZIONE DESC

                END 
        
        
            SET @CodCliFor = LEFT(@CodCliFor,1)
        
            IF @Progr = 0 And (@CodCliFor ='*' OR @CodCliFor='C' OR @CodCliFor ='F')  

                BEGIN
                    SELECT  TOP 1 @Progr = PR.PROGRESSIVOREGOLETESTE
                        ,@CodSconto = PR.CODSCONTO
                        ,@TipoSconto = PT.TIPOSCONTO
                        ,@Sconto = PR.SCONTO 
                    FROM dbo.REGOLEPREZZIESTESI PT Inner JOIN 
                         dbo.REGOLESCONTIESTESI PR On PT.PROGRESSIVO = PR.PROGRESSIVOREGOLETESTE
                    WHERE  (Pt.CODCLIFOR ='*' OR Pt.CODCLIFOR= @CodCliFor)  
                            AND (( @CodArt LIKE PT.CODARTTIPOLOGIA OR PT.CODART = @codart  OR PT.CODART ='*' OR  PT.CODART =''))
                            AND ((@VarEsplicite LIKE PT.VarEsplicite+'%') OR PT.VarEsplicite= '*')
                            AND ((@CodicePrimario = PT.CodicePrimario) OR PT.CodicePrimario='*')
                            AND ((@CodFeature = PT.CODFEATURE) OR PT.CODFEATURE =0)
                            AND (PT.CODGRUPPOPREZZIMAG =@GruppoPrzArt OR PT.CODGRUPPOPREZZIMAG=0 )
                            AND (PR.Sconto <> '' ) 
                            AND @Qta >=PT.QtaMinima  
                            AND (PT.UM='' OR PT.UM= @UM)
                            AND @DataDoc BETWEEN PR.InizioValidita AND PR.FineValidita 
                            AND (PT.CODDESTINAZIONE =0 OR PT.CODDESTINAZIONE =@Coddest)
                            AND (PT.FAMIGLIA = 0 OR PT.FAMIGLIA =@Famiglia)
                            AND (PT.REPARTO = 0 OR PT.REPARTO = @Reparto)                           
                            
                    ORDER BY 
                        CASE 
                            WHEN CODART =  '*' and PT.CODGRUPPOPREZZIMAG  = 0  THEN 6
                            WHEN CODART =  ''  and PT.CODGRUPPOPREZZIMAG <> 0  THEN 4
                            WHEN CODART <> ''  and PT.CODGRUPPOPREZZIMAG  = 0  THEN 2
                            WHEN CODART =  '*' and PT.FAMIGLIA            = 0  THEN 5
                            WHEN CODART =  ''  and PT.FAMIGLIA           <> 0  THEN 3
                            WHEN CODART <> ''  and PT.FAMIGLIA            = 0  THEN 1
                        END 
                        ,Utils.EditDistance(@Codart, PT.CODARTTIPOLOGIA) ASC
                        ,PT.CODSETTORE DESC, PT.CODZONA DESC, PT.CODCATEGORIA DESC
                        ,(@Qta - QTAMINIMA) ASC
                        ,PT.CODDESTINAZIONE
                    
                END 
            
            
            

        --------Inizio sequenza sconti-------------------------------------------------
            DECLARE @SeqSconti varchar(255),
                    @StrSconti varchar(255),
                    @tmpSconti varchar(255) =''
                    
            SET @StrSconti = @AppScRiga

                BEGIN
                
                Declare @NrScontiFissi int = 8
                --Gestione sequenza sconti, prima quelli base----
        
                INSERT INTO @TempTable(idRegola,codDiscount,strSpecialDiscount,strStdDiscount, NRSequenza)
                    (SELECT PR.IDRIGA, PR.CODSCONTO,PR.SCONTO,'' , PR.POSIZIONE + @NrScontiFissi
                        FROM dbo.REGOLEPREZZIESTESI PT 
                        Inner JOIN dbo.REGOLESCONTIESTESI PR On PT.PROGRESSIVO = PR.PROGRESSIVOREGOLETESTE
                        WHERE PT.PROGRESSIVO = @Progr AND @DataDoc BETWEEN PR.InizioValidita AND PR.FineValidita  )
                            
                ----NUOVA Gestione Sconti cumulati---
                --BEGIN
                
                --  DECLARE @CodSc varchar(5),
                --          @Nr as int,
                --          @Sc as varchar(50),
                --          @Scstr as varchar(50)
                            
                            
                --  --SET  @OldCodSconto =''
                --  DECLARE View4Insert  CURSOR FAST_FORWARD FOR
                        
                --      SELECT     PR.CODSCONTO, MIN(PR.SCONTO) AS SC, COUNT(PR.IDRIGA) AS NR
                --      FROM         REGOLEPREZZIESTESI AS PT INNER JOIN
                --                            REGOLESCONTIESTESI AS PR ON PT.PROGRESSIVO = PR.PROGRESSIVOREGOLETESTE
                --      WHERE     (PT.PROGRESSIVO = @Progr)
                --      GROUP BY PR.CODSCONTO

                --      OPEN View4Insert
        
                --      FETCH NEXT FROM View4Insert INTO @CodSconto, @Nr , @SC
                --      WHILE @@FETCH_STATUS = 0
                --          BEGIN
                                
                --              DECLARE @Count as int
                                
                --              SET @Count = (SELECT COUNT(IDRIGA) FROM  dbo.REGOLEPREZZIESTESI PT 
                --                                                  INNER JOIN dbo.REGOLESCONTIESTESI PR 
                --                                                  ON PT.PROGRESSIVO = PR.PROGRESSIVOREGOLETESTE Where CODSCONTO = @CodSconto AND PROGRESSIVO = @Progr)        
                                    
                                
                --              IF @Count > 0 
                                    
                --                  BEGIN
                                
                --                      SELECT @Scstr = COALESCE(@Scstr, '') + Sconto + '+' 
                --                      FROM  dbo.REGOLEPREZZIESTESI PT 
                --                      INNER JOIN dbo.REGOLESCONTIESTESI PR 
                --                      ON PT.PROGRESSIVO = PR.PROGRESSIVOREGOLETESTE Where CODSCONTO = @CodSconto AND PROGRESSIVO = @Progr
                                 
                --                      SET @Scstr = SUBSTRING(@Scstr, 1, LEN(@Scstr)-1)    
                                        
                                        
                --                      --Print @scstr
                --                      DELETE FROM @TempTable WHERE codDiscount = @Codsconto
                --                      INSERT INTO @TempTable(idRegola,codDiscount,strSpecialDiscount,strStdDiscount)
                --                              (SELECT 0, @Codsconto,@Scstr,'' )

                                        
                --                      SET @Count = 0
                                
                --                  END
                --              ELSE
                --                  BEGIN
                --                      SELECT 
                --                      INSERT INTO @TempTable(idRegola,codDiscount,strSpecialDiscount,strStdDiscount)
                --                              (SELECT 0, @Codsconto,@SC,'' )
                --                  END
                --              FETCH NEXT FROM View4Insert INTO @CodSconto, @Nr, @SC   

                --          END

                --      CLOSE View4Insert
                --      DEALLOCATE View4Insert
                --    END           
                --  --FINE NUOVA Gestione Sconti cumulati---
                
                IF @TipoSconto =1   
                    BEGIN
                        SET @StrSconti = @AppScRiga

                        WHILE @StrSconti <>''
                        
                            BEGIN
                                DECLARE @DefaultCodScontoC1 varchar(5),
                                        @DefaultCodScontoP1 varchar(5),
                                        @DefaultCodScontoM1 varchar(5),
                                        @DefaultCodScontoM2 varchar(5),
                                        @DefaultCodScontoM3 varchar(5),
                                        @CodScontoStd varchar(5),
                                        @NrSeq int
                                
                                SET @DefaultCodScontoC1 = (Select TOP 1 Codsconto From dbo.SCONTIESTESI Where TIPO='C1')
                                SET @DefaultCodScontoM1 = (Select TOP 1 Codsconto From dbo.SCONTIESTESI Where TIPO='M1')
                                SET @DefaultCodScontoM2 = (Select TOP 1 Codsconto From dbo.SCONTIESTESI Where TIPO='M2')
                                SET @DefaultCodScontoM3 = (Select TOP 1 Codsconto From dbo.SCONTIESTESI Where TIPO='M3')
                                --SET @DefaultCodScontoP1 = (Select Codsconto From price.SCONTIESTESI Where TIPO='P1')
                                
                                BEGIN
                                    SET @SeqSconti =(CASE LEFT(@StrSconti,2)
                                                        WHEN 'C1' THEN  @ScontoCli1
                                                        WHEN 'P1' THEN  (Select Sconto from TABPAGAMENTI Where CODICE = @Pagamento)
                                                        WHEN 'M1' THEN  @ScontoArt1
                                                        WHEN 'M2' THEN  @ScontoArt2
                                                        WHEN 'M3' THEN  @ScontoArt3
                                                     END)
                                    SET @CodScontoStd =(CASE LEFT(@StrSconti,2)
                                                        WHEN 'C1' THEN  @DefaultCodScontoC1
                                                        WHEN 'P1' THEN  @DefaultCodScontoP1
                                                        WHEN 'M1' THEN  @DefaultCodScontoM1
                                                        WHEN 'M2' THEN  @DefaultCodScontoM2
                                                        WHEN 'M3' THEN  @DefaultCodScontoM3
                                                     END)
                                    SET @NrSeq = (CASE LEFT(@StrSconti,2)
                                                        WHEN 'C1' THEN  1
                                                        WHEN 'P1' THEN  2
                                                        WHEN 'M1' THEN  3
                                                        WHEN 'M2' THEN  4
                                                        WHEN 'M3' THEN  5
                                                     END)                    
                                END
                                IF @tmpSconti =''
                                    BEGIN
                                        SET @tmpSconti = @SeqSconti
                                    
                                        IF (Select COUNT(codDiscount) FROM @TempTable Where codDiscount = @CodScontoStd) =0
                                            BEGIN
                                                    INSERT INTO @TempTable SELECT 0, @CodScontoStd,'',@SeqSconti, @NrSeq WHERE @CodScontoStd IS NOT NULL
                                            END
                                        ELSE
                                            BEGIN
                                                UPDATE @TempTable 
                                                    SET strStdDiscount= strStdDiscount + @SeqSconti
                                                    WHERE codDiscount = @CodScontoStd
                                            END
                                     END
                                
                                SET @StrSconti = LTRIM(SUBSTRING(@StrSconti, 3,100))
                            END 
                                
                    END
                    
                       
            END
    
    END

    RETURN
END


GO
GRANT SELECT
    ON OBJECT::[Price].[FUNGetSpecialDiscount_Extensive] TO [Metodo98]
    AS [dbo];

