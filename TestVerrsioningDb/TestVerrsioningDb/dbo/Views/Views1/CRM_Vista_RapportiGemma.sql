


CREATE view [dbo].[CRM_Vista_RapportiGemma]
as
SELECT     RP.IDRAPPORTO, RP.FLG_RichiestaRDO, RP.NoteRichiestaRDO AS ava_NoteRichiestaRDO,
                          (SELECT     TOP (1) IdSocieta
                            FROM          ALD_TabDittaDatiAggiuntivi AS ALD_TabDittaDatiAggiuntivi_1) + TC.CODCLIENTE AS Ava_Cliente, TC.CODCLIENTE,
                          (SELECT     TOP (1) IdSocieta
                            FROM          ALD_TabDittaDatiAggiuntivi AS ALD_TabDittaDatiAggiuntivi_2) + TC.CODCLIFAT AS ava_CODCFFATT, TC.CODCLIFAT, 
                      RP.DATA_EFF AS ava_dataEffMantuenzione, RP.RifOfferta AS ava_OffRiferimento, RP.RIFCLIENTE AS ava_RifCliente, RP.RIFCOMMCLI AS ava_RifCommCli,
                          (SELECT     TOP (1) IdSocieta
                            FROM          ALD_TabDittaDatiAggiuntivi AS ALD_TabDittaDatiAggiuntivi_1) + RP.TECNICO_EFF AS ava_TecnicoEffettivo, 
                      (CASE WHEN rp.TIPOLOGIARAPPORTO = 'O' THEN 100000000 ELSE (CASE WHEN rp.TIPOLOGIARAPPORTO = 'S' THEN 100000001 ELSE 100000000 END) END) 
                      AS ava_TipologiaRapporto, 
                      (CASE WHEN RP.TIPO_RAPPORTO = 'E' THEN 100000002 ELSE (CASE WHEN RP.TIPO_RAPPORTO = 'I' THEN 100000003 ELSE (CASE WHEN RP.TIPO_RAPPORTO = 'D'
                       THEN 100000004 ELSE (CASE WHEN RP.TIPO_RAPPORTO = 'V' THEN 100000000 ELSE 100000004 END) END) END) END) AS Ava_TipoRapporto
                      --RP.NoteRichiestaRDO AS ava_NoteRichiestaRDO
					  , SC.CodiceMezzo + ' - ' + aa.DESCRIZIONE as ava_Mezzo
					  , rp.NOTE_INTERNE as ava_NoteRappStampate
					  , rp.NOTE_TECNICO as ava_NoteTecnicoInterne
FROM         GEM_SEZIONECONTRATTORAPPORTI AS RP INNER JOIN
                      GEM_SEZIONICONTRATTO AS SC ON RP.IDCONTRATTO = SC.IDCONTRATTO AND RP.SEZIONECONTRATTO = SC.SEZIONECONTRATTO INNER JOIN
                      ANAGRAFICAARTICOLI AS AA ON SC.CodiceMezzo = AA.CODICE INNER JOIN
                      GEM_TESTACONTRATTO AS TC ON SC.IDCONTRATTO = TC.IDCONTRATTO
WHERE     (ISNULL(RP.FLG_RichiestaRDO, 0) = 1) AND (YEAR(ISNULL(RP.DATA_EFF, 1)) >= 2017)



GO
GRANT DELETE
    ON OBJECT::[dbo].[CRM_Vista_RapportiGemma] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CRM_Vista_RapportiGemma] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CRM_Vista_RapportiGemma] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CRM_Vista_RapportiGemma] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CRM_Vista_RapportiGemma] TO [Metodo98]
    AS [dbo];

