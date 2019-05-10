CREATE VIEW [dbo].a_VIS_DAY_CONS_ALD_TabRespCid AS
	SELECT *
	 FROM [ConsMFM].[dbo].[CONS_ALD_TabRespCid]

GO
GRANT REFERENCES
    ON OBJECT::[dbo].[a_VIS_DAY_CONS_ALD_TabRespCid] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[a_VIS_DAY_CONS_ALD_TabRespCid] TO [Metodo98]
    AS [dbo];

