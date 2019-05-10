

create view [dbo].[Ald_VisCONS_ALD_TabRespCid]
as
select * from ConsMFM.dbo.CONS_ALD_TabRespCid


GO
GRANT DELETE
    ON OBJECT::[dbo].[Ald_VisCONS_ALD_TabRespCid] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Ald_VisCONS_ALD_TabRespCid] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[Ald_VisCONS_ALD_TabRespCid] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Ald_VisCONS_ALD_TabRespCid] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Ald_VisCONS_ALD_TabRespCid] TO [Metodo98]
    AS [dbo];

