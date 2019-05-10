CREATE TABLE [dbo].[PL_PackingTesteAllestimenti] (
    [PROGRESSIVO]         DECIMAL (18)  NOT NULL,
    [DESCRIZIONE]         VARCHAR (100) DEFAULT ('') NULL,
    [CODCLIFOR]           VARCHAR (7)   NOT NULL,
    [NUMDESTDIVERSAMERCI] DECIMAL (5)   NOT NULL,
    [RAGSOCDDM]           VARCHAR (80)  DEFAULT ('') NULL,
    [INDIRIZZODDM]        VARCHAR (80)  DEFAULT ('') NULL,
    [CAPDDM]              VARCHAR (8)   DEFAULT ('') NULL,
    [LOCALITADDM]         VARCHAR (80)  DEFAULT ('') NULL,
    [PROVINCIADDM]        VARCHAR (80)  DEFAULT ('') NULL,
    [CHIUSO]              SMALLINT      DEFAULT ((0)) NULL,
    [UTENTEMODIFICA]      VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]        DATETIME      NOT NULL,
    CONSTRAINT [PK_PL_PackingTesteAllestimenti] PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC)
);


GO


CREATE TRIGGER TD_PL_PackingTesteAllestimenti ON PL_PackingTesteAllestimenti
FOR DELETE 
AS
    
    DELETE PL_PackingRaggAllestimenti
    FROM   PL_PackingRaggAllestimenti T2, DELETED T1
    WHERE  T2.RIFPROGRESSIVO  = T1.PROGRESSIVO



GO
GRANT DELETE
    ON OBJECT::[dbo].[PL_PackingTesteAllestimenti] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[PL_PackingTesteAllestimenti] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[PL_PackingTesteAllestimenti] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[PL_PackingTesteAllestimenti] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[PL_PackingTesteAllestimenti] TO [Metodo98]
    AS [dbo];

