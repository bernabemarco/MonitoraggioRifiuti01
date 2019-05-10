
CREATE FUNCTION [dbo].[Split]
(
    @RowData nvarchar(2000),
    @SplitOn nvarchar(5)
)  
RETURNS @RtnValue table 
(
    Id int identity(1,1),
    Tipologia nvarchar(100),
    Variante nvarchar(100)
    
) 
AS  
BEGIN 
    Declare @Cnt int
    Declare @Tipologia nvarchar(100) 
    Declare @Variante nvarchar(100) 
    DECLARE @STR nvarchar(100)
    DECLARE @INIT int
    DECLARE @LENSTR int
    
    Set @Cnt = 1

    While (Charindex(@SplitOn,@RowData)>0)
        Begin

            SET @Tipologia =  LEFT (ltrim(rtrim(Substring(@RowData,1,Charindex(@SplitOn,@RowData)-1))), CHARINDEX('=',ltrim(rtrim(Substring(@RowData,1,Charindex(@SplitOn,@RowData)-1))),1)-1)
            SET @STR=  rtrim(ltrim(Substring(@RowData,1,Charindex(@SplitOn,@RowData)-1)))
            SET @INIT = CHARINDEX('=',@STR,1)+1
            SET @LENSTR = LEN(@STR)     
                
            SET @Variante = SUBSTRING(@STR,@INIT, @LENSTR - @INIT+1)
            
            Insert Into @RtnValue (Tipologia, Variante)  SELECT @Tipologia, @Variante --WHERE @tipologia IS NOT NULL AND @Variante IS NOT NULL
                
            Set @RowData = Substring(@RowData,Charindex(@SplitOn,@RowData)+1,len(@RowData))
            Set @Cnt = @Cnt + 1
        End


    Return
END

