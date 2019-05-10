

CREATE FUNCTION FUSVariantiFromVarEsplicite
( @RowData nvarchar(2000) )  

RETURNS nvarchar(2000)

AS  

BEGIN 

       -- Declare the return variable here
       DECLARE @Result  varchar(255)
       DECLARE @SplitOn varchar(1)

       DECLARE @Variante nvarchar(100) 
       DECLARE @STR nvarchar(100)
       DECLARE @INIT int
       DECLARE @LENSTR int
       
       SET @SplitOn = ';'
       SET @Result=''

       While (Charindex(@SplitOn,@RowData)>0)
             Begin
                    
                    SET @STR=  rtrim(ltrim(Substring(@RowData,1,Charindex(@SplitOn,@RowData)-1)))
                    SET @INIT = CHARINDEX('=',@STR,1)+1
                    SET @LENSTR = LEN(@STR)           
                           
                    SET @Variante = SUBSTRING(@STR,@INIT, @LENSTR - @INIT+1)
                    
                    SET @Result = @Result + @Variante       
                    SET @RowData = Substring(@RowData,Charindex(@SplitOn,@RowData)+1,len(@RowData))
                    
             End

       -- Return the result of the function
       RETURN @Result

END



GO
GRANT EXECUTE
    ON OBJECT::[dbo].[FUSVariantiFromVarEsplicite] TO [Metodo98]
    AS [dbo];

