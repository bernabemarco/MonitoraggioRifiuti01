

CREATE FUNCTION [Utils].[EditDistance] (@Word varchar(30), @WordCompare varchar(30))
returns int
as
begin
    
    -- Levenshtein Algorithm 

    DECLARE @Distance int -- La variabile che viene restituita
            , @lenWord int -- La lunghezza della prima parola
            , @lenWordCompare int -- la lunghezza della seconda parola

    -- Calcolo la lunghezza delle due parole

    SET @LenWord = len(@Word)
    SET @LenWordCompare = len(@WordCompare)
 
    -- Se la lunghezza di una delle due parole � 0 allora viene restituita la lunghezza dell'altra
    IF @LenWord = 0
        SET @Distance = @LenWordCompare
    ELSE IF @LenWordCompare = 0
        SET @Distance = @LenWord
    ELSE
        BEGIN
            DECLARE @array_temp TABLE (riga INT,colonna INT,valore INT)
            -- Creo una tabella temporanea per simulare un array bidimensionale
            DECLARE @i INT
                  , @j int
  
            -- inizializzo la cella (0,0) con il valore 0
            INSERT @array_temp VALUES (0, 0, 0)

            -- importo i valori della prima riga e della prima colonna a 0
            SET @i = 1
            WHILE @i <= @LenWord
                BEGIN
                    INSERT @array_temp values (@i, 0, @i)
                    SET @i = @i + 1
                END
            set @j = 1
            WHILE @j <= @LenWordCompare
                BEGIN
                    INSERT @array_temp VALUES (0, @j, @j)
                    SET @j = @j + 1
                END
    
            -- Ciclo sulle due parole calcolando la distanza
    
            DECLARE   @cost int
                    , @min1 int
                    , @min2 int
                    , @min3 int
    
            SET @i = 1
            WHILE @i <= @LenWord
                BEGIN
                    SET @j = 1
                    WHILE @j <= @LenWordCompare
                        BEGIN
                            -- Compare the letters and determine @cost
                            -- If they are the same, @cost is 0. If different,
                            -- @cost is 1
                
                            IF (SUBSTRING(@Word, @i, 1) = SUBSTRING(@WordCompare, @j, 1))
                                SET @cost = 0
                            ELSE
                                SET @cost = 1
                
                            -- Calcolo il minimo tra:
                            -- La cella a sinistra
                            -- Quella in alto
                            -- E quella in alto a sinistra in diagonale
                
                            SELECT @min1 = [valore] + 1
                            FROM @array_temp
                            WHERE riga = @i - 1 and colonna = @j
                
                            SELECT @min2 = [valore] + 1
                            FROM @array_temp
                            WHERE riga = @i and colonna = @j - 1
                
                            SELECT @min3 = [valore] + @cost
                            FROM @array_temp
                            WHERE riga = @i - 1 and colonna = @j - 1
                
                            IF @min2 < @min1
                                SET @min1 = @min2

                            IF @min3 < @min1
                                SET @min1 = @min3
                
                            INSERT INTO @array_temp VALUES (@i, @j, @min1)
                            SET @j = @j + 1
                        END
                    SET @i = @i + 1
                END
            -- La distanza finale � la cella in basso a destra
            SELECT @Distance = [valore]
            FROM @array_temp
            WHERE riga = @LenWord AND colonna = @LenWordCompare
        END
    -- Restituisco la distanza
    RETURN @Distance
END

