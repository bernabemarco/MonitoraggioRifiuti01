
CREATE view Ald_VistaDistinzioneOrigineFatturati as
SELECT 	*
FROM           ConsMFM.dbo.Ald_DistinzioneOrigineFatturati
                 

GO
GRANT DELETE
    ON OBJECT::[dbo].[Ald_VistaDistinzioneOrigineFatturati] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Ald_VistaDistinzioneOrigineFatturati] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[Ald_VistaDistinzioneOrigineFatturati] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Ald_VistaDistinzioneOrigineFatturati] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Ald_VistaDistinzioneOrigineFatturati] TO [Metodo98]
    AS [dbo];

