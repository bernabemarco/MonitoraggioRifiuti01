CREATE TABLE [dbo].[BRIO_PREZZIARTICOLIMP] (
    [CODART]         VARCHAR (50)    NULL,
    [ANNO]           SMALLINT        NOT NULL,
    [MESE]           SMALLINT        NOT NULL,
    [QTATOT]         DECIMAL (19, 6) NULL,
    [IMPORTOTOTEURO] DECIMAL (19, 6) NULL,
    [QTASCAR]        DECIMAL (19, 6) NULL,
    [IMPSCAR]        DECIMAL (19, 6) NULL,
    [QTAMESEP]       DECIMAL (19, 6) NULL,
    [IMPORTOMESEP]   DECIMAL (19, 6) NULL,
    [PREZZOMEDIO]    AS              (case when [QTAMESEP]=(0) then (0) else [IMPORTOMESEP]/[QTAMESEP] end)
);


GO
GRANT SELECT
    ON OBJECT::[dbo].[BRIO_PREZZIARTICOLIMP] TO [Metodo98]
    AS [dbo];

