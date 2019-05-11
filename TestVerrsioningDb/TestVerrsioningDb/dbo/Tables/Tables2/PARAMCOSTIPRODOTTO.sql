﻿CREATE TABLE [dbo].[PARAMCOSTIPRODOTTO] (
    [IDCOSTO]              VARCHAR (10) NOT NULL,
    [DESCRIZIONE]          VARCHAR (25) NULL,
    [TIPOCOSTO]            SMALLINT     NULL,
    [CRITERIOVAL]          SMALLINT     NULL,
    [FLG_GESTCOSTI]        SMALLINT     NULL,
    [FLG_CONSIDERACICLI]   SMALLINT     NULL,
    [FLG_ARTCICLODISTINTA] SMALLINT     NULL,
    [TIPOVALORIZMAT_1]     SMALLINT     NULL,
    [LISTMAT_1]            DECIMAL (5)  NULL,
    [COSTOSTD_1]           VARCHAR (10) NULL,
    [COSTOCORR_1]          VARCHAR (10) NULL,
    [TIPOVALORIZMAT_2]     SMALLINT     NULL,
    [LISTMAT_2]            DECIMAL (5)  NULL,
    [COSTOSTD_2]           VARCHAR (10) NULL,
    [COSTOCORR_2]          VARCHAR (10) NULL,
    [TIPOVALORIZMAT_3]     SMALLINT     NULL,
    [LISTMAT_3]            DECIMAL (5)  NULL,
    [COSTOSTD_3]           VARCHAR (10) NULL,
    [COSTOCORR_3]          VARCHAR (10) NULL,
    [FLG_USALISTTRASF]     SMALLINT     NULL,
    [TIPOVALTRASF]         SMALLINT     NULL,
    [FLG_VALUTACICLO]      SMALLINT     NULL,
    [TIPOVALCICLO]         SMALLINT     NULL,
    [LISTTRASF]            DECIMAL (5)  NULL,
    [COSTOSTD]             VARCHAR (10) NULL,
    [COSTOCORR]            VARCHAR (10) NULL,
    [UTENTEMODIFICA]       VARCHAR (25) NOT NULL,
    [DATAMODIFICA]         DATETIME     NOT NULL,
    [FLG_AGGCOSTIPROD]     SMALLINT     NULL,
    [TIPOAGGCOMPONENTI]    SMALLINT     NULL,
    [FLG_USAPREZZIPART]    SMALLINT     NULL,
    PRIMARY KEY CLUSTERED ([IDCOSTO] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[PARAMCOSTIPRODOTTO] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[PARAMCOSTIPRODOTTO] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[PARAMCOSTIPRODOTTO] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[PARAMCOSTIPRODOTTO] TO [Metodo98]
    AS [dbo];
