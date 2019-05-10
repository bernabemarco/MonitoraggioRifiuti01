CREATE TABLE [dbo].[ALD_tempStpAnalisiCommCont] (
    [CodCommessa]      VARCHAR (30)    NOT NULL,
    [Fatturato]        DECIMAL (19, 6) DEFAULT (0) NULL,
    [Ordinato]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [RimanMagazzino]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [FattLavEst]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [NoteAccrLavEst]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [ConsuntivoLavEst] DECIMAL (19, 6) DEFAULT (0) NULL,
    [OrdinatoLavEst]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [UtenteModifica]   VARCHAR (25)    NOT NULL,
    [DataModifica]     SMALLDATETIME   NOT NULL,
    CONSTRAINT [PK_ALD_tempStpAnalisiCommCont] PRIMARY KEY CLUSTERED ([CodCommessa] ASC, [UtenteModifica] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_tempStpAnalisiCommCont] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_tempStpAnalisiCommCont] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_tempStpAnalisiCommCont] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_tempStpAnalisiCommCont] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_tempStpAnalisiCommCont] TO [Metodo98]
    AS [dbo];

