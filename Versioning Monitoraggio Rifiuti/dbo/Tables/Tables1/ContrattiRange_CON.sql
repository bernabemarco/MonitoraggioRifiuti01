CREATE TABLE [dbo].[ContrattiRange_CON] (
    [RIFPROGRESSIVO]            DECIMAL (10)    NOT NULL,
    [NRRIGA]                    INT             NOT NULL,
    [POSIZIONE]                 INT             NULL,
    [FLAGRIGA]                  SMALLINT        NULL,
    [VALORE]                    DECIMAL (19, 6) DEFAULT (0) NULL,
    [QTA]                       DECIMAL (19, 6) DEFAULT (0) NULL,
    [UM]                        VARCHAR (3)     NULL,
    [QTA2]                      DECIMAL (19, 6) DEFAULT (0) NULL,
    [UM2]                       VARCHAR (2)     NULL,
    [PREMIOVALORE]              DECIMAL (19, 6) DEFAULT (0) NULL,
    [PREMIOPERCENT]             DECIMAL (19, 6) DEFAULT (0) NULL,
    [NOTE]                      VARCHAR (500)   NULL,
    [UTENTEMODIFICA]            VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]              DATETIME        NOT NULL,
    [PREVISIONI]                SMALLINT        DEFAULT (2) NULL,
    [TIPO]                      SMALLINT        DEFAULT (0) NULL,
    [CONSUNTIVATOQTA]           DECIMAL (19, 6) DEFAULT (0) NULL,
    [CONSUNTIVATOVALORE]        DECIMAL (19, 6) DEFAULT (0) NULL,
    [CONSUNTIVATOQTASTORICO]    DECIMAL (19, 6) DEFAULT (0) NULL,
    [CONSUNTIVATOVALORESTORICO] DECIMAL (19, 6) DEFAULT (0) NULL,
    [PREMIOMATURATO]            DECIMAL (19, 6) DEFAULT (0) NULL,
    [UMVALORE]                  VARCHAR (3)     NULL,
    [PREMIONONVALIDO]           SMALLINT        DEFAULT ((0)) NULL,
    [ESCLUSOLOGICAMENTE]        SMALLINT        DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([RIFPROGRESSIVO] ASC, [NRRIGA] ASC) WITH (FILLFACTOR = 90)
);


GO

CREATE TRIGGER CANCELLACLDICUI ON ContrattiRange_CON
FOR DELETE 
AS

   DELETE CONTRATTIGRP_CONDICUI
    FROM   CONTRATTIGRP_CONDICUI T2, DELETED T1
    WHERE  T2.RifProgressivo = T1.RifProgressivo
   AND 	T2.RifRiga = T1.NRRiga

   DELETE CONTRATTICAT_CONDICUI
    FROM   CONTRATTICAT_CONDICUI T2, DELETED T1
    WHERE  T2.RifProgressivo = T1.RifProgressivo
   AND 	T2.RifRiga = T1.NRRiga

   DELETE CONTRATTICATST_CONDICUI
    FROM   CONTRATTICATST_CONDICUI T2, DELETED T1
    WHERE  T2.RifProgressivo = T1.RifProgressivo
   AND 	T2.RifRiga = T1.NRRiga

   DELETE CONTRATTIGRPPRZ_CONDICUI
    FROM   CONTRATTIGRPPRZ_CONDICUI T2, DELETED T1
    WHERE  T2.RifProgressivo = T1.RifProgressivo
   AND 	T2.RifRiga = T1.NRRiga

   DELETE CONTRATTIFAMREP_CONDICUI
    FROM   CONTRATTIFAMREP_CONDICUI T2, DELETED T1
    WHERE  T2.RifProgressivo = T1.RifProgressivo
   AND 	T2.RifRiga = T1.NRRiga

   DELETE CONTRATTIART_CONDICUI
    FROM   CONTRATTIART_CONDICUI T2, DELETED T1
    WHERE  T2.RifProgressivo = T1.RifProgressivo
   AND 	T2.RifRiga = T1.NRRiga

   DELETE CONTRATTIRANGE_CONDICUI
    FROM   CONTRATTIRANGE_CONDICUI T2, DELETED T1
    WHERE  T2.RifProgressivo = T1.RifProgressivo
   AND 	T2.RifRiga = T1.NRRiga


GO
GRANT DELETE
    ON OBJECT::[dbo].[ContrattiRange_CON] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ContrattiRange_CON] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ContrattiRange_CON] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ContrattiRange_CON] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ContrattiRange_CON] TO [Metodo98]
    AS [dbo];

