create view Gem_Vista_ControlloDocEmessi
as 
SELECT     IdRapportoGemma, IDTESTA as IdTesta_extra
FROM         EXTRARIGHEDOC
where len(IdRapportoGemma)>0
GROUP BY IdRapportoGemma, IDTESTA

GO
GRANT DELETE
    ON OBJECT::[dbo].[Gem_Vista_ControlloDocEmessi] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Gem_Vista_ControlloDocEmessi] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[Gem_Vista_ControlloDocEmessi] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Gem_Vista_ControlloDocEmessi] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Gem_Vista_ControlloDocEmessi] TO [Metodo98]
    AS [dbo];

