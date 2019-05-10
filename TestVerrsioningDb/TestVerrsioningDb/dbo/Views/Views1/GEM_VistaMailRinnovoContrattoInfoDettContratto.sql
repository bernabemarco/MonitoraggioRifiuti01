
CREATE VIEW [dbo].[GEM_VistaMailRinnovoContrattoInfoDettContratto]
AS
SELECT     IdContratto,
                          (SELECT     DATASCADENZA
                            FROM          GEM_TESTACONTRATTO AS t
                            WHERE      (IDCONTRATTO = GEM_MailRinnovoCOntratto.IdContratto)) AS DtScad,
                          (SELECT     DURATA
                            FROM          GEM_TESTACONTRATTO AS t
                            WHERE      (IDCONTRATTO = GEM_MailRinnovoCOntratto.IdContratto)) AS Durata,
                          (SELECT     CODCategoriaContratto
                            FROM          GEM_TESTACONTRATTO AS t
                            WHERE      (IDCONTRATTO = GEM_MailRinnovoCOntratto.IdContratto)) AS CODCategoriaContratto,
                          (SELECT     vc.DSCCATEGORIA
                            FROM          GEM_Vista_CategoriaContratto AS vc INNER JOIN
                                                   GEM_TESTACONTRATTO AS t ON vc.CODCategoriaContratto = t.CODCategoriaContratto
                            WHERE      (t.IDCONTRATTO = GEM_MailRinnovoCOntratto.IdContratto)) AS DSCCategoria,
                          (SELECT     'X' AS InvioEmail
                            FROM          GEM_MailRinnovoCOntratto AS MRC
                            WHERE      (IdContratto = GEM_MailRinnovoContratto.idcontratto) AND (Stato = 1)
                            GROUP BY IdContratto) AS InvioEmail,
                          (SELECT     MIN(DataModifica) AS DtInvioEmail
                            FROM          GEM_MailRinnovoCOntratto AS MRC
                            WHERE      (IdContratto = GEM_MailRinnovoContratto.idcontratto) AND (Stato = 1)
                            GROUP BY IdContratto) AS DtInvioEmail,
                          (SELECT     COUNT(*) AS Expr1
                            FROM          GEM_SEZIONECONTRATTORAPPORTI AS Rap
                            WHERE      (TIPOLOGIARAPPORTO = 'O') AND (DataEliminazione IS NULL) AND (IDCONTRATTO = GEM_MailRinnovoCOntratto.IdContratto) AND 
                                                   (STATO IN ('G', 'X', 'T', 'R', 'N'))) AS nrRappNEseg,
                          (SELECT     MAX(DATA_EFF) AS Expr1
                            FROM          GEM_SEZIONECONTRATTORAPPORTI AS Rap
                            WHERE      (TIPOLOGIARAPPORTO = 'O') AND (DataEliminazione IS NULL) AND (NOT (DATA_EFF IS NULL)) AND 
                                                   (IDCONTRATTO = GEM_MailRinnovoCOntratto.IdContratto) AND (STATO <> 'N')) AS LastDtRapp
FROM         GEM_MailRinnovoCOntratto

GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_VistaMailRinnovoContrattoInfoDettContratto] TO [Metodo98]
    AS [dbo];

