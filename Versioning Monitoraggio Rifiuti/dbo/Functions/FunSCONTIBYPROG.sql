
create FUNCTION FunSCONTIBYPROG (@RifProgressivo Decimal(5,0),
                                			    @Articolo nVarChar(50))

RETURNS @Results TABLE (Progressivo Decimal(5,0),
				ARTICOLO nVarChar(50) ,
				DESCRIZIONE nVarChar(80) ,
				Contratto Decimal(18,0),
				Segno SmallInt,
				FlagSconto Smallint,
				ValoreSconto nVarChar(15) ,
				TipoSconto nChar(2) ,
				IdFormula nChar(1) ,
				Formula nVarChar(21) ,
				FormulaFF nVarChar(21) ,
				IdSconto nVarChar(5) ,
				FlagScalare Smallint,
				NrListino Decimal(5,0),
				DscLst nVarchar(25) ,
				TipoSconto1 nVarchar(5) ,
				TipoSconto2 nVarchar(5) ,
				DataModifica DateTime,
				InFuoriFattura  SmallInt,
       			UsaPerImponibile  SmallInt)


AS
    BEGIN
DECLARE @ESERCIZIO Decimal(5,0)
DECLARE @FORNITORE nVarchar(7)

DECLARE @PROGRESSIVO Decimal(5,0)
DECLARE @CONTRATTO Decimal(18,0)
DECLARE @RIGA Decimal(5,0)
DECLARE @SEGNO Smallint
DECLARE @FLAGSCONTO Smallint
DECLARE @VALORESCONTO nVarChar(15)
DECLARE @IDFORMULA nChar(1)
DECLARE @FORMULA nVarChar(21)
DECLARE @FORMULAFF nVarChar(21)
DECLARE @IDSCONTO nVarChar(5)
DECLARE @DESCRIZIONE nVarChar(50)
DECLARE @FLAGSCALARE SmallInt
DECLARE @NRLISTINO Decimal(5,0)
DECLARE @DSCLIST nVarchar(25)
DECLARE @TIPOSCONTO1 nVarchar(5)
DECLARE @TIPOSCONTO2 nVarchar(5)
DECLARE @DATAMODIFICA DateTime

DECLARE @TMP_FLAGSCONTO Smallint
DECLARE @TMP_VALORESCONTO nVarChar(15)
DECLARE @TMP_DATAMODIFICA DateTime

DECLARE @COUNT int
DECLARE @TIPORIGA nChar(2)
DECLARE @CODRIGA1 Decimal(5,0)
DECLARE @CODRIGA2 Decimal(5,0)
DECLARE @INFUORIFATTURA SMALLINT
DECLARE @USAPERIMPONIBILE SMALLINT

