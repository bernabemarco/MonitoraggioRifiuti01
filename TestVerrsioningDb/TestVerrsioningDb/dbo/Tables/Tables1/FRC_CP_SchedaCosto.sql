CREATE TABLE [dbo].[FRC_CP_SchedaCosto] (
    [ID]                                     INT             IDENTITY (1, 1) NOT NULL,
    [TIPOSCHEDA]                             SMALLINT        NULL,
    [PREZZOCALCOLATO]                        SMALLINT        NULL,
    [AMBIENTE]                               VARCHAR (3)     NULL,
    [ANNODOC]                                INT             NULL,
    [MESEDOC]                                INT             NULL,
    [CODCLIFOR]                              VARCHAR (7)     NULL,
    [CODART]                                 VARCHAR (50)    NULL,
    [UM_BASE]                                VARCHAR (3)     NULL,
    [QUANTITA]                               DECIMAL (19, 6) NULL,
    [TOTLORDORIGAEURO]                       DECIMAL (19, 6) NULL,
    [ScontoIncondizionato]                   DECIMAL (19, 6) NULL,
    [TOTSCONTORIGAEURO]                      DECIMAL (19, 6) NULL,
    [SCONTO_COMMERCIALE]                     DECIMAL (19, 6) NULL,
    [TOTPROVVAGEURO1]                        DECIMAL (19, 6) NULL,
    [TOTPROVVAGEURO2]                        DECIMAL (19, 6) NULL,
    [TOTPROVVAGEURO3]                        DECIMAL (19, 6) NULL,
    [PROVVIGIONE_SPEC]                       DECIMAL (19, 6) NULL,
    [CONTRIBUTO_PERC]                        DECIMAL (19, 6) NULL,
    [CONTRIBUTO_EURO]                        DECIMAL (19, 6) NULL,
    [OMAGGI_CLIENTI]                         DECIMAL (19, 6) NULL,
    [PREMIO_CLIENTI]                         DECIMAL (19, 6) NULL,
    [PREMIO_AGENTI]                          DECIMAL (19, 6) NULL,
    [TRASPORTO_VENDITA]                      DECIMAL (19, 6) NULL,
    [LOGISTICA]                              DECIMAL (19, 6) NULL,
    [VARIE_COMMERCIALI]                      DECIMAL (19, 6) NULL,
    [CostiVariabiliDirettiCommessa]          DECIMAL (19, 6) NULL,
    [SpeseImballo]                           DECIMAL (19, 6) NULL,
    [SpeseTrasporto]                         DECIMAL (19, 6) NULL,
    [SpeseEffetto]                           DECIMAL (19, 6) NULL,
    [SpeseDocumento]                         DECIMAL (19, 6) NULL,
    [CostiFissiDirettiCommessa]              DECIMAL (19, 6) NULL,
    [AMM_SPECIFICI]                          DECIMAL (19, 6) NULL,
    [STAMPI_SPECIFICI]                       DECIMAL (19, 6) NULL,
    [BREVETTI_PLURIENNALI]                   DECIMAL (19, 6) NULL,
    [BREVETTI_ANNUALI]                       DECIMAL (19, 6) NULL,
    [VARIE_INDUSTRIALI]                      DECIMAL (19, 6) NULL,
    [CostoStruttura01]                       DECIMAL (19, 6) NULL,
    [CostoStruttura02]                       DECIMAL (19, 6) NULL,
    [CostoStruttura03]                       DECIMAL (19, 6) NULL,
    [CostoStruttura04]                       DECIMAL (19, 6) NULL,
    [CostoStruttura05]                       DECIMAL (19, 6) NULL,
    [CostoStruttura06]                       DECIMAL (19, 6) NULL,
    [CostoStruttura07]                       DECIMAL (19, 6) NULL,
    [CostoStruttura08]                       DECIMAL (19, 6) NULL,
    [CostoStruttura09]                       DECIMAL (19, 6) NULL,
    [CostoStruttura10]                       DECIMAL (19, 6) NULL,
    [CostoStruttura11]                       DECIMAL (19, 6) NULL,
    [CostoStruttura12]                       DECIMAL (19, 6) NULL,
    [CostoStruttura13]                       DECIMAL (19, 6) NULL,
    [CostoStruttura14]                       DECIMAL (19, 6) NULL,
    [CostoStruttura15]                       DECIMAL (19, 6) NULL,
    [CostoStruttura16]                       DECIMAL (19, 6) NULL,
    [CostoStruttura17]                       DECIMAL (19, 6) NULL,
    [CostoStruttura18]                       DECIMAL (19, 6) NULL,
    [CostoStruttura19]                       DECIMAL (19, 6) NULL,
    [CostoStruttura20]                       DECIMAL (19, 6) NULL,
    [CostoStruttura21]                       DECIMAL (19, 6) NULL,
    [CostoStruttura22]                       DECIMAL (19, 6) NULL,
    [CostoStruttura23]                       DECIMAL (19, 6) NULL,
    [CostoStruttura24]                       DECIMAL (19, 6) NULL,
    [CostoStruttura25]                       DECIMAL (19, 6) NULL,
    [CostoStruttura26]                       DECIMAL (19, 6) NULL,
    [CostoStruttura27]                       DECIMAL (19, 6) NULL,
    [CostoStruttura28]                       DECIMAL (19, 6) NULL,
    [CostoStruttura29]                       DECIMAL (19, 6) NULL,
    [CostoStruttura30]                       DECIMAL (19, 6) NULL,
    [T_TOTLORDORIGA]                         DECIMAL (19, 6) NULL,
    [T_SCONTI]                               DECIMAL (19, 6) NULL,
    [T_TOTNETTORIGA]                         DECIMAL (19, 6) NULL,
    [T_COSTICOMMERCIALIDIRETTI]              DECIMAL (19, 6) NULL,
    [T_RIVALSEDOCUMENTO]                     DECIMAL (19, 6) NULL,
    [T_MARGINECONTRIBUZIONECOMMERCIALE]      DECIMAL (19, 6) NULL,
    [T_MATERIALI]                            DECIMAL (19, 6) NULL,
    [T_LAVORAZIONIESTERNE]                   DECIMAL (19, 6) NULL,
    [T_LAVORAZIONIINTERNE]                   DECIMAL (19, 6) NULL,
    [T_MARGINEINDUSTRIALELORDO]              DECIMAL (19, 6) NULL,
    [T_MARGINECONTRIBUZIONE1LIVELLO]         DECIMAL (19, 6) NULL,
    [T_COSTIFISSIDIRETTI]                    DECIMAL (19, 6) NULL,
    [T_MARGINEINDUSTRIALENETTO]              DECIMAL (19, 6) NULL,
    [T_MARGINECONTRIBUZIONE2LIVELLO]         DECIMAL (19, 6) NULL,
    [T_COSTIGENERALI]                        DECIMAL (19, 6) NULL,
    [T_MARGINELORDOIMPOSTE]                  DECIMAL (19, 6) NULL,
    [T_PRODUTTIVITAORARIA]                   DECIMAL (19, 6) NULL,
    [T_REDDITIVITAORARIA]                    DECIMAL (19, 6) NULL,
    [TOTLORDORIGAEURO_PERC]                  DECIMAL (19, 6) NULL,
    [ScontoIncondizionato_PERC]              DECIMAL (19, 6) NULL,
    [TOTSCONTORIGAEURO_PERC]                 DECIMAL (19, 6) NULL,
    [SCONTO_COMMERCIALE_PERC]                DECIMAL (19, 6) NULL,
    [TOTPROVVAGEURO1_PERC]                   DECIMAL (19, 6) NULL,
    [TOTPROVVAGEURO2_PERC]                   DECIMAL (19, 6) NULL,
    [TOTPROVVAGEURO3_PERC]                   DECIMAL (19, 6) NULL,
    [PROVVIGIONE_SPEC_PERC]                  DECIMAL (19, 6) NULL,
    [CONTRIBUTO_PERC_PERC]                   DECIMAL (19, 6) NULL,
    [CONTRIBUTO_EURO_PERC]                   DECIMAL (19, 6) NULL,
    [OMAGGI_CLIENTI_PERC]                    DECIMAL (19, 6) NULL,
    [PREMIO_CLIENTI_PERC]                    DECIMAL (19, 6) NULL,
    [PREMIO_AGENTI_PERC]                     DECIMAL (19, 6) NULL,
    [TRASPORTO_VENDITA_PERC]                 DECIMAL (19, 6) NULL,
    [LOGISTICA_PERC]                         DECIMAL (19, 6) NULL,
    [VARIE_COMMERCIALI_PERC]                 DECIMAL (19, 6) NULL,
    [CostiVariabiliDirettiCommessa_PERC]     DECIMAL (19, 6) NULL,
    [SpeseImballo_PERC]                      DECIMAL (19, 6) NULL,
    [SpeseTrasporto_PERC]                    DECIMAL (19, 6) NULL,
    [SpeseEffetto_PERC]                      DECIMAL (19, 6) NULL,
    [SpeseDocumento_PERC]                    DECIMAL (19, 6) NULL,
    [CostiFissiDirettiCommessa_PERC]         DECIMAL (19, 6) NULL,
    [AMM_SPECIFICI_PERC]                     DECIMAL (19, 6) NULL,
    [STAMPI_SPECIFICI_PERC]                  DECIMAL (19, 6) NULL,
    [BREVETTI_PLURIENNALI_PERC]              DECIMAL (19, 6) NULL,
    [BREVETTI_ANNUALI_PERC]                  DECIMAL (19, 6) NULL,
    [VARIE_INDUSTRIALI_PERC]                 DECIMAL (19, 6) NULL,
    [CostoStruttura01_PERC]                  DECIMAL (19, 6) NULL,
    [CostoStruttura02_PERC]                  DECIMAL (19, 6) NULL,
    [CostoStruttura03_PERC]                  DECIMAL (19, 6) NULL,
    [CostoStruttura04_PERC]                  DECIMAL (19, 6) NULL,
    [CostoStruttura05_PERC]                  DECIMAL (19, 6) NULL,
    [CostoStruttura06_PERC]                  DECIMAL (19, 6) NULL,
    [CostoStruttura07_PERC]                  DECIMAL (19, 6) NULL,
    [CostoStruttura08_PERC]                  DECIMAL (19, 6) NULL,
    [CostoStruttura09_PERC]                  DECIMAL (19, 6) NULL,
    [CostoStruttura10_PERC]                  DECIMAL (19, 6) NULL,
    [CostoStruttura11_PERC]                  DECIMAL (19, 6) NULL,
    [CostoStruttura12_PERC]                  DECIMAL (19, 6) NULL,
    [CostoStruttura13_PERC]                  DECIMAL (19, 6) NULL,
    [CostoStruttura14_PERC]                  DECIMAL (19, 6) NULL,
    [CostoStruttura15_PERC]                  DECIMAL (19, 6) NULL,
    [CostoStruttura16_PERC]                  DECIMAL (19, 6) NULL,
    [CostoStruttura17_PERC]                  DECIMAL (19, 6) NULL,
    [CostoStruttura18_PERC]                  DECIMAL (19, 6) NULL,
    [CostoStruttura19_PERC]                  DECIMAL (19, 6) NULL,
    [CostoStruttura20_PERC]                  DECIMAL (19, 6) NULL,
    [CostoStruttura21_PERC]                  DECIMAL (19, 6) NULL,
    [CostoStruttura22_PERC]                  DECIMAL (19, 6) NULL,
    [CostoStruttura23_PERC]                  DECIMAL (19, 6) NULL,
    [CostoStruttura24_PERC]                  DECIMAL (19, 6) NULL,
    [CostoStruttura25_PERC]                  DECIMAL (19, 6) NULL,
    [CostoStruttura26_PERC]                  DECIMAL (19, 6) NULL,
    [CostoStruttura27_PERC]                  DECIMAL (19, 6) NULL,
    [CostoStruttura28_PERC]                  DECIMAL (19, 6) NULL,
    [CostoStruttura29_PERC]                  DECIMAL (19, 6) NULL,
    [CostoStruttura30_PERC]                  DECIMAL (19, 6) NULL,
    [T_TOTLORDORIGA_PERC]                    DECIMAL (19, 6) NULL,
    [T_SCONTI_PERC]                          DECIMAL (19, 6) NULL,
    [T_TOTNETTORIGA_PERC]                    DECIMAL (19, 6) NULL,
    [T_COSTICOMMERCIALIDIRETTI_PERC]         DECIMAL (19, 6) NULL,
    [T_RIVALSEDOCUMENTO_PERC]                DECIMAL (19, 6) NULL,
    [T_MARGINECONTRIBUZIONECOMMERCIALE_PERC] DECIMAL (19, 6) NULL,
    [T_MATERIALI_PERC]                       DECIMAL (19, 6) NULL,
    [T_LAVORAZIONIESTERNE_PERC]              DECIMAL (19, 6) NULL,
    [T_LAVORAZIONIINTERNE_PERC]              DECIMAL (19, 6) NULL,
    [T_MARGINEINDUSTRIALELORDO_PERC]         DECIMAL (19, 6) NULL,
    [T_MARGINECONTRIBUZIONE1LIVELLO_PERC]    DECIMAL (19, 6) NULL,
    [T_COSTIFISSIDIRETTI_PERC]               DECIMAL (19, 6) NULL,
    [T_MARGINEINDUSTRIALENETTO_PERC]         DECIMAL (19, 6) NULL,
    [T_MARGINECONTRIBUZIONE2LIVELLO_PERC]    DECIMAL (19, 6) NULL,
    [T_COSTIGENERALI_PERC]                   DECIMAL (19, 6) NULL,
    [T_MARGINELORDOIMPOSTE_PERC]             DECIMAL (19, 6) NULL,
    [UTENTEMODIFICA]                         VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]                           DATETIME        NOT NULL,
    [T_COSTOINDUSTRIALEPIENO]                DECIMAL (19, 6) NULL,
    [T_COSTOINDUSTRIALEVARIABILE]            DECIMAL (19, 6) NULL,
    [T_COSTOINDUSTRIALEPIENO_PERC]           DECIMAL (19, 6) NULL,
    [T_COSTOINDUSTRIALEVARIABILE_PERC]       DECIMAL (19, 6) NULL,
    [NomeElaborazione]                       VARCHAR (50)    DEFAULT ('') NULL,
    CONSTRAINT [KEY_FRC_CP_SchedaCosto] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO


