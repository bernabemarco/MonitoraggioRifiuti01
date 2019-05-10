

Create View [dbo].[EC_ViewCambioStato]
AS
 
Select Distinct
      EMEP.Progressivo
     ,EMEP.RifProgressivoPN
     ,TC.Descrizione
     ,TC.Causale
     ,TC.DataReg
     ,TC.Provvisorio
     ,TC.FLGMOVRICONCILIATOEC AS Stato
From
    EC_MovimentiEcPn EMEP
Inner Join
    TesteContabilita TC
ON
    TC.PROGRESSIVO = EMEP.RifProgressivoPN

GO
GRANT SELECT
    ON OBJECT::[dbo].[EC_ViewCambioStato] TO [Metodo98]
    AS [dbo];

