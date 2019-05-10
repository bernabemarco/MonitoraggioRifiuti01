

CREATE view [dbo].[ALD_CONS_Vista_PrelieviMagazzino] as
SELECT SM.PROGRESSIVO, SM.ESERCIZIO, RIGHT('00' + CAST(MONTH(SM.DATAMOV) AS varchar(2)), 2) AS Periodo, 
SM.CODART,
SM.CODCOMMESSA, 
(case when TCM.Reso=0 then SM.QTA1UM else SM.QTA1UM*-1 end) as qtaMov,
--SM.QTA1UM, 
0 as prezzoMP, 0 as PrezzoUPA, SM.CODCAUSALE
, 0 as progrCont, sm.UTENTEMODIFICA, sm.DATAMODIFICA
FROM         STORICOMAG AS SM INNER JOIN
                      TABCAUSALIMAG AS TCM ON SM.CODCAUSALE = TCM.CODICE INNER JOIN
                      ALD_TabCausaliPrelieviConsMagazzino AS Ald_TC ON SM.CODCAUSALE = Ald_TC.CODCausale


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_CONS_Vista_PrelieviMagazzino] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_CONS_Vista_PrelieviMagazzino] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_CONS_Vista_PrelieviMagazzino] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_CONS_Vista_PrelieviMagazzino] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_CONS_Vista_PrelieviMagazzino] TO [Metodo98]
    AS [dbo];

