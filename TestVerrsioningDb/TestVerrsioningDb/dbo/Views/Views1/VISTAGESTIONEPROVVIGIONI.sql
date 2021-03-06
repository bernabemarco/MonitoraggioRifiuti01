﻿
CREATE VIEW VISTAGESTIONEPROVVIGIONI AS
        SELECT TP.PROGRESSIVO,
        TP.CODAGENTE,
        TP.CODGRUPPOPROVCF,
        TP.CODCLIENTE,
        TP.CODGRUPPOPROVMAG,
        TP.CODARTICOLO,
        TP.INIZIOVALIDITA,
        TP.FINEVALIDITA,
        TP.CODARTRIC,
        RP.PROVVIGIONE,
        RP.DASCONTO,
        RP.DAIMPORTO,
        RP.DAIMPORTOEURO,
        RP.DAQTA,
        RP.DAFATTURATO,
        RP.DAFATTURATOEURO,
        RP.PROVVAGG,
        (CASE WHEN CHARINDEX('#',TP.CODARTICOLO)>0 THEN SUBSTRING(TP.CODARTICOLO,1,CHARINDEX('#',TP.CODARTICOLO)-1) ELSE TP.CODARTICOLO END)  AS CODPADRE,
        (SELECT DESCRIZIONE FROM ANAGRAFICAARTICOLI WHERE CODICE=TP.CODARTICOLO) AS DSCA,
        (CASE WHEN (SELECT DESCRIZIONE FROM ANAGRAFICAARTICOLI WHERE CODICE=TP.CODARTICOLO) IS NULL THEN (SELECT DESCRIZIONE FROM ANAGRAFICAARTICOLI WHERE CODICE=(CASE WHEN CHARINDEX('#',TP.CODARTICOLO)>0 THEN SUBSTRING(TP.CODARTICOLO,1,CHARINDEX('#',TP.CODARTICOLO)-1) ELSE TP.CODARTICOLO END) ) ELSE (SELECT DESCRIZIONE FROM ANAGRAFICAARTICOLI WHERE CODICE=TP.CODARTICOLO) END)  AS DSCARTICOLO,
        (SELECT DSCAGENTE FROM ANAGRAFICAAGENTI WHERE CODAGENTE=TP.CODAGENTE) AS DSCAGENTE,
        (SELECT DSCCONTO1 FROM ANAGRAFICACF WHERE CODCONTO=TP.CODCLIENTE) AS RAGSOC,
        (CASE WHEN (SELECT DSCCONTO1 FROM ANAGRAFICACF WHERE CODCONTO=TP.CODCLIENTE) IS NULL THEN 'TUTTI I CLIENTI' ELSE (SELECT DSCCONTO1 FROM ANAGRAFICACF WHERE CODCONTO=TP.CODCLIENTE) END)  AS DSCCONTO,
        (SELECT DESCRIZIONE FROM TABRAGGRPROVVIGIONICF WHERE CODICE=TP.CODGRUPPOPROVCF) AS DSCCATEGORIA,
        (SELECT DESCRIZIONE FROM TABRAGGRUPPAPROVVIGIONI WHERE CODICE=TP.CODGRUPPOPROVMAG) AS DSCGRUPPO
        FROM TABPROVVIGIONI TP, RIGHEPROVVIGIONI RP
        WHERE (TP.PROGRESSIVO=RP.RIFPROGRESSIVO)

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTAGESTIONEPROVVIGIONI] TO [Metodo98]
    AS [dbo];

