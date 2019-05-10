




CREATE VIEW [dbo].[CRM_VISTACLI_Fatturati] AS
        SELECT 		(SELECT     TOP (1) IdSocieta
                            FROM          dbo.ALD_TabDittaDatiAggiuntivi)+AF.CODCONTO as CODCONTO, 
							AF.CODCONTO as ava_codicemetodo,
							exc.CodCrm, 
		(SELECT     TOP (1) IdSocieta
                            FROM          dbo.ALD_TabDittaDatiAggiuntivi) AS IdSocieta,
							4 as ava_stato ,
												   (SELECT     TOP (1) IdSocieta 
                       FROM          ALD_TabDittaDatiAggiuntivi) + CODPAG as CODPAG,
					    (SELECT     TOP (1) IdSocieta
                       FROM          ALD_TabDittaDatiAggiuntivi)+ CAST(exc.IdTrust AS varchar(15)) as IdTrust,
					   
		isnull((SELECT     SUM(TD.TOTIMPONIBILEEURO * TD.SEGNO) AS TotFatturato1
FROM         TESTEDOCUMENTI AS TD INNER JOIN
                      PARAMETRIDOC AS PD ON TD.TIPODOC = PD.CODICE
WHERE     (PD.TIPO IN ('f', 'n')) AND (TD.ESERCIZIO = YEAR(GETDATE())) 
and td.CODCLIFOR=AF.CODCONTO
),0) as FatturatoAC,
isnull((SELECT     SUM(TD.TOTIMPONIBILEEURO * TD.SEGNO) AS TotFatturato1
FROM         TESTEDOCUMENTI AS TD INNER JOIN
                      PARAMETRIDOC AS PD ON TD.TIPODOC = PD.CODICE
WHERE     (PD.TIPO IN ('f', 'n')) AND (TD.ESERCIZIO = (YEAR(GETDATE()))-1 )
and td.CODCLIFOR=AF.CODCONTO
),0) as FatturatoA1,
isnull((SELECT     SUM(TD.TOTIMPONIBILEEURO * TD.SEGNO) AS TotFatturato1
FROM         TESTEDOCUMENTI AS TD INNER JOIN
                      PARAMETRIDOC AS PD ON TD.TIPODOC = PD.CODICE
WHERE     (PD.TIPO IN ('f', 'n')) AND (TD.ESERCIZIO = (YEAR(GETDATE()))-2 )
and td.CODCLIFOR=AF.CODCONTO
),0) as FatturatoA2,
isnull((
SELECT     SUM(case when SCADATTPASS=1 then IMPORTOSCEURO else IMPORTOSCEURO*-1 end) AS ImportoScadenze
FROM         TABSCADENZE AS TS
WHERE     (ESITO IN (0, 1)) and DATASCADENZA<=(getdate()-1)
and ts.CODCLIFOR=AF.CODCONTO),0) as Scaduto,
isnull(
(SELECT     SUM(case when SCADATTPASS=1 then IMPORTOSCEURO else IMPORTOSCEURO*-1 end) AS ImportoScadenze
FROM         TABSCADENZE AS TS
WHERE     (ESITO IN (3)) --and DATASCADENZA<=(getdate()-1)
and ts.CODCLIFOR=AF.CODCONTO),0) as Insoluto
, (case when len(rf.codagente1)>0 then 
((SELECT     TOP (1) IdSocieta
                            FROM          dbo.ALD_TabDittaDatiAggiuntivi)+rf.codagente1)
							else '' end) as CodAgente1
							, (case when len(rf.CODAGENTE2)>0 then  
							(rf.CODAGENTE2 +''+(select DSCAGENTE from ANAGRAFICAAGENTI AA where AA.CODAGENTE=RF.CODAGENTE2))
							else '' end) as CodAgente2
							, (case when len(rf.CODAGENTE3)>0 then  
														 (rf.CODAGENTE3 +''+(select DSCAGENTE from ANAGRAFICAAGENTI AA where AA.CODAGENTE=RF.CODAGENTE3)) 
							else '' end) as CodAgente3
								 ,(SELECT     TOP (1) IdSocieta
                       FROM          ALD_TabDittaDatiAggiuntivi)+ CAST(RF.CODSETTORE AS varchar(15)) as CODSETTORE
		 ,(SELECT     TOP (1) IdSocieta
                       FROM          ALD_TabDittaDatiAggiuntivi)+ CAST(RF.CODZONA AS varchar(15)) as CODZONA
FROM
        ANAGRAFICACF AF, EXTRACLIENTI EXC,ALD_TabTrust TT, ANAGRAFICARISERVATICF RF, TABUTENTI
WHERE  
(AF.CODCONTO = RF.CODCONTO) AND (USERDB = CAST(USER_NAME() AS VARCHAR(25))) 
       AND RF.ESERCIZIO = ESERCIZIOATTIVO AND AF.TIPOCONTO IN('C')
       AND 
exc.CodCrm  is not null and exc.CodCrm <>'' and
	   (AF.CODCONTO = EXC.CODCONTO)  and (TT.IdTrust = exc.IdTrust)
	   --and exc.IdTrust in (10)
	   	   and TT.ExportCRM=1
-- aggiunta filtro per A 67
--and rf.CODAGENTE1='A    67'






GO
GRANT DELETE
    ON OBJECT::[dbo].[CRM_VISTACLI_Fatturati] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CRM_VISTACLI_Fatturati] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CRM_VISTACLI_Fatturati] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CRM_VISTACLI_Fatturati] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CRM_VISTACLI_Fatturati] TO [Metodo98]
    AS [dbo];

