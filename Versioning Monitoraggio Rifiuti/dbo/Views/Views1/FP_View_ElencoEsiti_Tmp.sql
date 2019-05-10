

CREATE VIEW [dbo].[FP_View_ElencoEsiti_Tmp]
AS

select
     fle.Progressivo 
    ,fle.ProgressivoWS
    ,fle.ProgressivoSDI
    ,fle.Anno
    ,fle.Denominazione
    ,fle.numero
    ,fle.Esito
    ,fle.MsgEsito
    ,fle.CodStatoWorkflow
    ,fle.NomeFile
    ,td.TIPODOC
    ,td.NUMERODOC
    ,td.DATADOC
    ,td.CODCLIFOR
    ,td.ESERCIZIO
    ,td.BIS
    ,ac.DSCCONTO1
    ,td.NUMRIFDOC
    ,td.DATARIFDOC
from
    FP_LISTA_ESITI FLE
left join
    TESTEDOCUMENTI TD
on
    fle.ProgressivoDOC = td.PROGRESSIVO
left join
    ANAGRAFICACF AC
on
    ac.CODCONTO = td.CODCLIFOR


GO
GRANT SELECT
    ON OBJECT::[dbo].[FP_View_ElencoEsiti_Tmp] TO [Metodo98]
    AS [dbo];

