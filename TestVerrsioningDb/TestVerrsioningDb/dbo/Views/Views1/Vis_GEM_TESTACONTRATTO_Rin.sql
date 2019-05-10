
create view [dbo].[Vis_GEM_TESTACONTRATTO_Rin] as
select GEM_TESTACONTRATTO.* from GEM_TESTACONTRATTO inner join gemmadbg..GEM_T_TipoContratto TC on tc.IdTipoContr=GEM_TESTACONTRATTO.IdTipoContr where ValidazioneForm like '%R%'


GO
GRANT DELETE
    ON OBJECT::[dbo].[Vis_GEM_TESTACONTRATTO_Rin] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Vis_GEM_TESTACONTRATTO_Rin] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[Vis_GEM_TESTACONTRATTO_Rin] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Vis_GEM_TESTACONTRATTO_Rin] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Vis_GEM_TESTACONTRATTO_Rin] TO [Metodo98]
    AS [dbo];

