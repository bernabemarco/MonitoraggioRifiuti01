create view GEM_Vista_Estintori_CartTesto4
as
select Variante as DscCarTesto4, VARIANTE as CartTesto4 from TABVARIANTI where tipologia='E04'
union all
select Variante as DscCarTesto4, Descrizione as CartTesto4 from TABVARIANTI where tipologia='E04'

GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_Vista_Estintori_CartTesto4] TO [Metodo98]
    AS [dbo];

