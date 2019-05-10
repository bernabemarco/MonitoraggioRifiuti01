

CREATE VIEW [dbo].[VISTA_MESI]
AS
(
SELECT
 number,
 DATENAME(MONTH, '1900-' + CAST(number as varchar(2)) + '-1') monthname
FROM master..spt_values
WHERE Type = 'P' and number between 1 and 12 
)

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTA_MESI] TO [Metodo98]
    AS [dbo];

