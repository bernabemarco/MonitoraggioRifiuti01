

CREATE VIEW
  VISTAVBANCOVENDITA
  AS SELECT TesteVBanco.Progressivo,
    TesteVBanco.Data,
    TesteVBanco.CodCausale,
    TesteVBanco.Listino,
    TesteVBanco.ScontoFinale,
    TesteVBanco.TotImponibile,
    TesteVBanco.TotImposta,
    TesteVBanco.TotaleNetto,
    TesteVBanco.TotImponibileEuro,
    TesteVBanco.TotImpostaEuro,
    TesteVBanco.TotaleNettoEuro,
    TesteVBanco.Incassato,
    TesteVBanco.AggMagazzino,
    TesteVBanco.Contabilizzato,
    TesteVBanco.TipoRigaCont,
    TesteVBanco.RigaContabile,
    TesteVBanco.RipScontoFinale,
    (CASE WHEN (TesteVBanco.ScontoFinAValore > 0  AND TesteVBanco.RipScontoFinale = 0)  THEN 0 ELSE -1 END) AS ValScontoFinale,
    (SELECT  MAX(RIFTESTEDOC)  AS RIFTESTEDOC FROM RigheVBanco Where Progressivo=TesteVBanco.Progressivo) As RIFTESTEDOC,
    RVB.CodIva,
    ParametriVBanco.CausVendita,
    ParametriVBanco.CodGenAbbuoni,
    ParametriVBanco.CodIVAAbb, 
    ParametriVBanco.CodGenRicavi, 
    RVB.ControPartita,
    RVB.TotImponibile as ImponibileRiga,
    RVB.TotImposta as ImpostaRiga,
    RVB.TotImponibileEuro as ImponibileRigaEuro,
    RVB.TotImpostaEuro as ImpostaRigaEuro,
    RVB.TotNettoIvato as nettoRiga,
    RVB.TotNettoivatoEuro as nettoRigaEuro,
    RVB.TipoRiga,
    (CASE WHEN RVB.TipoRiga<>'R' THEN 1 ELSE -1 END) as FlgReso,
    (CASE WHEN (ParametriVBanco.UsaCliCorr = 'C' or ParametriVBanco.UsaCliCorr = 'E')
    then
	(select TABVINCOLIGIC.SCCLICORRISP from TABVINCOLIGIC where ESERCIZIO = (select ESERCIZIOATTIVO from TABUTENTI where USERDB = USER_NAME()))
    else 
	TesteVBanco.CodCliente 
    end	) as CodCli 
    FROM ((TesteVBanco LEFT OUTER JOIN ParametriVBanco ON TesteVBanco.CodCausale = ParametriVBanco.Codice) LEFT OUTER JOIN RIGHEVBANCO AS RVB ON TESTEVBANCO.PROGRESSIVO = RVB.PROGRESSIVO)

GO
GRANT DELETE
    ON OBJECT::[dbo].[VISTAVBANCOVENDITA] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[VISTAVBANCOVENDITA] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[VISTAVBANCOVENDITA] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTAVBANCOVENDITA] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[VISTAVBANCOVENDITA] TO [Metodo98]
    AS [dbo];

