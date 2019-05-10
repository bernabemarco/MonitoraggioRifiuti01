CREATE TABLE [dbo].[MovimentiCauzioni] (
    [IDTesta]             DECIMAL (10)    NOT NULL,
    [IDRiga]              INT             NOT NULL,
    [Posizione]           INT             NOT NULL,
    [CodiceVuoto]         VARCHAR (50)    NOT NULL,
    [UM]                  VARCHAR (3)     NOT NULL,
    [QtaCons]             DECIMAL (16, 6) NOT NULL,
    [CauMagCons]          DECIMAL (5)     NULL,
    [CodDepCons]          VARCHAR (10)    NULL,
    [CauMagConsColl]      DECIMAL (5)     NULL,
    [CodDepConsColl]      VARCHAR (10)    NULL,
    [ImportoUnitCons]     DECIMAL (19, 6) NOT NULL,
    [ImportoUnitConsEuro] DECIMAL (19, 6) NOT NULL,
    [QtaResi]             DECIMAL (16, 6) NOT NULL,
    [CauMagResi]          DECIMAL (5)     NULL,
    [CodDepResi]          VARCHAR (10)    NULL,
    [CauMagResiColl]      DECIMAL (5)     NULL,
    [CodDepResiColl]      VARCHAR (10)    NULL,
    [ImportoUnitResi]     DECIMAL (19, 6) NOT NULL,
    [ImportoUnitResiEuro] DECIMAL (19, 6) NOT NULL,
    [UTENTEMODIFICA]      VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]        DATETIME        NOT NULL,
    CONSTRAINT [PK_MOVIMENTICAUZIONI] PRIMARY KEY CLUSTERED ([IDTesta] ASC, [IDRiga] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_MOVIMENTICAUZIONI_IDTESTA] FOREIGN KEY ([IDTesta]) REFERENCES [dbo].[TESTEDOCUMENTI] ([PROGRESSIVO]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO

CREATE TRIGGER TD_MOVIMENTICAUZIONI ON MOVIMENTICAUZIONI FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)

    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN

    /*  DELETE ALL CHILDREN IN "STORICOMAG"  */
    DELETE STORICOMAG
    FROM   STORICOMAG T2, DELETED T1
    WHERE  T2.IDTESTA = T1.IDTESTA
     AND   T2.RIGACAUZ = T1.IDRIGA
     AND   T2.TIPOMOV IN (13,14,15,16)

    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END


GO
GRANT DELETE
    ON OBJECT::[dbo].[MovimentiCauzioni] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[MovimentiCauzioni] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[MovimentiCauzioni] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[MovimentiCauzioni] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[MovimentiCauzioni] TO [Metodo98]
    AS [dbo];

