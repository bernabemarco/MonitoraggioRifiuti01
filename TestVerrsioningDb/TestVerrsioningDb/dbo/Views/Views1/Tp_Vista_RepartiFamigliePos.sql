
Create view Tp_Vista_RepartiFamigliePos
AS
SELECT 
	TabRepartiFamigliaPOS.CodFamiglia,
	TABFAMIGLIEPOS.Descrizione as DescrFamiglia,
	TabRepartiFamigliaPOS.CodReparto, 
	TABREPARTIPOS.Descrizione as DescrReparto
FROM TabRepartiFamigliaPOS
INNER JOIN TABFAMIGLIEPOS
	ON TABFAMIGLIEPOS.Codice=TabRepartiFamigliaPOS.CodFamiglia
INNER JOIN TABREPARTIPOS
	ON TABREPARTIPOS.Codice=TabRepartiFamigliaPOS.CodReparto


GO
GRANT DELETE
    ON OBJECT::[dbo].[Tp_Vista_RepartiFamigliePos] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Tp_Vista_RepartiFamigliePos] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Tp_Vista_RepartiFamigliePos] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Tp_Vista_RepartiFamigliePos] TO [Metodo98]
    AS [dbo];

