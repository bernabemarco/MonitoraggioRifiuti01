﻿
CREATE VIEW [dbo].[DETTAGLIOIVADOCUMENTO]
AS
SELECT 
	0 AS CODICE,
	'' AS DESCRIZIONE,
	0 AS ALIQUOTA,
	CIVA.IDTESTA,
	0 AS TOTIMPONIBILE,
	0 AS TOTIMPONIBILERES,
	0 AS TOTIMPOSTA,
	0 AS TOTIMPOSTARES,
	0 AS TOTIMPONIBILEEURO,
	0 AS TOTIMPONIBILEEURORES,
	0 AS TOTIMPOSTAEURO,
	0 AS TOTIMPOSTAEURORES,
	0 AS TOTIMPONIBILEVALUTA,
	0 AS TOTIMPONIBILEVALUTARES,
	0 AS TOTIMPOSTAVALUTA,
	0 AS TOTIMPOSTAVALUTARES,
	0 AS INDETRAIBILITA,
	'' AS PLAFOND,
	'' AS TIPOINTRACEE,
	'' AS NOTE,
	'' AS AGGIUNGIDICESCF,
	'' AS DICHIARES,
	'' AS REPARTO,
	'' AS DESCRIZIONELINGUA1,
	'' AS DESCRIZIONELINGUA2,
	'' AS DESCRIZIONELINGUA3,
	'' AS DESCRIZIONELINGUA4,
	'' AS DESCRIZIONELINGUA5,
	'' AS DESCRIZIONELINGUA6,
	'' AS DESCRIZIONELINGUA7,
	'' AS DESCRIZIONELINGUA8,
	'' AS DESCRIZIONELINGUA9,
	'' AS EscludiRip
FROM	CASTELLETTIIVA AS CIVA,
		TRATTAMENTOIVA AS TIVA
WHERE TIVA.CODICE=CIVA.CODIVA
GROUP BY IDTESTA
UNION
SELECT 
	TIVA.CODICE,
	TIVA.DESCRIZIONE,
	TIVA.ALIQUOTA,
	CIVA.IDTESTA,
	CIVA.TOTIMPONIBILE,
	CIVA.TOTIMPONIBILERES,
	CIVA.TOTIMPOSTA,
	CIVA.TOTIMPOSTARES,
	CIVA.TOTIMPONIBILEEURO,
	CIVA.TOTIMPONIBILEEURORES,
	CIVA.TOTIMPOSTAEURO,
	CIVA.TOTIMPOSTAEURORES,
	CIVA.TOTIMPONIBILEVALUTA,
	CIVA.TOTIMPONIBILEVALUTARES,
	CIVA.TOTIMPOSTAVALUTA,
	CIVA.TOTIMPOSTAVALUTARES,
	TIVA.INDETRAIBILITA,
	TIVA.PLAFOND,
	TIVA.TIPOINTRACEE,
	TIVA.NOTE,
	TIVA.AGGIUNGIDICESCF,
	TIVA.DICHIARES,
	TIVA.REPARTO,
	TIVA.DESCRIZIONELINGUA1,
	TIVA.DESCRIZIONELINGUA2,
	TIVA.DESCRIZIONELINGUA3,
	TIVA.DESCRIZIONELINGUA4,
	TIVA.DESCRIZIONELINGUA5,
	TIVA.DESCRIZIONELINGUA6,
	TIVA.DESCRIZIONELINGUA7,
	TIVA.DESCRIZIONELINGUA8,
	TIVA.DESCRIZIONELINGUA9,
	TIVA.EscludiRip
FROM	CASTELLETTIIVA AS CIVA,
		TRATTAMENTOIVA AS TIVA
WHERE TIVA.CODICE=CIVA.CODIVA

GO
GRANT DELETE
    ON OBJECT::[dbo].[DETTAGLIOIVADOCUMENTO] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[DETTAGLIOIVADOCUMENTO] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[DETTAGLIOIVADOCUMENTO] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[DETTAGLIOIVADOCUMENTO] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[DETTAGLIOIVADOCUMENTO] TO [Metodo98]
    AS [dbo];

