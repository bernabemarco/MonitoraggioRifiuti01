﻿

CREATE VIEW VISTASTAMPAFIDODIVNAZ AS
SELECT TIPOCONTO,ACF.CODCONTO,DSCCONTO1,DSCCONTO2,CODNAZIONE,
    (SELECT SUM(IMPORTOSCADLIRE) FROM VISTASCADENZE WHERE (CASE WHEN PF.ESCLUDIOMAGGI=1 THEN NUMSCAD ELSE 1 END)<>-1 AND CODCLIFOR=ACF.CODCONTO AND ESITO=0 AND (TIPOEFFETTO NOT IN (SELECT TIPOEFF FROM ESCLUDIEFF_FIDO WHERE ESERCIZIO=(SELECT ESERCIZIOATTIVO FROM TABUTENTI WHERE USERDB = CAST(USER_NAME() AS VARCHAR(25))) AND ESITO=0)) AND DATAFATTURA>=(CASE WHEN NOT ARCF.DATAINIZIOCALCOLOFIDO IS NULL THEN ARCF.DATAINIZIOCALCOLOFIDO ELSE PF.DATAINIZCALC END)) AS TOTESITO0,
    (SELECT SUM(IMPORTOSCADLIRE) FROM VISTASCADENZE WHERE (CASE WHEN PF.ESCLUDIOMAGGI=1 THEN NUMSCAD ELSE 1 END)<>-1 AND CODCLIFOR=ACF.CODCONTO AND ESITO=1 AND (TIPOEFFETTO NOT IN (SELECT TIPOEFF FROM ESCLUDIEFF_FIDO WHERE ESERCIZIO=(SELECT ESERCIZIOATTIVO FROM TABUTENTI WHERE USERDB = CAST(USER_NAME() AS VARCHAR(25))) AND ESITO=1)) AND DATAFATTURA>=(CASE WHEN NOT ARCF.DATAINIZIOCALCOLOFIDO IS NULL THEN ARCF.DATAINIZIOCALCOLOFIDO ELSE PF.DATAINIZCALC END)) AS TOTESITO1,
    (SELECT SUM(IMPORTOSCADLIRE) FROM VISTASCADENZE WHERE (CASE WHEN PF.ESCLUDIOMAGGI=1 THEN NUMSCAD ELSE 1 END)<>-1 AND CODCLIFOR=ACF.CODCONTO AND ESITO=2 AND (TIPOEFFETTO NOT IN (SELECT TIPOEFF FROM ESCLUDIEFF_FIDO WHERE ESERCIZIO=(SELECT ESERCIZIOATTIVO FROM TABUTENTI WHERE USERDB = CAST(USER_NAME() AS VARCHAR(25))) AND ESITO=2)) AND DATAFATTURA>=(CASE WHEN NOT ARCF.DATAINIZIOCALCOLOFIDO IS NULL THEN ARCF.DATAINIZIOCALCOLOFIDO ELSE PF.DATAINIZCALC END)) AS TOTESITO2,
    (SELECT SUM(IMPORTOSCADLIRE) FROM VISTASCADENZE WHERE (CASE WHEN PF.ESCLUDIOMAGGI=1 THEN NUMSCAD ELSE 1 END)<>-1 AND CODCLIFOR=ACF.CODCONTO AND ESITO=3 AND (TIPOEFFETTO NOT IN (SELECT TIPOEFF FROM ESCLUDIEFF_FIDO WHERE ESERCIZIO=(SELECT ESERCIZIOATTIVO FROM TABUTENTI WHERE USERDB = CAST(USER_NAME() AS VARCHAR(25))) AND ESITO=3)) AND DATAFATTURA>=(CASE WHEN NOT ARCF.DATAINIZIOCALCOLOFIDO IS NULL THEN ARCF.DATAINIZIOCALCOLOFIDO ELSE PF.DATAINIZCALC END)) AS TOTESITO3,
    (SELECT SUM(IMPORTOSCADLIRE) FROM VISTASCADENZE WHERE (CASE WHEN PF.ESCLUDIOMAGGI=1 THEN NUMSCAD ELSE 1 END)<>-1 AND CODCLIFOR=ACF.CODCONTO AND ESITO=4 AND (TIPOEFFETTO NOT IN (SELECT TIPOEFF FROM ESCLUDIEFF_FIDO WHERE ESERCIZIO=(SELECT ESERCIZIOATTIVO FROM TABUTENTI WHERE USERDB = CAST(USER_NAME() AS VARCHAR(25))) AND ESITO=4)) AND DATAFATTURA>=(CASE WHEN NOT ARCF.DATAINIZIOCALCOLOFIDO IS NULL THEN ARCF.DATAINIZIOCALCOLOFIDO ELSE PF.DATAINIZCALC END)) AS TOTESITO4,
    (SELECT (CASE WHEN PF.ESCLUDIOMAGGI=1 THEN (SUM(TOTIMPONIBILEEURORES)+SUM(TOTIMPOSTAEURORES)-SUM(TOTOMAGGIEURORES)) ELSE (SUM(TOTIMPONIBILEEURORES)+SUM(TOTIMPOSTAEURORES)) END)*(SELECT CAMBIOEURO FROM TABCAMBI WHERE CODICE=0) FROM TESTEDOCUMENTI WHERE CODCLIFOR=ACF.CODCONTO AND DOCCHIUSO=0 AND (TESTEDOCUMENTI.TIPODOC NOT IN (SELECT CODDOC FROM ESCLUDIDOC_FIDO WHERE ESERCIZIO=(SELECT ESERCIZIOATTIVO FROM TABUTENTI WHERE USERDB = CAST(USER_NAME() AS VARCHAR(25))))) AND (SELECT TIPO FROM PARAMETRIDOC WHERE CODICE=TIPODOC)='B' AND DATADOC>=(CASE WHEN NOT ARCF.DATAINIZIOCALCOLOFIDO IS NULL THEN ARCF.DATAINIZIOCALCOLOFIDO ELSE PF.DATAINIZCALC END)) AS TOTBOLLE,
    (SELECT (CASE WHEN PF.ESCLUDIOMAGGI=1 THEN (SUM(TOTIMPONIBILEEURORES)+SUM(TOTIMPOSTAEURORES)-SUM(TOTOMAGGIEURORES)) ELSE (SUM(TOTIMPONIBILEEURORES)+SUM(TOTIMPOSTAEURORES)) END)*(SELECT CAMBIOEURO FROM TABCAMBI WHERE CODICE=0) FROM TESTEDOCUMENTI WHERE CODCLIFOR=ACF.CODCONTO AND DOCCHIUSO=0 AND (TESTEDOCUMENTI.TIPODOC NOT IN (SELECT CODDOC FROM ESCLUDIDOC_FIDO WHERE ESERCIZIO=(SELECT ESERCIZIOATTIVO FROM TABUTENTI WHERE USERDB = CAST(USER_NAME() AS VARCHAR(25))))) AND (SELECT TIPO FROM PARAMETRIDOC WHERE CODICE=TIPODOC)='F' AND DATADOC>=(CASE WHEN NOT ARCF.DATAINIZIOCALCOLOFIDO IS NULL THEN ARCF.DATAINIZIOCALCOLOFIDO ELSE PF.DATAINIZCALC END)) AS TOTFATTURE,
    (SELECT (CASE WHEN PF.ESCLUDIOMAGGI=1 THEN (SUM(TOTIMPONIBILEEURORES)+SUM(TOTIMPOSTAEURORES)-SUM(TOTOMAGGIEURORES)) ELSE (SUM(TOTIMPONIBILEEURORES)+SUM(TOTIMPOSTAEURORES)) END)*(SELECT CAMBIOEURO FROM TABCAMBI WHERE CODICE=0) FROM TESTEDOCUMENTI WHERE CODCLIFOR=ACF.CODCONTO AND DOCCHIUSO=0 AND (TESTEDOCUMENTI.TIPODOC NOT IN (SELECT CODDOC FROM ESCLUDIDOC_FIDO WHERE ESERCIZIO=(SELECT ESERCIZIOATTIVO FROM TABUTENTI WHERE USERDB = CAST(USER_NAME() AS VARCHAR(25))))) AND (SELECT TIPO FROM PARAMETRIDOC WHERE CODICE=TIPODOC)='O' AND DATADOC>=(CASE WHEN NOT ARCF.DATAINIZIOCALCOLOFIDO IS NULL THEN ARCF.DATAINIZIOCALCOLOFIDO ELSE PF.DATAINIZCALC END)) AS TOTORDINI,
    (SELECT (CASE WHEN PF.ESCLUDIOMAGGI=1 THEN (SUM(TOTIMPONIBILEEURORES)+SUM(TOTIMPOSTAEURORES)-SUM(TOTOMAGGIEURORES)) ELSE (SUM(TOTIMPONIBILEEURORES)+SUM(TOTIMPOSTAEURORES)) END)*(SELECT CAMBIOEURO FROM TABCAMBI WHERE CODICE=0) FROM TESTEDOCUMENTI WHERE CODCLIFOR=ACF.CODCONTO AND DOCCHIUSO=0 AND (TESTEDOCUMENTI.TIPODOC NOT IN (SELECT CODDOC FROM ESCLUDIDOC_FIDO WHERE ESERCIZIO=(SELECT ESERCIZIOATTIVO FROM TABUTENTI WHERE USERDB = CAST(USER_NAME() AS VARCHAR(25))))) AND (SELECT TIPO FROM PARAMETRIDOC WHERE CODICE=TIPODOC)='N' AND DATADOC>=(CASE WHEN NOT ARCF.DATAINIZIOCALCOLOFIDO IS NULL THEN ARCF.DATAINIZIOCALCOLOFIDO ELSE PF.DATAINIZCALC END)) AS TOTNOTEACC,
    (SELECT (CASE WHEN PF.ESCLUDIOMAGGI=1 THEN (SUM(TOTIMPONIBILEEURORES)+SUM(TOTIMPOSTAEURORES)-SUM(TOTOMAGGIEURORES)) ELSE (SUM(TOTIMPONIBILEEURORES)+SUM(TOTIMPOSTAEURORES)) END)*(SELECT CAMBIOEURO FROM TABCAMBI WHERE CODICE=0) FROM TESTEDOCUMENTI WHERE CODCLIFOR=ACF.CODCONTO AND DOCCHIUSO=0 AND (TESTEDOCUMENTI.TIPODOC NOT IN (SELECT CODDOC FROM ESCLUDIDOC_FIDO WHERE ESERCIZIO=(SELECT ESERCIZIOATTIVO FROM TABUTENTI WHERE USERDB = CAST(USER_NAME() AS VARCHAR(25))))) AND (SELECT TIPO FROM PARAMETRIDOC WHERE CODICE=TIPODOC)='A' AND DATADOC>=(CASE WHEN NOT ARCF.DATAINIZIOCALCOLOFIDO IS NULL THEN ARCF.DATAINIZIOCALCOLOFIDO ELSE PF.DATAINIZCALC END)) AS TOTALTRO,
    (SELECT (CASE WHEN PF.ESCLUDIOMAGGI=1 THEN (SUM(TOTIMPONIBILEEURORES)+SUM(TOTIMPOSTAEURORES)-SUM(TOTOMAGGIEURORES)) ELSE (SUM(TOTIMPONIBILEEURORES)+SUM(TOTIMPOSTAEURORES)) END)*(SELECT CAMBIOEURO FROM TABCAMBI WHERE CODICE=0) FROM TESTEDOCUMENTI WHERE CODCFFATT=ACF.CODCONTO AND DOCCHIUSO=0 AND (TESTEDOCUMENTI.TIPODOC NOT IN (SELECT CODDOC FROM ESCLUDIDOC_FIDO WHERE ESERCIZIO=(SELECT ESERCIZIOATTIVO FROM TABUTENTI WHERE USERDB = CAST(USER_NAME() AS VARCHAR(25))))) AND (SELECT TIPO FROM PARAMETRIDOC WHERE CODICE=TIPODOC)='B' AND DATADOC>=(CASE WHEN NOT ARCF.DATAINIZIOCALCOLOFIDO IS NULL THEN ARCF.DATAINIZIOCALCOLOFIDO ELSE PF.DATAINIZCALC END)) AS TOTBOLLECF,
    (SELECT (CASE WHEN PF.ESCLUDIOMAGGI=1 THEN (SUM(TOTIMPONIBILEEURORES)+SUM(TOTIMPOSTAEURORES)-SUM(TOTOMAGGIEURORES)) ELSE (SUM(TOTIMPONIBILEEURORES)+SUM(TOTIMPOSTAEURORES)) END)*(SELECT CAMBIOEURO FROM TABCAMBI WHERE CODICE=0) FROM TESTEDOCUMENTI WHERE CODCFFATT=ACF.CODCONTO AND DOCCHIUSO=0 AND (TESTEDOCUMENTI.TIPODOC NOT IN (SELECT CODDOC FROM ESCLUDIDOC_FIDO WHERE ESERCIZIO=(SELECT ESERCIZIOATTIVO FROM TABUTENTI WHERE USERDB = CAST(USER_NAME() AS VARCHAR(25))))) AND (SELECT TIPO FROM PARAMETRIDOC WHERE CODICE=TIPODOC)='F' AND DATADOC>=(CASE WHEN NOT ARCF.DATAINIZIOCALCOLOFIDO IS NULL THEN ARCF.DATAINIZIOCALCOLOFIDO ELSE PF.DATAINIZCALC END)) AS TOTFATTURECF,
    (SELECT (CASE WHEN PF.ESCLUDIOMAGGI=1 THEN (SUM(TOTIMPONIBILEEURORES)+SUM(TOTIMPOSTAEURORES)-SUM(TOTOMAGGIEURORES)) ELSE (SUM(TOTIMPONIBILEEURORES)+SUM(TOTIMPOSTAEURORES)) END)*(SELECT CAMBIOEURO FROM TABCAMBI WHERE CODICE=0) FROM TESTEDOCUMENTI WHERE CODCFFATT=ACF.CODCONTO AND DOCCHIUSO=0 AND (TESTEDOCUMENTI.TIPODOC NOT IN (SELECT CODDOC FROM ESCLUDIDOC_FIDO WHERE ESERCIZIO=(SELECT ESERCIZIOATTIVO FROM TABUTENTI WHERE USERDB = CAST(USER_NAME() AS VARCHAR(25))))) AND (SELECT TIPO FROM PARAMETRIDOC WHERE CODICE=TIPODOC)='O' AND DATADOC>=(CASE WHEN NOT ARCF.DATAINIZIOCALCOLOFIDO IS NULL THEN ARCF.DATAINIZIOCALCOLOFIDO ELSE PF.DATAINIZCALC END)) AS TOTORDINICF,
    (SELECT (CASE WHEN PF.ESCLUDIOMAGGI=1 THEN (SUM(TOTIMPONIBILEEURORES)+SUM(TOTIMPOSTAEURORES)-SUM(TOTOMAGGIEURORES)) ELSE (SUM(TOTIMPONIBILEEURORES)+SUM(TOTIMPOSTAEURORES)) END)*(SELECT CAMBIOEURO FROM TABCAMBI WHERE CODICE=0) FROM TESTEDOCUMENTI WHERE CODCFFATT=ACF.CODCONTO AND DOCCHIUSO=0 AND (TESTEDOCUMENTI.TIPODOC NOT IN (SELECT CODDOC FROM ESCLUDIDOC_FIDO WHERE ESERCIZIO=(SELECT ESERCIZIOATTIVO FROM TABUTENTI WHERE USERDB = CAST(USER_NAME() AS VARCHAR(25))))) AND (SELECT TIPO FROM PARAMETRIDOC WHERE CODICE=TIPODOC)='N' AND DATADOC>=(CASE WHEN NOT ARCF.DATAINIZIOCALCOLOFIDO IS NULL THEN ARCF.DATAINIZIOCALCOLOFIDO ELSE PF.DATAINIZCALC END)) AS TOTNOTEACCF,
    (SELECT (CASE WHEN PF.ESCLUDIOMAGGI=1 THEN (SUM(TOTIMPONIBILEEURORES)+SUM(TOTIMPOSTAEURORES)-SUM(TOTOMAGGIEURORES)) ELSE (SUM(TOTIMPONIBILEEURORES)+SUM(TOTIMPOSTAEURORES)) END)*(SELECT CAMBIOEURO FROM TABCAMBI WHERE CODICE=0) FROM TESTEDOCUMENTI WHERE CODCFFATT=ACF.CODCONTO AND DOCCHIUSO=0 AND (TESTEDOCUMENTI.TIPODOC NOT IN (SELECT CODDOC FROM ESCLUDIDOC_FIDO WHERE ESERCIZIO=(SELECT ESERCIZIOATTIVO FROM TABUTENTI WHERE USERDB = CAST(USER_NAME() AS VARCHAR(25))))) AND (SELECT TIPO FROM PARAMETRIDOC WHERE CODICE=TIPODOC)='A' AND DATADOC>=(CASE WHEN NOT ARCF.DATAINIZIOCALCOLOFIDO IS NULL THEN ARCF.DATAINIZIOCALCOLOFIDO ELSE PF.DATAINIZCALC END)) AS TOTALTROCF,
    PF.PERCESITO0 AS PERCESITO0,
    PF.PERCESITO1 AS PERCESITO1,
    PF.PERCESITO2 AS PERCESITO2,
    PF.PERCESITO3 AS PERCESITO3,
    PF.PERCESITO4 AS PERCESITO4
FROM 
    ANAGRAFICACF ACF LEFT OUTER JOIN ANAGRAFICARISERVATICF ARCF ON ARCF.CODCONTO=ACF.CODCONTO AND ARCF.ESERCIZIO=(SELECT ESERCIZIOATTIVO FROM TABUTENTI WHERE USERDB = CAST(USER_NAME() AS VARCHAR(25)))
    LEFT OUTER JOIN PARAMETRIFIDO PF ON PF.ESERCIZIO=(SELECT ESERCIZIOATTIVO FROM TABUTENTI WHERE USERDB = CAST(USER_NAME() AS VARCHAR(25)))

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTASTAMPAFIDODIVNAZ] TO [Metodo98]
    AS [dbo];

