

CREATE view [dbo].[ALD_CONS_Vista_FI_AA_Fornitori_RA]
as 
SELECT       tribFor.CODFORNITORE, max(tTributi.TipoRA) as TipoRA, max(tTributi.CodiceRA) as CodiceRA
FROM            TRIBUTIFORNITORI AS tribFor INNER JOIN
                         ConsMFM.dbo.TABTRIBUTI AS tTributi ON tribFor.CODTRIBUTO = tTributi.CODICE
						 group by tribFor.CODFORNITORE


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_CONS_Vista_FI_AA_Fornitori_RA] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_CONS_Vista_FI_AA_Fornitori_RA] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_CONS_Vista_FI_AA_Fornitori_RA] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_CONS_Vista_FI_AA_Fornitori_RA] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_CONS_Vista_FI_AA_Fornitori_RA] TO [Metodo98]
    AS [dbo];

