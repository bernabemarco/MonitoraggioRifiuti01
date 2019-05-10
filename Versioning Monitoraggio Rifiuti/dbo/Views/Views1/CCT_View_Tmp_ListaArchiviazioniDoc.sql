

CREATE VIEW [dbo].[CCT_View_Tmp_ListaArchiviazioniDoc] AS

  select TMP.IDSESSIONE,
         VLA.*  
  from CCT_TMP_ELABORAZIONIDOC TMP
  inner join CCT_View_ListaArchiviazioniDocumenti VLA 
  on  TMP.PROGRESSIVO = VLA.PROGRESSIVO AND TMP.RIFERIMENTO = VLA.RIFERIMENTO AND TMP.TIPOLOGIASERVIZI = VLA.TIPOLOGIASERVIZI


GO
GRANT SELECT
    ON OBJECT::[dbo].[CCT_View_Tmp_ListaArchiviazioniDoc] TO [Metodo98]
    AS [dbo];