/*  DELETE TRIGGER "TD_FRC_CP_SchedaCosto" FOR TABLE "FRC_CP_SchedaCosto"  */
CREATE TRIGGER TD_FRC_CP_SchedaCosto ON FRC_CP_SchedaCosto FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)

    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN
    
    /*  DELETE ALL CHILDREN IN "FRC_CP_DatiMateriali"  */
    DELETE FRC_CP_DatiMateriali
    FROM   FRC_CP_DatiMateriali T2, DELETED T1
    WHERE  T2.IDOrigine = T1.ID
    
    /*  DELETE ALL CHILDREN IN "FRC_CP_DatiMaterialiCLav"  */
    DELETE FRC_CP_DatiMaterialiCLav
    FROM   FRC_CP_DatiMaterialiCLav T2, DELETED T1
    WHERE  T2.IDOrigine = T1.ID
    
    /*  DELETE ALL CHILDREN IN "FRC_CP_DatiCicli"  */
    DELETE FRC_CP_DatiCicli
    FROM   FRC_CP_DatiCicli T2, DELETED T1
    WHERE  T2.IDOrigine = T1.ID
    
    RETURN
    
/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO
GRANT DELETE
    ON OBJECT::[dbo].[FRC_CP_SchedaCosto] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRC_CP_SchedaCosto] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRC_CP_SchedaCosto] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRC_CP_SchedaCosto] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRC_CP_SchedaCosto] TO [Metodo98]
    AS [dbo];

