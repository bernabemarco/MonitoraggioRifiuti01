create view ALD_EstrazioneMovMag_CDG_Raggruppate
as 
SELECT     STORICOMAG.ESERCIZIO, STORICOMAG.CODART, ANAGRAFICAARTICOLI.DESCRIZIONE, STORICOMAG.CODDEPOSITO, 
                      ald_CDG_MagazziniFiscali.DESCRIZIONE AS DscDeposito, ANAGRAFICAARTICOLI.GRUPPO, TABGRUPPI.DESCRIZIONE AS DscGruppo, TABGRUPPI.MAGFISCALE, 
                      STORICOMAG.CODCAUSALE, ALD_TabCausaliMag_CDG_Raggruppamenti.Descrizione AS DscCausale, ALD_TabCausaliMag_CDG_Raggruppamenti.Segno, 
                      ALD_TabCausaliMag_CDG_Raggruppamenti.Raggruppamento, STORICOMAG.QTA1UM * STORICOMAG.GIACENZA AS QtaMov
FROM         STORICOMAG INNER JOIN
                      ald_CDG_MagazziniFiscali ON STORICOMAG.CODDEPOSITO = ald_CDG_MagazziniFiscali.CODICE INNER JOIN
                      ANAGRAFICAARTICOLI ON STORICOMAG.CODART = ANAGRAFICAARTICOLI.CODICE INNER JOIN
                      TABGRUPPI ON ANAGRAFICAARTICOLI.GRUPPO = TABGRUPPI.CODICE INNER JOIN
                      ALD_TabCausaliMag_CDG_Raggruppamenti ON STORICOMAG.CODCAUSALE = ALD_TabCausaliMag_CDG_Raggruppamenti.CODCausale
--WHERE     (STORICOMAG.ESERCIZIO = 2018)
--order by CODART, CODCAUSALE

GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_EstrazioneMovMag_CDG_Raggruppate] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_EstrazioneMovMag_CDG_Raggruppate] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_EstrazioneMovMag_CDG_Raggruppate] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_EstrazioneMovMag_CDG_Raggruppate] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_EstrazioneMovMag_CDG_Raggruppate] TO [Metodo98]
    AS [dbo];

