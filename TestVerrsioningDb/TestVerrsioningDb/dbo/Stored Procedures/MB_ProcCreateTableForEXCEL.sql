

-- Stored Procedure
CREATE PROCEDURE [dbo].[MB_ProcCreateTableForEXCEL](@IdSessione DECIMAL(5,0),
              @Sel_1 nVARCHAR(80),
               @Sel_2 nVARCHAR(80),
                @Sel_3 nVARCHAR(80),
              @Sel_4 nVARCHAR(80),
               @Sel_5 nVARCHAR(80),
                @Sel_6 nVARCHAR(80),
                 @DataInizioAnalisi DateTime,
                  @DataFineAnalisi DateTime)
AS

BEGIN

-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;


SET @DataInizioAnalisi = (SELECT CASE TUTTOESERCIZIO
        WHEN 0 THEN  @DataInizioAnalisi
        WHEN 1 THEN DATEADD(YEAR, DATEDIFF(YEAR, 0, DATEADD(YEAR, 0, @DataInizioAnalisi)), 0)
        WHEN 2 THEN DATEADD(YEAR, DATEDIFF(YEAR, 0, DATEADD(YEAR, 0, @DataInizioAnalisi)), 0)
        END   FROM dbo.MB_RAGGRUPPAMENTI WHERE CODTIPO= 5)


SET @DataFineAnalisi = (SELECT CASE TUTTOESERCIZIO
        WHEN 0 THEN  @DataFineAnalisi
        WHEN 1 THEN DATEADD(MILLISECOND, -3, DATEADD(YEAR,DATEDIFF(YEAR, 0, DATEADD(YEAR, 0, @DataFineAnalisi)) + 1, 0))
        WHEN 2 THEN @DataFineAnalisi
        END   FROM dbo.MB_RAGGRUPPAMENTI WHERE CODTIPO= 5)


    INSERT INTO MB_RIFRIGHEDOCUMENTI_TMP(IDTESTA,IDRIGA,IDSESSIONE,RIFDSCCANALE,DATADOC,UTENTEMODIFICA,DATAMODIFICA)

    SELECT RD.IDTESTA,RD.idriga, @IdSessione IDSESSIONE,'XXXXXXXXXX'  RIFDSCCANALE,TD.DATADOC, USER_NAME(), GETDATE()

    FROM (SELECT CODICEDOC FROM MB_RAGGRUPPAMENTO_DOCUMENTI MB_RAGG_DOC
    INNER JOIN dbo.MB_RAGGRUPPAMENTI MB_RAGGR
     ON MB_RAGGR.CODICE = MB_RAGG_DOC.CODRAGGRUPPAMENTO
    WHERE MB_RAGGR.CODTIPO = 5 AND MB_RAGGR.FILTRACLIFOR = 0
     ) MB_RAGG_DOC

    INNER JOIN dbo.TESTEDOCUMENTI TD
     ON TD.TIPODOC = MB_RAGG_DOC.CODICEDOC
    INNER JOIN dbo.RIGHEDOCUMENTI RD
     ON TD.PROGRESSIVO = RD.IDTESTA 
    LEFT OUTER JOIN MB_RIFRIGHEDOCUMENTI_TMP TMP
    ON IDSESSIONE = @IdSessione AND tmp.IDTESTA = RD.IDTESTA AND TMP.IDRIGA= RD.IDRIGA
    WHERE TD.DATADOC BETWEEN @DataInizioAnalisi AND @DataFineAnalisi AND tmp.IDTESTA IS NULL

 


DECLARE @ANNOCORRENTE   INT

