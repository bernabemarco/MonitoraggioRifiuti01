create view GEM_Vista_CiontrattoSezioneMezziUltimaVisita
as
select max(dataultimavisita) as dtUltimaVisita, idcontratto, sezionecontratto
from GEM_SEZIONICONTRATTODETTMEZZI
where isnull(dataultimavisita,'')<>''
group by idcontratto, sezionecontratto

GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_Vista_CiontrattoSezioneMezziUltimaVisita] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_Vista_CiontrattoSezioneMezziUltimaVisita] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GEM_Vista_CiontrattoSezioneMezziUltimaVisita] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_Vista_CiontrattoSezioneMezziUltimaVisita] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_Vista_CiontrattoSezioneMezziUltimaVisita] TO [Metodo98]
    AS [dbo];

