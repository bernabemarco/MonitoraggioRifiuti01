
create view a_View_GEM_SEZIONI_Componenti
as
select  t1.*,
        t2.Descrizione as DesrizioneApp, t2.Ordine as OrdineApp, t2.Dismesso as DismessoApp,
        t3.Descrizione as DesrizioneSottoTipo, t3.Ordine as OrdineSottoTipo, t3.Dismesso as DismessoSottoTipo
from    (GEM_SEZIONI_Componenti t1 
         left outer join gemmadbg.dbo.GEM_T_TabApparati t2 ON (t2.idapparato=t1.idapparato collate Latin1_General_CI_AS))
         left outer join gemmadbg.dbo.GEM_T_TabSottoTipoApparato t3 ON (t3.idapparato=t1.idapparato collate Latin1_General_CI_AS and t3.idsottotipoapparato=t1.idsottotipoapparato collate Latin1_General_CI_AS)

GO
GRANT DELETE
    ON OBJECT::[dbo].[a_View_GEM_SEZIONI_Componenti] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[a_View_GEM_SEZIONI_Componenti] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[a_View_GEM_SEZIONI_Componenti] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[a_View_GEM_SEZIONI_Componenti] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[a_View_GEM_SEZIONI_Componenti] TO [Metodo98]
    AS [dbo];

