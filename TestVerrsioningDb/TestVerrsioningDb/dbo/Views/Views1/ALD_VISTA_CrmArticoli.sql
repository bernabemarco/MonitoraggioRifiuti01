


CREATE view [dbo].ALD_VISTA_CrmArticoli
as 

SELECT     AA.CODICE AS CodArticoloMetodo, AA.DESCRIZIONE + ' ' + ISNULL(AA.DESCRESTESA, '') AS Descrizione, ExM.IdASA, CONS_ALD_TABASA.Descrizione AS DscAsa, 
                      ExM.IdSottoAsa, CONS_ALD_TABSottoASA.Descrizione AS DscSottoAsa, ExM.idALDScontoEcom, CRM_ALDTabScontiEcommerce.DscCRMScontoEcom,
                          (SELECT     IdListinoVendita
                            FROM          ALD_TabDittaDatiAggiuntivi) AS IdListinoVendita, ISNULL
                          ((SELECT  top 1   PREZZO
                              FROM         LISTINIARTICOLI AS LA
                              WHERE     (CODART = AA.CODICE) AND (NRLISTINO =
                                                        (SELECT     TOP (1) IdListinoVendita
                                                          FROM          ALD_TabDittaDatiAggiuntivi AS ALD_TabDittaDatiAggiuntivi_2))), 0) AS ValListinoVendita, ISNULL
                          ((SELECT  top 1   UM
                              FROM         LISTINIARTICOLI AS LA
                              WHERE     (CODART = AA.CODICE) AND (NRLISTINO =
                                                        (SELECT     TOP (1) IdListinoVendita
                                                          FROM          ALD_TabDittaDatiAggiuntivi AS ALD_TabDittaDatiAggiuntivi_2))), '') AS UmListinoVendita,
                          (SELECT  top 1   IdListinoUPA
                            FROM          ALD_TabDittaDatiAggiuntivi AS ALD_TabDittaDatiAggiuntivi_3) AS IdListinoUPA, ISNULL
                          ((SELECT top 1   PREZZO
                              FROM         LISTINIARTICOLI AS LA
                              WHERE     (CODART = AA.CODICE) AND (NRLISTINO =
                                                        (SELECT     TOP (1) IdListinoUPA
                                                          FROM          ALD_TabDittaDatiAggiuntivi AS ALD_TabDittaDatiAggiuntivi_1))), 0) AS ValListinoAcquisti, ISNULL
                          ((SELECT top 1   UM
                              FROM         LISTINIARTICOLI AS LA
                              WHERE     (CODART = AA.CODICE) AND (NRLISTINO =
                                                        (SELECT     TOP (1) IdListinoUPA
                                                          FROM          ALD_TabDittaDatiAggiuntivi AS ALD_TabDittaDatiAggiuntivi_1))), '') AS UmListinoAcquisti, 
														  ARTICOLIUMPREFERITE.UM as UmBase,
	(select UM from ARTICOLIUMPREFERITE where (CODART = AA.CODICE) AND (TIPOUM = 3)) as UmVendita,
	AAcom.EXPORTECOMMERCE,
	AAcom.GRUPPOPRZPART,
	AAcom.GRUPPOPRVPART,
	aa.GRUPPO,
	aa.CATEGORIA,
	aa.CODCATEGORIASTAT,
	aa.ARTTIPOLOGIA,
	/* formula calcolo Kappa: ValListinoVendita / ValListinoAcquisto .fine */
	(case when 
	/* ValListinoAcquisto */
	ISNULL
                          ((SELECT top 1   PREZZO
                              FROM         LISTINIARTICOLI AS LA
                              WHERE     (CODART = AA.CODICE) AND (NRLISTINO =
                                                        (SELECT     TOP (1) IdListinoUPA
                                                          FROM          ALD_TabDittaDatiAggiuntivi AS ALD_TabDittaDatiAggiuntivi_1))), 0)=0 
	then 0 
	else 
	/* ValListinoVendita */
	ISNULL
                          ((SELECT  top 1   PREZZO
                              FROM         LISTINIARTICOLI AS LA
                              WHERE     (CODART = AA.CODICE) AND (NRLISTINO =
                                                        (SELECT     TOP (1) IdListinoVendita
                                                          FROM          ALD_TabDittaDatiAggiuntivi AS ALD_TabDittaDatiAggiuntivi_2))), 0)
	
	/
	/* ValListinoAcquisto */
	ISNULL
                          ((SELECT top 1   PREZZO
                              FROM         LISTINIARTICOLI AS LA
                              WHERE     (CODART = AA.CODICE) AND (NRLISTINO =
                                                        (SELECT     TOP (1) IdListinoUPA
                                                          FROM          ALD_TabDittaDatiAggiuntivi AS ALD_TabDittaDatiAggiuntivi_1))), 0) 
	end) as Kappa,

	/* formula Perc. Margine Previsto: (ValListinoVendita - ValListinoAcquisto ) / ValListinoVendita * 100 :fine */
	(case when 
		/* ValListinoVendita */
	ISNULL
                          ((SELECT  top 1   PREZZO
                              FROM         LISTINIARTICOLI AS LA
                              WHERE     (CODART = AA.CODICE) AND (NRLISTINO =
                                                        (SELECT     TOP (1) IdListinoVendita
                                                          FROM          ALD_TabDittaDatiAggiuntivi AS ALD_TabDittaDatiAggiuntivi_2))), 0)

	= 0
	then
		0
	else
		
		(
			/* ValListinoVendita */
	ISNULL
                          ((SELECT  top 1   PREZZO
                              FROM         LISTINIARTICOLI AS LA
                              WHERE     (CODART = AA.CODICE) AND (NRLISTINO =
                                                        (SELECT     TOP (1) IdListinoVendita
                                                          FROM          ALD_TabDittaDatiAggiuntivi AS ALD_TabDittaDatiAggiuntivi_2))), 0)

		-
			/* ValListinoAcquisto */
	ISNULL
                          ((SELECT top 1   PREZZO
                              FROM         LISTINIARTICOLI AS LA
                              WHERE     (CODART = AA.CODICE) AND (NRLISTINO =
                                                        (SELECT     TOP (1) IdListinoUPA
                                                          FROM          ALD_TabDittaDatiAggiuntivi AS ALD_TabDittaDatiAggiuntivi_1))), 0) 

		)
		/
			/* ValListinoVendita */
	ISNULL
                          ((SELECT  top 1   PREZZO
                              FROM         LISTINIARTICOLI AS LA
                              WHERE     (CODART = AA.CODICE) AND (NRLISTINO =
                                                        (SELECT     TOP (1) IdListinoVendita
                                                          FROM          ALD_TabDittaDatiAggiuntivi AS ALD_TabDittaDatiAggiuntivi_2))), 0)

		*100
	end ) as PercMarginePrev,

	isnull((SELECT PREZZOEURO FROM STORICOPREZZIARTICOLO WHERE (ULTIMO = 1) AND (TIPOPREZZO = 'F') and codarticolo=AA.CODICE),0) as UPAArticolo

