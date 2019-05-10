CREATE TABLE [dbo].[TESTE_CONTRATTI] (
    [PROGRESSIVO]               DECIMAL (10)    NOT NULL,
    [UTENTEMODIFICA]            VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]              DATETIME        NOT NULL,
    [ESERCIZIO]                 DECIMAL (5)     NOT NULL,
    [NUMEROCONTRATTO]           DECIMAL (10)    NOT NULL,
    [BIS]                       CHAR (1)        NULL,
    [DESCRIZIONECONTRATTO]      VARCHAR (255)   NOT NULL,
    [TIPONODO]                  SMALLINT        NOT NULL,
    [CODICE]                    VARCHAR (200)   NOT NULL,
    [DATAINIZIOESERCIZIO]       DATETIME        NULL,
    [DATAFINEESERCIZIO]         DATETIME        NULL,
    [DATAPROPOSTACONTRATTO]     DATETIME        NULL,
    [DATAAPPROVAZIONECONTRATTO] DATETIME        NULL,
    [RESPINTERNI1]              VARCHAR (100)   NULL,
    [DATAINIZIOCONTRATTO]       DATETIME        NULL,
    [RESPINTERNI2]              VARCHAR (100)   NULL,
    [DATAFINECONTRATTO]         DATETIME        NULL,
    [RESPINTERNI3]              VARCHAR (100)   NULL,
    [DATAINTERRUZIONECONTRATTO] DATETIME        NULL,
    [MOTIVAZIONE]               VARCHAR (255)   NULL,
    [NOTECONTRATTO]             VARCHAR (500)   NULL,
    [NODOPARENT]                DECIMAL (10)    NULL,
    [INDICEALBERO]              VARCHAR (2000)  NULL,
    [NATURA]                    CHAR (1)        NULL,
    [LISTINO]                   DECIMAL (5)     NULL,
    [SCONTO1]                   VARCHAR (10)    NULL,
    [MESEESCL1]                 SMALLINT        NULL,
    [GGESCL1]                   SMALLINT        NULL,
    [MESEESCL2]                 SMALLINT        NULL,
    [GGESCL2]                   SMALLINT        NULL,
    [APPLSCONTORIGA]            VARCHAR (10)    NULL,
    [APPLSCONTOFINALE]          VARCHAR (6)     NULL,
    [CODCONTOFATT]              VARCHAR (7)     NULL,
    [CODPAG]                    VARCHAR (4)     NULL,
    [CODGRUPPOPREZZIPART]       DECIMAL (5)     NULL,
    [PRCTRASPORTO]              VARCHAR (10)    NULL,
    [RIVIVAOMAGGI]              SMALLINT        NULL,
    [USAPRZPRVPART]             SMALLINT        NULL,
    [FATTFINEMESE]              SMALLINT        NULL,
    [NONRAGGRUPPDOC]            SMALLINT        NULL,
    [SPESEDOCUM]                SMALLINT        NULL,
    [SPESEEFFETTO]              SMALLINT        NULL,
    [SPESEIMBALLO]              SMALLINT        NULL,
    [SPESETRASPORTO]            SMALLINT        NULL,
    [CLIENTE]                   VARCHAR (7)     NULL,
    [FORNITORE]                 VARCHAR (7)     NULL,
    [PERIODOULTIMOCALCAVANZ]    DATETIME        NULL,
    [NOTE_CL]                   VARCHAR (500)   NULL,
    [CONSUNTIVAGRUPPIACQUISTO]  SMALLINT        DEFAULT (0) NULL,
    [DATASTORICIZZAZIONE]       DATETIME        NULL,
    [NOMENODO]                  VARCHAR (100)   NULL,
    [FIDOEURO]                  DECIMAL (19, 6) DEFAULT (0) NULL,
    [DATAINIZIOFIDO]            DATETIME        NULL,
    [MARCHIO]                   VARCHAR (50)    NULL,
    [LIQUIDATO]                 SMALLINT        DEFAULT (0) NOT NULL,
    PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC) WITH (FILLFACTOR = 90)
);


GO


