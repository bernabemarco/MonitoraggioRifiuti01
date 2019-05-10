



CREATE view [dbo].[A_GRI_VIS_RAPPINT_Materiali]  as
-- vista per profilo visione A_GRI_VIS_RAPPINT_Materiali, dt 27.03.2018
SELECT     G_RP.*, 
                      G_Mat.IDRIGA, G_Mat.IDMATERIALE, G_Mat.PREZZO, G_Mat.SCONTO, G_Mat.QTA, G_Mat.PROVVIGIONE1, G_Mat.PROVVIGIONE2, G_Mat.PROVVIGIONE3, 
                      G_Mat.flg_mat_dafatt, G_Mat.NoMovimentaMagazzino, G_Mat.CODDEPOSITO, G_Mat.CODUBICAZIONE
, (G_Mat.QTA * G_Mat.PREZZO) as ImpTotaleLordo 
, (G_Mat.QTA * G_Mat.PREZZO * (1-G_Mat.SCONTO/100)) as ImpTotaleNetto
, (G_Mat.PREZZO * (1-G_Mat.SCONTO/100)) as PrezzoUnitNetto
, (select sum(giacenza) as GicenzaUbic from vistastoricomagbase 
where CODDEPOSITO=G_Mat.CODDEPOSITO and codubicazione=G_Mat.CODUBICAZIONE and CODART=G_Mat.IDMATERIALE and DATAMOV<=G_RP.DATA_EFF) as giacenzaUbic
, (isnull((select sum(giacenza) as GicenzaUbic from vistastoricomagbase 
where CODDEPOSITO=G_Mat.CODDEPOSITO and codubicazione=G_Mat.CODUBICAZIONE and CODART=G_Mat.IDMATERIALE and DATAMOV<=G_RP.DATA_EFF),0) - G_Mat.qta) as DeltaGiacUbic_Qta
, ISNULL((SELECT TOP 1 PREZZO FROM  LISTINIARTICOLI AS LA
           WHERE (CODART = G_Mat.IDMATERIALE) AND (NRLISTINO = (SELECT TOP (1) IdListinoVendita
                                                          FROM ALD_TabDittaDatiAggiuntivi AS ALD_TabDittaDatiAggiuntivi_2))), 0) AS ListinoVendita

, (SELECT DSCCONTO1 FROM Anagraficacf WHERE CodConto=G_RP.CODCLIENTE) AS DSCCONTO1
, (SELECT Descrizione FROM ANAGRAFICAARTICOLI WHERE codice=G_Mat.IDMATERIALE) AS DscArticolo
, (SELECT DscAgente FROM [anagraficaagenti] WHERE [CodAgente]=G_RP.TECNICO_EFF) AS DescTECNICO_EFF
, (SELECT DESCRIZIONE FROM TABUBICAZIONIDEPOSITI WHERE CODUBICAZIONE=G_Mat.CODUBICAZIONE and CODDEPOSITO=G_Mat.CODDEPOSITO) AS DescUBICAZIONE
FROM         GRI_RAPPORTI AS G_RP INNER JOIN
                      GRI_RAPPORTI_Materiali AS G_Mat ON G_RP.IDRAPPORTO = G_Mat.IDRAPPORTO






GO
GRANT DELETE
    ON OBJECT::[dbo].[A_GRI_VIS_RAPPINT_Materiali] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[A_GRI_VIS_RAPPINT_Materiali] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[A_GRI_VIS_RAPPINT_Materiali] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[A_GRI_VIS_RAPPINT_Materiali] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[A_GRI_VIS_RAPPINT_Materiali] TO [Metodo98]
    AS [dbo];

