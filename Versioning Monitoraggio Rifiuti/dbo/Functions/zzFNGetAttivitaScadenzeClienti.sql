
CREATE FUNCTION [zzFNGetAttivitaScadenzeClienti]()
RETURNS @AttivitaScadenzeClienti TABLE
(
	[CODCONTO] [varchar](7) NOT NULL,
	DscCliente [varchar](200) NULL,
	[PROGRESSIVO] [decimal](10, 0) NOT NULL,
	[ESERCIZIO] [decimal](5, 0) NOT NULL,
	[ANNODOC] [smallint] NULL,
	[TIPODOC] [varchar](3) NULL,
	[NUMDOC] [decimal](10, 0) NULL,
	[BIS] [char](1) NULL,
	[NUMSCAD] [int] NULL,
	[DATASCADENZA] [datetime] NULL,
	[CODCLIFOR] [varchar](7) NULL,
	[DATAFATTURA] [datetime] NULL,
	[BANCAINC] [varchar](7) NULL,
	[BANCAAPPOGGIO] [decimal](5, 0) NULL,
	[NUMRIF] [varchar](15) NULL,
	[NUMEROPROT] [varchar](9) NULL,
	[CODAGE1] [varchar](7) NULL,
	[CODAGE2] [varchar](7) NULL,
	[CODAGE3] [varchar](7) NULL,
	[IMPPROVLIT1] [decimal](19, 4) NOT NULL,
	[IMPPROVLIT2] [decimal](19, 4) NOT NULL,
	[IMPPROVLIT3] [decimal](19, 4) NOT NULL,
	[IMPPROVVAL1] [decimal](19, 4) NOT NULL,
	[IMPPROVVAL2] [decimal](19, 4) NOT NULL,
	[IMPPROVVAL3] [decimal](19, 4) NOT NULL,
	[IMPPROVEURO1] [decimal](19, 4) NOT NULL,
	[IMPPROVEURO2] [decimal](19, 4) NOT NULL,
	[IMPPROVEURO3] [decimal](19, 4) NOT NULL,
	[LIQPROV1] [smallint] NULL,
	[LIQPROV2] [smallint] NULL,
	[LIQPROV3] [smallint] NULL,
	[IMPORTOSCLIT] [decimal](19, 4) NOT NULL,
	[IMPORTOSCVAL] [decimal](19, 4) NOT NULL,
	[IMPORTOSCEURO] [decimal](19, 4) NOT NULL,
	[IMPONIBSCLIT] [decimal](19, 4) NOT NULL,
	[IMPONIBSCVAL] [decimal](19, 4) NOT NULL,
	[IMPONIBSCEURO] [decimal](19, 4) NOT NULL,
	[TOTFATTLIT] [decimal](19, 4) NOT NULL,
	[TOTFATTVAL] [decimal](19, 4) NOT NULL,
	[TOTFATTEURO] [decimal](19, 4) NOT NULL,
	[IMPFATTLIT] [decimal](19, 4) NOT NULL,
	[IMPFATTVAL] [decimal](19, 4) NOT NULL,
	[IMPFATTEURO] [decimal](19, 4) NOT NULL,
	[FLAGCONT] [smallint] NULL,
	[TIPOEFFETTO] [numeric](5, 0) NULL,
	[ESITO] [numeric](1, 0) NULL,
	[LIVSOLL] [smallint] NULL,
	[LIQINS1] [smallint] NULL,
	[LIQINS2] [smallint] NULL,
	[LIQINS3] [smallint] NULL,
	[CODCAMBIO] [decimal](5, 0) NULL,
	[VALCAMBIO] [decimal](13, 6) NOT NULL,
	[NRDISTINTA] [decimal](10, 0) NULL,
	[NUMRAGGR] [int] NULL,
	[DATAPAGEFF] [datetime] NULL,
	[SCADATTPASS] [smallint] NULL,
	[NUMRIFPARTCONT] [varchar](19) NULL,
	[CODPAG] [varchar](4) NULL,
	[DATADEC] [datetime] NULL,
	[NOTE] [varchar](255) NULL,
	[NRGIORNALE] [decimal](5, 0) NULL,
	[UTENTEMODIFICA] [varchar](25) NOT NULL,
	[DATAMODIFICA] [datetime] NOT NULL,
	[RIFRIGACONT] [smallint] NULL,
	[ESITOPREC] [smallint] NULL,
	[NRREGESITO] [numeric](10, 0) NULL,
	[IDBOZZAAGT1] [decimal](10, 0) NOT NULL,
	[NRRIGAAGT1] [decimal](5, 0) NOT NULL,
	[IDBOZZAAGT2] [decimal](10, 0) NOT NULL,
	[NRRIGAAGT2] [decimal](5, 0) NOT NULL,
	[IDBOZZAAGT3] [decimal](10, 0) NOT NULL,
	[NRRIGAAGT3] [decimal](5, 0) NOT NULL,
	[DATASOLL1] [datetime] NULL,
	[DATASOLL2] [datetime] NULL,
	[DATASOLL3] [datetime] NULL,
	[RIFSCADRIEMISSIONE] [decimal](10, 0) NULL,
	[FLAGCESSIONE] [smallint] NULL,
	[ABI_RIEMISS] [varchar](6) NULL,
	[CAB_RIEMISS] [varchar](6) NULL,
	[RAGSOC_RIEMISS] [varchar](80) NULL,
	[INDIRIZZO_RIEMISS] [varchar](80) NULL,
	[CAP_RIEMISS] [varchar](8) NULL,
	[LOCALITA_RIEMISS] [varchar](80) NULL,
	[PROV_RIEMISS] [varchar](4) NULL,
	[NAZ_RIEMISS] [decimal](5, 0) NULL,
	[NOTE_RIEMISS] [varchar](255) NULL,
	[ESITOPRECRIEMISS] [smallint] NULL,
	[DSCBANCARIEMISS] [varchar](80) NULL,
	[DATAULTCALCINT] [datetime] NULL,
	[STATOSCADENZA] [smallint] NULL,
	[DATABLOCCO] [datetime] NULL,
	[DATASOLL4] [datetime] NULL,
	[DATASOLL5] [datetime] NULL,
	[CODICECIG] [varchar](10) NOT NULL,
	[CODICECUP] [varchar](15) NOT NULL,
	[IdAttivita] [int] NOT NULL,
	[IdScadenza] [decimal](18, 0) NOT NULL,
	[UserID] [varchar](25) NOT NULL,
	[DataInserimento] [datetime] NULL,
	[DataScadenzaAttivita] [datetime] NULL,
	[NoteAttivita] [varchar](max) NULL,
	[Richiamare] [bit] NULL,
	[Evaso] [bit] NULL,
	[TipoAttivita] varchar(25) NULL,
	[Priorita] [numeric](18, 0) NULL,
	[EsitoAttivita] varchar(25) NULL,
	[AssegnataA] [varchar](100) NULL,
	[NumeroChiamata] [varchar](100) NULL,
	[Letti] [bit] NULL,
	ColoreSfondo INT NOT NULL DEFAULT 0,
	ColoreCarattere INT NOT NULL DEFAULT 0
)
AS 
	BEGIN
		
		INSERT INTO @AttivitaScadenzeClienti
		(
			[CODCONTO]
			,DscCliente
			,[PROGRESSIVO]
			,[ESERCIZIO]
			,[ANNODOC]
			,[TIPODOC]
			,[NUMDOC]
			,[BIS]
			,[NUMSCAD]
			,[DATASCADENZA]
			,[CODCLIFOR]
			,[DATAFATTURA]
			,[BANCAINC]
			,[BANCAAPPOGGIO]
			,[NUMRIF]
			,[NUMEROPROT]
			,[CODAGE1]
			,[CODAGE2]
			,[CODAGE3]
			,[IMPPROVLIT1]
			,[IMPPROVLIT2]
			,[IMPPROVLIT3]
			,[IMPPROVVAL1]
			,[IMPPROVVAL2]
			,[IMPPROVVAL3]
			,[IMPPROVEURO1]
			,[IMPPROVEURO2]
			,[IMPPROVEURO3]
			,[LIQPROV1]
			,[LIQPROV2]
			,[LIQPROV3]
			,[IMPORTOSCLIT]
			,[IMPORTOSCVAL]
			,[IMPORTOSCEURO]
			,[IMPONIBSCLIT]
			,[IMPONIBSCVAL]
			,[IMPONIBSCEURO]
			,[TOTFATTLIT]
			,[TOTFATTVAL]
			,[TOTFATTEURO]
			,[IMPFATTLIT]
			,[IMPFATTVAL]
			,[IMPFATTEURO]
			,[FLAGCONT]
			,[TIPOEFFETTO]
			,[ESITO]
			,[LIVSOLL]
			,[LIQINS1]
			,[LIQINS2]
			,[LIQINS3]
			,[CODCAMBIO]
			,[VALCAMBIO]
			,[NRDISTINTA]
			,[NUMRAGGR]
			,[DATAPAGEFF]
			,[SCADATTPASS]
			,[NUMRIFPARTCONT]
			,[CODPAG]
			,[DATADEC]
			,[NOTE]
			,[NRGIORNALE]
			,[UTENTEMODIFICA]
			,[DATAMODIFICA]
			,[RIFRIGACONT]
			,[ESITOPREC]
			,[NRREGESITO]
			,[IDBOZZAAGT1]
			,[NRRIGAAGT1]
			,[IDBOZZAAGT2]
			,[NRRIGAAGT2]
			,[IDBOZZAAGT3]
			,[NRRIGAAGT3]
			,[DATASOLL1]
			,[DATASOLL2]
			,[DATASOLL3]
			,[RIFSCADRIEMISSIONE]
			,[FLAGCESSIONE]
			,[ABI_RIEMISS]
			,[CAB_RIEMISS]
			,[RAGSOC_RIEMISS]
			,[INDIRIZZO_RIEMISS]
			,[CAP_RIEMISS]
			,[LOCALITA_RIEMISS]
			,[PROV_RIEMISS]
			,[NAZ_RIEMISS]
			,[NOTE_RIEMISS]
			,[ESITOPRECRIEMISS]
			,[DSCBANCARIEMISS]
			,[DATAULTCALCINT]
			,[STATOSCADENZA]
			,[DATABLOCCO]
			,[DATASOLL4]
			,[DATASOLL5]
			,[CODICECIG]
			,[CODICECUP]
			,[IdAttivita]
			,[IdScadenza]
			,[UserID]
			,[DataInserimento]
			,[DataScadenzaAttivita]
			,[NoteAttivita]
			,[Richiamare]
			,[Evaso]
			,[TipoAttivita]
			,[Priorita]
			,[EsitoAttivita]
			,[AssegnataA]
			,[NumeroChiamata]
			,[Letti]
		)
		SELECT C.CODCONTO
			,C.DSCCONTO1 + ' ' + C.DSCCONTO2 AS 'DscCliente'
			,S.[PROGRESSIVO]
			,S.[ESERCIZIO]
			,S.[ANNODOC]
			,S.[TIPODOC]
			,S.[NUMDOC]
			,S.[BIS]
			,S.[NUMSCAD]
			,S.[DATASCADENZA]
			,S.[CODCLIFOR]
			,S.[DATAFATTURA]
			,S.[BANCAINC]
			,S.[BANCAAPPOGGIO]
			,S.[NUMRIF]
			,S.[NUMEROPROT]
			,S.[CODAGE1]
			,S.[CODAGE2]
			,S.[CODAGE3]
			,S.[IMPPROVLIT1]
			,S.[IMPPROVLIT2]
			,S.[IMPPROVLIT3]
			,S.[IMPPROVVAL1]
			,S.[IMPPROVVAL2]
			,S.[IMPPROVVAL3]
			,S.[IMPPROVEURO1]
			,S.[IMPPROVEURO2]
			,S.[IMPPROVEURO3]
			,S.[LIQPROV1]
			,S.[LIQPROV2]
			,S.[LIQPROV3]
			,S.[IMPORTOSCLIT]
			,S.[IMPORTOSCVAL]
			,S.[IMPORTOSCEURO]
			,S.[IMPONIBSCLIT]
			,S.[IMPONIBSCVAL]
			,S.[IMPONIBSCEURO]
			,S.[TOTFATTLIT]
			,S.[TOTFATTVAL]
			,S.[TOTFATTEURO]
			,S.[IMPFATTLIT]
			,S.[IMPFATTVAL]
			,S.[IMPFATTEURO]
			,S.[FLAGCONT]
			,S.[TIPOEFFETTO]
			,S.[ESITO]
			,S.[LIVSOLL]
			,S.[LIQINS1]
			,S.[LIQINS2]
			,S.[LIQINS3]
			,S.[CODCAMBIO]
			,S.[VALCAMBIO]
			,S.[NRDISTINTA]
			,S.[NUMRAGGR]
			,S.[DATAPAGEFF]
			,S.[SCADATTPASS]
			,S.[NUMRIFPARTCONT]
			,S.[CODPAG]
			,S.[DATADEC]
			,S.[NOTE]
			,S.[NRGIORNALE]
			,S.[UTENTEMODIFICA]
			,S.[DATAMODIFICA]
			,S.[RIFRIGACONT]
			,S.[ESITOPREC]
			,S.[NRREGESITO]
			,S.[IDBOZZAAGT1]
			,S.[NRRIGAAGT1]
			,S.[IDBOZZAAGT2]
			,S.[NRRIGAAGT2]
			,S.[IDBOZZAAGT3]
			,S.[NRRIGAAGT3]
			,S.[DATASOLL1]
			,S.[DATASOLL2]
			,S.[DATASOLL3]
			,S.[RIFSCADRIEMISSIONE]
			,S.[FLAGCESSIONE]
			,S.[ABI_RIEMISS]
			,S.[CAB_RIEMISS]
			,S.[RAGSOC_RIEMISS]
			,S.[INDIRIZZO_RIEMISS]
			,S.[CAP_RIEMISS]
			,S.[LOCALITA_RIEMISS]
			,S.[PROV_RIEMISS]
			,S.[NAZ_RIEMISS]
			,S.[NOTE_RIEMISS]
			,S.[ESITOPRECRIEMISS]
			,S.[DSCBANCARIEMISS]
			,S.[DATAULTCALCINT]
			,S.[STATOSCADENZA]
			,S.[DATABLOCCO]
			,S.[DATASOLL4]
			,S.[DATASOLL5]
			,S.[CODICECIG]
			,S.[CODICECUP]
			,A.[IdAttivita]
			,A.[IdScadenza]
			,A.[UserID]
			,A.[DataInserimento]
			,A.[DataScadenza]
			,A.[NoteAttivita]
			,A.[Richiamare]
			,A.[Evaso]
			,A.[TipoAttivita]
			,A.[Priorita]
			,A.[EsitoAttivita]
			,A.[AssegnataA]
			,A.[NumeroChiamata]
			,A.[Letti]
        FROM zzTabAttivitaSuScadenze A
			INNER JOIN TABSCADENZE S ON A.IdScadenza=S.PROGRESSIVO
			INNER JOIN ANAGRAFICACF C ON S.CODCLIFOR=C.CODCONTO

		-- Aggiorno le soglie di colore
		
		-- In azzurro e testo nero le righe di tipo Cessione (TIPOEFFETTO = 12)
		UPDATE  @AttivitaScadenzeClienti
		SET     ColoreSfondo = -16711681 ,
				ColoreCarattere = -16777216
		WHERE   TIPOEFFETTO = 12
		
		-- In rosso scuro e testo bianco le righe con esito Insoluto (ESITO = 3)
		UPDATE  @AttivitaScadenzeClienti
		SET     ColoreSfondo = -4194304 ,
				ColoreCarattere = -1
		WHERE   TIPOEFFETTO <> 12 AND ESITO = 3
		
		-- In verde e testo nero le righe con esito Insoluto Pagato (ESITO = 4)
		UPDATE  @AttivitaScadenzeClienti
		SET     ColoreSfondo = -16711936 ,
				ColoreCarattere = -16777216
		WHERE   TIPOEFFETTO <> 12 AND ESITO = 4
      
		RETURN                
	END

GO
GRANT SELECT
    ON OBJECT::[dbo].[zzFNGetAttivitaScadenzeClienti] TO [Metodo98]
    AS [dbo];

