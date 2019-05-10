CREATE VIEW VISTAMOVIMENTICES_ATI
AS
  SELECT 
	MA.Progressivo,
	MA.Descrizione,
	MA.TipoCalc,
	(SELECT Descrizione FROM TabTipi_ATI WHERE Codice=MA.TipoCalc) AS DscTipoCalc,
	MA.Tipo,
        MA.CodAmbiente,
	MA.DataInizioAmm,
	MA.DataFineAmm,
	MA.Cespite,
	AC.Descrizione AS DscCespite,
	AC.CodCatFis,
	(SELECT Descrizione FROM CategorieFiscali WHERE Codice=AC.CodCatFis) AS DscCatFis,
	AC.CodCat_ATI,
	(SELECT Descrizione FROM TabCat_ATI WHERE Codice=AC.CodCat_ATI) AS DscCat_ATI,
	MA.CodGenerico,
	(SELECT DscConto1 FROM AnagraficaGenerici WHERE CodConto=MA.CodGenerico) AS DscGenerico,
	MA.CodCCosto,
	(SELECT Descrizione FROM TabCentriCosto WHERE Codice=MA.CodCCosto) AS DscCCosto,
	MA.ImportoAmm,
	MA.ImportoAmmEuro,
	MA.ResiduoCDC,
	MA.ResiduoCDCEuro,
	MA.Agente 
FROM 
	Movimentices_ATI MA LEFT OUTER JOIN AnagraficaCespiti AC ON AC.Codice=MA.Cespite

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTAMOVIMENTICES_ATI] TO [Metodo98]
    AS [dbo];