--@TIPORIGA:
--	AR, Articolo
--	GR, Gruppo
--	CT, Categoria
--	CS, Categoria Statistica
--	FR, Famiglia Reparti
--	GP, Gruppo Prezzi


	DECLARE ConfigSconti_Cursor CURSOR FOR
		SELECT  TP_CONFIGSCONTI.Progressivo 			AS CFG_Progressivo,
				TP_CONFIGSCONTI.CodContratto 			AS CFG_Contratto,
				TP_CONFIGSCONTI.CodFor 		        	AS CFG_Fornitore,
				TP_CONFIGSCONTI.Esercizio               AS CFG_Esercizio,
				TP_CONFIGSCONTITESTE.IdRiga				AS TST_IdRiga,
				TP_CONFIGSCONTITESTE.Segno				AS TST_Segno,
				TP_CONFIGSCONTITESTE.FlagSconto			AS TST_FlagSconto,
				TP_CONFIGSCONTITESTE.ValoreSconto		AS TST_Valore,
				TP_CONFIGSCONTITESTE.IdFormula			AS TST_IdFormula,
				TP_CONFIGSCONTITESTE.Formula			AS TST_Formula,
				TP_CONFIGSCONTITESTE.FormulaFF			AS TST_FormulaFF,
				TP_CONFIGSCONTITESTE.IdSconto			AS TST_IdSconto,
				TP_TABSCONTI.Descrizione				AS TST_Descrizione,
				TP_CONFIGSCONTITESTE.FlagScalare		AS TST_FlagScalare,
				TP_CONFIGSCONTITESTE.NrListino	        AS TST_NRListino,
				TABLISTINI.DESCRIZIONE		        	AS TST_DSCLIST,
				TP_CONFIGSCONTITESTE.TipoSconto1		AS TST_TipoSconto1,
				TP_CONFIGSCONTITESTE.TipoSconto2		AS TST_TipoSconto2,
				TP_CONFIGSCONTITESTE.DataModifica		AS TST_DataModifica,
				TP_TipiDiSconto.FlagTipo                AS InFuoriFattura,
				TP_CONFIGSCONTITESTE.UsaPerImponibile	AS TST_UsaPerImponibile
        FROM TP_CONFIGSCONTI
		INNER JOIN TP_CONFIGSCONTITESTE
			ON TP_CONFIGSCONTITESTE.IDTESTA=TP_CONFIGSCONTI.Progressivo
		LEFT JOIN TP_TABSCONTI
			ON TP_TABSCONTI.CODICE=TP_CONFIGSCONTITESTE.IDSCONTO
		INNER JOIN TP_TipiDiSconto
			ON TP_TipiDiSconto.Codice=TP_TABSCONTI.Tipo
		LEFT JOIN TABLISTINI
			ON TABLISTINI.NRLISTINO=TP_CONFIGSCONTITESTE.NRLISTINO
		WHERE TP_CONFIGSCONTI.Progressivo=@RifProgressivo
		GROUP BY        TP_CONFIGSCONTI.Progressivo,TP_CONFIGSCONTI.CodFor,
                                TP_CONFIGSCONTI.Esercizio,TP_CONFIGSCONTI.DaData,
                                TP_CONFIGSCONTI.AData,TP_CONFIGSCONTI.CodContratto,
                                TP_CONFIGSCONTITESTE.IdRiga,TP_CONFIGSCONTITESTE.Segno,
                                TP_CONFIGSCONTITESTE.FlagSconto,TP_CONFIGSCONTITESTE.ValoreSconto,
                                TP_CONFIGSCONTITESTE.IdFormula,TP_CONFIGSCONTITESTE.IdSconto,
                                TP_TABSCONTI.Descrizione,TP_CONFIGSCONTITESTE.FlagScalare,
                                TP_CONFIGSCONTITESTE.NrListino,TABLISTINI.Descrizione,
                                TP_CONFIGSCONTITESTE.TipoSconto1,TP_CONFIGSCONTITESTE.TipoSconto2,
                                TP_CONFIGSCONTITESTE.Formula,TP_CONFIGSCONTITESTE.DataModifica,
                                TP_TipiDiSconto.FlagTipo,TP_CONFIGSCONTITESTE.FormulaFF,TP_CONFIGSCONTITESTE.UsaPerImponibile
		ORDER BY TP_CONFIGSCONTI.DADATA DESC

	OPEN ConfigSconti_Cursor

	FETCH NEXT FROM ConfigSconti_Cursor
 	    INTO @PROGRESSIVO,@CONTRATTO,@FORNITORE,@ESERCIZIO,@RIGA,@SEGNO,
		 @FLAGSCONTO,@VALORESCONTO,@IDFORMULA,@FORMULA,@FORMULAFF,
		 @IDSCONTO,@DESCRIZIONE,@FLAGSCALARE,@NRLISTINO,@DSCLIST,
		 @TIPOSCONTO1,@TIPOSCONTO2,@DATAMODIFICA,@INFUORIFATTURA,@USAPERIMPONIBILE

	WHILE @@FETCH_STATUS = 0
		BEGIN
			SET @TMP_FLAGSCONTO= -1
			SET @TMP_VALORESCONTO = ''

