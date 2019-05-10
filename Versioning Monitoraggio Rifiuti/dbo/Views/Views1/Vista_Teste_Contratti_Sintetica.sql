
CREATE VIEW [dbo].[Vista_Teste_Contratti_Sintetica]
AS
SELECT DISTINCT ESERCIZIO, NUMEROCONTRATTO,
                          (SELECT     TOP (1) DESCRIZIONECONTRATTO
                            FROM          dbo.VISTA_TESTE_CONTRATTI
                            WHERE      (ESERCIZIO = a.ESERCIZIO) AND (NUMEROCONTRATTO = a.NUMEROCONTRATTO) AND (ISNULL(DESCRIZIONECONTRATTO, '') <> '')) 
                      AS DescrizioneContratto
FROM         dbo.VISTA_TESTE_CONTRATTI AS a
where tiponodo <> 5

GO
GRANT SELECT
    ON OBJECT::[dbo].[Vista_Teste_Contratti_Sintetica] TO [Metodo98]
    AS [dbo];

