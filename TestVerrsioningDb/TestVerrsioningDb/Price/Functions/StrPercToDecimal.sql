
CREATE Function [Price].[StrPercToDecimal]
( 
    @strProvv As VARCHAR(50)
) 
RETURNS DECIMAL (19,6)
AS  
BEGIN

  DECLARE @ConvProvv DECIMAL(19,6)
 
   DECLARE @Count INT=0
   DECLARE @P1 Decimal(19,6)=0, @P Decimal(19,6) =0
    
  DECLARE @Item DECIMAL(19,6)
  SET @strProvv  = REPLACE(@strProvv,',','.')

   /* 19/02/2014 aggiunta Where @strProvv <>'' per evitare errore sulla lettura dela provvigione*/
   DECLARE tmp_Cursor CURSOR LOCAL  FAST_FORWARD  FOR
   SELECT Item FROM dbo.SplitStrings(@strProvv, '+') Where @strProvv <>''
 
                    
   OPEN tmp_Cursor;
        FETCH NEXT FROM tmp_Cursor
        INTO @Item
        WHILE @@FETCH_STATUS = 0
           BEGIN
  
                SET @p1 = 0 

                SET @p1 = @Item

                SET @p = @p + @p1 
                
                FETCH NEXT FROM tmp_Cursor
                INTO @Item
           END;
        CLOSE tmp_Cursor;
        DEALLOCATE tmp_Cursor;

        
    SET @ConvProvv = @p
    RETURN @ConvProvv


END  

