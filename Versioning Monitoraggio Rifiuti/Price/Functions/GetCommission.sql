

-- =============================================
--calcolo della Provvigione utilizzando la tabella provvigioni particolari
--************************************************************************
--parametri input
--   @Qta       - pecifica qta 
--   @IsRow     - TRUE=Provvigione di riga, false = Provvigione finale
--   @SeqApplPr - Sequenza Applicazione Provvigioni, se presente sostituisce quella dell'Agente
--   @IsAdd     - considera provv. aggiuntive
--   @CodAge    - Codice dell' Agente. (obbligatorio)
--   @NrAge     - Specifica se l'agente ? il primo,secondo o terzo agente del cliente
--   @ProvvCli
--   @CodCli    - Codice del Cliente. (obbligatorio)
--   @CodArt    - Codice Articolo. (obbligatorio)
--   @Date      - Data da confrontare con la data di validit?
--   @UM        - Unit? di misura Riga
--   @DaSconto  - Sconto Riga
--   @DaImporto  - Importo Riga in valuta
--   @DaImportoEuro -Importo Riga Euro
--   @DaFatturatoEuro - Fatturato Agente opzionale se non presente calcolo automaticamente,  
--   @NCampagna   - Campagna Riga,
--   @NPromozione - Promozione Riga,
--   @Esercizio   - Esercizio del documento
--valori di ritorno
--   CommissionString          - Provvigione in formato di stringa
--   CommissionValue
CREATE FUNCTION [price].[GetCommission] 
(
    @Qta DECIMAL(16,6),
    @strPrv AS VARCHAR(50),
    @SeqApplPr AS VARCHAR(20),
    @IsRow AS BIT,
    @CodAge AS VARCHAR(7) ,
    @NrAge AS SMALLINT,
--  
    @CodCli AS VARCHAR(7),
    @CodArt AS VARCHAR(50),
    @Date AS DATETIME,
    @UM varchar(3),
    @DaSconto DECIMAL(8,5),
    @DaImporto DECIMAL(19,4)=0,
    @DaImportoEuro DECIMAL(19,4)=0,
    @DaFatturatoEuro DECIMAL(19,4)=0,  
    @NCampagna VARCHAR(3),
    @NPromozione VARCHAR(3),
    @Esercizio Decimal(5,0)
)
RETURNS 
@Table TABLE 
(
    CommissionString VARCHAR(255), 
    CommissionValue decimal(19,4)
)

--ENCRY--
AS
BEGIN
    DECLARE @FunCheckPrice4Item Smallint
    DECLARE @CheckPrice4Customer SMALLINT
    DECLARE @Progr DECIMAL (10,0), @ProgrAdd DECIMAL (10,0),  @NRIGA SMALLINT, @NRIGAADD SMALLINT  
    , @ProvvAgg SMALLINT 
    DECLARE @ProvvStr VARCHAR(20), @ProvvValue DECIMAL(19,6)
    DECLARE @ProvvCli varchar(10)
    SET @Progr =0
