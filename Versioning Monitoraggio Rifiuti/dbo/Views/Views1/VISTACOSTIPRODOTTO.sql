﻿CREATE VIEW VISTACOSTIPRODOTTO AS
SELECT
	PROGRESSIVO,
	IDCOSTO,
	DESCRIZIONE,
	TIPOVALUTAZIONE,
	TIPOCOSTO,
	DATACALCOLO,
	ARTICOLO,
	UMRIF,
	VERSIONEDBA,
	VERSIONECICLO,
	IDDISTINTA,
	IDCICLO,
	CP_MATERIALE,
	CP_LAVINTERNA,
	CP_LAVESTERNA,
	CP_INDVARIABILE,
	CP_INDFISSO,
	CA_MATERIALE,
	CA_LAVINTERNA,
	CA_LAVESTERNA,
	CA_INDVARIABILE,
	CA_INDFISSO,
	CP_MATERIALEEURO,
	CP_LAVINTERNAEURO,
	CP_LAVESTERNAEURO,
	CP_INDVARIABILEEURO,
	CP_INDFISSOEURO,
	CA_MATERIALEEURO,
	CA_LAVINTERNAEURO,
	CA_LAVESTERNAEURO,
	CA_INDVARIABILEEURO,
	CA_INDFISSOEURO,
	CRITERIOVALUTAZIONE,
	ORIGINECOSTO,
	LISTINO,
	COSTOSTD,
	COSTOCORR,
	(CASE ORIGINECOSTO WHEN -1 THEN 'nessun criterio' ELSE 
		(CASE ORIGINECOSTO WHEN 0 THEN 'Ultimo Prezzo Acq.' ELSE 
			(CASE ORIGINECOSTO WHEN 2 THEN 'Costo Medio' ELSE 
				(CASE ORIGINECOSTO WHEN 3 THEN 'Lifo' ELSE 
					(CASE ORIGINECOSTO WHEN 5 THEN 'Listino ' + CAST(LISTINO AS VARCHAR) ELSE 
						(CASE ORIGINECOSTO WHEN 6 THEN 'Costo Std ' + COSTOSTD ELSE 
							(CASE ORIGINECOSTO WHEN 7 THEN 'Costo Corr ' + COSTOCORR ELSE '' END) 
						END) 
					END) 
				END) 
			END)
		END)
	END) AS DESORIGINECOSTO
FROM
	TABCOSTIPRODOTTO

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTACOSTIPRODOTTO] TO [Metodo98]
    AS [dbo];

