﻿

CREATE VIEW [dbo].[Ald_VistaTesteDocumenti_ConteggiEmissione]
AS
SELECT VISTATESTEDOC.*, ANAGRAFICARISERVATICF.STATOCONTABILITA, ANAGRAFICARISERVATICF.STATOMAGAZZINO, 
 ANAGRAFICARISERVATICF.STATOORDINI, ANAGRAFICARISERVATICF.STATOBOLLE, ANAGRAFICARISERVATICF.STATOFATTURE, 
 ANAGRAFICARISERVATICF.STATONOTEACCREDITO, ANAGRAFICARISERVATICF.STATOALTRO
 , 
 (SELECT     TOP (1) Tut.DESCRIZIONE
FROM         Ald_StoricoModificheDataDoc AS DocSto INNER JOIN
                      TABUTENTI AS Tut ON DocSto.UTENTEMODIFICA = Tut.USERID where Docsto.Idtesta=VISTATESTEDOC.PROGRESSIVO) as UtenteCreazioneDoc
FROM ANAGRAFICARISERVATICF INNER JOIN
 VISTATESTEDOC ON ANAGRAFICARISERVATICF.ESERCIZIO = VISTATESTEDOC.ESERCIZIO AND 
 ANAGRAFICARISERVATICF.CODCONTO = VISTATESTEDOC.CODCLIFOR


GO
GRANT SELECT
    ON OBJECT::[dbo].[Ald_VistaTesteDocumenti_ConteggiEmissione] TO [Metodo98]
    AS [dbo];

