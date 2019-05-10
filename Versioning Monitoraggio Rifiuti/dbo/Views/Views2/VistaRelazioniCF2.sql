CREATE VIEW VistaRelazioniCF2 as
select RelazioniCFV.CodCliFor, AnagraficaArticoli.Codice, RelazioniCFV.Varianti, RelazioniCFV.Articolo, RelazioniCFV.Riferimento
from AnagraficaArticoli inner join RelazioniCFV on AnagraficaArticoli.CodicePrimario=RelazioniCFV.Articolo 


GO
GRANT DELETE
    ON OBJECT::[dbo].[VistaRelazioniCF2] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[VistaRelazioniCF2] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[VistaRelazioniCF2] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[VistaRelazioniCF2] TO [Metodo98]
    AS [dbo];

