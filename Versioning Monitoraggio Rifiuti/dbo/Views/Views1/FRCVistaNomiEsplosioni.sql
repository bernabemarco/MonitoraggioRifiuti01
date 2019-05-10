
CREATE VIEW FRCVistaNomiEsplosioni AS 
	SELECT ANNO, NomeEsplosione
	FROM FRCDistinteBasiEsplose
	GROUP BY ANNO, NomeEsplosione

GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCVistaNomiEsplosioni] TO [Metodo98]
    AS [dbo];

