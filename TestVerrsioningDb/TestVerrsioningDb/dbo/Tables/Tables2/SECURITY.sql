﻿CREATE TABLE [dbo].[SECURITY] (
    [ID]   INT   NOT NULL,
    [DATA] NTEXT NOT NULL,
    CONSTRAINT [PK_SECURITY] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
GRANT SELECT
    ON OBJECT::[dbo].[SECURITY] TO [Metodo98]
    AS [dbo];

