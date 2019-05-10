
-- Fine Sviluppo 3523 ---------------

---------------------------------------------------- Anomalia nr. 12402 --------------------------------------------------------------
CREATE VIEW VISTAMOVCESATI AS
SELECT    
    Cespite,
    Descrizione,
    Tipo,
    Progressivo,
    (CASE WHEN Tipo IN (7,13) THEN DtaMovimento ELSE DtaEffettiva END) AS DtaEffettiva,
    DtaMovimento,
    (CASE WHEN Tipo IN (7,13) THEN DtaEffettiva ELSE DtaDocumento END) AS DtaDocumento,
    CompQtaRes,
    CompQtaEli,
    ImpImmRes,
    ImpImmResEuro,
    CompetenzaImp,
    CompetenzaImpEuro,
    CompetenzaOrd,
    CompetenzaOrdEuro,
    CompetenzaAnt,
    CompetenzaAntEuro,
    PercRivSva,
    ImpDocumento,
    ImpDocumentoEuro,
    ImpDocumentoIniz,
    ImpDocumentoInizEuro,
    ImpDocumentoVend,
    ImpDocumentoVendEuro,
    0 As TipoCalc,
    0 As PercAmm,
    FdoAnnoPrec,
    '' AS CodCCosto,
    TipoRiv
FROM 
    MovimentiCes
WHERE 
    Tipo <> 11
UNION ALL   
SELECT     
    Cespite,
    Descrizione,
    (CASE WHEN TIPO='A' THEN 11 ELSE 99 END) As Tipo,
    (CASE WHEN 
        EXISTS(SELECT TOP 1 MC.Progressivo FROM MovimentiCes MC WHERE MC.Cespite=MovimentiCes_ATI.Cespite AND MC.DtaEffettiva=MovimentiCes_ATI.DataFineAmm AND MC.Tipo=17) 
    THEN 
        (SELECT TOP 1 MC.Progressivo FROM MovimentiCes MC WHERE MC.Cespite=MovimentiCes_ATI.Cespite AND MC.DtaEffettiva=MovimentiCes_ATI.DataFineAmm AND MC.Tipo=17)-1 
    ELSE 
        (CASE WHEN 
            EXISTS(SELECT TOP 1 MC.Progressivo FROM MovimentiCes MC WHERE MC.Cespite=MovimentiCes_ATI.Cespite AND MC.DtaEffettiva=MovimentiCes_ATI.DataFineAmm AND MC.Tipo=11) 
        THEN
            (SELECT TOP 1 MC.Progressivo FROM MovimentiCes MC WHERE MC.Cespite=MovimentiCes_ATI.Cespite AND MC.DtaEffettiva=MovimentiCes_ATI.DataFineAmm AND MC.Tipo=11) 
        ELSE
            999999999
        END) 
    END) As Progressivo,    
    DataFineAmm As DtaEffettiva,
    Null As DtaMovimento,
    DataFineAmm As DtaDocumento,
    0 As CompQtaRes,
    0 As CompQtaEli,
    0 As ImpImmRes,
    0 As ImpImmResEuro,
    0 As CompetenzaImp,
    0 As CompetenzaImpEuro,
    ImportoAmm As CompetenzaOrd,
    ImportoAmmEuro As CompetenzaOrdEuro,
    0 As CompetenzaAnt,
    0 As CompetenzaAntEuro,
    0 As PercRivSva,
    0 As ImpDocumento,
    0 As ImpDocumentoEuro,
    0 As ImpDocumentoIniz,
    0 As ImpDocumentoInizEuro,
    0 As ImpDocumentoVend,
    0 As ImpDocumentoVendEuro,
    TipoCalc,
    PercAmm,
    0 As FdoAnnoPrec,
    CodCCosto,
    0 As TipoRiv
FROM 
    MovimentiCes_ATI
WHERE
    Tipo IN ('A','R')

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTAMOVCESATI] TO [Metodo98]
    AS [dbo];

