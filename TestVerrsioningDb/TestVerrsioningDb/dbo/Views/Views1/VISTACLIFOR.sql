﻿CREATE VIEW VISTACLIFOR AS
        SELECT AF.TIPOCONTO, AF.CODCONTO, AF.DSCCONTO1, AF.DSCCONTO2, AF.CODMASTRO, 
        AF.INDIRIZZO, AF.CAP, AF.LOCALITA, AF.PROVINCIA, AF.TELEFONO, AF.FAX, AF.TELEX, 
        AF.CODFISCALE, AF.PARTITAIVA, AF.CODNAZIONE, AF.CODICEISO, AF.CODLINGUA, AF.NOTE, 
        AF.UTENTEMODIFICA, AF.DATAMODIFICA, AF.CODREGIONE, AF.FLGBLACKLIST,RF.ESERCIZIO, RF.CODSETTORE,
        AF.FLGPERSFISICA,AF.DATANASCITAPERSFIS,AF.COMNASCITAPERSFIS,AF.PROVNASCITAPERSFIS,AF.COGNOMEPERSFIS,AF.NOMEPERSFIS,AF.SESSOPERSFIS,
        AF.CODSTATOESTERO,AF.STATOPROVCONTEA,AF.INDIRIZZOESTERO,AF.CODDEST_EDI,
        AF.TIPOPROFESSIONISTA,AF.TIPODOCRTACC,AF.FLGELENCOCF,AF.FLGSISTRI,AF.FLGQUALITY,
        AF.LUOGONASCITA, AF.VERSPRESSO, AF.INDIRIZZOINTERNET, AF.CODFISCALERITACC, AF.PARTITAIVARITACC, AF.CAPRITACC, AF.PROVINCIARITACC, 
        AF.LOCALITARITACC, AF.INDIRIZZORITACC, AF.ZONASPED, AF.DATANASCITA, AF.TIPOCLIENTEBUDGET, AF.CONSIDERABUDGET, AF.PERCORSODOCUMENTI,AF.FLGDOGANA,
        RF.CODZONA, RF.CODCATEGORIA, RF.CODSPED, RF.PRCTRASPORTO, RF.INOLTROTRASP, RF.CODPAG, 
        RF.MESEESCL1, RF.GGESCL1, RF.MESEESCL2, RF.GGESCL2,
        (SELECT CAB FROM BANCAAPPCF WHERE CODCONTO=RF.CODCONTO AND CODICE=BANCAANAGR) AS CAB, 
        (SELECT ABI FROM BANCAAPPCF WHERE CODCONTO=RF.CODCONTO AND CODICE=BANCAANAGR) AS ABI, 
        (SELECT CONTOCORRENTE FROM BANCAAPPCF WHERE CODCONTO=RF.CODCONTO AND CODICE=BANCAANAGR) AS CCDEBITORE, 
        RF.CODBANCA, 
        RF.BANCAANAGR, RF.CODAGENTE1, RF.CODAGENTE2, RF.CODAGENTE3, RF.PROVV1, RF.PROVV2, 
        RF.PROVV3, RF.SCONTO1, RF.CODIVA, RF.DICHESIVA, RF.LISTINO, RF.CODCAMBIO, 
        RF.DESTDIVMERCI, RF.DESTDIVDOCUMENTI, RF.SPESEDOCUM, RF.SPESEEFFETTO, 
        RF.SPESETRASPORTO, RF.SPESEIMBALLO, RF.FIDO, RF.FIDOEURO, RF.PORTO, 
        RF.TRASPACURA, RF.APPLSCONTORIGA, RF.APPLSCONTOFINALE, RF.CODCONTOFATT, 
        RF.FATTFINEMESE, RF.NONRAGGRUPPDOC, RF.CODDEPOSITO, 
        RF.CODDEPOSITOCOLL, RF.CODDEPCOMP, RF.CODDEPCOMPCOLL, RF.RIVIVAOMAGGI, 
        RF.NRCONTROPCONT, RF.USAPRZPRVPART, RF.CODDEBITORE, RF.NOTE1,
        RF.STATOCONTABILITA, RF.STATOMAGAZZINO,RF.STATOORDINI, RF.STATOBOLLE, RF.STATOFATTURE, RF.STATONOTEACCREDITO, RF.STATOALTRO,
        RF.CODGRUPPOPREZZIPART, RF.CODGRUPPOPROVPART,RF.RAGGSCADENZE,
        RF.EXPORTECOMMERCE, RF.USAPRZCOMMERCIALI,RF.PROGDICHINTENTO,RF.SPLITPAYMENT
FROM
        ANAGRAFICACF AF, ANAGRAFICARISERVATICF RF, TABUTENTI 
WHERE (AF.CODCONTO = RF.CODCONTO) AND (USERDB = CAST(USER_NAME() AS VARCHAR(25))) 
       AND RF.ESERCIZIO = ESERCIZIOATTIVO AND AF.TIPOCONTO IN('C','F')
       AND ((AF.CODCONTO=TABUTENTI.CODCLIFOR) OR (TABUTENTI.CODCLIFOR=''))

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTACLIFOR] TO [Metodo98]
    AS [dbo];

