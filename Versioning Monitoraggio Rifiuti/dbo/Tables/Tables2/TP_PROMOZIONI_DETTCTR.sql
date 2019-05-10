CREATE TABLE [dbo].[TP_PROMOZIONI_DETTCTR] (
    [RifProgressivo]     DECIMAL (18)    NOT NULL,
    [NrRiga]             INT             NOT NULL,
    [FlagRiga]           SMALLINT        NOT NULL,
    [Posizione]          INT             NOT NULL,
    [Codice]             VARCHAR (50)    NULL,
    [UM_M]               VARCHAR (3)     NULL,
    [Qta_Minima]         NUMERIC (16, 6) NULL,
    [UM_O]               VARCHAR (3)     NULL,
    [Qta_Omaggio]        NUMERIC (16, 6) NULL,
    [Abbuono]            NUMERIC (19, 6) NULL,
    [Prezzo_Sost]        NUMERIC (19, 6) NULL,
    [Prezzo_Sost_Euro]   NUMERIC (19, 6) NULL,
    [Prezzo_Valuta]      NUMERIC (19, 6) NULL,
    [Codice_Valuta]      VARCHAR (1)     NULL,
    [Sconto_Sost_Esteso] VARCHAR (10)    NULL,
    [Sconto_Sost]        NUMERIC (5, 2)  NULL,
    [Sconto_Agg_Esteso]  VARCHAR (10)    NULL,
    [Codice_Art_Oma]     VARCHAR (50)    NULL,
    [Qta_Art_Oma]        NUMERIC (16, 6) NULL,
    [UM_A_O]             VARCHAR (3)     NULL,
    [Priorita_Trasm]     INT             NULL,
    [Note]               VARCHAR (2500)  NULL,
    [UTENTEMODIFICA]     VARCHAR (25)    NULL,
    [DATAMODIFICA]       DATETIME        NULL,
    [QtaBudget]          DECIMAL (19, 6) NULL,
    [ValoreBudget]       DECIMAL (19, 6) NULL,
    [DataConsuntiv]      DATETIME        NULL,
    [QtaConsuntiv]       DECIMAL (19, 6) NULL,
    [ValoreConsuntiv]    DECIMAL (19, 6) NULL,
    PRIMARY KEY CLUSTERED ([RifProgressivo] ASC, [NrRiga] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE TRIGGER DELETETPPROMODETTCTR ON TP_PROMOZIONI_DETTCTR FOR DELETE
AS

BEGIN

DECLARE @CODART as VarChar(50)
	
	SELECT @CODART=Codice FROM DELETED 

	UPDATE TP_EXTRAMAG SET TP_Promo_com='' WHERE CODART=@CODART

END


GO

CREATE TRIGGER INSERTTPPROMODETTCTR ON TP_PROMOZIONI_DETTCTR FOR INSERT
AS

BEGIN

DECLARE @RIFPRG as int
DECLARE @CODART as Varchar(50)
DECLARE @ATTDIS as smallint
	
	SELECT @RIFPRG=RifProgressivo,  @CODART=Codice FROM INSERTED 
	SELECT @ATTDIS=Attiv_Disat FROM TP_PROMOZIONI_TESTECTR WHERE Progressivo=@RIFPRG
	
	IF @ATTDIS=0
		BEGIN
			UPDATE TP_EXTRAMAG SET TP_Promo_com=@RIFPRG WHERE CODART=@CODART
		END
END


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_PROMOZIONI_DETTCTR] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_PROMOZIONI_DETTCTR] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_PROMOZIONI_DETTCTR] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_PROMOZIONI_DETTCTR] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_PROMOZIONI_DETTCTR] TO [Metodo98]
    AS [dbo];

