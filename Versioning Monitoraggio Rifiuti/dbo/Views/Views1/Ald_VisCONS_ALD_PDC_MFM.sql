
create view Ald_VisCONS_ALD_PDC_MFM
as
select * from ConsMFM.dbo.CONS_ALD_PDC_MFM

GO
GRANT DELETE
    ON OBJECT::[dbo].[Ald_VisCONS_ALD_PDC_MFM] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Ald_VisCONS_ALD_PDC_MFM] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[Ald_VisCONS_ALD_PDC_MFM] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Ald_VisCONS_ALD_PDC_MFM] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Ald_VisCONS_ALD_PDC_MFM] TO [Metodo98]
    AS [dbo];

