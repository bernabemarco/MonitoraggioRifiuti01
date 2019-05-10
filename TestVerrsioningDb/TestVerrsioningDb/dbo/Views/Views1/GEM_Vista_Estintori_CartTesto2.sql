create view GEM_Vista_Estintori_CartTesto2
as
select Variante as DscCarTesto2, VARIANTE as CartTesto2 from TABVARIANTI where tipologia='E02'
union all
select Variante as DscCarTesto2, Descrizione as CartTesto2 from TABVARIANTI where tipologia='E02'

GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_Vista_Estintori_CartTesto2] TO [Metodo98]
    AS [dbo];