--*****************************Cerco relative configurazioni sulle righe*************************************
			--Cerco Per Articolo
			SELECT @COUNT=COUNT(*)
			FROM TP_ConfigScontiRighe_6Art
			WHERE RifProgressivo=@PROGRESSIVO AND IdTesta=@RIGA AND @Articolo LIKE REPLACE(CODICE,'?','_')

			IF (@COUNT=0 OR @COUNT IS NULL)
				BEGIN
					--Cerco Per Gruppo
					SELECT @COUNT=COUNT(*)
					FROM TP_ConfigScontiRighe_1Grp
					WHERE RifProgressivo=@PROGRESSIVO AND IdTesta=@RIGA

					IF (@COUNT=0 OR @COUNT IS NULL)
						BEGIN
							--Cerco Per Categoria
							SELECT @COUNT=COUNT(*)
							FROM TP_ConfigScontiRighe_2Cat
							WHERE RifProgressivo=@PROGRESSIVO AND IdTesta=@RIGA

							IF (@COUNT=0 OR @COUNT IS NULL)
								BEGIN
									--Cerco Per Categoria STATISTICA
									SELECT @COUNT=COUNT(*)
									FROM TP_ConfigScontiRighe_3CatSt
									WHERE RifProgressivo=@PROGRESSIVO AND IdTesta=@RIGA

									IF (@COUNT=0 OR @COUNT IS NULL)
										BEGIN
											--Cerco Per Gruppo Prezzi
											SELECT @COUNT=COUNT(*)
											FROM TP_ConfigScontiRighe_4GrpPrz
											WHERE RifProgressivo=@PROGRESSIVO AND IdTesta=@RIGA

											IF (@COUNT=0 OR @COUNT IS NULL)
												BEGIN
													--Cerco Per Famiglia Reparto
													SELECT @COUNT=COUNT(*)
													FROM TP_ConfigScontiRighe_5FamRep
													WHERE RifProgressivo=@PROGRESSIVO AND IdTesta=@RIGA

													IF (@COUNT=0 OR @COUNT IS NULL)
														BEGIN
															SET @TIPORIGA=''
														END
													ELSE
														BEGIN
															SET @TIPORIGA='FR'
														END
												END
											ELSE
												BEGIN
													SET @TIPORIGA='GP'
												END
										END
									ELSE
										BEGIN
											SET @TIPORIGA='CS'
										END
								END
							ELSE
								BEGIN
									SET @TIPORIGA='CT'
								END

						END
					ELSE
						BEGIN
							SET @TIPORIGA='GR'
						END
				END
			ELSE
				BEGIN
					SET @TIPORIGA='AR'
				END
