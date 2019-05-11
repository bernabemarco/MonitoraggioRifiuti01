﻿CREATE TABLE [dbo].[FRCScostamentiCicli] (
    [ID]                   INT              IDENTITY (1, 1) NOT NULL,
    [ANNO]                 INT              NULL,
    [MESEINIZIO]           INT              NULL,
    [MESEFINE]             INT              NULL,
    [COMPOSTO]             VARCHAR (50)     NULL,
    [DSCCOMPOSTO]          VARCHAR (500)    NULL,
    [UM_BASE]              VARCHAR (3)      NULL,
    [QTABASE1]             DECIMAL (19, 6)  NULL,
    [QTABASE2]             DECIMAL (19, 6)  NULL,
    [AMBIENTE1]            VARCHAR (3)      NULL,
    [AMBIENTE2]            VARCHAR (3)      NULL,
    [CDCProd]              VARCHAR (10)     NULL,
    [DESCDCProd]           VARCHAR (80)     NULL,
    [TEMPOUNIRISORSA1]     DECIMAL (20, 10) NULL,
    [TEMPOTOTRISORSA1]     DECIMAL (20, 10) NULL,
    [COSTOORARISORSA1]     DECIMAL (20, 10) NULL,
    [COSTOTOTRISORSA1]     DECIMAL (20, 10) NULL,
    [TEMPOUNIRISORSA2]     DECIMAL (20, 10) NULL,
    [TEMPOTOTRISORSA2]     DECIMAL (20, 10) NULL,
    [COSTOORARISORSA2]     DECIMAL (20, 10) NULL,
    [COSTOTOTRISORSA2]     DECIMAL (20, 10) NULL,
    [DELTATOTALEPROD]      DECIMAL (20, 10) NULL,
    [DELTAVOLUMEPROD]      DECIMAL (20, 10) NULL,
    [DELTAEFFICIENZAPROD]  DECIMAL (20, 10) NULL,
    [DELTAPREZZOPROD]      DECIMAL (20, 10) NULL,
    [CDCSetup]             VARCHAR (10)     NULL,
    [DESCDCSetup]          VARCHAR (80)     NULL,
    [TEMPOUNISETUP1]       DECIMAL (20, 10) NULL,
    [TEMPOTOTSETUP1]       DECIMAL (20, 10) NULL,
    [COSTOORASETUP1]       DECIMAL (20, 10) NULL,
    [COSTOTOTSETUP1]       DECIMAL (20, 10) NULL,
    [TEMPOUNISETUP2]       DECIMAL (20, 10) NULL,
    [TEMPOTOTSETUP2]       DECIMAL (20, 10) NULL,
    [COSTOORASETUP2]       DECIMAL (20, 10) NULL,
    [COSTOTOTSETUP2]       DECIMAL (20, 10) NULL,
    [DELTATOTALESETUP]     DECIMAL (20, 10) NULL,
    [DELTAVOLUMESETUP]     DECIMAL (20, 10) NULL,
    [DELTAEFFICIENZASETUP] DECIMAL (20, 10) NULL,
    [DELTAPREZZOSETUP]     DECIMAL (20, 10) NULL,
    [CDCMop]               VARCHAR (10)     NULL,
    [DESCDCMop]            VARCHAR (80)     NULL,
    [TEMPOUNIUOMO1]        DECIMAL (20, 10) NULL,
    [TEMPOTOTUOMO1]        DECIMAL (20, 10) NULL,
    [COSTOORAUOMO1]        DECIMAL (20, 10) NULL,
    [COSTOTOTUOMO1]        DECIMAL (20, 10) NULL,
    [TEMPOUNIUOMO2]        DECIMAL (20, 10) NULL,
    [TEMPOTOTUOMO2]        DECIMAL (20, 10) NULL,
    [COSTOORAUOMO2]        DECIMAL (20, 10) NULL,
    [COSTOTOTUOMO2]        DECIMAL (20, 10) NULL,
    [DELTATOTALEUOMO]      DECIMAL (20, 10) NULL,
    [DELTAVOLUMEUOMO]      DECIMAL (20, 10) NULL,
    [DELTAEFFICIENZAUOMO]  DECIMAL (20, 10) NULL,
    [DELTAPREZZOUOMO]      DECIMAL (20, 10) NULL,
    [UTENTEMODIFICA]       VARCHAR (25)     NOT NULL,
    [DATAMODIFICA]         DATETIME         NOT NULL,
    CONSTRAINT [KEY_FRCScostamentiCicli] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FRCScostamentiCicli] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRCScostamentiCicli] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRCScostamentiCicli] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCScostamentiCicli] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRCScostamentiCicli] TO [Metodo98]
    AS [dbo];
