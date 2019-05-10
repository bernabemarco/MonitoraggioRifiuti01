
CREATE VIEW [dbo].[ALD_Vista_CommessaCollaudoSoggetto]
AS
SELECT max(AnaArt.DESCRIZIONE) AS DscSoggetto, RilAttivita.RifCommessaCliente  
FROM ALD_TabClasseArtNodoPrev AS TClNodo INNER JOIN AnagraficaCommesse 
ON TClNodo.TipoPrev = AnagraficaCommesse.TipoCom INNER JOIN ALD_RilevazioneAttivitaCommessa AS RilAttivita ON AnagraficaCommesse.RifComm = RilAttivita.RifCommessaCliente 
AND TClNodo.DescrizioneTipoTransaz = RilAttivita.DescrizioneTipoTransaz INNER JOIN ANAGRAFICAARTICOLI AS AnaArt ON RilAttivita.Soggetto = AnaArt.CODICE 
WHERE (TClNodo.ClasseArticoloId = '102050') 
--AND RilAttivita.RifCommessaCliente like 'ias%' -- (VSD.RIFCOMMCLI) 
GROUP BY RilAttivita.RifCommessaCliente 

GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_Vista_CommessaCollaudoSoggetto] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_Vista_CommessaCollaudoSoggetto] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_Vista_CommessaCollaudoSoggetto] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_Vista_CommessaCollaudoSoggetto] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_Vista_CommessaCollaudoSoggetto] TO [Metodo98]
    AS [dbo];

