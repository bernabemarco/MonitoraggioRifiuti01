
CREATE VIEW [dbo].[V_CONTRATTI_COSTIFICAZIONERIGHE]
AS
SELECT     CCR.contratto, CCR.idtestadoc, CCR.idrigadoc, CCR.descrizionecontratto, CCR.perctrasporto, CCR.incidenzabudgetincond, CCR.incidenzaincond, 
                      CCR.incidenzabudgetcond, CCR.incidenzacond, 
                      RD.TOTNETTORIGAEURO / RD.QTAPREZZO - RD.TOTNETTORIGAEURO / RD.QTAPREZZO * CCR.incidenzabudgetincond / 100 AS totalenettobudgetincond, 
                      RD.TOTNETTORIGAEURO / RD.QTAPREZZO - RD.TOTNETTORIGAEURO / RD.QTAPREZZO * CCR.incidenzaincond / 100 AS totalenettoincond, 
                      CCR.totalenettobudgetcond, CCR.totalenettocond, CCR.totalenettoprovvigioni, CCR.totalenettoscontimerce,
                          (SELECT     CODCLIFOR AS CODCLIFOR_RIS
                            FROM          dbo.TESTEDOCUMENTI
                            WHERE      (PROGRESSIVO IN
                                                       (SELECT     dbo.FUNSGetDUMP_IDTESTARP_RigheDocumenti(CCR.IDTESTADOC, CCR.IDRIGADOC, 0, 0) AS Expr1))) AS codclifor,
                          (SELECT     CODCFFATT AS CODCFFATT_RIS
                            FROM          dbo.TESTEDOCUMENTI AS TESTEDOCUMENTI_2
                            WHERE      (PROGRESSIVO IN
                                                       (SELECT     dbo.FUNSGetDUMP_IDTESTARP_RigheDocumenti(CCR.IDTESTADOC, CCR.IDRIGADOC, 0, 0) AS Expr1))) AS codcffatt,
                          (SELECT     NUMDESTDIVERSAMERCI AS NUMDESTDIVERSAMERCI_RIS
                            FROM          dbo.TESTEDOCUMENTI AS TESTEDOCUMENTI_1
                            WHERE      (PROGRESSIVO IN
                                                       (SELECT     dbo.FUNSGetDUMP_IDTESTARP_RigheDocumenti(CCR.IDTESTADOC, CCR.IDRIGADOC, 0, 0) AS Expr1))) AS numdestdiversamerci, 
                      RD.TOTNETTORIGAEURO / RD.QTAPREZZO - RD.TOTNETTORIGAEURO / RD.QTAPREZZO * CCR.incidenzabudgetcond / 100 AS totalenettobudgetincondvalore, 
                      RD.TOTNETTORIGAEURO / RD.QTAPREZZO - RD.TOTNETTORIGAEURO / RD.QTAPREZZO * CCR.incidenzacond / 100 AS totalenettoincondvalore, 
                      CCR.totalenettobudgetcondvalore, CCR.totalenettocondvalore, CCR.perc_val, CCR.incidenzabudgetcondriga, CCR.incidenzacondriga, CCR.incidenzapremiomaturato, 
                      CCR.incidenzapremiomaturatobudget, CCR.premiocondizionato, CCR.idcond, CCR.valorerigapremio, CCR.CODICECOSTO, ISNULL(CCR.TIPOCONTRIBUTO, 'C') 
                      AS tipocontributo
FROM         dbo.CONTRATTI_COSTIFICAZIONERIGHE AS CCR INNER JOIN
                      dbo.RIGHEDOCUMENTI AS RD ON RD.IDTESTA = CCR.idtestadoc AND RD.IDRIGA = CCR.idrigadoc


GO
GRANT SELECT
    ON OBJECT::[dbo].[V_CONTRATTI_COSTIFICAZIONERIGHE] TO [Metodo98]
    AS [dbo];

