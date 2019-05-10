create function [dbo].[MAPS_NAVIGAPROGPRODVALLE](@NOMEPIANIF varchar(30), @PROG_ID decimal(10,0))
returns @Results table (
	NOMEPIANIF	varchar(30),
	LIVELLO		int,
	PROG_ID		decimal(10,0),
	RIF_ID		decimal(10,0))
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
		if (@TIPOREC=3 and @CURRENTLEVEL=0)
			begin
				set @CURRENTLEVEL=@CURRENTLEVEL+1
				insert into @Results(NOMEPIANIF,LIVELLO,PROG_ID,RIF_ID)
					(select P.NOMEPIANIF,@CURRENTLEVEL,P.PROG_ID,R.PROG_ID
						from PROGPRODUZIONEDOC P inner join @Results R on P.NOMEPIANIF=R.NOMEPIANIF and P.RIF_ID=R.PROG_ID and R.LIVELLO=@CURRENTLEVEL-1)		
				set @ROWCOUNT=@@ROWCOUNT
			end
		
		if not ((@TIPOREC=0 or @TIPOREC=7) and (@CURRENTLEVEL=0))
			begin
				set @CURRENTLEVEL=@CURRENTLEVEL+1
				insert into @Results(NOMEPIANIF,LIVELLO,PROG_ID,RIF_ID)
					(select P.NOMEPIANIF,@CURRENTLEVEL,P.PROG_ID,R.PROG_ID
						from PROGPRODUZIONE P inner join @Results R on P.NOMEPIANIF=R.NOMEPIANIF and P.RIFID=R.PROG_ID and R.LIVELLO=@CURRENTLEVEL-1)		
				set @ROWCOUNT=@@ROWCOUNT
			end

		if (@ROWCOUNT > 0)
		begin
			set @CURRENTLEVEL=@CURRENTLEVEL+1
			insert into @Results(NOMEPIANIF,LIVELLO,PROG_ID,RIF_ID)
				(select P.NOMEPIANIF,@CURRENTLEVEL,P.PROG_ID,R.PROG_ID
					from PROGPRODUZIONEDOC P inner join @Results R on P.NOMEPIANIF=R.NOMEPIANIF and P.RIF_ID=R.PROG_ID and R.LIVELLO=@CURRENTLEVEL-1)
			set @ROWCOUNT=@@ROWCOUNT
		end
	end

	return

end

GO
GRANT DELETE
    ON OBJECT::[dbo].[MAPS_NAVIGAPROGPRODVALLE] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[MAPS_NAVIGAPROGPRODVALLE] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[MAPS_NAVIGAPROGPRODVALLE] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[MAPS_NAVIGAPROGPRODVALLE] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[MAPS_NAVIGAPROGPRODVALLE] TO [Metodo98]
    AS [dbo];

