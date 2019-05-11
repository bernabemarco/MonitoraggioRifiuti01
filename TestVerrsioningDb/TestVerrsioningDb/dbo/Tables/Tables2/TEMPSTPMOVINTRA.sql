﻿CREATE TABLE [dbo].[TEMPSTPMOVINTRA] (
    [TipoAC]         VARCHAR (1)     NOT NULL,
    [TipoMov]        SMALLINT        NOT NULL,
    [Mese]           SMALLINT        CONSTRAINT [DF_TEMPSTPMOVINTRA_Mese] DEFAULT (0) NULL,
    [Trimestre]      SMALLINT        CONSTRAINT [DF_TEMPSTPMOVINTRA_Trimestre] DEFAULT (0) NULL,
    [Anno]           SMALLINT        CONSTRAINT [DF_TEMPSTPMOVINTRA_Anno] DEFAULT (0) NULL,
    [PartIvaDitta]   VARCHAR (12)    NULL,
    [ProgrRiga1]     SMALLINT        CONSTRAINT [DF_TEMPSTPMOVINTRA_ProgrRiga1] DEFAULT (0) NULL,
    [PartitaIva1]    VARCHAR (12)    NULL,
    [CodiceISO1]     VARCHAR (3)     NULL,
    [TotEuro1]       DECIMAL (19, 4) CONSTRAINT [DF_TEMPSTPMOVINTRA_TotEuro1] DEFAULT (0) NULL,
    [TotValuta1]     DECIMAL (19, 4) CONSTRAINT [DF_TEMPSTPMOVINTRA_TotValuta1] DEFAULT (0) NULL,
    [NatTTrans1]     VARCHAR (1)     NULL,
    [NomenclComb1]   VARCHAR (8)     NULL,
    [TotMassa1]      DECIMAL (16, 6) CONSTRAINT [DF_TEMPSTPMOVINTRA_TotMassa1] DEFAULT (0) NULL,
    [TotUMSuppl1]    DECIMAL (16, 6) CONSTRAINT [DF_TEMPSTPMOVINTRA_TotUMSuppl1] DEFAULT (0) NULL,
    [ValStatEuro1]   DECIMAL (19, 4) CONSTRAINT [DF_TEMPSTPMOVINTRA_ValStatEuro1] DEFAULT (0) NULL,
    [CondCons1]      VARCHAR (1)     NULL,
    [ModoTrasp1]     DECIMAL (5)     CONSTRAINT [DF_TEMPSTPMOVINTRA_ModoTrasp1] DEFAULT (0) NULL,
    [Provenienza1]   VARCHAR (2)     NULL,
    [Origine1]       VARCHAR (2)     NULL,
    [Destinazione1]  VARCHAR (2)     NULL,
    [MeseRett1]      SMALLINT        CONSTRAINT [DF_TEMPSTPMOVINTRA_MeseRett1] DEFAULT (0) NULL,
    [TrimRett1]      SMALLINT        CONSTRAINT [DF_TEMPSTPMOVINTRA_TrimRett1] DEFAULT (0) NULL,
    [AnnoRett1]      SMALLINT        CONSTRAINT [DF_TEMPSTPMOVINTRA_AnnoRett1] DEFAULT (0) NULL,
    [SegnoRett1]     VARCHAR (1)     NULL,
    [ProgrRiga2]     SMALLINT        CONSTRAINT [DF_TEMPSTPMOVINTRA_ProgrRiga2] DEFAULT (0) NULL,
    [PartitaIva2]    VARCHAR (12)    NULL,
    [CodiceISO2]     VARCHAR (3)     NULL,
    [TotEuro2]       DECIMAL (19, 4) CONSTRAINT [DF_TEMPSTPMOVINTRA_TotEuro2] DEFAULT (0) NULL,
    [TotValuta2]     DECIMAL (19, 4) CONSTRAINT [DF_TEMPSTPMOVINTRA_TotValuta2] DEFAULT (0) NULL,
    [NatTTrans2]     VARCHAR (1)     NULL,
    [NomenclComb2]   VARCHAR (8)     NULL,
    [TotMassa2]      DECIMAL (16, 6) CONSTRAINT [DF_TEMPSTPMOVINTRA_TotMassa2] DEFAULT (0) NULL,
    [TotUMSuppl2]    DECIMAL (16, 6) CONSTRAINT [DF_TEMPSTPMOVINTRA_TotUMSuppl2] DEFAULT (0) NULL,
    [ValStatEuro2]   DECIMAL (19, 4) CONSTRAINT [DF_TEMPSTPMOVINTRA_ValStatEuro2] DEFAULT (0) NULL,
    [CondCons2]      VARCHAR (1)     NULL,
    [ModoTrasp2]     DECIMAL (5)     CONSTRAINT [DF_TEMPSTPMOVINTRA_ModoTrasp2] DEFAULT (0) NULL,
    [Provenienza2]   VARCHAR (2)     NULL,
    [Origine2]       VARCHAR (2)     NULL,
    [Destinazione2]  VARCHAR (2)     NULL,
    [MeseRett2]      SMALLINT        CONSTRAINT [DF_TEMPSTPMOVINTRA_MeseRett2] DEFAULT (0) NULL,
    [TrimRett2]      SMALLINT        CONSTRAINT [DF_TEMPSTPMOVINTRA_TrimRett2] DEFAULT (0) NULL,
    [AnnoRett2]      SMALLINT        CONSTRAINT [DF_TEMPSTPMOVINTRA_AnnoRett2] DEFAULT (0) NULL,
    [SegnoRett2]     VARCHAR (1)     NULL,
    [ProgrRiga3]     SMALLINT        CONSTRAINT [DF_TEMPSTPMOVINTRA_ProgrRiga3] DEFAULT (0) NULL,
    [PartitaIva3]    VARCHAR (12)    NULL,
    [CodiceISO3]     VARCHAR (3)     NULL,
    [TotEuro3]       DECIMAL (19, 4) CONSTRAINT [DF_TEMPSTPMOVINTRA_TotEuro3] DEFAULT (0) NULL,
    [TotValuta3]     DECIMAL (19, 4) CONSTRAINT [DF_TEMPSTPMOVINTRA_TotValuta3] DEFAULT (0) NULL,
    [NatTTrans3]     VARCHAR (1)     NULL,
    [NomenclComb3]   VARCHAR (8)     NULL,
    [TotMassa3]      DECIMAL (16, 6) CONSTRAINT [DF_TEMPSTPMOVINTRA_TotMassa3] DEFAULT (0) NULL,
    [TotUMSuppl3]    DECIMAL (16, 6) CONSTRAINT [DF_TEMPSTPMOVINTRA_TotUMSuppl3] DEFAULT (0) NULL,
    [ValStatEuro3]   DECIMAL (19, 4) CONSTRAINT [DF_TEMPSTPMOVINTRA_ValStatEuro3] DEFAULT (0) NULL,
    [CondCons3]      VARCHAR (1)     NULL,
    [ModoTrasp3]     DECIMAL (5)     CONSTRAINT [DF_TEMPSTPMOVINTRA_ModoTrasp3] DEFAULT (0) NULL,
    [Provenienza3]   VARCHAR (2)     NULL,
    [Origine3]       VARCHAR (2)     NULL,
    [Destinazione3]  VARCHAR (2)     NULL,
    [MeseRett3]      SMALLINT        CONSTRAINT [DF_TEMPSTPMOVINTRA_MeseRett3] DEFAULT (0) NULL,
    [TrimRett3]      SMALLINT        CONSTRAINT [DF_TEMPSTPMOVINTRA_TrimRett3] DEFAULT (0) NULL,
    [AnnoRett3]      SMALLINT        CONSTRAINT [DF_TEMPSTPMOVINTRA_AnnoRett3] DEFAULT (0) NULL,
    [SegnoRett3]     VARCHAR (1)     NULL,
    [ProgrRiga4]     SMALLINT        CONSTRAINT [DF_TEMPSTPMOVINTRA_ProgrRiga4] DEFAULT (0) NULL,
    [PartitaIva4]    VARCHAR (12)    NULL,
    [CodiceISO4]     VARCHAR (3)     NULL,
    [TotEuro4]       DECIMAL (19, 4) CONSTRAINT [DF_TEMPSTPMOVINTRA_TotEuro4] DEFAULT (0) NULL,
    [TotValuta4]     DECIMAL (19, 4) CONSTRAINT [DF_TEMPSTPMOVINTRA_TotValuta4] DEFAULT (0) NULL,
    [NatTTrans4]     VARCHAR (1)     NULL,
    [NomenclComb4]   VARCHAR (8)     NULL,
    [TotMassa4]      DECIMAL (16, 6) CONSTRAINT [DF_TEMPSTPMOVINTRA_TotMassa4] DEFAULT (0) NULL,
    [TotUMSuppl4]    DECIMAL (16, 6) CONSTRAINT [DF_TEMPSTPMOVINTRA_TotUMSuppl4] DEFAULT (0) NULL,
    [ValStatEuro4]   DECIMAL (19, 4) CONSTRAINT [DF_TEMPSTPMOVINTRA_ValStatEuro4] DEFAULT (0) NULL,
    [CondCons4]      VARCHAR (1)     NULL,
    [ModoTrasp4]     DECIMAL (5)     CONSTRAINT [DF_TEMPSTPMOVINTRA_ModoTrasp4] DEFAULT (0) NULL,
    [Provenienza4]   VARCHAR (2)     NULL,
    [Origine4]       VARCHAR (2)     NULL,
    [Destinazione4]  VARCHAR (2)     NULL,
    [MeseRett4]      SMALLINT        CONSTRAINT [DF_TEMPSTPMOVINTRA_MeseRett4] DEFAULT (0) NULL,
    [TrimRett4]      SMALLINT        CONSTRAINT [DF_TEMPSTPMOVINTRA_TrimRett4] DEFAULT (0) NULL,
    [AnnoRett4]      SMALLINT        CONSTRAINT [DF_TEMPSTPMOVINTRA_AnnoRett4] DEFAULT (0) NULL,
    [SegnoRett4]     VARCHAR (1)     NULL,
    [ProgrRiga5]     SMALLINT        CONSTRAINT [DF_TEMPSTPMOVINTRA_ProgrRiga5] DEFAULT (0) NULL,
    [PartitaIva5]    VARCHAR (12)    NULL,
    [CodiceISO5]     VARCHAR (3)     NULL,
    [TotEuro5]       DECIMAL (19, 4) CONSTRAINT [DF_TEMPSTPMOVINTRA_TotEuro5] DEFAULT (0) NULL,
    [TotValuta5]     DECIMAL (19, 4) CONSTRAINT [DF_TEMPSTPMOVINTRA_TotValuta5] DEFAULT (0) NULL,
    [NatTTrans5]     VARCHAR (1)     NULL,
    [NomenclComb5]   VARCHAR (8)     NULL,
    [TotMassa5]      DECIMAL (16, 6) CONSTRAINT [DF_TEMPSTPMOVINTRA_TotMassa5] DEFAULT (0) NULL,
    [TotUMSuppl5]    DECIMAL (16, 6) CONSTRAINT [DF_TEMPSTPMOVINTRA_TotUMSuppl5] DEFAULT (0) NULL,
    [ValStatEuro5]   DECIMAL (19, 4) CONSTRAINT [DF_TEMPSTPMOVINTRA_ValStatEuro5] DEFAULT (0) NULL,
    [CondCons5]      VARCHAR (1)     NULL,
    [ModoTrasp5]     DECIMAL (5)     CONSTRAINT [DF_TEMPSTPMOVINTRA_ModoTrasp5] DEFAULT (0) NULL,
    [Provenienza5]   VARCHAR (2)     NULL,
    [Origine5]       VARCHAR (2)     NULL,
    [Destinazione5]  VARCHAR (2)     NULL,
    [MeseRett5]      SMALLINT        CONSTRAINT [DF_TEMPSTPMOVINTRA_MeseRett5] DEFAULT (0) NULL,
    [TrimRett5]      SMALLINT        CONSTRAINT [DF_TEMPSTPMOVINTRA_TrimRett5] DEFAULT (0) NULL,
    [AnnoRett5]      SMALLINT        CONSTRAINT [DF_TEMPSTPMOVINTRA_AnnoRett5] DEFAULT (0) NULL,
    [SegnoRett5]     VARCHAR (1)     NULL,
    [ProgrRiga6]     SMALLINT        CONSTRAINT [DF_TEMPSTPMOVINTRA_ProgrRiga6] DEFAULT (0) NULL,
    [PartitaIva6]    VARCHAR (12)    NULL,
    [CodiceISO6]     VARCHAR (3)     NULL,
    [TotEuro6]       DECIMAL (19, 4) CONSTRAINT [DF_TEMPSTPMOVINTRA_TotEuro6] DEFAULT (0) NULL,
    [TotValuta6]     DECIMAL (19, 4) CONSTRAINT [DF_TEMPSTPMOVINTRA_TotValuta6] DEFAULT (0) NULL,
    [NatTTrans6]     VARCHAR (1)     NULL,
    [NomenclComb6]   VARCHAR (8)     NULL,
    [TotMassa6]      DECIMAL (16, 6) CONSTRAINT [DF_TEMPSTPMOVINTRA_TotMassa6] DEFAULT (0) NULL,
    [TotUMSuppl6]    DECIMAL (16, 6) CONSTRAINT [DF_TEMPSTPMOVINTRA_TotUMSuppl6] DEFAULT (0) NULL,
    [ValStatEuro6]   DECIMAL (19, 4) CONSTRAINT [DF_TEMPSTPMOVINTRA_ValStatEuro6] DEFAULT (0) NULL,
    [CondCons6]      VARCHAR (1)     NULL,
    [ModoTrasp6]     DECIMAL (5)     CONSTRAINT [DF_TEMPSTPMOVINTRA_ModoTrasp6] DEFAULT (0) NULL,
    [Provenienza6]   VARCHAR (2)     NULL,
    [Origine6]       VARCHAR (2)     NULL,
    [Destinazione6]  VARCHAR (2)     NULL,
    [MeseRett6]      SMALLINT        CONSTRAINT [DF_TEMPSTPMOVINTRA_MeseRett6] DEFAULT (0) NULL,
    [TrimRett6]      SMALLINT        CONSTRAINT [DF_TEMPSTPMOVINTRA_TrimRett6] DEFAULT (0) NULL,
    [AnnoRett6]      SMALLINT        CONSTRAINT [DF_TEMPSTPMOVINTRA_AnnoRett6] DEFAULT (0) NULL,
    [SegnoRett6]     VARCHAR (1)     NULL,
    [ProgrRiga7]     SMALLINT        CONSTRAINT [DF_TEMPSTPMOVINTRA_ProgrRiga7] DEFAULT (0) NULL,
    [PartitaIva7]    VARCHAR (12)    NULL,
    [CodiceISO7]     VARCHAR (3)     NULL,
    [TotEuro7]       DECIMAL (19, 4) CONSTRAINT [DF_TEMPSTPMOVINTRA_TotEuro7] DEFAULT (0) NULL,
    [TotValuta7]     DECIMAL (19, 4) CONSTRAINT [DF_TEMPSTPMOVINTRA_TotValuta7] DEFAULT (0) NULL,
    [NatTTrans7]     VARCHAR (1)     NULL,
    [NomenclComb7]   VARCHAR (8)     NULL,
    [TotMassa7]      DECIMAL (16, 6) CONSTRAINT [DF_TEMPSTPMOVINTRA_TotMassa7] DEFAULT (0) NULL,
    [TotUMSuppl7]    DECIMAL (16, 6) CONSTRAINT [DF_TEMPSTPMOVINTRA_TotUMSuppl7] DEFAULT (0) NULL,
    [ValStatEuro7]   DECIMAL (19, 4) CONSTRAINT [DF_TEMPSTPMOVINTRA_ValStatEuro7] DEFAULT (0) NULL,
    [CondCons7]      VARCHAR (1)     NULL,
    [ModoTrasp7]     DECIMAL (5)     CONSTRAINT [DF_TEMPSTPMOVINTRA_ModoTrasp7] DEFAULT (0) NULL,
    [Provenienza7]   VARCHAR (2)     NULL,
    [Origine7]       VARCHAR (2)     NULL,
    [Destinazione7]  VARCHAR (2)     NULL,
    [MeseRett7]      SMALLINT        CONSTRAINT [DF_TEMPSTPMOVINTRA_MeseRett7] DEFAULT (0) NULL,
    [TrimRett7]      SMALLINT        CONSTRAINT [DF_TEMPSTPMOVINTRA_TrimRett7] DEFAULT (0) NULL,
    [AnnoRett7]      SMALLINT        CONSTRAINT [DF_TEMPSTPMOVINTRA_AnnoRett7] DEFAULT (0) NULL,
    [SegnoRett7]     VARCHAR (1)     NULL,
    [ProgrRiga8]     SMALLINT        CONSTRAINT [DF_TEMPSTPMOVINTRA_ProgrRiga8] DEFAULT (0) NULL,
    [PartitaIva8]    VARCHAR (12)    NULL,
    [CodiceISO8]     VARCHAR (3)     NULL,
    [TotEuro8]       DECIMAL (19, 4) CONSTRAINT [DF_TEMPSTPMOVINTRA_TotEuro8] DEFAULT (0) NULL,
    [TotValuta8]     DECIMAL (19, 4) CONSTRAINT [DF_TEMPSTPMOVINTRA_TotValuta8] DEFAULT (0) NULL,
    [NatTTrans8]     VARCHAR (1)     NULL,
    [NomenclComb8]   VARCHAR (8)     NULL,
    [TotMassa8]      DECIMAL (16, 6) CONSTRAINT [DF_TEMPSTPMOVINTRA_TotMassa8] DEFAULT (0) NULL,
    [TotUMSuppl8]    DECIMAL (16, 6) CONSTRAINT [DF_TEMPSTPMOVINTRA_TotUMSuppl8] DEFAULT (0) NULL,
    [ValStatEuro8]   DECIMAL (19, 4) CONSTRAINT [DF_TEMPSTPMOVINTRA_ValStatEuro8] DEFAULT (0) NULL,
    [CondCons8]      VARCHAR (1)     NULL,
    [ModoTrasp8]     DECIMAL (5)     CONSTRAINT [DF_TEMPSTPMOVINTRA_ModoTrasp8] DEFAULT (0) NULL,
    [Provenienza8]   VARCHAR (2)     NULL,
    [Origine8]       VARCHAR (2)     NULL,
    [Destinazione8]  VARCHAR (2)     NULL,
    [ProgrRiga9]     SMALLINT        CONSTRAINT [DF_TEMPSTPMOVINTRA_ProgrRiga9] DEFAULT (0) NULL,
    [PartitaIva9]    VARCHAR (12)    NULL,
    [CodiceISO9]     VARCHAR (3)     NULL,
    [TotEuro9]       DECIMAL (19, 4) CONSTRAINT [DF_TEMPSTPMOVINTRA_TotEuro9] DEFAULT (0) NULL,
    [TotValuta9]     DECIMAL (19, 4) CONSTRAINT [DF_TEMPSTPMOVINTRA_TotValuta9] DEFAULT (0) NULL,
    [NatTTrans9]     VARCHAR (1)     NULL,
    [NomenclComb9]   VARCHAR (8)     NULL,
    [TotMassa9]      DECIMAL (16, 6) CONSTRAINT [DF_TEMPSTPMOVINTRA_TotMassa9] DEFAULT (0) NULL,
    [TotUMSuppl9]    DECIMAL (16, 6) CONSTRAINT [DF_TEMPSTPMOVINTRA_TotUMSuppl9] DEFAULT (0) NULL,
    [ValStatEuro9]   DECIMAL (19, 4) CONSTRAINT [DF_TEMPSTPMOVINTRA_ValStatEuro9] DEFAULT (0) NULL,
    [CondCons9]      VARCHAR (1)     NULL,
    [ModoTrasp9]     DECIMAL (5)     CONSTRAINT [DF_TEMPSTPMOVINTRA_ModoTrasp9] DEFAULT (0) NULL,
    [Provenienza9]   VARCHAR (2)     NULL,
    [Origine9]       VARCHAR (2)     NULL,
    [Destinazione9]  VARCHAR (2)     NULL,
    [ProgrRiga10]    SMALLINT        CONSTRAINT [DF_TEMPSTPMOVINTRA_ProgrRiga10] DEFAULT (0) NULL,
    [PartitaIva10]   VARCHAR (12)    NULL,
    [CodiceISO10]    VARCHAR (3)     NULL,
    [TotEuro10]      DECIMAL (19, 4) CONSTRAINT [DF_TEMPSTPMOVINTRA_TotEuro10] DEFAULT (0) NULL,
    [TotValuta10]    DECIMAL (19, 4) CONSTRAINT [DF_TEMPSTPMOVINTRA_TotValuta10] DEFAULT (0) NULL,
    [NatTTrans10]    VARCHAR (1)     NULL,
    [NomenclComb10]  VARCHAR (8)     NULL,
    [TotMassa10]     DECIMAL (16, 6) CONSTRAINT [DF_TEMPSTPMOVINTRA_TotMassa10] DEFAULT (0) NULL,
    [TotUMSuppl10]   DECIMAL (16, 6) CONSTRAINT [DF_TEMPSTPMOVINTRA_TotUMSuppl10] DEFAULT (0) NULL,
    [ValStatEuro10]  DECIMAL (19, 4) CONSTRAINT [DF_TEMPSTPMOVINTRA_ValStatEuro10] DEFAULT (0) NULL,
    [CondCons10]     VARCHAR (1)     NULL,
    [ModoTrasp10]    DECIMAL (5)     CONSTRAINT [DF_TEMPSTPMOVINTRA_ModoTrasp10] DEFAULT (0) NULL,
    [Provenienza10]  VARCHAR (2)     NULL,
    [Origine10]      VARCHAR (2)     NULL,
    [Destinazione10] VARCHAR (2)     NULL,
    [NrPagina]       SMALLINT        NOT NULL,
    [IDSessione]     SMALLINT        NOT NULL,
    [UtenteModifica] VARCHAR (25)    NOT NULL,
    [DataModifica]   DATETIME        NOT NULL,
    [MESERETT8]      SMALLINT        CONSTRAINT [DF_TEMPSTPMOVINTRA_MESERETT8] DEFAULT ((0)) NULL,
    [TRIMRETT8]      SMALLINT        CONSTRAINT [DF_TEMPSTPMOVINTRA_TRIMRETT8] DEFAULT ((0)) NULL,
    [ANNORETT8]      SMALLINT        CONSTRAINT [DF_TEMPSTPMOVINTRA_ANNORETT8] DEFAULT ((0)) NULL,
    [SEGNORETT8]     VARCHAR (1)     NULL,
    [MESERETT9]      SMALLINT        CONSTRAINT [DF_TEMPSTPMOVINTRA_MESERETT9] DEFAULT ((0)) NULL,
    [TRIMRETT9]      SMALLINT        CONSTRAINT [DF_TEMPSTPMOVINTRA_TRIMRETT9] DEFAULT ((0)) NULL,
    [ANNORETT9]      SMALLINT        CONSTRAINT [DF_TEMPSTPMOVINTRA_ANNORETT9] DEFAULT ((0)) NULL,
    [SEGNORETT9]     VARCHAR (1)     NULL,
    [MESERETT10]     SMALLINT        CONSTRAINT [DF_TEMPSTPMOVINTRA_MESERETT10] DEFAULT ((0)) NULL,
    [TRIMRETT10]     SMALLINT        CONSTRAINT [DF_TEMPSTPMOVINTRA_TRIMRETT10] DEFAULT ((0)) NULL,
    [ANNORETT10]     SMALLINT        CONSTRAINT [DF_TEMPSTPMOVINTRA_ANNORETT10] DEFAULT ((0)) NULL,
    [SEGNORETT10]    VARCHAR (1)     NULL,
    CONSTRAINT [PK_TEMPSTPMOVINTRA] PRIMARY KEY CLUSTERED ([TipoAC] ASC, [TipoMov] ASC, [NrPagina] ASC, [IDSessione] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TEMPSTPMOVINTRA] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TEMPSTPMOVINTRA] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TEMPSTPMOVINTRA] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TEMPSTPMOVINTRA] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TEMPSTPMOVINTRA] TO [Metodo98]
    AS [dbo];
