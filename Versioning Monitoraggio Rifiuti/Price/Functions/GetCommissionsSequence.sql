
-- =============================================
--parametri input
--  SeqApplPr  - sequenza di applicazione
--  PrCli   - stringa provv. cliente/fornitore
--  PrArt   - stringa provv. articolo
--  PrAg   - stringa provv. agente
--parametri output
--   strProvv - stringa di provv. composta secondo la sequenza
--valore di ritorno
--   corripondente numerico di strProvv
CREATE Function [Price].[GetCommissionsSequence]
(@TipoCalcolo As Smallint
,@CodAge varchar(7)
,@NrAge SMALLINT= 1 
,@SeqApplPr AS VARCHAR(100)
,@ProvvCli AS VARCHAR(7)
,@ProvvArt VARCHAR(10)
,@ProvvAge VARCHAR(10)
,@AppProvvRiga CHAR(8)
,@AppProvvFinale CHAR(6)
)

RETURNS 
@Table TABLE 
(
    -- Add the column definitions for the TABLE variable here
    CommissionString VARCHAR(255), 
    CommissionValue decimal(19,4)
)

--ENCRY--
AS

BEGIN  
    DECLARE @PrArt AS VARCHAR(10), @PrCli AS VARCHAR(10), @PrAg VARCHAR(10)

    If @CodAge <> '' 
        BEGIN
            If @TipoCalcolo <> 0 
                BEGIN 
                    If @TipoCalcolo = 1
                        BEGIN 
                            IF  @SeqApplPr =''
                                SET @SeqApplPr = @AppProvvRiga

                            SET @PrArt = @ProvvArt
                        END
                    ELSE
                        IF  @SeqApplPr =''                  
                            SET @SeqApplPr = @AppProvvFinale
                
                    SET @PrCli = @ProvvCli
                    SET @PrAg = @ProvvAge
                END
        
            DECLARE @strProvv AS VARCHAR(50), @CalcolaSeqProvv AS VARCHAR(50)
            SET @strProvv = ''
            SET @CalcolaSeqProvv = 0
            DECLARE @restoSeq AS VARCHAR(100)
            

            If @SeqApplPr <> ''
                BEGIN
                    SET @restoSeq = RTRIM(@SeqApplPr)
                    DECLARE @corr AS varchar(100), @prcorr AS VARCHAR(100)
                    WHILE @restoSeq <> ''
                        BEGIN
                            SET @corr = Left(@restoSeq,  1)
                            SET @prcorr= (Select Case @corr
                                    WHEN 'C' THEN  LTRIM(@PrCli)
                                    WHEN 'M' THEN  LTRIM(@PrArt)
                                    WHEN 'A' THEN  LTrim(@PrAg)
                                End )
                            IF (@strProvv <> '') And (@strProvv <> '0') 
                                BEGIN
                                    If @prcorr <> '' 
                                        SET @strProvv = @strProvv +'+' + @prcorr
                                END
                            Else
                                SET @strProvv = @prcorr
                            /* 19-02-2014 Modifica subtring da 3 a 2 */
                            SET @restoSeq = LTRIM(SUBSTRING(@restoSeq, 2,100))
                        END
                    
                        SET @CalcolaSeqProvv = ( Select  Price.StrPercToDecimal(@strProvv))
                END
        End 
    ELSE
        BEGIN  
            SET @strProvv = ''
            SET @CalcolaSeqProvv = 0
        END

    INSERT INTO @table (CommissionString, CommissionValue) SELECT ISNULL(@strProvv,''), ISNULL(@CalcolaSeqProvv,0)
  RETURN       
End 


GO
GRANT SELECT
    ON OBJECT::[Price].[GetCommissionsSequence] TO [Metodo98]
    AS [dbo];

