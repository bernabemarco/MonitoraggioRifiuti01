
CREATE VIEW [dbo].[zzCtVistaAttivitaScadenzeClienti] AS
    SELECT
        A.[IdAttivita]
        , A.[IdScadenza]
        , A.[UserID]
        , A.[DataInserimento]
        , A.[DataScadenza] AS [DataScadenzaAttivita]
        , A.[NoteAttivita]
        , A.[Richiamare]
        , A.[Evaso]
        , T.DescrizioneTipo AS [TipoAttivita]
        , A.[Priorita]
        , E.DescrizioneEsito AS [EsitoAttivita]
        , A.[AssegnataA]
        , A.[NumeroChiamata]
        , A.[Letti]
        , C.CODCONTO
        , ISNULL(C.DSCCONTO1,'') + ' ' + ISNULL(C.DSCCONTO2,'') AS 'DscCliente'
        , S.[PROGRESSIVO]
        , S.[ESERCIZIO]
        , S.[ANNODOC]
        , S.[TIPODOC]
        , S.[NUMDOC]
        , S.[BIS]
        , S.[NUMSCAD]
        , S.[DATASCADENZA]
        , S.[CODCLIFOR]
        , S.[DATAFATTURA]
        , S.[BANCAINC]
        , S.[BANCAAPPOGGIO]
        , S.[NUMRIF]
        , S.[NUMEROPROT]
        , S.[CODAGE1]
        , S.[CODAGE2]
        , S.[CODAGE3]
        , S.[IMPPROVLIT1]
        , S.[IMPPROVLIT2]
        , S.[IMPPROVLIT3]
        , S.[IMPPROVVAL1]
        , S.[IMPPROVVAL2]
        , S.[IMPPROVVAL3]
        , S.[IMPPROVEURO1]
        , S.[IMPPROVEURO2]
        , S.[IMPPROVEURO3]
        , S.[LIQPROV1]
        , S.[LIQPROV2]
        , S.[LIQPROV3]
        , S.[IMPORTOSCLIT]
        , S.[IMPORTOSCVAL]
        , S.[IMPORTOSCEURO]
        , S.[IMPONIBSCLIT]
        , S.[IMPONIBSCVAL]
        , S.[IMPONIBSCEURO]
        , S.[TOTFATTLIT]
        , S.[TOTFATTVAL]
        , S.[TOTFATTEURO]
        , S.[IMPFATTLIT]
        , S.[IMPFATTVAL]
        , S.[IMPFATTEURO]
        , S.[FLAGCONT]
        , S.[TIPOEFFETTO]
        , S.[ESITO]
        , S.[LIVSOLL]
        , S.[LIQINS1]
        , S.[LIQINS2]
        , S.[LIQINS3]
        , S.[CODCAMBIO]
        , S.[VALCAMBIO]
        , S.[NRDISTINTA]
        , S.[NUMRAGGR]
        , S.[DATAPAGEFF]
        , S.[SCADATTPASS]
        , S.[NUMRIFPARTCONT]
        , S.[CODPAG]
        , S.[DATADEC]
        , S.[NOTE]
        , S.[NRGIORNALE]
        , S.[UTENTEMODIFICA]
        , S.[DATAMODIFICA]
        , S.[RIFRIGACONT]
        , S.[ESITOPREC]
        , S.[NRREGESITO]
        , S.[IDBOZZAAGT1]
        , S.[NRRIGAAGT1]
        , S.[IDBOZZAAGT2]
        , S.[NRRIGAAGT2]
        , S.[IDBOZZAAGT3]
        , S.[NRRIGAAGT3]
        , S.[DATASOLL1]
        , S.[DATASOLL2]
        , S.[DATASOLL3]
        , S.[RIFSCADRIEMISSIONE]
        , S.[FLAGCESSIONE]
        , S.[ABI_RIEMISS]
        , S.[CAB_RIEMISS]
        , S.[RAGSOC_RIEMISS]
        , S.[INDIRIZZO_RIEMISS]
        , S.[CAP_RIEMISS]
        , S.[LOCALITA_RIEMISS]
        , S.[PROV_RIEMISS]
        , S.[NAZ_RIEMISS]
        , S.[NOTE_RIEMISS]
        , S.[ESITOPRECRIEMISS]
        , S.[DSCBANCARIEMISS]
        , S.[DATAULTCALCINT]
        , S.[STATOSCADENZA]
        , S.[DATABLOCCO]
        , S.[DATASOLL4]
        , S.[DATASOLL5]
        , S.[CODICECIG]
        , S.[CODICECUP]
    FROM zzTabAttivitaSuScadenze A
        INNER JOIN TABSCADENZE S
        ON S.PROGRESSIVO = A.IdScadenza
        LEFT OUTER JOIN ANAGRAFICACF C
        ON C.CODCONTO = S.CODCLIFOR
        LEFT OUTER JOIN zzTabTipiAttivita T
        ON T.CodTipo = A.TipoAttivita
        LEFT OUTER JOIN zzTabEsitiAttivita E
        ON E.CodEsito = A.EsitoAttivita

GO
GRANT DELETE
    ON OBJECT::[dbo].[zzCtVistaAttivitaScadenzeClienti] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[zzCtVistaAttivitaScadenzeClienti] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[zzCtVistaAttivitaScadenzeClienti] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[zzCtVistaAttivitaScadenzeClienti] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[zzCtVistaAttivitaScadenzeClienti] TO [Metodo98]
    AS [dbo];

