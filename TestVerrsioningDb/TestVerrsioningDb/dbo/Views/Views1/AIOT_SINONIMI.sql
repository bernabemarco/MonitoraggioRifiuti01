
CREATE VIEW AIOT_SINONIMI
AS
SELECT     Progressivo, Codice, Cod_Sino, Desc_Sino, Coeff_Sino, UtenteModifica, DataModifica, UM, Tipo_Barcode, BarcodeDaStampare, BarcodeTipo, BarcodeStringa, 
                      ESPORTAAG, ESPORTAPV
FROM         dbo.TP_SINONIMI


GO
GRANT DELETE
    ON OBJECT::[dbo].[AIOT_SINONIMI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[AIOT_SINONIMI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[AIOT_SINONIMI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[AIOT_SINONIMI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[AIOT_SINONIMI] TO [Metodo98]
    AS [dbo];

