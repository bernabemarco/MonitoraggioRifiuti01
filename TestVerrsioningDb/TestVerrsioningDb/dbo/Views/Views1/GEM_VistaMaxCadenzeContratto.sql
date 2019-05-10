
create view GEM_VistaMaxCadenzeContratto
as
SELECT     SC.IDCONTRATTO,
max(case when isnull(SC.NrOperazInDeroga,0)=0 then VTOP.NrOperazioniTotali else isnull(SC.NrOperazInDeroga,0) end) as MaxNrCadInDeroga
FROM         GEM_SEZIONICONTRATTO AS SC INNER JOIN
                      GEM_Vista_T_TabStruttureOperazioniPrimarie AS VTOP ON SC.idTipologMezzo = VTOP.idTipologMezzo
group by IDCONTRATTO

GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_VistaMaxCadenzeContratto] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_VistaMaxCadenzeContratto] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GEM_VistaMaxCadenzeContratto] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_VistaMaxCadenzeContratto] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_VistaMaxCadenzeContratto] TO [Metodo98]
    AS [dbo];

