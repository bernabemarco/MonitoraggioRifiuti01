create VIEW ALD_V_ExtraAgenti
AS

select  xa.CodAgente,  isnull(TIpAg.Descrizione, ta. Descrizione) as  TipologiaCommAgente,  Cid.Descrizione , Resp.Descrizione as Resposabile
from extraagenti XA
left join SL_TIPOAGENTE TA on Ta.Codice = TipoAgente
left join consMFM.dbo.CONS_ALD_TabRespCid Cid on xa.IdRespCid = cid.IdRespCid
left join consMFM.dbo.ALD_TABANAGRTIPOLOGIECOMMERCIALIAGENTE TIpAg on TIpAg.IdTipologiaCommAgente = XA.IdTipologiaCommAgente
left join ALD_VISTRARESPONSABILIATTIVIPERRUOLO Resp ON Resp.IdREsponsabile = XA.IdREsponsabile
-- where codagente = 'A  3358'-- 'A  3008'

GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_V_ExtraAgenti] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_V_ExtraAgenti] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_V_ExtraAgenti] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_V_ExtraAgenti] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_V_ExtraAgenti] TO [Metodo98]
    AS [dbo];

