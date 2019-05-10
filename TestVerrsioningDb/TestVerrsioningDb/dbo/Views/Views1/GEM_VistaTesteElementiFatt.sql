
CREATE view  GEM_VistaTesteElementiFatt 
as

SELECT 
		r.[IDRAPPORTO]
		,r.[IDCONTRATTO]
		,r.[SEZIONECONTRATTO]
		,v.[CODCLIENTE]
		,DscConto1
		,[SedeRagSoc]
		,DescTipologMezzo
      ,[TIPOLOGIARAPPORTO]
      ,[TIPO_RAPPORTO]
      ,[DATA_EFF]
      ,[DATA_FATT]
      ,[STATO]
      ,[DA_FATT]
      ,[NOTE_INTERNE]
		,r.TECNICO_EFF
      ,r.[NOTE_TECNICO]
      ,DescTecnicoRisorsa
	,isnull(( SELECT sum (totnettoriga) from GEM_Vista_ELEMENTI_FATT where GEM_Vista_ELEMENTI_FATT.IDRAPPORTO = r.IDRAPPORTO  Group by GEM_Vista_ELEMENTI_FATT.IDRAPPORTO ),0) as TotaleNetto
	,isnull(( SELECT sum (totlordoriga) from GEM_Vista_ELEMENTI_FATT where GEM_Vista_ELEMENTI_FATT.IDRAPPORTO = r.IDRAPPORTO  Group by GEM_Vista_ELEMENTI_FATT.IDRAPPORTO ),0) as TotaleLordo

  FROM [GEM_SEZIONECONTRATTORAPPORTI] r inner join 	[GEM_VistaContratti] v 
		on r.IDCONTRATTO=v.IDCONTRATTO and r.SEZIONECONTRATTO = v.SEZIONECONTRATTO 
	inner join anagraficaCF a on v.CODCLIENTE = a.codconto


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_VistaTesteElementiFatt] TO [Metodo98]
    AS [dbo];

