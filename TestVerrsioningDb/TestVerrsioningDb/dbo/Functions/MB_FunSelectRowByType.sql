﻿

CREATE FUNCTION [dbo].[MB_FunSelectRowByType](@IdSessione DECIMAL(5,0))

RETURNS TABLE 
AS RETURN

(
	SELECT
		@IdSessione AS IDSESSIONE,
		DAT_BASE_CONVERTITI.RAGGRUPPAMENTO,
		DAT_BASE_CONVERTITI.TIPO,
		DAT_BASE_CONVERTITI.IDTESTA As IDTestaDoc,
		DAT_BASE_CONVERTITI.IDRIGA As IDRigaDoc,
		DAT_BASE_CONVERTITI.TOTLORDORIGAEURO As ValoreLordoRiga,
		DAT_BASE_CONVERTITI.TOTNETTORIGAEURO As ValoreNettoRiga,
		ISNULL(DAT_BASE_CONVERTITI.ValoreAcquistato,0) AS ValoreAcquistato,
		ISNULL(TTCAA.COSTOMEDIOPEZZOXKG,0) AS ValoreTrasporto,
		DAT_BASE_CONVERTITI.QTAPREZZO As QtaOrigine,
		DAT_BASE_CONVERTITI.QtaConv1,
		DAT_BASE_CONVERTITI.QtaConv2,
		DAT_BASE_CONVERTITI.UMPREZZO As UmOrigine,
		DAT_BASE_CONVERTITI.UmConv1,
		DAT_BASE_CONVERTITI.UmConv2,
		DAT_BASE_CONVERTITI.SCONTORIGA
	FROM
	(
		SELECT
			DATI_BASE.CODART,
			DATI_BASE.CODDEPOSITO,
			DATI_BASE.NRRIFPARTITA,
			DATI_BASE.RAGGRUPPAMENTO,
			DATI_BASE.TIPO,
			DATI_BASE.IDTESTA,
			DATI_BASE.IDRIGA,
			DATI_BASE.TOTLORDORIGAEURO,
			DATI_BASE.TOTNETTORIGAEURO,
			DATI_BASE.QTAPREZZO,
			(SELECT COSTOMEDIO FROM dbo.MB_FunGetAcquistatoStorico(
			(SELECT CAST(CONVERT(VARCHAR(8),MAX(MB_RIFRIGHEDOCUMENTI_TMP.DATADOC),112) AS DECIMAL(8,0)) FROM MB_RIFRIGHEDOCUMENTI_TMP WHERE IDSESSIONE = @IdSessione)
			,DATI_BASE.CODART,DATI_BASE.CODDEPOSITO,ISNULL(DATI_BASE.NRRIFPARTITA,''),AUP1.UM)) AS ValoreAcquistato,
			CAST((DATI_BASE.QTAPREZZO * AFC1.FATTORE) AS DECIMAL(16,6)) AS QtaConv1,
			CAST((DATI_BASE.QTAPREZZO * AFC2.FATTORE) AS DECIMAL(16,6)) AS QtaConv2,
			DATI_BASE.UMPREZZO,
			AUP1.UM AS UmConv1,
			AUP2.UM AS UmConv2,
			DATI_BASE.SCONTORIGA
		FROM
			(
				SELECT 
					MRD.CODRAGGRUPPAMENTO AS RAGGRUPPAMENTO,
					MPD.CODTIPO AS TIPO,
					RD.IDTESTA,
					RD.PROGRIGADOC IDRIGA,
					RD.CODART,
					RD.CODDEPOSITO,
					RD.NRRIFPARTITA,
					RD.QTAPREZZO,
					RD.UMPREZZO,
					RD.SCONTORIGA,
					RD.TOTLORDORIGAEURO,
					RD.TOTNETTORIGAEURO
				FROM
					(SELECT DISTINCT IDTESTA,IDRIGA FROM MB_RIFRIGHEDOCUMENTI_TMP WHERE IDSESSIONE = @IdSessione) MBRRD
				INNER JOIN
					VISTADOCUMENTIBASE RD
				ON
					RD.IDTESTA = MBRRD.IDTESTA AND
					RD.PROGRIGADOC = MBRRD.IDRIGA
				INNER JOIN
					MB_RAGGRUPPAMENTO_DOCUMENTI MRD
				ON
					MRD.CODICEDOC = RD.TIPODOC
				INNER JOIN
					MB_RAGGRUPPAMENTI MPD
				ON
					MPD.CODICE = MRD.CODRAGGRUPPAMENTO
				WHERE
					(
						(
							MPD.CODTIPO IN(1,6) AND (((RD.TIPORIGA <> 'O') AND (RD.TIPORIGA <> 'N')) OR (RD.TIPORIGA = 'N' AND RD.SCONTIESTESI <> '100'))
						)
						OR
						(
							MPD.CODTIPO IN(4,7) AND ((RD.TIPORIGA =  'O') OR (RD.TIPORIGA = 'N' AND RD.SCONTIESTESI =  '100'))
						)
						OR
						(
							(MPD.CODTIPO = 2 AND (MRD.CODDEPOSITO = RD.CODDEPOSITO AND MRD.CODICEDOC = RD.TIPODOC)) OR
							(MPD.CODTIPO = 3 AND (MRD.CODDEPOSITO = RD.CODDEPOSITO AND MRD.CODICEDOC = RD.TIPODOC)) 
						)
						OR
						(
							MPD.CODTIPO NOT IN(1,2,3,4,5,6,7)
						)
					)
			) DATI_BASE
		CROSS APPLY
			(SELECT TIPOUM1,TIPOUM2 FROM MB_PARAMETRI WHERE PROGRESSIVO = 1) MP_TMP
		INNER JOIN
			ARTICOLIUMPREFERITE AUP1
		ON
			AUP1.CODART = DATI_BASE.CODART AND
			AUP1.TIPOUM = MP_TMP.TIPOUM1
		INNER JOIN
			ARTICOLIFATTORICONVERSIONE AFC1
		ON
			AFC1.CODART = AUP1.CODART AND
			AFC1.UM1 = DATI_BASE.UMPREZZO AND
			AFC1.UM2 = AUP1.UM
		INNER JOIN
			ARTICOLIUMPREFERITE AUP2
		ON
			AUP2.CODART = DATI_BASE.CODART AND
			AUP2.TIPOUM = MP_TMP.TIPOUM2
		INNER JOIN
			ARTICOLIFATTORICONVERSIONE AFC2
		ON
			AFC2.CODART = AUP2.CODART AND
			AFC2.UM1 = DATI_BASE.UMPREZZO AND
			AFC2.UM2 = AUP2.UM
	) DAT_BASE_CONVERTITI
	LEFT OUTER JOIN
		TP_TRASPORTOCOSTOACQARTICOLI TTCAA
	ON 
		TTCAA.CODART = DAT_BASE_CONVERTITI.CODART AND
		TTCAA.NRRIFPARTITA = DAT_BASE_CONVERTITI.NRRIFPARTITA AND
		TTCAA.CODDEPOSITO = DAT_BASE_CONVERTITI.CODDEPOSITO
	/*Modifica per malfunzionamento*/
	--WHERE DAT_BASE_CONVERTITI.TIPO <>5
	)




GO
GRANT SELECT
    ON OBJECT::[dbo].[MB_FunSelectRowByType] TO [Metodo98]
    AS [dbo];

