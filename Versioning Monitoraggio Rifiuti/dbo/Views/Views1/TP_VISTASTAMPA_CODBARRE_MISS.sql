
CREATE VIEW TP_VISTASTAMPA_CODBARRE_MISS
AS SELECT 
    ttm.progressivo as prog_miss, 
    ttdm.progressdoc as prog_doc,    
    '*' + (case when isnull((select top 1 idriga from righedocumenti where righedocumenti.scontoriga=100 and idtesta=ttdm.progressdoc),0)=0 then '0' else '1' end) + 
     right((replicate('0',10) + convert(varchar(10),ttm.progressivo)),10) + 
     right((replicate('0',10) + convert(varchar(10),ttdm.progressdoc)),10) + '*' as codbarre
FROM 
     tabtestemissioni as ttm left outer join tabtestedocumentimiss as ttdm on ttm.progressivo=ttdm.rifprogrtestamiss 



GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_VISTASTAMPA_CODBARRE_MISS] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_VISTASTAMPA_CODBARRE_MISS] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_VISTASTAMPA_CODBARRE_MISS] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_VISTASTAMPA_CODBARRE_MISS] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_VISTASTAMPA_CODBARRE_MISS] TO [Metodo98]
    AS [dbo];

