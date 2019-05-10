
CREATE VIEW FRC_CP_VistaSchedaCosto AS 
	SELECT FRC_CP_SchedaCosto.*, ISNULL((SELECT DESCRIZIONE FROM CGesAmbienti WHERE Codice = FRC_CP_SchedaCosto.AMBIENTE), '') AS Descrizione_Ambiente, 
	       ISNULL((SELECT DSCCONTO1 FROM ANAGRAFICACF WHERE CODCONTO = FRC_CP_SchedaCosto.CODCLIFOR), '') AS Ragione_Sociale_Soggetto, 
	       ISNULL((SELECT DESCRIZIONE FROM ANAGRAFICAARTICOLI WHERE CODICE = FRC_CP_SchedaCosto.CODART), '') AS Descrizione_Articolo 
	FROM FRC_CP_SchedaCosto

GO
GRANT SELECT
    ON OBJECT::[dbo].[FRC_CP_VistaSchedaCosto] TO [Metodo98]
    AS [dbo];

