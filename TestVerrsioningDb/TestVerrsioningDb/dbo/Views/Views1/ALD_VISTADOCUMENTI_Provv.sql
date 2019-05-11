﻿


/******************************
Autore: Sara
Data: 14-6-2018
Usato da: lqprvg90.rpt
Commessa: Punto 155
Descrizione: 

Parametri: 
Modifiche (chi, quando, cosa):
Sabrina, dt 25.10.2018
integrazione campi per Sicura traccia tombale Provvigioni Agenti
*******************************/

CREATE VIEW [dbo].[ALD_VISTADOCUMENTI_Provv] AS 
 SELECT
    TD.PROGRESSIVO as IDTESTA,TD.ESERCIZIO,
    TD.TIPODOC,TD.NUMERODOC,TD.BIS,TD.DATADOC,
    TD.CODAGENTE1,
    TD.PRCPROVVAG1,TD.PRCPROVVFINALEAG1,
    RD.IDRIGA as PROGRIGADOC,RD.POSIZIONE,
    RD.TIPORIGA,
    RD.CODART,RD.DESCRIZIONEART,
    RD.UMGEST,
    RD.PROVVAG1,RD.RIFCOMMCLI,
    RD.PREZZOUNITNETTOEURO,
    RD.PREZZOUNITLORDOEURO,
    TD.TOTPROVVAGEURO1*TD.SEGNO as TOTPROVVFINALEAG1EURO,
    TD.TOTIMPONIBILEEURO*TD.SEGNO AS TOTIMPONIBILEEURO,
    (CASE WHEN RD.TIPORIGA='V' THEN 0 ELSE RD.QTAGEST*TD.SEGNO END) as QTAGEST,
    RD.TOTNETTORIGAEURO*TD.SEGNO as TOTNETTORIGAEURO,
    RD.TOTPROVVAGEURO1*TD.SEGNO as TOTPROVVAG1EURO,
	(case when PD.TIPO='F' then 'fattura' when   PD.TIPO='N' then 'Nota accredito' END) as NaturaDoc
	--Sabrina, 25.10.2018 per traccia tobale provvigioni agenti
	, td.ANNOTAZIONI
FROM
TESTEDOCUMENTI as TD join RIGHEDOCUMENTI as RD on TD.PROGRESSIVO=RD.IDTESTA
join PARAMETRIDOC as PD  on TD.TIPODOC = PD.CODICE
WHERE RD.TIPORIGA='N'






GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_VISTADOCUMENTI_Provv] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_VISTADOCUMENTI_Provv] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_VISTADOCUMENTI_Provv] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_VISTADOCUMENTI_Provv] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_VISTADOCUMENTI_Provv] TO [Metodo98]
    AS [dbo];