--- recupero info cliente x esercizio -----------------------------------------------------     
    DECLARE @CliUsaPrzPrv bit,
            @GruppoPrzCli int,
            @GruppoPrvCli int,
            @ProvvCli1 varchar(10),
            @ProvvCli2 varchar(10),
            @ProvvCli3 varchar(10),
            @ScontoCli1 varchar(10),
            @AppScRiga varchar(10),
            @AppScFinale varchar(6),
            @ListinoCli decimal(5, 0),
            @NrContratto decimal(10, 0)
            
    SELECT  @CliUsaPrzPrv = CliUsaPrzPrv
            ,@GruppoPrvCli = GruppoPrvCli
            ,@ProvvCli1 = ProvvCli1 
            ,@ProvvCli2 = ProvvCli2 
            ,@ProvvCli3 = ProvvCli3 
            ,@ScontoCli1 = ScontoCli1 
            ,@AppScRiga = AppScRiga 
            ,@AppScFinale = AppScFinale 
            ,@ListinoCli = ListinoCli 
            ,@NrContratto = NrContratto 
            FROM [Price].[FUNGetCustomer4year] (@CodCli , 0, @Esercizio)        
    
    --- recupero info articolo x esercizio -----------------------------------------------------
    DECLARE @ArtUsaPrzPrv bit,
            @GruppoPrvArt int,
            @ScontoArt1 varchar(10),
            @ScontoArt2 varchar(10),
            @ScontoArt3 varchar(10),
            @PrvArt varchar(10),
            @AddPlusVariant BIT,
            @CodFeature INT,
            @VarEsplicite varchar(max) =''

    SELECT  @ArtUsaPrzPrv = ArtUsaPrzPrv 
            ,@GruppoPrvArt = GruppoPrvArt 
            ,@ScontoArt1 = ScontoArt1 
            ,@ScontoArt2 = ScontoArt2 
            ,@ScontoArt3 = ScontoArt3 
            ,@PrvArt = PrvArt 
            ,@AddPlusVariant = AddPlusVariant
            ,@CodFeature = CodFeature
            ,@VarEsplicite = VarEsplicite
            FROM [Price].[FunGetItem4year] (@codart,@Esercizio)
    
    IF @Esercizio = 1900
        SET @Esercizio = YEAR(getdate())

    
    --- recupero info articolo x esercizio -----------------------------------------------------
    DECLARE @StrProvvAge AS VARCHAR(20)
            ,@CheckCommissionAge SMALLINT
            ,@AppProvvRiga CHAR(8)
            ,@AppProvvFinale CHAR(6)
            ,@FatturatoCli DECIMAL(19,6)
            

  IF @DaFatturatoEuro > 0
    SET @FatturatoCli = @DaFatturatoEuro
          
    DECLARE @NoIva As  BIT = CONVERT(BIT,(SELECT PROVVNOIVA FROM ParametriGPrezzi WHERE NrRecord=1   ))

    SELECT @StrProvvAge=Provvigioni
            ,@CheckCommissionAge=UsaPrvPart
            ,@AppProvvRiga=ApplProvvRiga
            ,@AppProvvFinale=ApplProvvFinale 
            ,@FatturatoCli = Fatturato
            FROM Price.FUNGetAgent4year(@CodAge,@NrAge,@NoIva,@Esercizio)
    
    /* gestione data entry da classe CLSPRZPRV sempre valorizzato */

    IF @strPrv <>''
        Set @StrProvvAge = @strPrv  
    

    /* Fine */

    ---------------------------------------------------------------------------------------------
    SET @FunCheckPrice4Item = (SELECT [Price].[FUSCheckSpecialPrice4Item] (@Codart, @Esercizio))
    SET @CheckPrice4Customer = (SELECT [Price].[FUSCheckSpecialPrice4Customer] (@CodCli, @Esercizio))

    DECLARE @P AS VARCHAR(100)


    SET @ProvvCli =(SELECT CASE @NrAge WHEN 1 THEN @ProvvCli1 WHEN 2 THEN @ProvvCli2 WHEN 3 THEN @ProvvCli3 END )

    ------------------------------------------------
        BEGIN
            IF @IsRow =1
                (SELECT @ProvvStr= Commissionstring , @ProvvValue = CommissionValue FROM Price.GetCommissionsSequence(1,@CodAge,@NrAge,@SeqApplPr,  @ProvvCli,  @PrvArt,@StrProvvAge,@AppProvvRiga,@AppProvvFinale))
            Else
                (SELECT @ProvvStr= Commissionstring , @ProvvValue = CommissionValue FROM Price.GetCommissionsSequence(2, @CodAge,@NrAge,@SeqApplPr, @ProvvCli, @PrvArt, @StrProvvAge,@AppProvvRiga,@AppProvvFinale))
            
        END  
        IF @CheckCommissionAge=1 And @ArtUsaPrzPrv=1 And @CliUsaPrzPrv=1 
            BEGIN
                 (SELECT @PROGR=PROGR, @NRIGA= IDRIGA FROM [Price].[GetCommissionsProgr] (0
                                                                  ,@Qta
                                                                  ,@CodAge
                                                                  ,@CodCli
                                                                  ,@CodArt
                                                                  ,@Date
                                                                  ,@UM
                                                                  ,@DaSconto
                                                                  ,@DaImporto
                                                                  ,@DaImportoEuro
                                                                  ,@DaFatturatoEuro
                                                                  ,@GruppoPrvArt
                                                                  ,@GruppoPrvCli
                                                                  ,@NCampagna
                                                                  ,@NPromozione
                                                                  ,@CodFeature
                                                                  ,@VarEsplicite
                                                                  ))

                 (SELECT @PROGRADD=PROGR, @NRIGAADD= IDRIGA  FROm[Price].[GetCommissionsProgr] (1
                                                                  ,@Qta
                                                                  ,@CodAge
                                                                  ,@CodCli
                                                                  ,@CodArt
                                                                  ,@Date
                                                                  ,@UM
                                                                  ,@DaSconto
                                                                  ,@DaImporto
                                                                  ,@DaImportoEuro
                                                                  ,@DaFatturatoEuro
                                                                  ,@GruppoPrvArt
                                                                  ,@GruppoPrvCli
                                                                  ,@NCampagna
                                                                  ,@NPromozione
                                                                  ,@CodFeature
                                                                  ,@VarEsplicite
                                                                  ))
                             
            END      
    ---------------------------------Calcolo Provvigione    ----------------------------------------------
    DECLARE @QtaMinima decimal(16, 6),
        @Sconto varchar(20),
        @Provv VARCHAR(50),
        @ProvvAdd VARCHAR(50),
        @TipoRiga decimal(5,0)


    IF @Progr > 0 OR @ProgrAdd >0
        
        BEGIN 
            DECLARE @sign AS CHAR(1)=''

            SELECT  TOP 1 @Provv= Provvigione FROM [Price].[FUNSpecialCommission4Item] (@Progr,@Nriga)      
            SELECT  TOP 1 @ProvvAdd= Provvigione FROM [Price].[FUNSpecialCommission4Item] (@ProgrADD,@NrigaADD)

            IF @Provv <>''
                SET @Provvstr = @Provv 

            IF @Provvstr <>'' OR @Provv <>''
                SET @sign='+'

		   DECLARE @InntProvvAdd int = (SELECT LEFT(SUBSTRING(@ProvvAdd, PATINDEX('%[0-9.]%', @ProvvAdd), 8000),  PATINDEX('%[^0-9.-]%', SUBSTRING(@ProvvAdd, PATINDEX('%[0-9.-]%', @ProvvAdd), 8000) + 'X') -1))

           IF @InntProvvAdd >0 
                BEGIN
                    SET @Provvstr = @Provvstr +@sign +@ProvvAdd

					DECLARE @provvStrValue varchar(50) = @Provvstr
					If EXISTS(SELECT CHARINDEX('(', @provvStrValue))
						SET @provvStrValue = (SELECT REPLACE(@provvStrValue,'(','-'))
					If EXISTS(SELECT CHARINDEX(')', @provvStrValue))
						SET @provvStrValue = (SELECT REPLACE(@provvStrValue,')',''))
					

                    SET @ProvvValue=(Select  Price.StrPercToDecimal(@provvStrValue))
                    INSERT INTO @Table (CommissionString, CommissionValue )
                    VALUES (@Provvstr, @ProvvValue )  
                END    
            ELSE
                BEGIN
                    SET @ProvvValue=(Select  Price.StrPercToDecimal(@Provvstr))
                    INSERT INTO @Table (CommissionString, CommissionValue )
                    VALUES (@Provvstr, @ProvvValue )
                END                  
                            
                    
        END
        
    ELSE
        BEGIN
            INSERT INTO @Table (CommissionString, CommissionValue )
                    VALUES (@Provvstr, @ProvvValue )
        
        END      
    RETURN 
END




GO
GRANT SELECT
    ON OBJECT::[Price].[GetCommission] TO [Metodo98]
    AS [dbo];

