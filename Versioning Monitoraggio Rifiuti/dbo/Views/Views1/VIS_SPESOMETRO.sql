﻿CREATE VIEW [dbo].[VIS_SPESOMETRO]
AS
SELECT [CodiceAzienda]
      ,[TipoCF]
      ,[CodiceCF]
      ,(CASE WHEN left([PartitaIVA],11)='00000000000' then '' else [PartitaIVA] end) as [PartitaIVA]
      ,[CodiceFiscale]
      ,[PersonaFisica]
      ,[Cognome]
      ,[Nome]
      ,[DataNascita]
      ,[ComuneNascita]
      ,[ProvinciaNascita]
      ,[CodStatoEsteroSedeLegale]
      ,[CodStatoEsteroResidenza]
      ,[CodStatoDomicilio]
      ,[RagioneSociale]
      ,[CittaEsteraSedeLegale]
      ,[IndirizzoSedeLegale]
      ,[CodiceISO]
      ,[CodiceIdentificativoIVA]
      ,[NotaDiVariazione]
      ,[DocumentoRiepilogativo]
      ,[TipoDocumento]
      ,[AutoFattura]
      ,[LeasingNoleggio]
      ,[Noleggio]
      ,[IvaNonEsposta]
      ,[ReverseCharge]
      ,[ESERCIZIO]
      ,[DataRegistrazione]
      ,[DataDocumento]
      ,[NRRIFER]
      ,[NProtocollo]
      ,[NRREG]
      ,[DESCRIZIONE]
      ,[CODICE]
      ,sum([ImportoBeni]) as [ImportoBeni]
      ,sum([ImpostaBeni]) as [ImpostaBeni]
      ,sum([NonImponibileBeni]) as [NonImponibileBeni]
      ,sum([EsentiBeni]) as [EsentiBeni]
      ,sum([FuoriCampoBeni]) as [FuoriCampoBeni]
      ,sum([ImportoServizi]) as [ImportoServizi]
      ,sum([ImpostaServizi]) as [ImpostaServizi]
      ,sum([NonImponibileServizi]) as [NonImponibileServizi]
      ,sum([EsentiServizi]) as [EsentiServizi]
      ,sum([FuoriCampoServizi]) as [FuoriCampoServizi]
  FROM VIS_PRESPESOMETRO
  where not (tipocf='F' and ReverseCharge='S' and CODICE=1)
  group by  [CodiceAzienda]
      ,[TipoCF]
      ,[CodiceCF]
      ,[PartitaIVA]
      ,[CodiceFiscale]
      ,[PersonaFisica]
      ,[Cognome]
      ,[Nome]
      ,[DataNascita]
      ,[ComuneNascita]
      ,[ProvinciaNascita]
      ,[CodStatoEsteroSedeLegale]
      ,[CodStatoEsteroResidenza]
      ,[CodStatoDomicilio]
      ,[RagioneSociale]
      ,[CittaEsteraSedeLegale]
      ,[IndirizzoSedeLegale]
      ,[CodiceISO]
      ,[CodiceIdentificativoIVA]
      ,[NotaDiVariazione]
      ,[DocumentoRiepilogativo]
      ,[TipoDocumento]
      ,[AutoFattura]
      ,[LeasingNoleggio]
      ,[Noleggio]
      ,[IvaNonEsposta]
      ,[ReverseCharge]
      ,[ESERCIZIO]
      ,[DataRegistrazione]
      ,[DataDocumento]
      ,[NRRIFER]
      ,[NProtocollo]
      ,[NRREG]
      ,[DESCRIZIONE]
      ,[CODICE]

	  

GO
GRANT REFERENCES
    ON OBJECT::[dbo].[VIS_SPESOMETRO] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[VIS_SPESOMETRO] TO [Metodo98]
    AS [dbo];

