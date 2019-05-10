
CREATE view [dbo].[ALD_Vista_CommessaMFM]
as
SELECT     AC.RifComm, ExCom.WBS1Societa + ExCom.WBS1Progressivo + ExCom.WBS2Gestione + ExCom.WBS3Servizio 
+ (CASE WHEN isnull(ExCom.WBS3Provincia, '') 
                      = '' THEN isnull(ExCom.WBS3Regione,'') ELSE ExCom.WBS3Provincia END) 
                      + ExCom.WBS3DestDuso + ExCom.WBS3Separatore + ExCom.WBS4Prestazione + ExCom.WBS4Separatore + ExCom.WBS5ModErogazione AS RifCMFM
FROM         ExtraCommCli AS ExCom INNER JOIN
                      AnagraficaCommesse AS AC ON ExCom.RifProgressivo = AC.Progressivo


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_Vista_CommessaMFM] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_Vista_CommessaMFM] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_Vista_CommessaMFM] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_Vista_CommessaMFM] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_Vista_CommessaMFM] TO [Metodo98]
    AS [dbo];

