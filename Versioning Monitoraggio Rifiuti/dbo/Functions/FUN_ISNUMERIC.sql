create function dbo.FUN_ISNUMERIC(@num VARCHAR(255)) returns bit
BEGIN
    IF LEFT(@num, 1) = '-'  
        SET @num = SUBSTRING(@num, 2, LEN(@num))  
 
    DECLARE @pos TINYINT  
 
    SET @pos = 1 + LEN(@num) - CHARINDEX('.', REVERSE(@num))  
 
    RETURN CASE  
    WHEN PATINDEX('%[^0-9.-]%', @num) = 0  
        AND @num NOT IN ('.', '-', '+', '^') 
        AND LEN(@num)>0  
        AND @num NOT LIKE '%-%' 
        AND  
        (  
            ((@pos = LEN(@num)+1)  
            OR @pos = CHARINDEX('.', @num))  
        )  
    THEN  
        1  
    ELSE  
		0  
    END  
END  

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[FUN_ISNUMERIC] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FUN_ISNUMERIC] TO [Metodo98]
    AS [dbo];

