﻿
CREATE VIEW [dbo].[ald_vista_GEM_RedditivitaContratti]
AS
-- rapporti --
SELECT     GEM_SEZIONECONTRATTORAPPORTI.IDCONTRATTO, EXTRARIGHEDOC.IDTESTA, 
GEM_SEZIONECONTRATTORAPPORTI.IDRAPPORTO AS RifGemma
, 'Rapporto' AS Origine
FROM         EXTRARIGHEDOC INNER JOIN
                      GEM_SEZIONECONTRATTORAPPORTI ON EXTRARIGHEDOC.IdRapportoGemma = GEM_SEZIONECONTRATTORAPPORTI.IDRAPPORTO/* rate --*/
union
-- rata --
SELECT     GEM_SEZIONECONTRATTO_RATE.IDCONTRATTO, TESTEDOCUMENTI.PROGRESSIVO AS IdTesta, ('Rata nr.: ' + cast(NUMERORATA as varchar(10))) AS RifGemma, 
                      'Rata' AS Origine
FROM         TESTEDOCUMENTI INNER JOIN
                      GEM_SEZIONECONTRATTO_RATE ON TESTEDOCUMENTI.PROGRESSIVO = GEM_SEZIONECONTRATTO_RATE.NUMERO_RFW


GO
GRANT SELECT
    ON OBJECT::[dbo].[ald_vista_GEM_RedditivitaContratti] TO [Metodo98]
    AS [dbo];

