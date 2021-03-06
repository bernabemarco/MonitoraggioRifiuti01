﻿
CREATE VIEW AIOT_CONDIZIONATI
AS
SELECT     PROGRESSIVO, RIFCONTRATTO, DADATA, ADATA, NOTE, 
                      CASE WHEN TIPOCALCOLOPREMIO = 0 THEN 'CUMULATIVO' ELSE 'SCAGLIONI' END AS TIPOCALCOLOPREMIO, EMESSO, TIPODOC, IVA, 
                      PAGAMENTO, SOTTOCONTOCONTABILE, RIFPROGRESSIVODOC
FROM         dbo.CONTRATTI_CON


GO
GRANT DELETE
    ON OBJECT::[dbo].[AIOT_CONDIZIONATI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[AIOT_CONDIZIONATI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[AIOT_CONDIZIONATI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[AIOT_CONDIZIONATI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[AIOT_CONDIZIONATI] TO [Metodo98]
    AS [dbo];

