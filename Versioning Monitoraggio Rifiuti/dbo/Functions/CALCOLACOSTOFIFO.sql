

create function dbo.CALCOLACOSTOFIFO(@codart varchar(50), @dataMov datetime, @esercizio smallint)
returns decimal(16,6)
as
-- =============================================
-- Calcola il costo Fifo 
-- =============================================
begin
    declare @costo decimal(16,6)
    --set @costo =  1.1

    -- Giacenza alla data calcolo
    DECLARE @qtagia    Float = (SELECT SUM(GIACENZA*QTA1UM) FROM STORICOMAG WHERE CODART = @codart AND DATAMOV <= @dataMov)

    -- Accumulatori quantit� e valore
    DECLARE @qtamag Float = 0
    DECLARE @valmag Float = 0

    DECLARE @qtamov Float
    DECLARE @valmov Float
    DECLARE @qtaass Float

    -- Se presente uso la funzione personalizzata
    IF Object_ID('dbo.MET_CALCOLACOSTOFIFO') IS NOT NULL 
      RETURN dbo.MET_COSTO_FIFO(@codart, @esercizio, @dataMov)

    -- Leggo a ritroso i carichi fino a copertura della gicenza
    DECLARE my_cursor CURSOR LOCAL STATIC READ_ONLY FORWARD_ONLY 
        FOR 
            SELECT QTA1UM*QUANTITACARICO, IMPORTOTOTNETTOEURO*VALORECARICO
            FROM STORICOMAG 
            WHERE QTA1UM > 0 AND (QUANTITACARICO <> 0 OR VALORECARICO <> 0)
            AND CODART = @codart 
            AND ESERCIZIO = @esercizio
            AND DATAMOV <= @dataMov
            ORDER BY DATAMOV DESC

    OPEN my_cursor
    WHILE (1=1)
    BEGIN 
        FETCH NEXT FROM my_cursor INTO @qtamov, @valmov

        -- Esco se non ci sono pi� carichi da leggere
        IF @@FETCH_STATUS <> 0 BREAK

        -- Se qt� da assegnare maggiore del movimento lo assegno tutto (oppure se giacenza da assegnare � zero)
        IF (@qtagia-@qtamag>=@qtamov) OR (@qtagia=0)
        begin
            --select @qtamag, @valmag/Iif(@qtamag=0,1,@qtamag), @qtamov, @valmov/@qtamov
            set @valmag = @valmag + @valmov
            set @qtamag = @qtamag + @qtamov
        end
            else    -- altrimenti solo quota parte              
        begin
            --select @qtamag, @valmag/@qtamag, @qtagia-@qtamag, @valmov/@qtamov
            set @valmag = @valmag + @valmov*((@qtagia-@qtamag)/@qtamov)
            set @qtamag = @qtagia
        end
        
        -- Esco a copertura
        IF @qtamag >= @qtagia BREAK
    END
    CLOSE my_cursor
    DEALLOCATE my_cursor

    SET @costo = (CASE WHEN @qtamag>0 THEN @valmag/@qtamag ELSE 0 END)
            
    return @costo
end

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[CALCOLACOSTOFIFO] TO [Metodo98]
    AS [dbo];

