

Create View [dbo].[EC_ViewRiconciliazione]
AS

Select
     EMEP.Progressivo
    ,EMEP.RifProgressivoPN
    ,EMEP.RifRigaPN
    ,TC.ESERCIZIO
    ,TC.DATAREG
    ,TC.CAUSALE
    ,TC.DESCRIZIONE
    ,RC.CONTO
    ,RC.IMPORTO
    ,RC.DESCRIZIONE As DescrizioneRiga
    ,EC.CodBanca
    ,EC.CodFlusso
From
    EC_MovimentiEcPn EMEP
Inner Join
    TesteContabilita TC
ON
        TC.Progressivo = EMEP.RifProgressivoPN
Inner Join
    RigheContabilita RC
ON
        RC.NRREG = TC.Progressivo
    And RC.NRRIGA = EMEP.RifRigaPN
Inner Join
    EC_EstrattoConto EC
ON
    EC.Progressivo = EMEP.RifProgressivoEC

GO
GRANT SELECT
    ON OBJECT::[dbo].[EC_ViewRiconciliazione] TO [Metodo98]
    AS [dbo];

