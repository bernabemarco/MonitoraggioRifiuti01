﻿

CREATE VIEW VISTA_TRASPORTO_ACQ_COSTI AS

    select TACQ.PROGRESSIVO,TACQ.ESERCIZIO,TACQ.NRREGISTRAZIONE,TACQ.DATA,TACQ.CODSPEDIZ,TACQ.CODDEPOSITO,
           TACQ.CAMIONNR,TACQ.CAMIONCOSTO,TACQ.CAMIONTOTALE,TACQ.PEDANANR,TACQ.PEDANACOSTO,
           TACQ.PEDANATOTALE,TACQ.TOTALEKG,TACQ.COSTOTRASPORTOTOT,TACQ.COSTOTRASPORTOMEDIOKG,
           TDETTACQ.TIPODOC,TDETTACQ.NUMERODOC,
           (SELECT CODCLIFOR FROM TESTEDOCUMENTI TD WHERE TD.ESERCIZIO = TDETTACQ.ESERCIZIO AND TD.TIPODOC = TDETTACQ.TIPODOC AND TD.NUMERODOC = TDETTACQ.NUMERODOC) AS CODCLIFOR,
           (SELECT DATADOC FROM TESTEDOCUMENTI TD WHERE TD.ESERCIZIO = TDETTACQ.ESERCIZIO AND TD.TIPODOC = TDETTACQ.TIPODOC AND TD.NUMERODOC = TDETTACQ.NUMERODOC) AS DATADOC,
           (SELECT DATARIFDOC FROM TESTEDOCUMENTI TD WHERE TD.ESERCIZIO = TDETTACQ.ESERCIZIO AND TD.TIPODOC = TDETTACQ.TIPODOC AND TD.NUMERODOC = TDETTACQ.NUMERODOC) AS DATARIFDOC,            
           (SELECT NUMRIFDOC FROM TESTEDOCUMENTI TD WHERE TD.ESERCIZIO = TDETTACQ.ESERCIZIO AND TD.TIPODOC = TDETTACQ.TIPODOC AND TD.NUMERODOC = TDETTACQ.NUMERODOC) AS NUMRIFDOC,
           (SELECT BIS FROM TESTEDOCUMENTI TD WHERE TD.ESERCIZIO = TDETTACQ.ESERCIZIO AND TD.TIPODOC = TDETTACQ.TIPODOC AND TD.NUMERODOC = TDETTACQ.NUMERODOC) AS BIS,
           TDETTACQ.TOTALEKG AS TOTALEKG_DOC,TDETTACQ.PEDANENR AS PEDANENR_DOC,TDETTACQ.PEDANECOSTO AS PEDANECOSTO_DOC,
           TDETTACQ.PEDANECOSTOTOTALE AS PEDANECOSTOTOTALE_DOC,TDETTACQ.PEDANECOSTOXFORNITORE AS PEDANECOSTOXFORNITORE_DOC,
           TDETTACQ.COSTOXKG AS COSTOXKG_DOC,
           DETT.CODART,(SELECT DESCRIZIONE FROM ANAGRAFICAARTICOLI AA WHERE AA.CODICE=DETT.CODART) AS DSCART, 
           DETT.NRRIFPARTITA,DETT.TOTALEPEZZI AS TOTALEPEZZI_DETT,DETT.TOTALEPESO AS TOTALEPESO_DETT,
           DETT.TOTALEPEDANA AS TOTALEPEDANA_DETT,DETT.COSTOPEDANA AS COSTOPEDANA_DETT,DETT.COSTOPEZZOXPEDANA AS COSTOPEZZOXPEDANA_DETT,
           DETT.COSTOPEZZOXKG AS COSTOPEZZOXKG_DETT,
           DETTART.CODART AS CODART_ART,(SELECT DESCRIZIONE FROM ANAGRAFICAARTICOLI AA WHERE AA.CODICE=DETTART.CODART) AS DSCART_ART, 
           DETTART.TOTALEPEZZI AS TOTALEPEZZI_ART,DETTART.TOTALEPESO AS TOTALEPESO_ART,
           DETTART.TOTALEPEDANA AS TOTALEPEDANA_ART,DETTART.COSTOPEDANA AS COSTOPEDANA_ART,DETTART.COSTOPEZZOXPEDANA AS COSTOPEZZOXPEDANA_ART,
           DETTART.COSTOPEZZOXKG AS COSTOPEZZOXKG_ART
    from TP_TRASPORTOACQ TACQ inner join 
         TP_TRASPORTODETTAGLIOACQ TDETTACQ ON TACQ.PROGRESSIVO = TDETTACQ.RIFPROGRESSIVO 
         left join
         TP_TRASPORTOTOTALEARTICOLOLOTTO DETT ON 
         TACQ.PROGRESSIVO = DETT.RIFPROGRESSIVO AND  
         TDETTACQ.ESERCIZIO = DETT.ESERCIZIO AND  
         TDETTACQ.TIPODOC = DETT.TIPODOC AND
         TDETTACQ.NUMERODOC = DETT.NUMERODOC
         left join 
         TP_TRASPORTOTOTALEARTICOLO DETTART ON 
         TACQ.PROGRESSIVO = DETTART.RIFPROGRESSIVO AND  
         TDETTACQ.ESERCIZIO = DETTART.ESERCIZIO AND  
         TDETTACQ.TIPODOC = DETTART.TIPODOC AND
         TDETTACQ.NUMERODOC = DETTART.NUMERODOC AND
         DETT.CODART=DETTART.CODART
 
   


GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTA_TRASPORTO_ACQ_COSTI] TO [Metodo98]
    AS [dbo];
