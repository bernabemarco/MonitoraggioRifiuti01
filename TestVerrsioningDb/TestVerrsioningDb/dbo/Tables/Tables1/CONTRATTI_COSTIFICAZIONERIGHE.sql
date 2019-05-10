CREATE TABLE [dbo].[CONTRATTI_COSTIFICAZIONERIGHE] (
    [contratto]                     DECIMAL (10)    DEFAULT (0) NOT NULL,
    [idtestadoc]                    DECIMAL (10)    DEFAULT (0) NOT NULL,
    [idrigadoc]                     DECIMAL (10)    DEFAULT (0) NOT NULL,
    [descrizionecontratto]          VARCHAR (255)   NOT NULL,
    [perctrasporto]                 DECIMAL (19, 6) DEFAULT (0) NOT NULL,
    [incidenzabudgetincond]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [incidenzaincond]               DECIMAL (19, 6) DEFAULT (0) NULL,
    [incidenzabudgetcond]           DECIMAL (19, 6) DEFAULT (0) NULL,
    [incidenzacond]                 DECIMAL (19, 6) DEFAULT (0) NULL,
    [totalenettobudgetincond]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [totalenettoincond]             DECIMAL (19, 6) DEFAULT (0) NULL,
    [totalenettobudgetcond]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [totalenettocond]               DECIMAL (19, 6) DEFAULT (0) NULL,
    [totalenettoprovvigioni]        DECIMAL (19, 6) NULL,
    [totalenettoscontimerce]        DECIMAL (19, 6) NULL,
    [codclifor]                     VARCHAR (7)     NULL,
    [codcffatt]                     VARCHAR (7)     NULL,
    [numdiversamerci]               DECIMAL (5)     NULL,
    [utentemodifica]                VARCHAR (25)    NOT NULL,
    [datamodifica]                  DATETIME        NOT NULL,
    [totalenettobudgetincondvalore] DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [totalenettoincondvalore]       DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [totalenettobudgetcondvalore]   DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [totalenettocondvalore]         DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [perc_val]                      SMALLINT        DEFAULT ((0)) NULL,
    [incidenzabudgetcondriga]       DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [incidenzacondriga]             DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [incidenzapremiomaturato]       DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [incidenzapremiomaturatobudget] DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [premiocondizionato]            DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [idcond]                        DECIMAL (10)    DEFAULT ((0)) NULL,
    [valorerigapremio]              DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [CODICECOSTO]                   VARCHAR (5)     NULL,
    [TIPOCONTRIBUTO]                VARCHAR (1)     NULL,
    [ValoreRigaBudget]              DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [VALRIGAPROVV1]                 DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [VALRIGAPROVV2]                 DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [VALRIGAPROVV3]                 DECIMAL (16, 6) DEFAULT ((0)) NULL
);


GO
CREATE NONCLUSTERED INDEX [IDX_CONTRATTI_COSTIFICAZIONERIGHE_idtestadoc]
    ON [dbo].[CONTRATTI_COSTIFICAZIONERIGHE]([idtestadoc] ASC);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CONTRATTI_COSTIFICAZIONERIGHE] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CONTRATTI_COSTIFICAZIONERIGHE] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CONTRATTI_COSTIFICAZIONERIGHE] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CONTRATTI_COSTIFICAZIONERIGHE] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CONTRATTI_COSTIFICAZIONERIGHE] TO [Metodo98]
    AS [dbo];

