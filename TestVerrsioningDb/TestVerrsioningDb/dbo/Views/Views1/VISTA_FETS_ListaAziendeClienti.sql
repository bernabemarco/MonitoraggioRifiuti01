

CREATE VIEW VISTA_FETS_ListaAziendeClienti
AS
Select '' As SelCF, CF.CODCONTO, 
        CF.DSCCONTO1, 
        Case When IsNull(CF.CODFISCALE,'') <> '' Then 
            IsNull(CF.CODFISCALE,'') 
        Else IsNull(CF.PARTITAIVA,'') 
        End As CODFISCALEPARTITAIVA, 
    CF.INDIRIZZO, 
    CF.LOCALITA, 
    CF.CAP, 
    ISNULL(FT.Stato,0) Stato, 
    ISNULL(FT.TipoInstradamento,0) TipoInstradamento,
    ISNULL(FT.TipoInvio,4) TipoInvio,
        FT.DatamodificaWS,
    '' DestDivPresenti,
    '' CliForFattPresenti,
    FT.DatiWS
from ANAGRAFICACF CF 
Left outer Join FETS_ListaAziendeAttive FT
ON Case When IsNull(CF.CODFISCALE,'') <> '' Then    
        IsNull(CF.CODFISCALE,'')
    Else IsNull(CF.PARTITAIVA,'') End = FT.CODICEFISCALEPARTITAIVA
AND CF.CODCONTO = FT.CODCONTO

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTA_FETS_ListaAziendeClienti] TO [Metodo98]
    AS [dbo];

