
CREATE VIEW [dbo].[zzCtVistaClienti] AS
    SELECT  AC.CODCONTO AS 'Cod. Cliente'
            , ISNULL(AC.DSCCONTO1,'') + ' ' + ISNULL(AC.DSCCONTO2,'') AS 'Rag. Sociale'
            , AC.PARTITAIVA AS 'Partita IVA'
            , AC.CODFISCALE AS 'Cod. Fiscale'
            , AC.TELEFONO AS 'Telefono'
            , AC.INDIRIZZO AS 'Indirizzo'
            , AC.CAP
            , AC.LOCALITA AS 'Localita'
            , AC.PROVINCIA AS 'Provincia'
            , AC.StatoIndicatore AS 'Stato Indicatore'
            , ISNULL(SI.CodiceColore, 0) AS ColoreSfondo
            , 0 AS ColoreCarattere
    FROM    dbo.ANAGRAFICACF AS AC
            LEFT OUTER JOIN dbo.zzTabStatiIndicatore AS SI ON AC.StatoIndicatore = SI.StatoIndicatore           
    WHERE   AC.TIPOCONTO = 'C'

GO
GRANT DELETE
    ON OBJECT::[dbo].[zzCtVistaClienti] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[zzCtVistaClienti] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[zzCtVistaClienti] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[zzCtVistaClienti] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[zzCtVistaClienti] TO [Metodo98]
    AS [dbo];

