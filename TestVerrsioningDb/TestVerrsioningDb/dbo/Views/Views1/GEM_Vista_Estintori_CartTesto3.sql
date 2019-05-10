create view GEM_Vista_Estintori_CartTesto3
as
select Variante as DscCarTesto3, VARIANTE as CartTesto3 from TABVARIANTI where tipologia='E03'
union all
select Variante as DscCarTesto3, Descrizione as CartTesto3 from TABVARIANTI where tipologia='E03'

GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_Vista_Estintori_CartTesto3] TO [Metodo98]
    AS [dbo];

