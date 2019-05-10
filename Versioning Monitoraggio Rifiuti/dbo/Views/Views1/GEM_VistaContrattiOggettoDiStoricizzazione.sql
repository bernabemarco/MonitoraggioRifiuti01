-- GEM_TESTACONTRATTO
create view GEM_VistaContrattiOggettoDiStoricizzazione
as
SELECT   IDCONTRATTO, IdStato, DataIdStato,
(case when (
	IdStato=2 
	and 
	(SELECT     COUNT(IDCONTRATTO) AS ContContr
FROM         GEM_TESTACONTRATTO AS TC
WHERE     (PCONTR = GEM_TESTACONTRATTO.idcontratto) AND (IdStato = 1))>0
		)
		then 1 
		else 
			0
		 end) as FlagDaMantenere2,
		 (case when (
	IdStato=2 
	and 
	isnull(PCONTR,'')=''
	)
		then 1 
		else 
			0
		 end) as FlagDaMantenere2bis,
(case when IdStato in(3,4) and year(DataIdStato)>=2014
		then 1 
		else 
			0
		 end) as FlagDaMantenere34

FROM        GEM_TESTACONTRATTO
WHERE     IdStato in (2,3,4)


GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_VistaContrattiOggettoDiStoricizzazione] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_VistaContrattiOggettoDiStoricizzazione] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GEM_VistaContrattiOggettoDiStoricizzazione] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_VistaContrattiOggettoDiStoricizzazione] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_VistaContrattiOggettoDiStoricizzazione] TO [Metodo98]
    AS [dbo];

