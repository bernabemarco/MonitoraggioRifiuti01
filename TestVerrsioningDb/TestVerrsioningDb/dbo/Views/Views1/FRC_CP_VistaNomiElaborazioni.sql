
CREATE VIEW FRC_CP_VistaNomiElaborazioni AS 
	SELECT NomeElaborazione
	FROM FRC_CP_SchedaCosto
	GROUP BY NomeElaborazione

GO
GRANT SELECT
    ON OBJECT::[dbo].[FRC_CP_VistaNomiElaborazioni] TO [Metodo98]
    AS [dbo];

