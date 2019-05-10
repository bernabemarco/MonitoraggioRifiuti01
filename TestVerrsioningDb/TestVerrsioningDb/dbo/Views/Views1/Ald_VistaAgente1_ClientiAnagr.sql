

create view [dbo].Ald_VistaAgente1_ClientiAnagr
as
/*raggr per agente + dsc;  zona + dsc + note zona;provincia; categoria cli + dsc
idtrust==>*1,10,11,15,99*/
SELECT     AnaRis.ESERCIZIO, AnaRis.CODAGENTE1, AAg.DSCAGENTE, AnaRis.CODZONA, Zone.DESCRIZIONE AS DscZona, Zone.NOTE AS NoteZona, AnaCF.PROVINCIA, 
                      AnaRis.CODCATEGORIA, CatCF.DSCCATEGORIA AS DscCategoria, COUNT(DISTINCT AnaRis.CODCONTO) AS CountCliAna
FROM         ANAGRAFICACF AS AnaCF INNER JOIN
                      ANAGRAFICARISERVATICF AS AnaRis ON AnaCF.CODCONTO = AnaRis.CODCONTO INNER JOIN
                      ANAGRAFICAAGENTI AS AAg ON AnaRis.CODAGENTE1 = AAg.CODAGENTE LEFT OUTER JOIN
                      EXTRACLIENTI AS ExC ON AnaCF.CODCONTO = ExC.CODCONTO LEFT OUTER JOIN
                      CATEGORIECF AS CatCF ON AnaRis.CODCATEGORIA = CatCF.CODCATEGORIA LEFT OUTER JOIN
                      TABZONE AS Zone ON AnaRis.CODZONA = Zone.CODICE
WHERE     (ExC.IdTrust IN (1, 10, 11, 15, 99))
GROUP BY AAg.DSCAGENTE, AnaRis.CODAGENTE1, AnaRis.CODZONA, Zone.DESCRIZIONE, Zone.NOTE, AnaRis.CODCATEGORIA, CatCF.DSCCATEGORIA, AnaCF.PROVINCIA, 
                      AnaRis.ESERCIZIO


GO
GRANT DELETE
    ON OBJECT::[dbo].[Ald_VistaAgente1_ClientiAnagr] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Ald_VistaAgente1_ClientiAnagr] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[Ald_VistaAgente1_ClientiAnagr] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Ald_VistaAgente1_ClientiAnagr] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Ald_VistaAgente1_ClientiAnagr] TO [Metodo98]
    AS [dbo];