--****************************************************************************

			IF (@TIPORIGA = 'AR')
				BEGIN
					--Cerco Per Articolo
					SELECT @TMP_FLAGSCONTO=FlagSconto,@TMP_VALORESCONTO=ValoreSconto,@TMP_DATAMODIFICA=DataModifica
					FROM TP_ConfigScontiRighe_6Art
					WHERE RifProgressivo=@PROGRESSIVO AND IdTesta=@RIGA AND @Articolo LIKE REPLACE(CODICE,'?','_')
				END
			IF (@TIPORIGA = 'GR')
				BEGIN
					--Cerco Per Gruppo
					SELECT @CODRIGA1=GRUPPO
					FROM ANAGRAFICAARTICOLI
					WHERE CODICE=@Articolo

					SELECT @TMP_FLAGSCONTO=FlagSconto,@TMP_VALORESCONTO=ValoreSconto,@TMP_DATAMODIFICA=DataModifica
					FROM TP_ConfigScontiRighe_1Grp
					WHERE RifProgressivo=@PROGRESSIVO AND IdTesta=@RIGA AND Codice=@CODRIGA1
				END


			IF (@TIPORIGA = 'CT')
				BEGIN
					--Cerco Per Categoria
					SELECT @CODRIGA1=CATEGORIA
					FROM ANAGRAFICAARTICOLI
					WHERE CODICE=@Articolo

					SELECT @TMP_FLAGSCONTO=FlagSconto,@TMP_VALORESCONTO=ValoreSconto,@TMP_DATAMODIFICA=DataModifica
					FROM TP_ConfigScontiRighe_2Cat
					WHERE RifProgressivo=@PROGRESSIVO AND IdTesta=@RIGA AND Codice=@CODRIGA1
				END
			IF (@TIPORIGA = 'CS')
				BEGIN
					--Cerco Per Categoria STATISTICA
					SELECT @CODRIGA1=CODCATEGORIASTAT
					FROM ANAGRAFICAARTICOLI
					WHERE CODICE=@Articolo

					SELECT @TMP_FLAGSCONTO=FlagSconto,@TMP_VALORESCONTO=ValoreSconto,@TMP_DATAMODIFICA=DataModifica
					FROM TP_ConfigScontiRighe_3CatSt
					WHERE RifProgressivo=@PROGRESSIVO AND IdTesta=@RIGA AND Codice=@CODRIGA1
				END
			IF (@TIPORIGA = 'FR')
				BEGIN
					--Cerco Per Gruppo Prezzi
					SELECT @CODRIGA1=CODFAMIGLIAPOS,@CODRIGA2=CODREPARTOPOS
					FROM TP_EXTRAMAG
					WHERE CODART=@Articolo

					SELECT @TMP_FLAGSCONTO=FlagSconto,@TMP_VALORESCONTO=ValoreSconto,@TMP_DATAMODIFICA=DataModifica
					FROM TP_ConfigScontiRighe_5FamRep
					WHERE RifProgressivo=@PROGRESSIVO AND IdTesta=@RIGA AND CodFam=@CODRIGA1 AND (CodRep=0 OR CodRep=@CODRIGA2)
				END
			IF (@TIPORIGA = 'GP')
				BEGIN
					--Cerco Per Famiglia Reparto
					SELECT @CODRIGA1=CODGRUPPOPREZZIPART
					FROM ANAGRAFICARISERVATICF
					WHERE  ESERCIZIO=@ESERCIZIO AND CODCONTO=@FORNITORE

					SELECT @TMP_FLAGSCONTO=FlagSconto,@TMP_VALORESCONTO=ValoreSconto,@TMP_DATAMODIFICA=DataModifica
					FROM TP_ConfigScontiRighe_4GrpPrz
					WHERE RifProgressivo=@PROGRESSIVO AND IdTesta=@RIGA AND Codice=@CODRIGA1
				END

			IF (@TMP_FLAGSCONTO > -1 AND @TMP_VALORESCONTO <> '')
				BEGIN
					SET @VALORESCONTO = @TMP_VALORESCONTO
					SET @FLAGSCONTO	= @TMP_FLAGSCONTO

					IF @TMP_DATAMODIFICA>@DATAMODIFICA
						BEGIN
							SET @DATAMODIFICA =@TMP_DATAMODIFICA
						END
				END
			ELSE
				BEGIN
					SET @TIPORIGA = ''
				END

 			INSERT INTO @Results VALUES(@PROGRESSIVO,@Articolo,@DESCRIZIONE,@CONTRATTO,
						    @SEGNO,@FLAGSCONTO,@VALORESCONTO,@TIPORIGA,
						    @IDFORMULA,@FORMULA,@FORMULAFF,@IDSCONTO,@FLAGSCALARE,
					  	    @NRLISTINO,@DSCLIST,@TIPOSCONTO1,@TIPOSCONTO2,@DATAMODIFICA,
						    @INFUORIFATTURA,@USAPERIMPONIBILE)

		 	FETCH NEXT FROM ConfigSconti_Cursor
				INTO @PROGRESSIVO,@CONTRATTO,@FORNITORE,@ESERCIZIO,@RIGA,@SEGNO,
				     @FLAGSCONTO,@VALORESCONTO,@IDFORMULA,@FORMULA,@FORMULAFF,
				     @IDSCONTO,@DESCRIZIONE,@FLAGSCALARE,@NRLISTINO,@DSCLIST,
		 		     @TIPOSCONTO1,@TIPOSCONTO2,@DATAMODIFICA,@INFUORIFATTURA,@USAPERIMPONIBILE
		END

	CLOSE ConfigSconti_Cursor
	DEALLOCATE ConfigSconti_Cursor

    RETURN
END

GO
GRANT SELECT
    ON OBJECT::[dbo].[FunSCONTIBYPROG] TO [Metodo98]
    AS [dbo];

