


CREATE PROCEDURE [dbo].[MB_SET_Dettaglio_Tipologie]

AS

    DELETE FROM  MB_Dettaglio_Tipologie
     
    MERGE dbo.MB_Dettaglio_Tipologie AS target
     USING (SELECT     IDTESTADOC, IDRIGADOC, COD, ValoreVenduto, ValoreAcquistato, Qtatax, QTAUM, Tipo
            FROM  VISTA_MB_Righe_Tipologie 
     ) AS Source (IDTESTADOC, IDRIGADOC, COD, ValoreVenduto, ValoreAcquistato, Qtatax, QTAUM, Tipo)
    
    ON target.Idtesta = Source.IDTESTADOC 
    AND target.Idriga = Source.Idrigadoc 
       AND TARGET.cod = Source.cod
    WHEN NOT  MATCHED BY TARGET THEN
        INSERT (  IDTESTA, IDRIGA, COD, ValoreVenduto, ValoreAcquistato, Qtatax, QTAUM, Tipo)
        VALUES (Source.IDTESTADOC, Source.IDRIGADOC, Source.COD, Source.ValoreVenduto, Source.ValoreAcquistato, Source.Qtatax, Source.QTAUM, Source.Tipo)
    
    --WHEN MATCHED THEN
    --  UPDATE SET ValoreVEnduto = Source.ValoreVenduto, 
    --   ValoreAcquistato=Source.ValoreAcquistato, Qtatax=Source.Qtatax, QTAUM=Source.QTAUM, Tipo=Source.Tipo
    WHEN NOT MATCHED BY SOURCE THEN
        DELETE    
          ;


RETURN 0 

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[MB_SET_Dettaglio_Tipologie] TO [Metodo98]
    AS [dbo];