DECLARE @SqlQuery  nVARCHAR(MAX)

 /*Recordset Dati*/
 DELETE FROM MB_DettaglioRighe_Tmp WHERE IdSessione = @IdSessione

 IF @Sel_1 = ''
  SET @Sel_1 = '''TUTTI'''

 IF @Sel_2 = ''
  SET @Sel_2 = '''TUTTI'''

 IF @Sel_3 = ''
  SET @Sel_3 = '''TUTTI'''

 IF @Sel_4 = ''
  SET @Sel_4 = ''''''

 IF @Sel_5 = ''
  SET @Sel_5 = ''''''

 IF @Sel_6 = ''
  SET @Sel_6 = ''''''

 SET @SqlQuery = 'INSERT INTO MB_DettaglioRighe_Tmp(IdSessione,Raggruppamento,Tipo,IdTestaDoc,IdRigaDoc,ValoreLordoRiga,ValoreNettoRiga,ValoreMedioAcquistato,ValoreTraspAcq,
                QtaOrigine,QtaConv1,QtaConv2,UmOrigine,UmConv1,UmConv2,ScontoRiga,
                QtaExtra, ValoreExtra,
                CodAgente1,VALOREPROVV1,CodAgente2,VALOREPROVV2,CodAgente3,VALOREPROVV3,
                Sel_1,Sel_2,Sel_3,Sel_4,Sel_5,Sel_6,UtenteModifica,DataModifica)
      SELECT
      MFSRBT.IDSessione,
      MFSRBT.Raggruppamento,
      MFSRBT.Tipo,
      MFSRBT.IDTestaDoc,
      MFSRBT.IDRigaDoc,
      MFSRBT.ValoreLordoRiga,
      MFSRBT.ValoreNettoRiga,
      MFSRBT.ValoreAcquistato,
      MFSRBT.ValoreTrasporto,
      MFSRBT.QtaOrigine,
      MFSRBT.QtaConv1,
      MFSRBT.QtaConv2,
      MFSRBT.UmOrigine,
      MFSRBT.UmConv1,
      MFSRBT.UmConv2,
      MFSRBT.ScontoRiga,
      ISNULL(VTD.QtaExtra,0) QtaExtra,
      ISNULL(VTD.ValoreExtra,0) ValoreExtra,
      ISNULL(VTD.CodAgente1,'''') CodAgente1,
      ISNULL(VTD.TotProvvAgEuro1,0) TotProvvAgEuro1,
      ISNULL(VTD.CodAgente2,'''') CodAgente2,
      ISNULL(VTD.TotProvvAgEuro2,0) TotProvvAgEuro2,
      ISNULL(VTD.CodAgente3,'''') CodAgente3,
      ISNULL(VTD.TotProvvAgEuro3,0) TotProvvAgEuro3, 
      ISNULL(' + @Sel_1 + ',''''),
      ISNULL(' + @Sel_2 + ',''''),
      ISNULL(' + @Sel_3 + ',''''),
      ISNULL(' + @Sel_4 + ',''''),
      ISNULL(' + @Sel_5 + ',''''),
         ISNULL(' + @Sel_6 + ',''''),
      USER_name() AS UTENTEMODIFICA,
      GETDATE() AS DATAMODIFICA
      FROM
      [dbo].[MB_FunSelectRowByType](' + CAST(@IdSessione AS nVARCHAR(5)) + ') MFSRBT
      LEFT  OUTER JOIN
      MB_FunValidRow(' + CAST(@IdSessione AS nVARCHAR(5)) + ') VTD
      ON VTD.IDTESTA = MFSRBT.IDTESTADOC AND VTD.IDRIGA = MFSRBT.IDRIGADOC

     '

 --PRINT @SqlQuery


 EXEC sp_executesql @SQLQuery

 /*Aggiorno\Inserisco il campo Sconti su Righedocumenti_Budget*/
 --UPDATE
 UPDATE RIGHEDOCUMENTI_BUDGET
 SET RIGHEDOCUMENTI_BUDGET.SCONTI = TERD.COMPOSIZIONEESTEMPORANEO
 FROM
  RIGHEDOCUMENTI_BUDGET RDB
 INNER JOIN
  (
  SELECT
   TED.IDTESTA,
   TED.IDRIGA,
   TED.COMPOSIZIONEESTEMPORANEO
  FROM
   TP_EXTRARIGHEDOC TED,
   MB_DETTAGLIORIGHE_TMP MDRT
  WHERE
   MDRT.IDTESTADOC = TED.IDTESTA AND
   MDRT.IDRIGADOC = TED.IDRIGA  AND
   ((TED.COMPOSIZIONEESTEMPORANEO <> '' AND TED.COMPOSIZIONEESTEMPORANEO IS NOT NULL))
  ) TERD
 ON
  TERD.IDTESTA = RDB.IDTESTA AND
  TERD.IDRIGA = RDB.IDRIGA

 --INSERT
 INSERT INTO RIGHEDOCUMENTI_BUDGET(IDTESTA,IDRIGA,SCONTI)
 SELECT
  *
 FROM
 (
 SELECT
  TED.IDTESTA,
  TED.IDRIGA,
  TED.COMPOSIZIONEESTEMPORANEO
 FROM
  TP_EXTRARIGHEDOC TED,
  MB_DETTAGLIORIGHE_TMP MDRT
 WHERE
  MDRT.IDTESTADOC = TED.IDTESTA AND
  MDRT.IDRIGADOC = TED.IDRIGA AND
  ((TED.COMPOSIZIONEESTEMPORANEO <> '' AND COMPOSIZIONEESTEMPORANEO IS NOT NULL))
 ) TERD
 WHERE
  NOT EXISTS(SELECT PROGRESSIVO FROM RIGHEDOCUMENTI_BUDGET RDB WHERE RDB.IDTESTA = TERD.IDTESTA AND RDB.IDRIGA = TERD.IDRIGA)


 RETURN
END



GO
GRANT EXECUTE
    ON OBJECT::[dbo].[MB_ProcCreateTableForEXCEL] TO [Metodo98]
    AS [dbo];

