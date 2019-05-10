

CREATE PROCEDURE [dbo].[Proc_PreparaAggiornaListino](@NrListino decimal(5,0) = 0,
                                                      @Articolo varchar(50) = '',
                                                       @Um varchar(3) = '') 
AS



GO
GRANT EXECUTE
    ON OBJECT::[dbo].[Proc_PreparaAggiornaListino] TO [Metodo98]
    AS [dbo];

