﻿CREATE TABLE [dbo].[TEMPSTPCM_CARICORISORSE] (
    [IDSESSIONE]          INT             NOT NULL,
    [PROGCICLO]           DECIMAL (10)    NOT NULL,
    [NRFASE]              INT             NOT NULL,
    [CDLAVORO]            VARCHAR (5)     NOT NULL,
    [MACCHINA]            VARCHAR (5)     NOT NULL,
    [ORECARICOSETUPR]     DECIMAL (16, 6) NULL,
    [ORECARICOMACCHINAR]  DECIMAL (16, 6) NULL,
    [ORECARICOUOMOR]      DECIMAL (16, 6) NULL,
    [ORECARICOFASER]      DECIMAL (16, 6) NULL,
    [ORECARICOSETUP1]     DECIMAL (16, 6) NULL,
    [ORECARICOMACCHINA1]  DECIMAL (16, 6) NULL,
    [ORECARICOUOMO1]      DECIMAL (16, 6) NULL,
    [ORECARICOFASE1]      DECIMAL (16, 6) NULL,
    [ORECARICOSETUP2]     DECIMAL (16, 6) NULL,
    [ORECARICOMACCHINA2]  DECIMAL (16, 6) NULL,
    [ORECARICOUOMO2]      DECIMAL (16, 6) NULL,
    [ORECARICOFASE2]      DECIMAL (16, 6) NULL,
    [ORECARICOSETUP3]     DECIMAL (16, 6) NULL,
    [ORECARICOMACCHINA3]  DECIMAL (16, 6) NULL,
    [ORECARICOUOMO3]      DECIMAL (16, 6) NULL,
    [ORECARICOFASE3]      DECIMAL (16, 6) NULL,
    [ORECARICOSETUP4]     DECIMAL (16, 6) NULL,
    [ORECARICOMACCHINA4]  DECIMAL (16, 6) NULL,
    [ORECARICOUOMO4]      DECIMAL (16, 6) NULL,
    [ORECARICOFASE4]      DECIMAL (16, 6) NULL,
    [ORECARICOSETUP5]     DECIMAL (16, 6) NULL,
    [ORECARICOMACCHINA5]  DECIMAL (16, 6) NULL,
    [ORECARICOUOMO5]      DECIMAL (16, 6) NULL,
    [ORECARICOFASE5]      DECIMAL (16, 6) NULL,
    [ORECARICOSETUP6]     DECIMAL (16, 6) NULL,
    [ORECARICOMACCHINA6]  DECIMAL (16, 6) NULL,
    [ORECARICOUOMO6]      DECIMAL (16, 6) NULL,
    [ORECARICOFASE6]      DECIMAL (16, 6) NULL,
    [ORECARICOSETUP7]     DECIMAL (16, 6) NULL,
    [ORECARICOMACCHINA7]  DECIMAL (16, 6) NULL,
    [ORECARICOUOMO7]      DECIMAL (16, 6) NULL,
    [ORECARICOFASE7]      DECIMAL (16, 6) NULL,
    [ORECARICOSETUP8]     DECIMAL (16, 6) NULL,
    [ORECARICOMACCHINA8]  DECIMAL (16, 6) NULL,
    [ORECARICOUOMO8]      DECIMAL (16, 6) NULL,
    [ORECARICOFASE8]      DECIMAL (16, 6) NULL,
    [ORECARICOSETUP9]     DECIMAL (16, 6) NULL,
    [ORECARICOMACCHINA9]  DECIMAL (16, 6) NULL,
    [ORECARICOUOMO9]      DECIMAL (16, 6) NULL,
    [ORECARICOFASE9]      DECIMAL (16, 6) NULL,
    [ORECARICOSETUP10]    DECIMAL (16, 6) NULL,
    [ORECARICOMACCHINA10] DECIMAL (16, 6) NULL,
    [ORECARICOUOMO10]     DECIMAL (16, 6) NULL,
    [ORECARICOFASE10]     DECIMAL (16, 6) NULL,
    [ORECARICOSETUPO]     DECIMAL (16, 6) NULL,
    [ORECARICOMACCHINAO]  DECIMAL (16, 6) NULL,
    [ORECARICOUOMOO]      DECIMAL (16, 6) NULL,
    [ORECARICOFASEO]      DECIMAL (16, 6) NULL,
    PRIMARY KEY CLUSTERED ([IDSESSIONE] ASC, [PROGCICLO] ASC, [NRFASE] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TEMPSTPCM_CARICORISORSE] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TEMPSTPCM_CARICORISORSE] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TEMPSTPCM_CARICORISORSE] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TEMPSTPCM_CARICORISORSE] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TEMPSTPCM_CARICORISORSE] TO [Metodo98]
    AS [dbo];

