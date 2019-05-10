
create view Ald_VistaConsAnagrRespCid
as 
SELECT     TCid.IdRespCid, TCid.Descrizione, TCid.idCDC, TCdC.DESCRIZIONE AS DscCDC, TCid.IdSocieta, TCid.Stato, TCid.UTENTEMODIFICA, TCid.DATAMODIFICA, TCid.idVDC, 
                      TVdc.Descrizione AS DscVDC, TCid.CostoStd
FROM         ConsMFM..CONS_ALD_TabRespCid AS TCid INNER JOIN
                      ConsMFM..CONS_ALD_TabVDC AS TVdc ON TCid.idVDC = TVdc.idVDC INNER JOIN
                      ConsMFM..TABCENTRICOSTO AS TCdC ON TCid.idCDC = TCdC.CODICE



GO
GRANT SELECT
    ON OBJECT::[dbo].[Ald_VistaConsAnagrRespCid] TO [Metodo98]
    AS [dbo];

