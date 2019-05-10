

CREATE VIEW [dbo].[a_VIS_RilProvTMP] AS
	Select IDSESSIONE,CODAGENTE,DSCAGENTE,sum(TOTPROVDOC) TOTPROVDOC  from A_RilProvTMP where ISNULL(codagente,'')<>'' group by IDSESSIONE,CODAGENTE,DSCAGENTE

GO
GRANT DELETE
    ON OBJECT::[dbo].[a_VIS_RilProvTMP] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[a_VIS_RilProvTMP] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[a_VIS_RilProvTMP] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[a_VIS_RilProvTMP] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[a_VIS_RilProvTMP] TO [Metodo98]
    AS [dbo];

