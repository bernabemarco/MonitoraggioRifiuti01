
Create View VistaContratti_VediNodo as
select progressivo,contratto,
(case 
when 
(select sum(consuntivovalore) from 
CONTRATTIAV_PROGRESSIVOCONDIZIONATI
where progressivo=rifprogressivo and 
CONTRATTIAV_PROGRESSIVOCONDIZIONATI.contratto=
CONTRATTIAVPROGRESSIVO_TESTE.contratto)>0 or
(select sum(consuntivo) from 
CONTRATTIAV_PROGRESSIVOINCONDPERC
where progressivo=rifprogressivo and 
CONTRATTIAV_PROGRESSIVOINCONDPERC.contratto=
CONTRATTIAV_PROGRESSIVOINCONDPERC.contratto)>0 then 'VEDI'
else 'NO'
end) as Vedi,
(select sum(consuntivovalore) from 
CONTRATTIAV_PROGRESSIVOCONDIZIONATI
where progressivo=rifprogressivo and 
CONTRATTIAV_PROGRESSIVOCONDIZIONATI.contratto=CONTRATTIAVPROGRESSIVO_TESTE.contratto)
as Condizionati,
(select sum(consuntivo) from 
CONTRATTIAV_PROGRESSIVOINCONDPERC
where progressivo=rifprogressivo and 
CONTRATTIAV_PROGRESSIVOINCONDPERC.contratto=CONTRATTIAV_PROGRESSIVOINCONDPERC.contratto)
as InCondizionati
from CONTRATTIAVPROGRESSIVO_TESTE 
group by progressivo,contratto


GO
GRANT SELECT
    ON OBJECT::[dbo].[VistaContratti_VediNodo] TO [Metodo98]
    AS [dbo];

