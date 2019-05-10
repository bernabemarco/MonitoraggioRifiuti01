CREATE TABLE [dbo].[Lkfl] (
    [LkflPProgr]     INT          NULL,
    [LKFLOrd]        VARCHAR (4)  DEFAULT ('ASC') NULL,
    [LkflIProprieta] VARCHAR (3)  DEFAULT ('S') NOT NULL,
    [lkflCltab]      VARCHAR (80) DEFAULT ('') NOT NULL,
    [lkflClkey]      VARCHAR (80) DEFAULT ('') NOT NULL,
    [lkflClfld]      VARCHAR (80) DEFAULT ('') NOT NULL,
    CONSTRAINT [lkflprimary] PRIMARY KEY CLUSTERED ([lkflCltab] ASC, [lkflClkey] ASC, [lkflClfld] ASC)
);

