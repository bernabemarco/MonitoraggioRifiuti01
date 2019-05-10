CREATE TABLE [dbo].[FRCWStampaCoefficientiKTesta] (
    [NrTerminale]     DECIMAL (5)     NOT NULL,
    [Ambiente]        VARCHAR (3)     NOT NULL,
    [Anno]            INT             NOT NULL,
    [Qualifica]       INT             NOT NULL,
    [DataValutazione] DATETIME        NULL,
    [A000]            DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [B000CA]          DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [ASS]             DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [B000]            DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [OreSoggContr]    DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [OreOneriContr]   DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [OreTFR]          DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [C000]            DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [K010]            DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [K020]            DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [K030]            DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [K000]            DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [UtenteModifica]  VARCHAR (25)    NOT NULL,
    [DataModifica]    DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([NrTerminale] ASC, [Ambiente] ASC, [Anno] ASC, [Qualifica] ASC)
);


GO


/*  DELETE TRIGGER "TD_FRCWStampaCoefficientiKTesta" FOR TABLE "FRCWStampaCoefficientiKTesta"  */
CREATE TRIGGER TD_FRCWStampaCoefficientiKTesta ON FRCWStampaCoefficientiKTesta FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)

    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN

    
    /*  DELETE ALL CHILDREN IN "FRCWStampaCoefficientiKRighe"  */
    DELETE FRCWStampaCoefficientiKRighe
    FROM   FRCWStampaCoefficientiKRighe T2, DELETED T1
    WHERE  T2.NrTerminale = T1.NrTerminale AND T2.Ambiente = T1.Ambiente AND T2.Anno = T1.Anno AND T2.Qualifica = T1.Qualifica
    
    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO
GRANT DELETE
    ON OBJECT::[dbo].[FRCWStampaCoefficientiKTesta] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRCWStampaCoefficientiKTesta] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRCWStampaCoefficientiKTesta] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCWStampaCoefficientiKTesta] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRCWStampaCoefficientiKTesta] TO [Metodo98]
    AS [dbo];

