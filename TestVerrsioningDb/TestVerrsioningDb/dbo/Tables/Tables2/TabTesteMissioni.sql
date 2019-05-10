CREATE TABLE [dbo].[TabTesteMissioni] (
    [PROGRESSIVO]    DECIMAL (10)  NOT NULL,
    [ESERCIZIO]      DECIMAL (5)   NOT NULL,
    [NUMEROMISS]     DECIMAL (9)   NOT NULL,
    [DATAMISS]       DATETIME      NULL,
    [DESCRMISS]      VARCHAR (70)  NULL,
    [IMPFILTRO]      SMALLINT      DEFAULT (0) NULL,
    [UM]             VARCHAR (3)   NULL,
    [TIPOEMISSLISTE] SMALLINT      DEFAULT (0) NULL,
    [STATO]          SMALLINT      DEFAULT (0) NULL,
    [DATAEVAS]       DATETIME      NULL,
    [EVADFINODATA]   DATETIME      NULL,
    [CODDEPOSITO]    VARCHAR (10)  DEFAULT ('') NULL,
    [UTENTEMODIFICA] VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]   DATETIME      NOT NULL,
    [FILESCRIPT]     VARCHAR (100) NULL,
    [CtrlGiac]       SMALLINT      DEFAULT ((0)) NULL,
    [EvasTotOrdini]  SMALLINT      DEFAULT ((0)) NULL,
    CONSTRAINT [PK_TabTesteMissioni] PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC) WITH (FILLFACTOR = 90)
);


GO


CREATE TRIGGER TD_TabTesteMissioni  ON TabTesteMissioni
FOR DELETE 
AS

BEGIN

    /*  DELETE ALL CHILDREN IN "TabRigheMiss_1"  */
    DELETE TabRigheMiss_1
    FROM     TabRigheMiss_1 T2, DELETED T1
    WHERE  T2.RIFPROGRESSIVO = T1.PROGRESSIVO


    /*  DELETE ALL CHILDREN IN "TabRigheMiss_2"  */
    DELETE TabRigheMiss_2
    FROM     TabRigheMiss_2 T2, DELETED T1
    WHERE  T2.RIFPROGRESSIVO = T1.PROGRESSIVO


    /*  DELETE ALL CHILDREN IN "TabTesteDocumentiMiss"  */
    DELETE TabTesteDocumentiMiss
    FROM     TabTesteDocumentiMiss T2, DELETED T1
    WHERE  T2.RIFPROGRTESTAMISS = T1.PROGRESSIVO

 
    /*  DELETE ALL CHILDREN IN "TabDocMissNonEvadibili"  */
    DELETE TabDocMissNonEvadibili
    FROM     TabDocMissNonEvadibili T2, DELETED T1
    WHERE  T2.PROGRMISS = T1.PROGRESSIVO 




END


GO
GRANT DELETE
    ON OBJECT::[dbo].[TabTesteMissioni] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TabTesteMissioni] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TabTesteMissioni] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TabTesteMissioni] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TabTesteMissioni] TO [Metodo98]
    AS [dbo];

