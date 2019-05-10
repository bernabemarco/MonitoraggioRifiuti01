


CREATE VIEW view_tmpConsuntivi
AS
SELECT    tmpConsuntivati.sessione,tmpConsuntivati.NRTERMINALE,tmpConsuntivati.FINOALLADATA,tmpConsuntivati.DATACONSUNTIV,
          TESTE_CONTRATTI.PROGRESSIVO, TESTE_CONTRATTI.ESERCIZIO, 
          TESTE_CONTRATTI.NUMEROCONTRATTO, TESTE_CONTRATTI.BIS, TESTE_CONTRATTI.DESCRIZIONECONTRATTO, 
          CASE WHEN TESTE_CONTRATTI.TIPONODO = 0 THEN 'Libero' ELSE CASE WHEN TESTE_CONTRATTI.TIPONODO = 1 THEN 'Cli/For Fatt' ELSE CASE
           WHEN TESTE_CONTRATTI.TIPONODO = 2 THEN 'Cliente' ELSE CASE WHEN TESTE_CONTRATTI.TIPONODO = 3 THEN 'Destinazione Diversa' ELSE
           CASE WHEN TESTE_CONTRATTI.TIPONODO = 4 THEN 'Fornitore' ELSE CASE WHEN TESTE_CONTRATTI.TIPONODO = 5 THEN 'Esercizio' END
           END END END END END AS TipoContratto, TESTE_CONTRATTI.CODICE, tmpConsuntivati.CODCLIFOR, tmpConsuntivati.CODCFFATT, 
          tmpConsuntivati.NUMDESTDIVERSAMERCI, 
          CASE WHEN tmpConsuntivati.tipologia = 'C' THEN 'Condizionato' ELSE 'Incondizionato' END AS Tipologia, 
          CASE WHEN tmpConsuntivati.scartata = 0 THEN 'Consuntivata' ELSE 'Non Consuntivata' END AS Scartata, 
          tmpConsuntivati.PROGRESSIVO AS IDTESTA, testedocumenti.tipodoc, tmpConsuntivati.IDRIGA, teste_contratti.indicealbero, 
          righedocumenti.codart, righedocumenti.descrizioneart
FROM      tmpConsuntivati INNER JOIN
          TESTE_CONTRATTI ON tmpConsuntivati.CONTRATTO = TESTE_CONTRATTI.PROGRESSIVO INNER JOIN
          testedocumenti ON tmpConsuntivati.PROGRESSIVO = testedocumenti.progressivo LEFT OUTER JOIN
          righedocumenti ON tmpConsuntivati.PROGRESSIVO = righedocumenti.idtesta AND tmpconsuntivati.idriga = righedocumenti.idriga



GO
GRANT SELECT
    ON OBJECT::[dbo].[view_tmpConsuntivi] TO [Metodo98]
    AS [dbo];

