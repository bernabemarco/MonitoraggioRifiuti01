
CREATE VIEW [dbo].[VISTALIQUIDAZIONEDAANNULLARE]
AS
SELECT     'INCOND' AS tipo, teste_contratti.codice, contratti_cl.descrizione, dbo.CONTRATTICL_DATEDOC.RIFPROGRESSIVOCL, 
                      dbo.CONTRATTICL_DATEDOC.RIFPROGRESSIVO, dbo.CONTRATTICL_DATEDOC.NRRIGA,0 AS RIFRIGA, dbo.CONTRATTICL_DATEDOC.FLAGRIGA, 
                      dbo.CONTRATTICL_DATEDOC.POSIZIONE, dbo.CONTRATTICL_DATEDOC.DATAEMISSIONE, dbo.CONTRATTICL_DATEDOC.VALORE, 
                      dbo.TESTEDOCUMENTI.ESERCIZIO, dbo.TESTEDOCUMENTI.TIPODOC, dbo.TESTEDOCUMENTI.NUMERODOC, dbo.TESTEDOCUMENTI.DATADOC, 
                      dbo.TESTEDOCUMENTI.NUMRIFDOC, dbo.TESTEDOCUMENTI.DATARIFDOC, teste_contratti.indicealbero, anagraficacf.dscconto1
FROM         dbo.CONTRATTICL_DATEDOC LEFT OUTER JOIN
                      dbo.TESTEDOCUMENTI ON dbo.CONTRATTICL_DATEDOC.RIFPROGRESSIVODOC = dbo.TESTEDOCUMENTI.PROGRESSIVO LEFT JOIN
                      contratti_cl ON contratti_cl.rifprogressivo = CONTRATTICL_DATEDOC.RIFPROGRESSIVOCL LEFT JOIN
                      teste_contratti ON teste_contratti.progressivo = contratti_cl.rifprogressivo LEFT JOIN
                      anagraficacf ON anagraficacf.codconto = teste_contratti.codice
WHERE     CONTRATTICL_DATEDOC.RIFPROGRESSIVODOC > 0 AND numerodoc > 0 AND bolisperc = 0
UNION
SELECT     'INCONDPERC' AS tipo, teste_contratti.codice, CONTRATTI_CL.descrizione, dbo.CONTRATTICL_QTADATEDOC.RIFPROGRESSIVOCL, 
                      dbo.CONTRATTICL_QTADATEDOC.RIFPROGRESSIVO, dbo.CONTRATTICL_QTADATEDOC.NRRIGA,dbo.CONTRATTICL_QTADATEDOC.RIFRIGA, dbo.CONTRATTICL_QTADATEDOC.FLAGRIGA, 
                      dbo.CONTRATTICL_QTADATEDOC.POSIZIONE, dbo.CONTRATTICL_QTADATEDOC.DATAEMISSIONE, dbo.CONTRATTICL_QTADATEDOC.VALORE, 
                      dbo.TESTEDOCUMENTI.ESERCIZIO, dbo.TESTEDOCUMENTI.TIPODOC, dbo.TESTEDOCUMENTI.NUMERODOC, dbo.TESTEDOCUMENTI.DATADOC, 
                      dbo.TESTEDOCUMENTI.NUMRIFDOC, dbo.TESTEDOCUMENTI.DATARIFDOC, teste_contratti.indicealbero, anagraficacf.dscconto1
FROM         dbo.CONTRATTICL_QTADATEDOC LEFT OUTER JOIN
                      dbo.TESTEDOCUMENTI ON dbo.CONTRATTICL_QTADATEDOC.RIFPROGRESSIVODOC = dbo.TESTEDOCUMENTI.PROGRESSIVO LEFT JOIN
                      contratti_cl ON contratti_cl.rifprogressivo = CONTRATTICL_QTADATEDOC.RIFPROGRESSIVOCL
and   contratti_cl.nrriga = CONTRATTICL_QTADATEDOC.rifprogressivo

 LEFT JOIN
                      teste_contratti ON teste_contratti.progressivo = contratti_cl.rifprogressivo LEFT JOIN
                      anagraficacf ON anagraficacf.codconto = teste_contratti.codice
WHERE     CONTRATTICL_QTADATEDOC.RIFPROGRESSIVODOC > 0 AND numerodoc > 0 AND bolisperc = 1
UNION
SELECT     'COND' AS tipo, teste_contratti.codice, contratti_con.note AS descrizione, dbo.CONTRATTICC_DATELIQ.RIFPROGRESSIVO, 
                      dbo.CONTRATTICC_DATELIQ.RIFPROGRESSIVOCC, dbo.CONTRATTICC_DATELIQ.NRRIGA,0 AS RIFRIGA, dbo.CONTRATTICC_DATELIQ.FLAGRIGA, 
                      dbo.CONTRATTICC_DATELIQ.POSIZIONE, dbo.CONTRATTICC_DATELIQ.DATAEMISSIONE, dbo.CONTRATTICC_DATELIQ.VALORE, TESTEDOCUMENTI_1.ESERCIZIO, 
                      TESTEDOCUMENTI_1.TIPODOC, TESTEDOCUMENTI_1.NUMERODOC, TESTEDOCUMENTI_1.DATADOC, TESTEDOCUMENTI_1.NUMRIFDOC, 
                      TESTEDOCUMENTI_1.DATARIFDOC, teste_contratti.indicealbero, anagraficacf.dscconto1
FROM         dbo.CONTRATTICC_DATELIQ LEFT OUTER JOIN
                      dbo.TESTEDOCUMENTI AS TESTEDOCUMENTI_1 ON dbo.CONTRATTICC_DATELIQ.RIFPROGRESSIVODOC = TESTEDOCUMENTI_1.PROGRESSIVO LEFT JOIN
                      contratti_con ON contratti_con.rifcontratto = dbo.CONTRATTICC_DATELIQ.RIFPROGRESSIVO AND 
                      contratti_con.progressivo = dbo.CONTRATTICC_DATELIQ.RIFPROGRESSIVOCC LEFT JOIN
                      teste_contratti ON teste_contratti.progressivo = contratti_con.rifcontratto LEFT JOIN
                      anagraficacf ON anagraficacf.codconto = teste_contratti.codice
WHERE     dbo.CONTRATTICC_DATELIQ.RIFPROGRESSIVODOC > 0 AND numerodoc > 0




GO
GRANT DELETE
    ON OBJECT::[dbo].[VISTALIQUIDAZIONEDAANNULLARE] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[VISTALIQUIDAZIONEDAANNULLARE] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTALIQUIDAZIONEDAANNULLARE] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[VISTALIQUIDAZIONEDAANNULLARE] TO [Metodo98]
    AS [dbo];

