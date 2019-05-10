





/*
	rif.14/03/2016 - creata
	rif.18/03/2016 - modificati join in left outer
*/
CREATE FUNCTION [dbo].[MAPS_ElementoModificatoEsternamente](
    @NOMEPIANIF     varchar(30)
	,@PROG_ID		decimal(20,0)
)
RETURNS SMALLINT
AS
BEGIN
	
	declare @RESULT smallint
	declare @CONTAMOD int=0
	declare @TIPOREC int
	select @TIPOREC=TIPO
	from PROGPRODUZIONE 
	where NOMEPIANIF=@NOMEPIANIF
		and PROG_ID=@PROG_ID
	
	IF (@TIPOREC IN (3,4,5,9))
	BEGIN
		-- documenti
		select @CONTAMOD=
			(case when PP.ORIG_CODFOR<>TD.CODCLIFOR then 1 else 0 end) -- modificato fornitore
			+ (case when PP.ORIG_CODART<>RD.CODART then 1 else 0 end) -- modificato articolo
			+ (case when PP.ORIG_DATACONS<>RD.DATACONSEGNA then 1 else 0 end) -- modificata data consegna
			+ (case when PP.ORIG_QTADOCUMENTO<>RD.QTAGESTRES then 1 else 0 end) -- modificata quantita
			+ (case when PP.ORIG_UMDOCUMENTO<>RD.UMGEST then 1 else 0 end) -- modificata um
			+ (case when PP.ORIG_VERDBA<>RD.VERSIONEDIBA then 1 else 0 end) -- modificata versione dba
			+ (case when RD.IDTESTA is null then 1 else 0 end) -- annullata riga
		from PROGPRODUZIONE PP
            left outer join TESTEDOCUMENTI TD on TD.PROGRESSIVO = PP.IDTESTADOC
            left outer join RIGHEDOCUMENTI RD on RD.IDTESTA = PP.IDTESTADOC and RD.IDRIGA = PP.IDRIGADOC
		where PP.NOMEPIANIF = @NOMEPIANIF
			and PP.PROG_ID = @PROG_ID
	END
	ELSE IF (@TIPOREC IN (6))
	BEGIN
		-- ordini di produzione
		select @CONTAMOD=
			(case when PP.ORIG_CODFOR<>RP.CODFORDEST then 1 else 0 end) -- modificato fornitore
			+ (case when PP.ORIG_CODART<>RP.CODART then 1 else 0 end) -- modificato articolo
			+ (case when PP.ORIG_DATACONS<>RP.DATAFINERICH then 1 else 0 end) -- modificata data consegna
			+ (case when PP.ORIG_QTADOCUMENTO<>RP.QTAGESTIONERES then 1 else 0 end) -- modificata quantita
			+ (case when PP.ORIG_UMDOCUMENTO<>RP.UMGEST then 1 else 0 end) -- modificata um
			+ (case when PP.ORIG_VERDBA<>RP.VERSIONEDBA then 1 else 0 end) -- modificata versione dba
			+ (case when RP.IDTESTA is null then 1 else 0 end) -- annullata riga
		from PROGPRODUZIONE PP
            left outer join TESTEORDINIPROD TP on TP.PROGRESSIVO = PP.IDTESTADOC
            left outer join RIGHEORDPROD RP on RP.IDTESTA = PP.IDTESTADOC and RP.IDRIGA = PP.IDRIGADOC
		where PP.NOMEPIANIF = @NOMEPIANIF
			and PP.PROG_ID = @PROG_ID
	END
	ELSE IF (@TIPOREC IN (7))
	BEGIN
		-- impegni di produzione
		select @CONTAMOD=
			(case when PP.ORIG_CODFOR<>IP.CODFORIMP then 1 else 0 end) -- modificato fornitore
			+ (case when PP.ORIG_CODART<>IP.CODART then 1 else 0 end) -- modificato articolo
			+ (case when PP.ORIG_DATACONS<>IP.DATAIMPEGNORICH then 1 else 0 end) -- modificata data consegna
			+ (case when PP.ORIG_QTADOCUMENTO<>IP.QTAGESTIONERES then 1 else 0 end) -- modificata quantita
			+ (case when PP.ORIG_UMDOCUMENTO<>IP.UMGEST then 1 else 0 end) -- modificata um
			+ (case when IP.IDTESTA is null then 1 else 0 end) -- annullata riga
		from PROGPRODUZIONE PP
            left outer join TESTEORDINIPROD TP on TP.PROGRESSIVO = PP.IDTESTADOC
            left outer join IMPEGNIORDPROD IP on IP.IDTESTA = PP.IDTESTADOC and IP.IDRIGA = PP.IDRIGADOC and IP.IDIMPEGNO = PP.IDIMPEGNO
		where PP.NOMEPIANIF = @NOMEPIANIF
			and PP.PROG_ID = @PROG_ID
    END

	IF (@CONTAMOD = 0)
		SET @RESULT = 0
	ELSE
		SET @RESULT = 1
    RETURN @RESULT
END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[MAPS_ElementoModificatoEsternamente] TO [Metodo98]
    AS [dbo];

