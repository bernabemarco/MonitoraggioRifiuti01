﻿
CREATE  FUNCTION [dbo].[FunFETS_ImpostazioniUffici]
(
    @Progressivo DECIMAL(10,0) 

)
RETURNS TABLE AS RETURN
(
       

  
   SELECT TOP 1 PARAMETRIDOC.NOMEFILE,
		ISNULL(CF.PEC,'') EMAIL, 
		CF.CODDESTINATARIOPA CODICE_UFFICIO,
		'' RIFERIMENTOAMMINISTRAZIONE,
		PARAMETRIDOC.SIGNATURERICHIESTA,
		PARAMETRIDOC.ARCHIVIAZIONESOSTITUTIVA,
		CASE PG.TIPOINVIO WHEN 0 THEN PARAMETRIDOC.TIPOINVIOCONV  ELSE (CASE TIPOINVIO  WHEN 1 THEN 'STORE' WHEN 2 THEN 'SDI' END)  END TIPOINVIO 
                  
		FROM TESTEDOCUMENTI TD,
			ANAGRAFICACF  CF,
			FETS_ParametriGenerali PG,
			(SELECT TOP 1 ISNULL(CF.FILEPATH, CD.NOMEFILE) NOMEFILE, SIGNATURERICHIESTA, ARCHIVIAZIONESOSTITUTIVA, TIPOINVIOCONV FROM TESTEDOCUMENTI TD
			LEFT OUTER JOIN (SELECT CASE WHEN CODICEFEPA ='TD20' THEN 'SELFINV' ELSE 'SDI' END TIPOINVIOCONV, CODICEMET, SIGNATURERICHIESTA,ARCHIVIAZIONESOSTITUTIVA , NOMEFILE FROM FETS_CODIFICHEDOCUMENTI) CD
			ON CD.CODICEMET = TD.TIPODOC
			LEFT OUTER JOIN FETS_DocumentiCF CF 
			ON TD.TIPODOC = CF.TIPODOC 
			AND (TD.CODCLIFOR = CF.CODCF OR TD.CODCFFATT = CF.CODCF)
			WHERE PROGRESSIVO= @Progressivo) AS PARAMETRIDOC
		WHERE TD.PROGRESSIVO= @Progressivo AND TD.CODCLIFOR = CF.CODCONTO AND ISNULL(CF.CODDESTINATARIOPA,'') <>''
       AND NOT EXISTS(SELECT * FROM FETS_ListaAziendeAttive LA where LA.CODCONTO =  CF.CODCONTO AND LA.Stato <>0)
   UNION ALL
   SELECT * FROM ( SELECT TOP 1 
                    PARAMETRIDOC.NOMEFILE,
					LU.MAIL EMAIL,
					ISNULL(LU.PROGRESSIVOUFFICIO,'''') CODICE_UFFICIO ,
					LU.RIFERIMENTOAMMINISTRAZIONE,
                    (SELECT TOP 1 ISNULL(SIGNATURERICHIESTA,0) SIGNATURERICHIESTA FROM TESTEDOCUMENTI TD
                    LEFT OUTER JOIN FETS_CODIFICHEDOCUMENTI CD
                    ON CD.CODICEMET = TD.TIPODOC
                    LEFT OUTER JOIN FETS_DocumentiCF CF 
                    ON TD.TIPODOC = CF.TIPODOC 
                    AND (TD.CODCLIFOR = CF.CODCF OR TD.CODCFFATT = CF.CODCF)
                    
                    WHERE PROGRESSIVO= @Progressivo) AS SIGNATURERICHIESTA,
                           (SELECT TOP 1 ISNULL(ARCHIVIAZIONESOSTITUTIVA,0) ARCHIVIAZIONESOSTITUTIVA FROM TESTEDOCUMENTI TD
                    LEFT OUTER JOIN FETS_CODIFICHEDOCUMENTI CD
                    ON CD.CODICEMET = TD.TIPODOC
                    LEFT OUTER JOIN FETS_DocumentiCF CF 
                    ON TD.TIPODOC = CF.TIPODOC 
                    AND (TD.CODCLIFOR = CF.CODCF OR TD.CODCFFATT = CF.CODCF)

                    WHERE PROGRESSIVO= @Progressivo) AS ARCHIVIAZIONESOSTITUTIVA,
                    CASE PG.TIPOINVIO WHEN 0 THEN (CASE LU.TIPOINVIO WHEN 2 THEN 'B2B' WHEN 0 THEN 'EMAIL' WHEN 1 THEN 'PEC' WHEN 3 THEN PARAMETRIDOC.TIPOINVIOCONV WHEN 4 THEN 'STORE' END) 
                                                                                                                                                             ELSE (CASE PG.TIPOINVIO  WHEN 1 THEN 'STORE' WHEN 2 THEN 'SDI' END)  END TIPOINVIO 
                      
                      FROM TESTEDOCUMENTI TD
					,FETS_ListaAziendeAttive LA Inner Join FETS_ListaUfficiAttivi LU ON LA.CODCONTO = LU.CODCF
                    ,FETS_ParametriGenerali PG
					,(SELECT TOP 1 ISNULL(CF.FILEPATH, CD.NOMEFILE) NOMEFILE, SIGNATURERICHIESTA, ARCHIVIAZIONESOSTITUTIVA, TIPOINVIOCONV FROM TESTEDOCUMENTI TD
						LEFT OUTER JOIN (SELECT CASE WHEN CODICEFEPA ='TD20' THEN 'SELFINV' ELSE 'SDI' END TIPOINVIOCONV, CODICEMET, SIGNATURERICHIESTA,ARCHIVIAZIONESOSTITUTIVA , NOMEFILE FROM FETS_CODIFICHEDOCUMENTI) CD
						ON CD.CODICEMET = TD.TIPODOC
						LEFT OUTER JOIN FETS_DocumentiCF CF 
						ON TD.TIPODOC = CF.TIPODOC 
						AND (TD.CODCLIFOR = CF.CODCF OR TD.CODCFFATT = CF.CODCF)
						WHERE PROGRESSIVO= @Progressivo) AS PARAMETRIDOC
                          
                    WHERE TD.PROGRESSIVO= @Progressivo AND LA.Stato<>0
                    AND (
                    (TD.CODCLIFOR = LU.CODCF AND TD.CODCFFATT = LU.CODCFFATT AND ISNULL(TD.NUMDESTDIVERSAMERCI,0)= LU.DESTINAZIONEDIVERSA)
                    OR 
                    ((TD.CODCLIFOR = LU.CODCF AND  ISNULL(TD.NUMDESTDIVERSAMERCI,0)= LU.DESTINAZIONEDIVERSA) OR TD.CODCFFATT = LU.CODCFFATT)
                    OR 
                    ( TD.CODCFFATT = LU.CODCFFATT)
                    OR
                    ( TD.CODCLIFOR = LU.CODCF)
                    )
                             
                    ORDER BY 
                           CASE WHEN (TD.CODCLIFOR = LU.CODCF AND TD.CODCFFATT = LU.CODCFFATT AND ISNULL(TD.NUMDESTDIVERSAMERCI,0)= LU.DESTINAZIONEDIVERSA) THEN 0 ELSE 1 END ,
                           CASE WHEN ((TD.CODCLIFOR = LU.CODCF AND  ISNULL(TD.NUMDESTDIVERSAMERCI,0)= LU.DESTINAZIONEDIVERSA) OR TD.CODCFFATT = LU.CODCFFATT) THEN 0 ELSE 1 END,
                           CASE WHEN ( TD.CODCFFATT = LU.CODCFFATT) AND PG.PrioritaCCFD = 1   THEN 0 ELSE 1 END,
                           CASE WHEN ( TD.CODCLIFOR = LU.CODCF) AND PG.PrioritaCCFD = 0 THEN 0 ELSE 1 END) M
                                                                                                 
)

GO
GRANT SELECT
    ON OBJECT::[dbo].[FunFETS_ImpostazioniUffici] TO [Metodo98]
    AS [dbo];

