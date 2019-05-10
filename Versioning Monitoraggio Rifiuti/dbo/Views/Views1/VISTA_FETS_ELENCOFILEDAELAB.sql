

CREATE VIEW [dbo].[VISTA_FETS_ELENCOFILEDAELAB] AS
SELECT        *
FROM            (SELECT        EL.PROGRESSIVO AS PROGRESSELENCODOC, 
                                                                EL.NOMEFILE,
                               (SELECT TOP 1 PERCORSODOWNLOADFILE FROM FETS_ParametriGenerali) AS PATHFILE, 
                               ISNULL(Uffici.CODCF, IsNull(El.CliFor,'')) AS CODCF, 
                               ISNULL((SELECT DSCCONTO1 FROM ANAGRAFICACF CF WHERE CF.CODCONTO = IsNull(Uffici.CODCF,El.CliFor)), '') AS RAGSOCCF, 
                               ISNULL(Uffici.CODCFFATT, IsNull(El.CliFor,'')) AS CODCFFATT, 
                               ISNULL((SELECT DSCCONTO1 FROM ANAGRAFICACF CF WHERE CF.CODCONTO = IsNull(Uffici.CODCFFATT,El.CliFor)), '') AS RAGSOCCFFATT, 
                               ISNULL(Uffici.DESTINAZIONEDIVERSA, 0) AS DESTINAZIONEDIVERSA, 
                               ISNULL((SELECT RAGIONESOCIALE FROM DESTINAZIONIDIVERSE DD WHERE DD.CODICE = Uffici.DESTINAZIONEDIVERSA AND DD.CODCONTO = Uffici.CODCF), '') AS RAGSOCDDM, 
                               ISNULL((SELECT INDIRIZZO FROM DESTINAZIONIDIVERSE DD WHERE DD.CODICE = Uffici.DESTINAZIONEDIVERSA AND DD.CODCONTO = Uffici.CODCF), '') AS INDIRIZZODDM, 
                               ISNULL((SELECT LOCALITA  FROM DESTINAZIONIDIVERSE DD WHERE DD.CODICE = Uffici.DESTINAZIONEDIVERSA AND DD.CODCONTO = Uffici.CODCF), '') AS LOCALITADDM, 
                               ISNULL((SELECT PROVINCIA FROM DESTINAZIONIDIVERSE DD WHERE DD.CODICE = Uffici.DESTINAZIONEDIVERSA AND DD.CODCONTO = Uffici.CODCF), '') AS PROVINCIADDM, 
                               ISNULL(
                                        (SELECT TOP 1   DOC.CODICEMET 
                                         FROM           FETS_CODIFICHEDOCUMENTI DOC 
                                         WHERE          DOC.TIPOCICLO = 1
                                         AND    EL.CodiceB2b =  Case 
                                                                    When IsNull(DOC.CODICEB2B,'') <> '' And IsNull(DOC.CODICECARATTB2B ,'') <> '' Then DOC.CODICEB2B 
                                                                Else
                                                                    ''  
                                                                End
                                         And    EL.CodiceCarattB2b = Case -- Se Valorizzato CodiceB2B deve essere valorizzato anche Caratteristica B2B
                                                                        When IsNull(DOC.CODICEB2B,'') <> '' And IsNull(DOC.CODICECARATTB2B ,'') <> '' Then DOC.CODICECARATTB2B 
                                                                     Else
                                                                        ''  
                                                                     End 

                                         AND    EL.CodiceFepa = Case 
                                                                    When IsNull( DOC.CODICEFEPA,'') <> '' Then DOC.CODICEFEPA
                                                                Else
                                                                    ''  
                                                                End
                                         ), 
                                      '') AS MET_TIPODOC, 
                                      CodiceB2B, 
                                      CodicecarattB2B, 
                               ISNULL(EL.STATOELAB, 0) AS STATOELAB, 
                               ROW_NUMBER() OVER (PARTITION BY EL.PROGRESSIVO ORDER BY EL.PROGRESSIVO) AS PRow, 
                               PROGRESSIVODOC
                FROM           FETS_ELENCODOCUMENTI EL, 
                                -- (SELECT         CASE WHEN UFF.TIPOINVIO=3 THEN UFF.CODICEFISCALEPARTITAIVA ELSE PROGRESSIVOUFFICIO END PROGRESSIVOUFFICIO,  CODCF, CODCFFATT, DESTINAZIONEDIVERSA FROM FETS_ListaUfficiAttivi uff ) Uffici 
                                (SELECT         CASE WHEN UFF.TIPOINVIO=3 THEN UFF.CODICEFISCALEPARTITAIVA ELSE PROGRESSIVOUFFICIO END PROGRESSIVOUFFICIO,  CODCF, CODCFFATT, DESTINAZIONEDIVERSA 
                                        FROM FETS_ListaUfficiAttivi uff 
                                        UNION ALL 
                                        SELECT CODFISCALE, CODCONTO, CODCONTO, 999 FROM VISTA_FETS_ListaFornitori_Import
                                        WHERE CODCONTO NOT IN (SELECT CODCONTO FROM FETS_ListaAziendeAttive)
                                ) Uffici

                                WHERE          
                                EL.Tipo = 0 
                                AND 
                                LEFT(IsNull(Uffici.CODCF,El.CliFor), 1) = 'F' 
								 AND ((ISNULL(Uffici.PROGRESSIVOUFFICIO,El.Transmitterid) = El.Transmitterid OR     ISNULL(Uffici.PROGRESSIVOUFFICIO,El.Transmitterid + '-000') = El.Transmitterid + '-000') OR EL.CliFor = Uffici.CODCF AND Uffici.DESTINAZIONEDIVERSA = 999 )
                                 AND  Uffici.CODCF = El.CliFor
                                 ) AS TAB
WHERE           PRow = 1


GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTA_FETS_ELENCOFILEDAELAB] TO [Metodo98]
    AS [dbo];

