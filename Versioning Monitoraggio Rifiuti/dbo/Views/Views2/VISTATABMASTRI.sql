﻿CREATE VIEW VISTATABMASTRI AS
        SELECT TABMASTRI.CODICE, TABMASTRI.DESCRIZIONE, TABMASTRI.TIPO, 
        TABMASTRI.NOTE, TABMASTRI.DATAINIVALIDITA, 
        TABMASTRI.DATAFINEVALIDITA, TABMASTRI.UTENTEMODIFICA, 
        TABMASTRI.DATAMODIFICA
        FROM TABMASTRI, TABESERCIZI
        WHERE TABMASTRI.DATAFINEVALIDITA >= TABESERCIZI.DATAINICONT
        AND TABMASTRI.DATAINIVALIDITA <= TABESERCIZI.DATAFINECONT
        AND TABESERCIZI.CODICE = (SELECT ESERCIZIOATTIVO FROM TABUTENTI WHERE USERDB=CAST(USER_NAME() AS VARCHAR(25)))


GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTATABMASTRI] TO [Metodo98]
    AS [dbo];

