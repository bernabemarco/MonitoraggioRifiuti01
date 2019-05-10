CREATE TABLE [dbo].[PL_PackingTesta] (
    [Progressivo]             DECIMAL (18)    NOT NULL,
    [Esercizio]               DECIMAL (5)     NOT NULL,
    [Data]                    DATETIME        NOT NULL,
    [CliFor]                  VARCHAR (7)     NOT NULL,
    [DestinazioneDiversa]     DECIMAL (5)     DEFAULT ((0)) NULL,
    [RagSocDDM]               VARCHAR (80)    DEFAULT ('') NULL,
    [IndirizzoDDM]            VARCHAR (80)    DEFAULT ('') NULL,
    [CapDDM]                  VARCHAR (8)     DEFAULT ('') NULL,
    [LocalitaDDM]             VARCHAR (80)    DEFAULT ('') NULL,
    [ProvinciaDDM]            VARCHAR (80)    DEFAULT ('') NULL,
    [DestinazioneDiversaprel] DECIMAL (5)     DEFAULT ((0)) NULL,
    [RagSocDDMprel]           VARCHAR (80)    DEFAULT ('') NULL,
    [IndirizzoDDMprel]        VARCHAR (80)    DEFAULT ('') NULL,
    [CapDDMprel]              VARCHAR (8)     DEFAULT ('') NULL,
    [LocalitaDDMprel]         VARCHAR (80)    DEFAULT ('') NULL,
    [ProvinciaDDMprel]        VARCHAR (80)    DEFAULT ('') NULL,
    [NUMPL]                   DECIMAL (19)    NOT NULL,
    [Chiuso]                  SMALLINT        DEFAULT ((0)) NULL,
    [NsRif]                   VARCHAR (250)   DEFAULT ('') NULL,
    [VsRif]                   VARCHAR (250)   DEFAULT ('') NULL,
    [Spedizione]              CHAR (1)        NULL,
    [NumPartColli]            DECIMAL (18)    DEFAULT ((0)) NULL,
    [Note]                    VARCHAR (6500)  DEFAULT ('') NULL,
    [Spedizioniere]           DECIMAL (5)     DEFAULT ((0)) NULL,
    [TOTALECOLLI]             DECIMAL (16, 6) DEFAULT ((0)) NOT NULL,
    [TOTALECOLLIRAGG]         DECIMAL (16, 9) DEFAULT ((0)) NOT NULL,
    [TOTALEPESONETTO]         DECIMAL (16, 6) DEFAULT ((0)) NOT NULL,
    [TOTALEPESOLORDO]         DECIMAL (16, 6) DEFAULT ((0)) NOT NULL,
    [TOTALEVOLUME]            DECIMAL (16, 6) DEFAULT ((0)) NOT NULL,
    [PesoBilancia]            DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [PrelImbPedSuEmissDoc]    SMALLINT        DEFAULT ((0)) NULL,
    [PrelNewArtSuEmissDoc]    SMALLINT        DEFAULT ((0)) NULL,
    [Tipo_Prelievo]           SMALLINT        DEFAULT ((0)) NULL,
    [Tipo_QtaPrel]            SMALLINT        DEFAULT ((0)) NULL,
    [EmessoDoc]               SMALLINT        DEFAULT ((0)) NULL,
    [UTENTEMODIFICA]          VARCHAR (50)    NOT NULL,
    [DATAMODIFICA]            DATETIME        NOT NULL,
    CONSTRAINT [PK_PL_PackingTesta] PRIMARY KEY CLUSTERED ([Progressivo] ASC)
);


GO


CREATE TRIGGER TD_PL_PackingTesta ON PL_PackingTesta
FOR DELETE 
AS

    /*  DELETE ALL CHILDREN IN "PL_PackingRighe"  */
    DELETE PL_PackingRighe
    FROM   PL_PackingRighe T2, DELETED T1
    WHERE  T2.RIFPROGRESSIVO  = T1.Progressivo 
           
    /*  DELETE ALL CHILDREN IN "PL_PackingRagg"  */
    DELETE PL_PackingRagg
    FROM   PL_PackingRagg T2, DELETED T1
    WHERE  T2.RIFPROGRESSIVO  = T1.Progressivo 

    /*  DELETE ALL CHILDREN IN "PL_PackingRigheRagg"  */
    DELETE PL_PackingRigheRagg
    FROM   PL_PackingRigheRagg T2, DELETED T1
    WHERE  T2.RIFPROGRESSIVO  = T1.Progressivo 

    /*  DELETE ALL CHILDREN IN "PL_Packing_ElencoArtXIMB"  */
    DELETE PL_Packing_ElencoArtXIMB
    FROM   PL_Packing_ElencoArtXIMB T2, DELETED T1
    WHERE  T2.RIFPROGRESSIVO  = T1.Progressivo 



GO
GRANT DELETE
    ON OBJECT::[dbo].[PL_PackingTesta] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[PL_PackingTesta] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[PL_PackingTesta] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[PL_PackingTesta] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[PL_PackingTesta] TO [Metodo98]
    AS [dbo];

