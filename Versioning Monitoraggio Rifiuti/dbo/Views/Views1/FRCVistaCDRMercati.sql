
CREATE VIEW FRCVistaCDRMercati AS 
	SELECT T1.Ambiente, T2.Descrizione AS DesAmbiente, T1.CDRMercato, T3.DESCRIZIONE AS DesCDRMercato,
		   'Categoria Cliente' AS Tipo, T1.Categoria AS Codice, T4.DSCCATEGORIA AS Descrizione
	FROM FRCMercatoCategoriaCliente T1 INNER JOIN CGesAmbienti T2 ON T1.Ambiente = T2.Codice
		 INNER JOIN TABCENTRICOSTO T3 ON T1.CDRMercato = T3.CODICE
		 INNER JOIN CATEGORIECF T4 ON T1.Categoria = T4.CODCATEGORIA
	UNION ALL
	SELECT T1.Ambiente, T2.Descrizione AS DesAmbiente, T1.CDRMercato, T3.DESCRIZIONE AS DesCDRMercato,
		   'Settore Cliente' AS Tipo, T1.Settore AS Codice, T4.DESCRIZIONE AS Descrizione
	FROM FRCMercatoSettoreCliente T1 INNER JOIN CGesAmbienti T2 ON T1.Ambiente = T2.Codice
		 INNER JOIN TABCENTRICOSTO T3 ON T1.CDRMercato = T3.CODICE
		 INNER JOIN TABSETTORI T4 ON T1.Settore = T4.CODICE
	UNION ALL
	SELECT T1.Ambiente, T2.Descrizione AS DesAmbiente, T1.CDRMercato, T3.DESCRIZIONE AS DesCDRMercato,
		   'Zona Cliente' AS Tipo, T1.Zona AS Codice, T4.DESCRIZIONE AS Descrizione
	FROM FRCMercatoZonaCliente T1 INNER JOIN CGesAmbienti T2 ON T1.Ambiente = T2.Codice
		 INNER JOIN TABCENTRICOSTO T3 ON T1.CDRMercato = T3.CODICE
		 INNER JOIN TABZONE T4 ON T1.Zona = T4.CODICE

GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCVistaCDRMercati] TO [Metodo98]
    AS [dbo];

