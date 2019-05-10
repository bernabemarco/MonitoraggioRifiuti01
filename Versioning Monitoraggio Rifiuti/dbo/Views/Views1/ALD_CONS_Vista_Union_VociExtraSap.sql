
CREATE view [dbo].ALD_CONS_Vista_Union_VociExtraSap as
SELECT        CODCONTO, 
 CodSap, 
  IdSocietaPartnerMNC, IdSocietaPartnerGR, 
                         ClassCID as ClassID
,'' as CogesSpeciale, '' as TMVDare, '' as TMVAvere, 0 as flgNoExportSap, ''  as CodSapStanz
FROM            EXTRACLIENTI
union all
SELECT        CODCONTO, 
 CodSap, IdSocietaPartnerMNC, IdSocietaPartnerGR, 
                         ClassFID as ClassID
,'' as CogesSpeciale, '' as TMVDare, '' as TMVAvere, 0 as flgNoExportSap, ''  as CodSapStanz
FROM            EXTRAFORNITORI
union all
SELECT        CODCONTO, CodSap, 
IdSocietaPartnerMNC, '' as IdSocietaPartnerGR, 
'' as ClassID,
CogesSpeciale, TMVDare, TMVAvere, flgNoExportSap, CodSapStanz
FROM            EXTRAGENERICI

GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_CONS_Vista_Union_VociExtraSap] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_CONS_Vista_Union_VociExtraSap] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_CONS_Vista_Union_VociExtraSap] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_CONS_Vista_Union_VociExtraSap] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_CONS_Vista_Union_VociExtraSap] TO [Metodo98]
    AS [dbo];

