
create VIEW Ald_RifCommessa_ASA 
as
SELECT      AC.RifComm, --ExCC.IdASA, TpCom.IdAsa as idAsaTP,
(case when isnull(ExCC.IdASA,TpCom.IdASA)='' then TpCom.IdASA else isnull(ExCC.IdASA,TpCom.IdASA) end) as IdAsaCommessa
FROM         AnagraficaCommesse AS AC INNER JOIN
                      ExtraCommCli AS ExCC ON AC.Progressivo = ExCC.RifProgressivo INNER JOIN
                      CONS_ALD_TabTipoCommessaASA AS TpCom ON AC.TipoCom = TpCom.TipoCommessa

GO
GRANT DELETE
    ON OBJECT::[dbo].[Ald_RifCommessa_ASA] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Ald_RifCommessa_ASA] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[Ald_RifCommessa_ASA] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Ald_RifCommessa_ASA] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Ald_RifCommessa_ASA] TO [Metodo98]
    AS [dbo];

