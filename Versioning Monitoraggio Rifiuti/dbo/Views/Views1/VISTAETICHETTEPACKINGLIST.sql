
CREATE VIEW VISTAETICHETTEPACKINGLIST
AS
SELECT     PT.Progressivo, PT.Esercizio, PT.Data, PT.Cliente, PT.DestinazioneDiversa, PT.NsRif, PT.VsRif, PT.Spedizione, PT.NumPartColli, PT.Note, 
                      PR.RifProgressivo, PR.NrRiga, PR.FlagRiga, PR.Posizione, PR.CodiceArticolo, PR.CodiceRaggruppamento, PR.DescrizioneAggiuntiva, PR.Um, 
                      PR.Imballo, PR.Qta, PR.Colli, PR.Da, PR.A, PR.PesoNetto, PR.PesoLordo, PR.Volume, PR.Intra, PR.NumEtichette, PR.TipoRiga, PR.RifProgConf, 
                      PR.RifRigaConf, PR.ImbH, PR.ImbL, PR.ImbP, PR.ImbPeso, ISNULL(PR.NumEtichette, 1) AS NUMEROETICHETTE, ACF.DSCCONTO1, ACF.DSCCONTO2, 
                      ACF.INDIRIZZO, ACF.CAP, ACF.LOCALITA, ACF.PROVINCIA, ACF.TELEFONO, ACF.FAX, ACF.INDIRIZZOINTERNET,
                          (SELECT     DESCRIZIONE
                            FROM          TABNAZIONI
                            WHERE      TABNAZIONI.CODICE = ACF.CODNAZIONE) AS NAZIONE, AA.DESCRIZIONE, PT.NUMPL
FROM         PackingTesta PT LEFT OUTER JOIN
                      ANAGRAFICACF ACF ON ACF.CODCONTO = PT.Cliente LEFT OUTER JOIN
                      PackingRighe PR ON PR.RifProgressivo = PT.Progressivo LEFT OUTER JOIN
                      ANAGRAFICAARTICOLI AA ON AA.CODICE = PR.CodiceArticolo


GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTAETICHETTEPACKINGLIST] TO [Metodo98]
    AS [dbo];

