
CREATE view [dbo].[CRM_Vista_TabScontiEcommerce]
as 
SELECT    (SELECT     TOP (1) IdSocieta
                       FROM          ALD_TabDittaDatiAggiuntivi) as Ditta,
 (SELECT     TOP (1) IdSocieta
                       FROM          ALD_TabDittaDatiAggiuntivi) + CAST(idALDScontoEcom AS varchar(15)) AS idALDScontoEcom,
					   [DscCRMScontoEcom], idAsa,
					   ProvvigioneMedia, ScontoMaxStd, ScontoMaxCA			  
FROM         CRM_ALDTabScontiEcommerce


GO
GRANT SELECT
    ON OBJECT::[dbo].[CRM_Vista_TabScontiEcommerce] TO [Metodo98]
    AS [dbo];

