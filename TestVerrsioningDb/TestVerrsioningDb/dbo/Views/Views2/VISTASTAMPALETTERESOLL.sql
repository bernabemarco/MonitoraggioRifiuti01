﻿
CREATE VIEW VISTASTAMPALETTERESOLL AS
SELECT TS.*,
   (CASE WHEN VCF.DESTDIVDOCUMENTI=0 THEN
      VCF.DSCCONTO1
   ELSE
      (SELECT RAGIONESOCIALE FROM DESTINAZIONIDIVERSE WHERE CODCONTO=TS.CODCLIFOR AND CODICE=VCF.DESTDIVDOCUMENTI) END) AS DSCCONTO1,
      
   (CASE WHEN VCF.DESTDIVDOCUMENTI=0 THEN
      VCF.DSCCONTO2
   ELSE
      '' END) AS DSCCONTO2,

   (CASE WHEN VCF.DESTDIVDOCUMENTI=0 THEN
      VCF.INDIRIZZO
   ELSE
      (SELECT INDIRIZZO FROM DESTINAZIONIDIVERSE WHERE CODCONTO=TS.CODCLIFOR AND CODICE=VCF.DESTDIVDOCUMENTI) END) AS INDIRIZZO,

   (CASE WHEN VCF.DESTDIVDOCUMENTI=0 THEN
      VCF.CAP
   ELSE
      (SELECT CAP FROM DESTINAZIONIDIVERSE WHERE CODCONTO=TS.CODCLIFOR AND CODICE=VCF.DESTDIVDOCUMENTI) END) AS CAP,

   (CASE WHEN VCF.DESTDIVDOCUMENTI=0 THEN
      VCF.LOCALITA
   ELSE
      (SELECT LOCALITA FROM DESTINAZIONIDIVERSE WHERE CODCONTO=TS.CODCLIFOR AND CODICE=VCF.DESTDIVDOCUMENTI) END) AS LOCALITA,

   (CASE WHEN VCF.DESTDIVDOCUMENTI=0 THEN
      VCF.PROVINCIA
   ELSE
      (SELECT PROVINCIA FROM DESTINAZIONIDIVERSE WHERE CODCONTO=TS.CODCLIFOR AND CODICE=VCF.DESTDIVDOCUMENTI) END) AS PROVINCIA,
   
   (SELECT RAGIONESOCIALE FROM DESTINAZIONIDIVERSE WHERE CODCONTO=TS.CODCLIFOR AND CODICE=VCF.DESTDIVDOCUMENTI) AS RAGSOCDD,
   '' AS RAGSOCDD2,
   (SELECT INDIRIZZO FROM DESTINAZIONIDIVERSE WHERE CODCONTO=TS.CODCLIFOR AND CODICE=VCF.DESTDIVDOCUMENTI) AS INDIRIZZODD,
   (SELECT CAP FROM DESTINAZIONIDIVERSE WHERE CODCONTO=TS.CODCLIFOR AND CODICE=VCF.DESTDIVDOCUMENTI) AS CAPDD,
   (SELECT LOCALITA FROM DESTINAZIONIDIVERSE WHERE CODCONTO=TS.CODCLIFOR AND CODICE=VCF.DESTDIVDOCUMENTI) AS LOCALITADD,
   (SELECT PROVINCIA FROM DESTINAZIONIDIVERSE WHERE CODCONTO=TS.CODCLIFOR AND CODICE=VCF.DESTDIVDOCUMENTI) AS PROVINCIADD,    
   VCF.FAX,
   VCF.TELEFONO,
   (SELECT DESCRIZIONE FROM TABPAGAMENTI WHERE TABPAGAMENTI.CODICE=TS.CODPAG) AS DSCPAG,
   (SELECT CODCONTORIF FROM ANAGRAFICABANCHE WHERE CODBANCA=TS.BANCAINC) AS CONTORIFBANCA,
   (SELECT DSCBANCA FROM ANAGRAFICABANCHE WHERE CODBANCA=TS.BANCAINC) AS DSCBANCA,
   (SELECT DESCRIZIONE FROM TIPIEFFETTI WHERE EFFETTO=TS.TIPOEFFETTO) AS DSCTIPOEFFETTO,
   (CASE WHEN TS.SCADATTPASS=1 THEN 1 ELSE -1 END) AS SEGNOATTPASS,
   (CASE WHEN ((TS.SCADATTPASS<>0 AND SUBSTRING(TS.CODCLIFOR,1,1)<>'C') OR(TS.SCADATTPASS=0 AND SUBSTRING(TS.CODCLIFOR,1,1)='C')) THEN(TS.IMPORTOSCLIT*-1) ELSE TS.IMPORTOSCLIT END) AS IMPORTOSCADLIRE,
   (CASE WHEN ((TS.SCADATTPASS<>0 AND SUBSTRING(TS.CODCLIFOR,1,1)<>'C') OR(TS.SCADATTPASS=0 AND SUBSTRING(TS.CODCLIFOR,1,1)='C')) THEN(TS.IMPORTOSCEURO*-1) ELSE TS.IMPORTOSCEURO END) AS IMPORTOSCADEURO,
   (CASE WHEN ((TS.SCADATTPASS<>0 AND SUBSTRING(TS.CODCLIFOR,1,1)<>'C') OR(TS.SCADATTPASS=0 AND SUBSTRING(TS.CODCLIFOR,1,1)='C')) THEN(TS.IMPORTOSCVAL*-1) ELSE TS.IMPORTOSCVAL END) AS IMPORTOSCADVALUTA,
   (CASE WHEN ((TS.SCADATTPASS<>0 AND SUBSTRING(TS.CODCLIFOR,1,1)<>'C') OR(TS.SCADATTPASS=0 AND SUBSTRING(TS.CODCLIFOR,1,1)='C')) THEN(TS.TOTFATTLIT*-1) ELSE TS.TOTFATTLIT END) AS TOTFATTURALIRE,
   (CASE WHEN ((TS.SCADATTPASS<>0 AND SUBSTRING(TS.CODCLIFOR,1,1)<>'C') OR(TS.SCADATTPASS=0 AND SUBSTRING(TS.CODCLIFOR,1,1)='C')) THEN(TS.TOTFATTEURO*-1) ELSE TS.TOTFATTEURO END) AS TOTFATTURAEURO,
   (CASE WHEN ((TS.SCADATTPASS<>0 AND SUBSTRING(TS.CODCLIFOR,1,1)<>'C') OR(TS.SCADATTPASS=0 AND SUBSTRING(TS.CODCLIFOR,1,1)='C')) THEN(TS.TOTFATTVAL*-1) ELSE TS.TOTFATTVAL END) AS TOTFATTURAVALUTA,
   (SELECT DSCAGENTE FROM ANAGRAFICAAGENTI WHERE CODAGENTE=CODAGE1) AS DSCAGENTE1,
   (SELECT DSCAGENTE FROM ANAGRAFICAAGENTI WHERE CODAGENTE=CODAGE2) AS DSCAGENTE2,
   (SELECT DSCAGENTE FROM ANAGRAFICAAGENTI WHERE CODAGENTE=CODAGE3) AS DSCAGENTE3,
   VCF.CODNAZIONE AS NAZIONE,
   VCF.CODSETTORE AS SETTORE,
   VCF.CODZONA AS ZONA,
   VCF.CODCATEGORIA AS CATEGORIA,
   (SELECT TIPO FROM TIPIEFFETTI WHERE EFFETTO=TS.TIPOEFFETTO) AS DSCEFFETTO,
   (SELECT DESCRIZIONE FROM ESITI WHERE ESITI.ESITO=TS.ESITO) AS DSCESITO,
   (SELECT DESCRIZIONE FROM TABNAZIONI WHERE CODICE=(SELECT CODNAZIONE FROM ANAGRAFICACF WHERE CODCONTO=TS.CODCLIFOR)) AS DSCNAZIONE,
   SUBSTRING('Attivi Passivi',(1-SCADATTPASS)*7+1,7) AS DESSCADATTPASS,
   SUBSTRING('01-GEN02-FEB03-MAR04-APR05-MAG06-GIU07-LUG08-AGO09-SET10-OTT11-NOV12-DIC',((MONTH(DATASCADENZA))-1)*6+1,6) AS MESE,
   (SELECT DIVISA FROM TABCAMBI WHERE CODICE=TS.CODCAMBIO) AS DIVISA
   FROM TABSCADENZE TS LEFT OUTER JOIN VISTACLIFOR VCF ON TS.CODCLIFOR=VCF.CODCONTO


GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTASTAMPALETTERESOLL] TO [Metodo98]
    AS [dbo];

