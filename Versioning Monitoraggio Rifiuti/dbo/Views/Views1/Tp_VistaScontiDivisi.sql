

CREATE VIEW [dbo].[Tp_VistaScontiDivisi]

AS

Select
    S.IdTesta,
    S.IdRiga,
    (Case When (S.ScontiEstesi <> '' And S.ScontiEstesi <> '0') then CAST(S.Posizione As Varchar(25)) Else '' End) as Posizione,
    (Case When (S.ScontiEstesi <> '' And S.ScontiEstesi <> '0') then S.ScontiEstesi Else '' End) as ScontiEstesi,
    (Case When (S.ScontiEstesi <> '' And S.ScontiEstesi <> '0') then S.Segno Else '' End) as Segno,
    (Case When (S.ScontiEstesi <> '' And S.ScontiEstesi <> '0') then S.Sconto Else '' End) as Sconto,
    S.PrezzoLordo,
    S.PrezzoNetto,
    S.PrezzoNettoPosizione,
    (Case When (S.ScontiEstesi <> '' And S.ScontiEstesi <> '0') then CAST(S.ValoreSconto As Varchar(25)) Else '' End) as ValoreSconto,
    /*Personalizzazioni Eugenio*/
    (Case When (S.ScontiEstesi <> '' And S.ScontiEstesi <> '0') then 'DI' Else '' End) as Codice,
    (Case When (S.ScontiEstesi <> '' And S.ScontiEstesi <> '0') then (CASE WHEN S.Segno = '-' THEN 'C' ELSE 'A' END) Else '' End) as CodStatus
    /*Personalizzazioni Eugenio*/
from
    [dbo].[Fun_DividiStringaScontiExt](0) S


GO
GRANT SELECT
    ON OBJECT::[dbo].[Tp_VistaScontiDivisi] TO [Metodo98]
    AS [dbo];

