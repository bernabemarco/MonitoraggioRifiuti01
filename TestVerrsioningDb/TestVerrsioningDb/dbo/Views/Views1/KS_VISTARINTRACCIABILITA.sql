CREATE  view KS_VISTARINTRACCIABILITA as
	select sm.tipodoc,sm.numerodoc,sm.codclifor,sm.idtesta AS IDTESTADOC,sm.rigadoc AS IDRIGADOC,sm.nrifpartita,sm.codart ,sm.qta1um,sm3.progressivo ProgComponente,
	sm3.nrifpartita LottoComponente,sm3.codart ArtComponente,sm3.qta1um QtaComponente,AUP.UM UM, sm3.idtesta IdtestaComp,
	sm3.rigadoc IdRigaComp
	from storicomag SM left outer join 
	storicomag sm2 on sm.nrifpartita=sm2.nrifpartita and sm.codart=sm2.codart and
	( (sm.idtesta<>sm2.idtesta 
		and sm.tipodoc<>sm2.tipodoc and sm2.idtesta in 
( select min(idtesta) from storicomag where nrifpartita=sm.nrifpartita and codart=sm.codart   )
 ) or
	(sm.idtesta=sm2.idtesta and sm.tipodoc=sm2.tipodoc and sm2.idtesta in 
	(select idtesta from storicomag group by
	idtesta,rigadoc having count(*)>1 )))
	 and sm.datamov>=sm2.datamov
	left outer join storicomag sm3
	on sm2.idtesta=sm3.idtesta and sm.codart<>sm3.codart AND SM2.RIGADOC=SM3.RIGADOC 
	inner  join distintaartcomposti DAC on left(sm.codart, patindex('%#%',sm.codart)) =DAC.Artcomposto or sm.codart=DAC.ARTCOMPOSTO
	inner join articoliumpreferite AUP on sm3.codart=AUP.codart and aup.tipoum=1
	where sm3.progressivo is not null

GO
GRANT SELECT
    ON OBJECT::[dbo].[KS_VISTARINTRACCIABILITA] TO [Metodo98]
    AS [dbo];