CREATE TRIGGER CANC_CONTRATTO ON TESTE_CONTRATTI
FOR DELETE 
AS
    Declare @rp decimal(10,0)
    Declare @Esercizio decimal(5,0)
    Declare @cliente varchar(7)
    Declare @fornitore varchar(7)
    Declare @natura varchar(1)  

    Select @rp=PROGRESSIVO From DELETED
    Select @Esercizio=esercizio From deleted
    select @cliente=cliente from deleted
    select @fornitore=fornitore from deleted
    select @natura=natura from deleted

    Delete CONTRATTI_RESPONS_INTERNI    Where RIFPROGRESSIVO=@rp
    Delete CONTRATTI_RESPONS_ESTERNI    Where RIFPROGRESSIVO=@rp
    Delete CONTRATTI_CONSDOC            Where RIFPROGRESSIVO=@rp
    Delete CONTRATTI_RCFV_GRUPPO        Where RIFPROGRESSIVO=@rp
    Delete CONTRATTI_RCFV_CATEGORIA     Where RIFPROGRESSIVO=@rp
    Delete CONTRATTI_RCFV_CATEGORIAS    Where RIFPROGRESSIVO=@rp
    Delete CONTRATTI_RCFV_GRPPREZZI     Where RIFPROGRESSIVO=@rp
    Delete CONTRATTI_RCFV_FAMIGLIA      Where RIFPROGRESSIVO=@rp
    Delete CONTRATTI_RCFV_ARTICOLI      Where RIFPROGRESSIVO=@rp
    Delete GESTIONEPREZZIRIGHECTR       Where RIFPROGRESSIVO In (Select PROGRESSIVO From GESTIONEPREZZICTR Where PROGRESSIVOCTR=@rp)
    Delete GESTIONEPREZZICTR            Where PROGRESSIVOCTR=@rp

    Delete GESTIONEPREZZI                Where PROGRESSIVOCTR=@rp

    Delete TP_PROMOZIONI_TESTE           Where RIFCONTRATTO=@rp 
    Delete TP_PROMOZIONI_TESTECTR        Where PROGRESSIVOCTR=@rp
    Delete TP_TESTE_SCONTI_LOGISTICI     Where RIFCONTRATTO=@rp
    Delete TP_TESTE_SCONTI_LOGISTICICTR  Where RIFCONTRATTO=@rp
    Delete TP_CONFIGSCONTI               Where CODCONTRATTO=@rp
    Delete TP_CONFIGSCONTICTR            Where CODCONTRATTO=@rp
    Delete CONTRATTI_TOP                 Where RIFCONTRATTO=@rp
    Delete CONTRATTI_CON                 Where RIFCONTRATTO=@rp

    Delete CONTRATTI_CL                  Where RIFPROGRESSIVO=@rp

    Delete CONTRATTI_CL_AVAL             Where RIFPROGRESSIVO=@rp
    Delete CONTRATTI_CL_INPERC           Where RIFPROGRESSIVO=@rp
    Delete CONTRATTI_CL_MANCRESO         Where RIFPROGRESSIVO=@rp
    Delete CONTRATTI_CL_SUPUNT           Where RIFPROGRESSIVO=@rp
    
    Delete TP_TABPROGRNRRIGA             Where NOMETABELLA='CONTRATTI_CL' And PROGR=@rp
     
    Delete TP_PROMOZIONI_TESTE Where RIFCONTRATTO = @rp
    
    Delete CONTRATTI_COSTIFICAZIONERIGHE Where Contratto =  @rp
        
    if @natura = 'A'

        if @cliente is not null
            begin
                if @cliente <>'' 
                    begin
                        Update AnagraficaRiservatiCF 
                        Set NumeroContratto = NULL
                        Where Esercizio=@esercizio and codconto=@cliente
                    end
            end

    else

        if @fornitore is not null
            begin
                if @fornitore <>'' 
                    begin
                        Update AnagraficaRiservatiCF 
                        Set NumeroContratto = NULL
                        Where Esercizio=@esercizio and codconto=@fornitore
                    end

            end
        


GO
GRANT DELETE
    ON OBJECT::[dbo].[TESTE_CONTRATTI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TESTE_CONTRATTI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TESTE_CONTRATTI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TESTE_CONTRATTI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TESTE_CONTRATTI] TO [Metodo98]
    AS [dbo];

