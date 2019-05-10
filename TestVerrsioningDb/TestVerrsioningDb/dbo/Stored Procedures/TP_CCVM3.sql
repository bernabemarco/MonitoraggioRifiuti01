create procedure TP_CCVM3
(@Anno integer,
				      @mese integer,
				      @Mag varchar(10)) as 

BEGIN 

	declare @Qta integer 
	declare @di datetime 
	declare @df datetime 
	
	if @Mese=0 
		BEGIN 
			delete from TP_CVM_MESI where Anno=@Anno And codDeposito=@Mag 
			
			select @di=cast('01/01/'+STR(@Anno)  as datetime) 
			select @df=CONVERT(DATETIME, STR(@Anno) + '-12-31', 102) 
		
		END 
	
	Else 
		BEGIN 
			delete from TP_CVM_MESI where Anno=@Anno and Mese=@Mese And codDeposito=@Mag 
		
			select @di=CONVERT(DATETIME, STR(@Anno) + '-' + STR(@mese) + '-01', 102) 
			select @df= CONVERT(DATETIME, STR(@Anno) + '-' + STR(@mese) + '-31', 102) 
		END 
	
	select @Qta=1 
	
	INSERT INTO TP_CVM_MESI(CodArt,codDeposito,mese,anno,Carichi,Venduti,Mancanti) 
		SELECT  
			case when TMPC.CodiceArt is null 
			         then (
					case when TMPV.CodiceArt is null 
				  	         then TMPM.CodiceArt 
					         else TMPV.CodiceArt end) 
			         else TMPC.CodiceArt end as CodArt, 
			case when TMPC.CodiceDep is null 
			         then (
					case when TMPV.CodiceDep is null 
					         then TMPM.CodiceDep 
					         else TMPV.CodiceDep end) 
			         else TMPC.CodiceDep end as CodDep, 
			case when TMPC.Mese is null 
			         then (
					case when TMPV.Mese is null 
					         then TMPM.MESE 
					         else TMPV.Mese end) 
			         else TMPC.Mese end as Mese, 
			@Anno as Anno, 
			case when TMPC.Car is null 
			         then 0 
			         else TMPC.Car end as Carichi, 
			case when TMPV.Ven is null 
			         then 0 
			         else TMPV.Ven * -1 end as Venduti, 
			case when TMPM.Man is null 
			         then 0 
			         else TMPM.Man end as Mancanti 
		FROM (
			Select 	StoricoMag.codDeposito as CodiceDep, 
				CodArt as CodiceArt, 
				month(datamov) as Mese, 
				sum(Case 	when @Qta=2 
						then StoricoMag.qta2um * StoricoMag.giacenza 
						else StoricoMag.qta1um * StoricoMag.giacenza end) as Car 
			From StoricoMag 
			where 	StoricoMag.codDeposito=@Mag AND 
				StoricoMag.tipodoc IN ('CDF') AND 
				StoricoMag.codcausale IN (3) AND 
				StoricoMag.datamov>=@di AND 
				StoricoMag.datamov<=@df 
			group by 	CodArt,	StoricoMag.codDeposito, month(datamov)) as TMPC  
		FULL OUTER JOIN (
			Select 	StoricoMag.codDeposito as CodiceDep,
				CodArt as CodiceArt, 
				month(datamov) as Mese, 
				sum(Case 	when @Qta=2 
						then StoricoMag.qta2um * StoricoMag.giacenza 
						else StoricoMag.qta1um * StoricoMag.giacenza end) as Ven 
			From 	StoricoMag 
			where 	StoricoMag.codDeposito=@Mag AND 
				StoricoMag.tipodoc IN('FDO','NCC','FVS','FVP','OCN') AND 
				StoricoMag.codcausale IN(2,13) AND 
				StoricoMag.datamov>=@di AND 
				StoricoMag.datamov<=@df 
			group by CodArt,StoricoMag.codDeposito,month(datamov)) as TMPV 
		ON 	TMPC.CodiceDep=TMPV.CodiceDep AND 
			TMPC.CodiceArt=TMPV.CodiceArt AND 
			TMPC.Mese=TMPV.Mese  
		FULL OUTER JOIN (
			Select 	coddeposito as CodiceDep,
				codart as CodiceArt,
				month(testedocumenti.datadoc) as Mese, 
				(case 	when sum(tp_extrarighedoc.mancanti) is null 
					then 0 
					else sum(tp_extrarighedoc.mancanti) end) as Man 
			From 	tp_extrarighedoc 
			Join 	righedocumenti 
				on 	tp_extrarighedoc.idtesta=righedocumenti.idtesta and 
					tp_extrarighedoc.idriga=righedocumenti.idriga 
			Join 	testedocumenti 
				on 	righedocumenti.idtesta=testedocumenti.progressivo and 
					testedocumenti.datadoc>=@di and 
					testedocumenti.datadoc<=@df and 
					tp_extrarighedoc.mancanti is not null and 
					tp_extrarighedoc.mancanti<>0 
			where 	testedocumenti.tipodoc IN ('OCN') AND 
				coddeposito=@Mag 
			group by codart,coddeposito,month(testedocumenti.datadoc)) as TMPM 
		ON 	TMPM.CodiceDep=TMPV.CodiceDep AND 
			TMPM.CodiceArt=TMPV.CodiceArt AND 
			TMPM.Mese=TMPV.Mese 
		ORDER BY MESE, CODART 
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[TP_CCVM3] TO [Metodo98]
    AS [dbo];

