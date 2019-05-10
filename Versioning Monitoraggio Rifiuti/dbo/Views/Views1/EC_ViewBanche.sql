

CREATE VIEW [dbo].[EC_ViewBanche]

AS
	select 
		ECB.CodBanca,AB.CodiceIban As CodIBAN
	from 
		EC_BancheTipi ECB
	inner join
		ANAGRAFICABANCHE AB
	on
		AB.CODBANCA = ECB.CodBanca

GO
GRANT SELECT
    ON OBJECT::[dbo].[EC_ViewBanche] TO [Metodo98]
    AS [dbo];

