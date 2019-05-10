﻿

CREATE VIEW CCT_View_Tmp_ListaArchiviazioni AS

  select TMP.IDSESSIONE,
         VLA.*  
  from CCT_TMP_ELABORAZIONI TMP
  inner join CCT_View_ListaArchiviazioni VLA 
  on  TMP.PROGRESSIVO = VLA.PROGRESSIVO AND TMP.RIFERIMENTO = VLA.RIFERIMENTO AND TMP.TIPOLOGIASERVIZI = VLA.TIPOLOGIASERVIZI



GO
GRANT SELECT
    ON OBJECT::[dbo].[CCT_View_Tmp_ListaArchiviazioni] TO [Metodo98]
    AS [dbo];

