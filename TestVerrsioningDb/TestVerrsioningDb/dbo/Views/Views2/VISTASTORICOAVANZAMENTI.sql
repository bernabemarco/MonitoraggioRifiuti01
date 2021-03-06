﻿CREATE VIEW VISTASTORICOAVANZAMENTI AS
SELECT
	BL.IDTESTACOMM,BL.ESERCIZIO AS ANNOCOM,BL.TIPOCOM,BL.NUMEROCOM,BL.IDRIGACOMM,BL.CODICEORD,
	BL.PROGRESSIVO IDTESTACICLO,BL.CODART,BL.DESCRIZIONEART,BL.VERSIONECICLO,BL.DSCVERSIONE,BL.VALIDITACICLO,BL.VERSIONEDBA,BL.CICLOSTANDARD,BL.TIPOCICLO,
	BL.NUMEROFASE,BL.TIPOFASE,BL.OPERAZIONE,(SELECT DESCRIZIONE FROM TABELLAOPERAZIONI WHERE TABELLAOPERAZIONI.CODICE=BL.OPERAZIONE) AS DSCOPERAZIONE,
	BL.MACCHINA,BL.CDLAVORO,BL.QTAPREVISTA,BL.UMFASE AS UMPREV, BL.RIFCOMMCLI,BL.DATAEMISSIONE,
	SR.PROGRESSIVO,SR.RIFMOVPRINCIPALE,SR.DATAMOV,SR.CODCAUSALE,SR.ANNOBOLLA,SR.NUMEROBOLLA,SR.ESERCIZIO,SR.TIPOMOVIMENTO,	
	SR.CDLAVORO CDLAVOROMOV,(SELECT DESCRIZIONE FROM TABELLACDLAVORO WHERE TABELLACDLAVORO.CODICE=SR.CDLAVORO) DSCCDLAVOROMOV,
	(SELECT REPARTO FROM TABELLACDLAVORO WHERE CODICE=SR.CDLAVORO) AS CODREPARTO,
	SR.MACCHINA MACCHINAMOV,(SELECT DESCRIZIONE FROM TABELLAMACCHINE WHERE TABELLAMACCHINE.CODICE=SR.MACCHINA) DSCMACCHINAMOV,
	SR.DATAINIZIOSETUP,SR.ORAINIZIOSETUP,SR.DATAFINESETUP,SR.ORAFINESETUP,SR.ORESETUP,
	SR.DATAINIZIOMACCHINA,SR.ORAINIZIOMACCHINA,SR.DATAFINEMACCHINA,SR.ORAFINEMACCHINA,SR.OREMACCHINA,
	SR.DATAINIZIOUOMO,SR.ORAINIZIOUOMO,SR.DATAFINEUOMO,SR.ORAFINEUOMO,SR.OREUOMO,
	SR.DATAINIZIODURATA,SR.ORAINIZIODURATA,SR.DATAFINEDURATA,SR.ORAFINEDURATA,SR.OREDURATA,
	SR.DATAINIZIOMOVNE,SR.ORAINIZIOMOVNE,SR.DATAFINEMOVNE,SR.ORAFINEMOVNE,SR.OREMOVIMENTAZIONE,
	SR.COSTOSETUP,SR.COSTOSETUPAGG,SR.COSTOSETUPEURO,SR.COSTOSETUPAGGEURO,SR.DSCCOSTOSETUP,
	SR.COSTOMACCHINA,SR.COSTOMACCHINAAGG,SR.COSTOMACCHINAEURO,SR.COSTOMACCHINAAGGEURO,SR.DSCCOSTOMACCHINA,
	SR.COSTOUOMO,SR.COSTOUOMOAGG,SR.COSTOUOMOEURO,SR.COSTOUOMOAGGEURO,SR.DSCCOSTOUOMO,
	SR.COSTOINDIRETTO,SR.COSTOINDIRETTOAGG,SR.COSTOINDIRETTOEURO,SR.COSTOINDIRETTOAGGEURO,SR.DSCCOSTOINDIRETTO,
	SR.COSTOESTERNO,SR.COSTOESTERNOAGG,SR.COSTOESTERNOEURO,SR.COSTOESTERNOAGGEURO,SR.DSCCOSTOESTERNO,	
	(SR.COSTOSETUP+SR.COSTOSETUPAGG+SR.COSTOMACCHINA+SR.COSTOMACCHINAAGG+SR.COSTOUOMO+SR.COSTOUOMOAGG+SR.COSTOINDIRETTO+SR.COSTOINDIRETTOAGG+SR.COSTOESTERNO+SR.COSTOESTERNOAGG) AS COSTOTOTALE,
	(SR.COSTOSETUP+SR.COSTOSETUPAGG+SR.COSTOMACCHINA+SR.COSTOMACCHINAAGG+SR.COSTOUOMO+SR.COSTOUOMOAGG+SR.COSTOINDIRETTO+SR.COSTOINDIRETTOAGG) AS COSTOTOTALEINTERNO,
	(SR.COSTOESTERNO+SR.COSTOESTERNOAGG) AS COSTOTOTALEESTERNO,	
	(SR.COSTOSETUPEURO+SR.COSTOSETUPAGGEURO+SR.COSTOMACCHINAEURO+SR.COSTOMACCHINAAGGEURO+SR.COSTOUOMOEURO+SR.COSTOUOMOAGGEURO+SR.COSTOINDIRETTOEURO+SR.COSTOINDIRETTOAGGEURO+SR.COSTOESTERNOEURO+SR.COSTOESTERNOAGGEURO) AS COSTOTOTALEEURO,
	(SR.COSTOSETUPEURO+SR.COSTOSETUPAGGEURO+SR.COSTOMACCHINAEURO+SR.COSTOMACCHINAAGGEURO+SR.COSTOUOMOEURO+SR.COSTOUOMOAGGEURO+SR.COSTOINDIRETTOEURO+SR.COSTOINDIRETTOAGGEURO) AS COSTOTOTALEINTERNOEURO,
	(SR.COSTOESTERNOEURO+SR.COSTOESTERNOAGGEURO) AS COSTOTOTALEESTERNOEURO,
	SR.QTALAVORATA,SR.QTALAVORATAFASE,SR.QTADELTALAVORATA,
	SR.QTAVERSATA,SR.QTAVERSATAFASE,		
	SR.QTASCARTATA,SR.QTASCARTATAFASE,
	SR.QTARILAVORATA,SR.QTARILAVORATAFASE,
	SR.QTATRASFERITA,SR.QTATRASFERITAFASE,
	SR.UM,SR.UMFASE,
	SR.STATOOPERAZIONE,SR.CODSQUADRA,SR.TIPOBOLLA,
	SR.RIFTESTADOCUMENTO,SR.RIFRIGADOCUMENTO,SR.MOVIMENTOAUTOMATICO
FROM
	STORICOAVANZAMENTI SR LEFT OUTER JOIN VISTABOLLELAVORAZIONE BL ON
	SR.ANNOBOLLA=BL.ANNOBOLLA AND SR.NUMEROBOLLA=BL.NUMEROBOLLA

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTASTORICOAVANZAMENTI] TO [Metodo98]
    AS [dbo];

