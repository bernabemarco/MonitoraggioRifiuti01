CREATE VIEW VISTATEMPSTPCES_ATI AS
SELECT 
    Progressivo,
    Descrizione,
    DataMovimento As DtaEffettiva,
    DtaDocumento,
    Cespite,
    TipoMov As Tipo,
    Importo As CompetenzaImp,
    ImportoEuro As CompetenzaImpEuro,
    ImportoAmm As CompetenzaOrd,
    ImportoAmmEuro As CompetenzaOrdEuro,
    Immobilizzo As ImpImmRes,
    ImmobilizzoEuro As ImpImmResEuro,
    PercAmm As PercAmmOrd,
    ImpDocumentoIniz,
    ImpDocumentoInizEuro,
    ImpDocumentoVend As ImpDocumento,
    ImpDocumentoVendEuro As ImpDocumentoEuro,
    MinusPlusValenza As PMValenze,
    MinusPlusValenzaEuro As PMValenzeEuro,
    ImpResiduo,
    ImpResiduoEuro,
    FondoAmm As FdoOrdRes,
    FondoAmmEuro As FdoOrdResEuro,
    PercRivSva,
    IDSessione,
	 Esercizio,
	 EsercizioStp
FROM TEMPSTPCES_ATI

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTATEMPSTPCES_ATI] TO [Metodo98]
    AS [dbo];

