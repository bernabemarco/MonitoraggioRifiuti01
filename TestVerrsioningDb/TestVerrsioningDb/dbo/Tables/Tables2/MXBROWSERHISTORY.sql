CREATE TABLE [dbo].[MXBROWSERHISTORY] (
    [id]      UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    [url]     NVARCHAR (MAX)   NOT NULL,
    [userid]  VARCHAR (25)     NOT NULL,
    [title]   VARCHAR (255)    NOT NULL,
    [datareg] DATETIME         DEFAULT (getdate()) NOT NULL,
    [MenuID]  VARCHAR (100)    DEFAULT ('') NOT NULL,
    [Clicks]  INT              DEFAULT ((0)) NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[MXBROWSERHISTORY] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[MXBROWSERHISTORY] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[MXBROWSERHISTORY] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[MXBROWSERHISTORY] TO [Metodo98]
    AS [dbo];

