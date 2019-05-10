



CREATE view [dbo].[CRM_Vista_AnagraficaArticoli]
as 
SELECT    
(SELECT     TOP (1) IdSocieta
                            FROM          dbo.ALD_TabDittaDatiAggiuntivi) AS IdSocieta,
 (SELECT     TOP (1) IdSocieta
                       FROM          ALD_TabDittaDatiAggiuntivi) + AA.CODICE AS CodArticolo, 
					   AA.CODICE AS Ava_Codice, 
					   (AA.CODICE + ' - ' + AA.DESCRIZIONE + ' ' + left(isnull(AA.DESCRESTESA,''), 90) )AS CodArticoloMetodo, 
					   AA.DESCRIZIONE + ' ' + isnull(AA.DESCRESTESA,'') AS Descrizione, 
                      ExM.IdASA, ExM.IdSottoAsa, 
					  
					 (( SELECT     TOP (1) IdSocieta
                            FROM          ALD_TabDittaDatiAggiuntivi AS ALD_TabDittaDatiAggiuntivi_1) +ExM.idALDScontoEcom) as idALDScontoEcom,
                         (SELECT     TOP (1) IdSocieta
                            FROM          ALD_TabDittaDatiAggiuntivi AS ALD_TabDittaDatiAggiuntivi_1) + CAST( (SELECT     IdListinoVendita
                            FROM          ALD_TabDittaDatiAggiuntivi AS ALD_TabDittaDatiAggiuntivi_3) AS varchar(15)) AS IdListinoVendita
							
							, ISNULL
                          ((SELECT TOP 1    PREZZO
                              FROM         LISTINIARTICOLI AS LA
                              WHERE  UM=ARTICOLIUMPREFERITE.UM
							  and   (CODART = AA.CODICE) AND (NRLISTINO =
                                                        (SELECT     TOP (1) IdListinoVendita
                                                          FROM          ALD_TabDittaDatiAggiuntivi AS ALD_TabDittaDatiAggiuntivi_2))), 0) AS ListinoVendita, ISNULL
                          ((SELECT  TOP 1   PREZZO
                              FROM         LISTINIARTICOLI AS LA
                              WHERE     (CODART = AA.CODICE) AND (NRLISTINO =
                                                        (SELECT     TOP (1) IdListinoUPA
                                                          FROM          ALD_TabDittaDatiAggiuntivi AS ALD_TabDittaDatiAggiuntivi_1))), 0) AS ListinoAcquisti, 
														  ARTICOLIUMPREFERITE.UM
, 2 as Quantydecimal
, 0 as Statecode
, 1 as Statuscode
, 1 ava_valido
, ExM.ListinoCommerciale as ava_ListinoCommerciale
FROM         ANAGRAFICAARTICOLI AS AA INNER JOIN
                      EXTRAMAG AS ExM ON AA.CODICE = ExM.CODART INNER JOIN
                      ANAGRAFICAARTICOLICOMM AS AACom ON AA.CODICE = AACom.CODICEART INNER JOIN
                      TABUTENTI ON AACom.ESERCIZIO = TABUTENTI.ESERCIZIOATTIVO INNER JOIN
                      CONS_ALD_TABASA ON ExM.IdASA = CONS_ALD_TABASA.IdASA INNER JOIN
                      CONS_ALD_TABSottoASA ON ExM.IdSottoAsa = CONS_ALD_TABSottoASA.IdSottoASA INNER JOIN
                      CRM_ALDTabScontiEcommerce ON ExM.idALDScontoEcom = CRM_ALDTabScontiEcommerce.idALDScontoEcom INNER JOIN
                      ARTICOLIUMPREFERITE ON ExM.CODART = ARTICOLIUMPREFERITE.CODART
WHERE     (AACom.EXPORTECOMMERCE = 1) AND (TABUTENTI.USERDB = CAST(USER_NAME() AS VARCHAR(25))) AND (ARTICOLIUMPREFERITE.TIPOUM = 3)
	   





GO
GRANT DELETE
    ON OBJECT::[dbo].[CRM_Vista_AnagraficaArticoli] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CRM_Vista_AnagraficaArticoli] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CRM_Vista_AnagraficaArticoli] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CRM_Vista_AnagraficaArticoli] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CRM_Vista_AnagraficaArticoli] TO [Metodo98]
    AS [dbo];

