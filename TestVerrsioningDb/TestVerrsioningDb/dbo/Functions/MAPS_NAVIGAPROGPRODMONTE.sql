
-- GESTIONE TESORERIA FINE -------------------------------------------------------------


-- ANOMALIA 3017 INIZIO -------------------

CREATE function [dbo].[MAPS_NAVIGAPROGPRODMONTE](@NOMEPIANIF varchar(30), @PROG_ID decimal(10,0))
returns @Results table (
    NOMEPIANIF  varchar(30),
    LIVELLO     int,
    PROG_ID     decimal(10,0),
    RIF_ID      decimal(10,0))
as
begin

    declare @ROWCOUNT int   
    declare @CURRENTLEVEL int
    declare @TIPOREC int

    set @CURRENTLEVEL=0

    -- determino il tipo record
    select @TIPOREC=TIPO from PROGPRODUZIONE 
        where NOMEPIANIF=@NOMEPIANIF and PROG_ID=@PROG_ID

    -- inserisco il nodo principale
    insert into @Results (NOMEPIANIF,LIVELLO,PROG_ID,RIF_ID)
        values (@NOMEPIANIF,@CURRENTLEVEL,@PROG_ID,0)

    set @ROWCOUNT=@@ROWCOUNT
    while @ROWCOUNT>0
    begin
        -- navigazione per record di tipo ORC
        if ((@TIPOREC=0 or @TIPOREC=7) and (@CURRENTLEVEL=0))
            begin
                set @CURRENTLEVEL=@CURRENTLEVEL+1
                insert into @Results(NOMEPIANIF,LIVELLO,PROG_ID,RIF_ID)
                    (select P.NOMEPIANIF,@CURRENTLEVEL,P.RIFID,R.PROG_ID
                        from PROGPRODUZIONE P inner join @Results R on P.NOMEPIANIF=R.NOMEPIANIF and P.PROG_ID=R.PROG_ID and P.RIFID<>0 and R.LIVELLO=@CURRENTLEVEL-1)
                set @ROWCOUNT=@@ROWCOUNT
            end

        set @CURRENTLEVEL=@CURRENTLEVEL+1
        insert into @Results(NOMEPIANIF,LIVELLO,PROG_ID,RIF_ID)
            (select P.NOMEPIANIF,@CURRENTLEVEL,P.RIF_ID,R.PROG_ID
                from PROGPRODUZIONEDOC P inner join @Results R on P.NOMEPIANIF=R.NOMEPIANIF and P.PROG_ID=R.PROG_ID and R.LIVELLO=@CURRENTLEVEL-1)
        
        set @ROWCOUNT=@@ROWCOUNT
        if (@ROWCOUNT > 0)
        begin
            set @CURRENTLEVEL=@CURRENTLEVEL+1
            insert into @Results(NOMEPIANIF,LIVELLO,PROG_ID,RIF_ID)
                (select P.NOMEPIANIF,@CURRENTLEVEL,P.RIFID,R.PROG_ID
                    from PROGPRODUZIONE P inner join @Results R on P.NOMEPIANIF=R.NOMEPIANIF and P.PROG_ID=R.PROG_ID and P.RIFID<>0 and R.LIVELLO=@CURRENTLEVEL-1)
            set @ROWCOUNT=@@ROWCOUNT
        end

        /*
        if (@ROWCOUNT > 0)
        begin
            set @CURRENTLEVEL=@CURRENTLEVEL+1
            insert into @Results(NOMEPIANIF,LIVELLO,PROG_ID,RIF_ID)
                (select P.NOMEPIANIF,@CURRENTLEVEL,P.RIFID,R.PROG_ID
                    from PROGPRODUZIONE P inner join @Results R on P.NOMEPIANIF=R.NOMEPIANIF and P.RIF_PROP=R.PROG_ID and R.LIVELLO=@CURRENTLEVEL-1)
            set @ROWCOUNT=@@ROWCOUNT
        end
        */

    end

    return

end

GO
GRANT DELETE
    ON OBJECT::[dbo].[MAPS_NAVIGAPROGPRODMONTE] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[MAPS_NAVIGAPROGPRODMONTE] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[MAPS_NAVIGAPROGPRODMONTE] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[MAPS_NAVIGAPROGPRODMONTE] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[MAPS_NAVIGAPROGPRODMONTE] TO [Metodo98]
    AS [dbo];

