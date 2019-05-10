


--drop view [A_GEM_VIS_RAPPINT_Materiali]
--go

CREATE view [dbo].[A_GEM_VIS_RAPPINT_Materiali]  as
-- vista per profilo visione [a_VIS_GEM_RAPPORTI_Materiali] dt 29.03.2018
SELECT     GEM_RP.*, 
                      G_Mat.IDRIGA, G_Mat.IDMATERIALE, G_Mat.PREZZO, G_Mat.SCONTO, G_Mat.QTA, G_Mat.PROVVIGIONE1, G_Mat.PROVVIGIONE2, G_Mat.PROVVIGIONE3, 
                      G_Mat.flg_mat_dafatt, G_Mat.NoMovimentaMagazzino, G_Mat.CODDEPOSITO, G_Mat.CODUBICAZIONE
, (G_Mat.QTA * G_Mat.PREZZO) as ImpTotaleLordo 
, (G_Mat.QTA * G_Mat.PREZZO * (1-isnull(G_Mat.SCONTO,0)/100)) as ImpTotaleNetto
, (G_Mat.PREZZO * (1-isnull(G_Mat.SCONTO,0)/100)) as PrezzoUnitNetto
, (select sum(giacenza) as GicenzaUbic from vistastoricomagbase 
where CODDEPOSITO=G_Mat.CODDEPOSITO and codubicazione=G_Mat.CODUBICAZIONE and CODART=G_Mat.IDMATERIALE and DATAMOV<=GEM_RP.DATA_EFF) as giacenzaUbic
, (isnull((select sum(giacenza) as GicenzaUbic from vistastoricomagbase 
where CODDEPOSITO=G_Mat.CODDEPOSITO and codubicazione=G_Mat.CODUBICAZIONE and CODART=G_Mat.IDMATERIALE and DATAMOV<=GEM_RP.DATA_EFF),0) - - G_Mat.qta) as DeltaGiacUbic_Qta
, ( ISNULL((SELECT TOP 1 PREZZO FROM  LISTINIARTICOLI AS LA
           WHERE (CODART = G_Mat.IDMATERIALE) AND (NRLISTINO = (SELECT TOP (1) IdListinoVendita
                                                          FROM ALD_TabDittaDatiAggiuntivi AS ALD_TabDittaDatiAggiuntivi_2))), 0)) as ListinoVendita
, (SELECT DSCCONTO1 FROM Anagraficacf WHERE CodConto=GEM_RP.CODCLIENTE) AS DSCCONTO1
, (SELECT Descrizione FROM ANAGRAFICAARTICOLI WHERE codice=G_Mat.IDMATERIALE) AS DscArticolo
, (SELECT DscAgente FROM [anagraficaagenti] WHERE [CodAgente]=GEM_RP.TECNICO_EFF) AS DescTECNICO_EFF
, (SELECT DESCRIZIONE FROM TABUBICAZIONIDEPOSITI WHERE CODUBICAZIONE=G_Mat.CODUBICAZIONE and CODDEPOSITO=G_Mat.CODDEPOSITO) AS DescUBICAZIONE
FROM         GEM_SEZIONECONTRATTORAPPORTI AS GEM_RP INNER JOIN
                     GEM_SEZIONECONTRATTORAPPORTI_Materiali AS G_Mat ON GEM_RP.IDRAPPORTO = G_Mat.IDRAPPORTO





GO
GRANT DELETE
    ON OBJECT::[dbo].[A_GEM_VIS_RAPPINT_Materiali] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[A_GEM_VIS_RAPPINT_Materiali] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[A_GEM_VIS_RAPPINT_Materiali] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[A_GEM_VIS_RAPPINT_Materiali] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[A_GEM_VIS_RAPPINT_Materiali] TO [Metodo98]
    AS [dbo];