FROM         ANAGRAFICAARTICOLI AS AA INNER JOIN
                      EXTRAMAG AS ExM ON AA.CODICE = ExM.CODART INNER JOIN
                      ANAGRAFICAARTICOLICOMM AS AACom ON AA.CODICE = AACom.CODICEART INNER JOIN
                      ARTICOLIUMPREFERITE ON ExM.CODART = ARTICOLIUMPREFERITE.CODART LEFT OUTER JOIN
                      CRM_ALDTabScontiEcommerce ON ExM.idALDScontoEcom = CRM_ALDTabScontiEcommerce.idALDScontoEcom LEFT OUTER JOIN
                      CONS_ALD_TABASA ON ExM.IdASA = CONS_ALD_TABASA.IdASA LEFT OUTER JOIN
                      CONS_ALD_TABSottoASA ON ExM.IdSottoAsa = CONS_ALD_TABSottoASA.IdSottoASA CROSS JOIN
                      TABUTENTI
WHERE     (ARTICOLIUMPREFERITE.TIPOUM = 1) 
/*AND (AACom.ESERCIZIO = 2015) */
AND AACom.ESERCIZIO = ESERCIZIOATTIVO
/*AND (TABUTENTI.USERDB = 'trm200')*/

AND (TABUTENTI.USERDB = CAST(USER_NAME() AS VARCHAR(25)))


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_VISTA_CrmArticoli] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_VISTA_CrmArticoli] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_VISTA_CrmArticoli] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_VISTA_CrmArticoli] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_VISTA_CrmArticoli] TO [Metodo98]
    AS [dbo];

