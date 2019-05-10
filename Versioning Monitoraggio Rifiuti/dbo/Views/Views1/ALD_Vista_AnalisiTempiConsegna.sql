
CREATE VIEW dbo.ALD_Vista_AnalisiTempiConsegna
AS
SELECT     TD_DDT.DATADOC, RD_DDT.IDTESTA, TD_DDT.ESERCIZIO, TD_DDT.TIPODOC, TD_DDT.NUMERODOC, RD_DDT.CODART AS cArt, 
                      RD_ODS.TIPODOC AS rifTipoDocODS, EXRPD_ODS.DocOrSpedizione AS EXRPD_ODS_flDocSped, PD_ODS.TIPO, 
                      RD_ODS.NUMERODOC AS riNumDocODS, RD_ODS.DATACONSegna AS DtConsODS_Prevista, isnull(EXR_ODS.DATACONS, RD_ODS.DATACONSegna) AS DtConsODS_Storica, RD_ORC.TIPODOC AS rifTipoDocORC, 
                      EXRPD_ORC.DocOrSpedizione AS EXRPD_ORC_flDocSped, PD_ORC.TIPO AS Tipo_ORC, RD_ORC.NUMERODOC AS rifNumeroDocORC, 
		      RD_ORC.DATACONSegna AS DtConsORC_Prevista, 
                      isnull(EXR_ORC.DATACONS,RD_ORC.DATACONSegna)  AS DtConsORC_Storica
FROM         dbo.EXTRARIGHEDOC EXR_ORC RIGHT OUTER JOIN
                      dbo.PARAMETRIDOC PD_ORC RIGHT OUTER JOIN
                      dbo.EXTRAPARDOC EXRPD_ORC RIGHT OUTER JOIN
                      dbo.RIGHEDOCUMENTI RD_ORC ON EXRPD_ORC.CODICE = RD_ORC.TIPODOC ON PD_ORC.CODICE = RD_ORC.TIPODOC ON 
                      EXR_ORC.IDTESTA = RD_ORC.IDTESTA AND EXR_ORC.IDRIGA = RD_ORC.IDRIGA RIGHT OUTER JOIN
                      dbo.PARAMETRIDOC PD_ODS INNER JOIN
                      dbo.EXTRARIGHEDOC EXR_ODS INNER JOIN
                      dbo.RIGHEDOCUMENTI RD_DDT INNER JOIN
                      dbo.RIGHEDOCUMENTI RD_ODS ON RD_DDT.IDTESTARP = RD_ODS.IDTESTA AND RD_DDT.IDRIGARP = RD_ODS.IDRIGA ON 
                      EXR_ODS.IDTESTA = RD_ODS.IDTESTA AND EXR_ODS.IDRIGA = RD_ODS.IDRIGA INNER JOIN
                      dbo.TESTEDOCUMENTI TD_DDT ON RD_DDT.IDTESTA = TD_DDT.PROGRESSIVO ON PD_ODS.CODICE = RD_ODS.TIPODOC INNER JOIN
                      dbo.EXTRAPARDOC EXRPD_ODS ON RD_ODS.TIPODOC = EXRPD_ODS.CODICE ON RD_ORC.IDRIGA = RD_ODS.IDRIGARP AND 
                      RD_ORC.IDTESTA = RD_ODS.IDTESTARP
WHERE     (RD_DDT.TIPORIGA = 'N')


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_Vista_AnalisiTempiConsegna] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_Vista_AnalisiTempiConsegna] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_Vista_AnalisiTempiConsegna] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_Vista_AnalisiTempiConsegna] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_Vista_AnalisiTempiConsegna] TO [Metodo98]
    AS [dbo];

