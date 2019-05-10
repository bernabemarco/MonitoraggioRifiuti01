create procedure TP_ArticoloCalcolaCVMGiorni
			(@DataInizio datetime,
			@DataFine datetime, 
			@Mag varchar(10),
			@Articolo varchar(50),
			@Coeff decimal(19,4)) as
BEGIN 

INSERT INTO TP_CPO (CodArt,Mag,DataInizio,DataFine,Carichi,Venduti,Mancanti,Media) 
	Select  case when TMPC.CodiceArt is null then (case when TMPV.CodiceArt is null then TMPM.CodiceArt else TMPV.CodiceArt end) else TMPC.CodiceArt end as CodArt, 
		case when TMPC.CodiceDep is null then (case when TMPV.CodiceDep is null then TMPM.CodiceDep else TMPV.CodiceDep end) else TMPC.CodiceDep end as CodDep, 
		@DataInizio,
		@DataFine, 
		case when TMPC.Car is null then 0 else TMPC.Car end as Carichi, 
		case when TMPV.Ven is null or TMPV.Ven > 0 then 0 else TMPV.Ven * -1 end as Venduti, 
		case when TMPM.Man is null then 0 else TMPM.Man end as Mancanti,
		0 
	FROM ( Select StoricoMag.codDeposito as CodiceDep, Storicomag.CodArt as CodiceArt, 
			sum((StoricoMag.qta1um * StoricoMag.Giacenza) * @Coeff) as Car 
		From StoricoMag 
		Inner Join tp_Extramag on StoricoMag.codart=TP_extramag.CodArt 
		where StoricoMag.codDeposito=@Mag AND StoricoMag.tipodoc IN ('CDF') AND 
			StoricoMag.codcausale IN (3) AND StoricoMag.datamov>=@DataInizio AND 
			StoricoMag.datamov<=@DataFine  AND
			Storicomag.CodArt=@Articolo
		group by StoricoMag.CodArt,StoricoMag.codDeposito) as TMPC 
	FULL OUTER JOIN ( Select StoricoMag.codDeposito as CodiceDep, StoricoMag.CodArt as CodiceArt, 
				sum((StoricoMag.qta1um * StoricoMag.Giacenza) * @Coeff)  as Ven 
			  From StoricoMag 
			  Inner Join tp_Extramag on StoricoMag.codart=TP_extramag.CodArt 
			  where StoricoMag.codDeposito=@Mag AND StoricoMag.tipodoc IN('FDO','NCC','FVS','FVP','OCN') AND StoricoMag.codcausale IN(2,13) AND StoricoMag.datamov>=@DataInizio AND StoricoMag.datamov<=@DataFine AND 
				Storicomag.CodArt=@Articolo
			  group by StoricoMag.CodArt,StoricoMag.codDeposito) as TMPV ON TMPC.CodiceDep=TMPV.CodiceDep AND TMPC.CodiceArt = TMPV.CodiceArt 
	FULL OUTER JOIN ( Select coddeposito as CodiceDep, codart as CodiceArt, (case when sum(tp_extrarighedoc.mancanti) is null then 0 else sum(tp_extrarighedoc.mancanti) end) as Man 
			  From tp_extrarighedoc 
			  Join righedocumenti on tp_extrarighedoc.idtesta=righedocumenti.idtesta and tp_extrarighedoc.IDRiga = righedocumenti.IDRiga 
			  Join testedocumenti on righedocumenti.idtesta=testedocumenti.progressivo and testedocumenti.datadoc>=@DataInizio and testedocumenti.datadoc<=@DataFine and tp_extrarighedoc.mancanti is not null and tp_extrarighedoc.mancanti<>0 
			  where testedocumenti.tipodoc IN ('OCN') AND coddeposito=@Mag AND CodArt=@Articolo
			  group by codart,coddeposito) as TMPM ON TMPM.CodiceDep=TMPV.CodiceDep AND TMPM.CodiceArt = TMPV.CodiceArt 
	ORDER BY CODART 
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[TP_ArticoloCalcolaCVMGiorni] TO [Metodo98]
    AS [dbo];

