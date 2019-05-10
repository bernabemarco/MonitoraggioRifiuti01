



CREATE view [dbo].[Ald_VistaUnionAttivitaCidCommessa]
as
SELECT     RilAt.RifCommessaCliente, CommMFM.RifCMFM, ExMg.IdRespCid, RilAt.Soggetto, AA.DESCRIZIONE AS DscSoggetto, RilAt.DataInizioIntervento AS DtInt, MONTH(RilAt.DataInizioIntervento) 
                      AS meseRil, YEAR(RilAt.DataInizioIntervento) AS AnnoRil, RilAt.OreLavorate AS oreOrd, 0 AS oreStr, RilAt.OreViaggio, RilAt.OreLavorate + RilAt.OreViaggio AS TotOre, 
                      RilAt.KmPercorsi, 0 AS OreIntPreviste, 'AtCom' AS TipoOrigine, RilAt.Progressivo AS rifProgressivo, '0' AS IDRAPPORTO
					  
FROM         ALD_RilevazioneAttivitaCommessa AS RilAt INNER JOIN
                      EXTRAMAG AS ExMg ON RilAt.Soggetto = ExMg.CODART INNER JOIN
                      ANAGRAFICAARTICOLI AS AA ON ExMg.CODART = AA.CODICE LEFT OUTER JOIN
                      ALD_Vista_CommessaMFM AS CommMFM ON RilAt.RifCommessaCliente = CommMFM.RifComm

union all
SELECT     gemRap.RIFCOMMCLI, CommMFM.RifCMFM, EXTRAAGENTI.IdRespCid, GemRilAt.TECNICO AS Soggetto, AAg.DSCAGENTE AS DscSoggetto, GemRilAt.DATA AS DtInt, MONTH(GemRilAt.DATA) 
                      AS meseRil, YEAR(GemRilAt.DATA) AS AnnoRil, GemRilAt.OREORD, GemRilAt.ORESTRA, GemRilAt.OREVIAGGIO, 
                      GemRilAt.OREORD + GemRilAt.ORESTRA + GemRilAt.OREVIAGGIO AS TotOre, GemRilAt.KM AS KmPercorsi, gemRap.OreIntPreviste, 'AtSer' AS TipoOrigine, 
                      0 AS rifProgressivo, GemRilAt.IDRAPPORTO
FROM         GEM_SEZIONECONTRATTORAPPORTI_OreLavoroINTERNE AS GemRilAt INNER JOIN
                      EXTRAAGENTI ON GemRilAt.TECNICO = EXTRAAGENTI.CODAGENTE INNER JOIN
                      GEM_SEZIONECONTRATTORAPPORTI AS gemRap ON GemRilAt.IDRAPPORTO = gemRap.IDRAPPORTO INNER JOIN
                      ANAGRAFICAAGENTI AS AAg ON EXTRAAGENTI.CODAGENTE = AAg.CODAGENTE LEFT OUTER JOIN
                      ALD_Vista_CommessaMFM AS CommMFM ON gemRap.RIFCOMMCLI = CommMFM.RifComm





GO
GRANT DELETE
    ON OBJECT::[dbo].[Ald_VistaUnionAttivitaCidCommessa] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Ald_VistaUnionAttivitaCidCommessa] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[Ald_VistaUnionAttivitaCidCommessa] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Ald_VistaUnionAttivitaCidCommessa] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Ald_VistaUnionAttivitaCidCommessa] TO [Metodo98]
    AS [dbo];

