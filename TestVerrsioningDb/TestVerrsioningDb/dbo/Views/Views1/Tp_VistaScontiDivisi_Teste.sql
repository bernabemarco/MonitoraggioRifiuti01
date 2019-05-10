
CREATE VIEW [dbo].[Tp_VistaScontiDivisi_Teste]
AS
Select
    Q.Progressivo,
    (Case When (Q.ValoreSconto <> '') then Cast(Q.Posizione as varchar) Else '' End) as Posizione,
    Q.ScontoFinale,
    Q.Segno,
    Q.Sconto,
    Q.ImponibileLordo,
    Q.ImponibileNetto,
    Q.ImponibileNettoPosizione,
    Q.ValoreSconto,
    /*Personalizzazioni Eugenio*/
    Q.Codice,
    Q.CodStatus
From
(
    Select
        S.Progressivo,
        (Case When (S.ValoreSconto <> 0) then Row_Number() over(Partition by S.Progressivo order by S.Posizione) Else '' End) as Posizione,
        (Case When (S.ValoreSconto <> 0) then S.ScontoFinale Else '' End) as ScontoFinale,
        (Case When (S.ValoreSconto <> 0) then S.Segno Else '' End) as Segno,
        (Case When (S.ValoreSconto <> 0) then S.Sconto Else '' End) as Sconto,
        S.ImponibileLordo,
        S.ImponibileNetto,
        S.ImponibileNettoPosizione,
        (Case When (S.ValoreSconto <> 0) then CAST(S.ValoreSconto As Varchar(25)) Else '' End) as ValoreSconto,
        /*Personalizzazioni Eugenio*/
        (Case When (S.ValoreSconto <> 0) then (CASE WHEN S.Segno = '-' THEN 'FC' ELSE 'DI' END) Else '' End) as Codice,
        (Case When (S.ValoreSconto <> 0) then (CASE WHEN S.Segno = '-' THEN 'C' ELSE 'A' END) Else '' End) as CodStatus
        /*Personalizzazioni Eugenio*/
    from
        [dbo].[Fun_DividiStringaScontiTesteExt](0)S
    Where
            S.Progressivo <> 0
        and (S.Totale = 1 or (S.Totale > 1 and S.ValoreSconto <> 0))
) Q
GO
GRANT SELECT
    ON OBJECT::[dbo].[Tp_VistaScontiDivisi_Teste] TO [Metodo98]
    AS [dbo];

