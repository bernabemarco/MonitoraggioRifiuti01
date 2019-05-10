

create view VISTARELAZIONIPROGPROD as

select
    CODCLIFOR,
    
    (case when VARIANTI = '' or VARIANTI is null then
        ARTICOLO
     else 

       case when VARESPLICITE = ''  then   
         (ARTICOLO+'#'+VARIANTI) 
       else
         (select dbo.FUSRicercaArticolo_Varianti(RELAZIONICFV.ARTICOLO,RELAZIONICFV.VARESPLICITE))
       end
        
     end) as ARTICOLO,

    (case when TIPOREL=1 then
        ARTICOLO 
    else
        RIFERIMENTO
    end) as RIFERIMENTO
from
    RELAZIONICFV   


GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTARELAZIONIPROGPROD] TO [Metodo98]
    AS [dbo];

