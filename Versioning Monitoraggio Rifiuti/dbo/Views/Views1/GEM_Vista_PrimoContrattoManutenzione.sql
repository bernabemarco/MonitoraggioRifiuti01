

CREATE view [dbo].[GEM_Vista_PrimoContrattoManutenzione]
as
select  IDCONTRATTO,
	(
				--case when 
				--isnull((select count(GemT2.IDCONTRATTO) from GEM_TESTACONTRATTO GemT2, EXTRACLIENTI ExC 
				--			where GemT2.CODCLIENTE=exC.CODCONTO 
							--spostato su cliente old, dt 16.01.2018 --
				--			and ExC.CodClienteNew=TC.CODCLIENTE
							--and ExC.CodClienteOld=TC.CODCLIENTE
							-- tolto dt 16.01.2018 -- 
							--and year(TC.DataIdStato)=year(exc.DtCreazione)
	--),0)>0 then 1 
		--		else
			--		(
					case when isnull((select count(GemT.IDCONTRATTO) from GEM_TESTACONTRATTO GemT, EXTRACLIENTI Exc where Exc.CODCONTO=GemT.CODCLIENTE 
	and GemT.CODCLIENTE=TC.CODCLIENTE
	-- tolto dt 16.01.2018 -- 
	--and year(TC.DataIdStato)=year(exc.DtCreazione)
	--integrazionee esclusione contratto
	and gemt.IDCONTRATTO<>tc.IDCONTRATTO
							),0)>0 then 0
					else 1
				--	end)
				end)
					  as NuovoCli
from GEM_TESTACONTRATTO as TC




GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_Vista_PrimoContrattoManutenzione] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_Vista_PrimoContrattoManutenzione] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GEM_Vista_PrimoContrattoManutenzione] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_Vista_PrimoContrattoManutenzione] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_Vista_PrimoContrattoManutenzione] TO [Metodo98]
    AS [dbo];

