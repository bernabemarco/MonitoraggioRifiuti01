CREATE TABLE [dbo].[Biri_AggiornamentoNoteSezioni] (
    [NotaAnteporre]    NTEXT          NULL,
    [NOTE]             NTEXT          NULL,
    [NotaNuova]        NVARCHAR (MAX) NOT NULL,
    [IDCONTRATTO]      NVARCHAR (255) NULL,
    [SEZIONECONTRATTO] FLOAT (53)     NULL
);


GO
GRANT ALTER
    ON OBJECT::[dbo].[Biri_AggiornamentoNoteSezioni] TO [Profiler]
    AS [dbo];


GO
GRANT CONTROL
    ON OBJECT::[dbo].[Biri_AggiornamentoNoteSezioni] TO [Profiler]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[Biri_AggiornamentoNoteSezioni] TO [Profiler]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Biri_AggiornamentoNoteSezioni] TO [Profiler]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[Biri_AggiornamentoNoteSezioni] TO [Profiler]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Biri_AggiornamentoNoteSezioni] TO [Profiler]
    AS [dbo];


GO
GRANT TAKE OWNERSHIP
    ON OBJECT::[dbo].[Biri_AggiornamentoNoteSezioni] TO [Profiler]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Biri_AggiornamentoNoteSezioni] TO [Profiler]
    AS [dbo];


GO
GRANT VIEW DEFINITION
    ON OBJECT::[dbo].[Biri_AggiornamentoNoteSezioni] TO [Profiler]
    AS [dbo];


GO
GRANT VIEW CHANGE TRACKING
    ON OBJECT::[dbo].[Biri_AggiornamentoNoteSezioni] TO [Profiler]
    AS [dbo];

