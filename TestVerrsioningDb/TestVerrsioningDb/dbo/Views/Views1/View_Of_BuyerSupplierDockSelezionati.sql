

CREATE VIEW [dbo].[View_Of_BuyerSupplierDockSelezionati]
AS

Select
    Rip.NumeroSessione,
    Rip.IdSessione,
    (Case When Rip.NumeroBuyer > 1 Then '' Else Rip.CodBuyer End) as CodBuyer,
    (Case When Rip.NumeroBuyer > 1 Then '' Else AB.DESCRIZIONE End) as DscBuyer,
    (Case When Rip.NumeroFornitore > 1 Then '' Else Rip.CodFornitore End) as CodFornitore,
    (Case When Rip.NumeroFornitore > 1 Then '' Else [AS].DSCCONTO1 End) as DscFornitore,
    (Case When Rip.NumeroDeposito > 1 Then '' Else Rip.CodDeposito End) as CodDeposito,
    (Case When Rip.NumeroDeposito > 1 Then '' Else AD.DESCRIZIONE End) as DscDeposito
From
(   
    SELECT
        ROW_NUMBER() OVER(PARTITION BY B.IdSessione 
                          ORDER BY B.IdSessione,B.CodBuyer,S.CodFornitore,D.CodDeposito) As NumeroSessione,
        ROW_NUMBER() OVER(PARTITION BY B.IdSessione,B.CodBuyer 
                          ORDER BY B.IdSessione,B.CodBuyer) As NumeroBuyer,
        ROW_NUMBER() OVER(PARTITION BY B.IdSessione,B.CodBuyer,S.CodFornitore
                          ORDER BY B.IdSessione,B.CodBuyer,S.CodFornitore) As NumeroFornitore,
        ROW_NUMBER() OVER(PARTITION BY B.IdSessione,B.CodBuyer,S.CodFornitore,D.CodDeposito
                          ORDER BY B.IdSessione,B.CodBuyer,S.CodFornitore,D.CodDeposito) As NumeroDeposito,
        B.IdSessione,
        B.CodBuyer,
        S.CodFornitore,
        D.CodDeposito
    FROM 
        TP_OF_BUYERS B
    INNER JOIN
        TP_OF_SUPPLIERS S
    ON
        S.IdSessione = B.IdSessione AND
        S.CodBuyer = B.CodBuyer
    INNER JOIN
        TP_OF_DOCKS D
    ON
        D.IdSessione = S.IdSessione AND
        D.CodBuyer = S.CodBuyer
    WHERE
        B.Selezionato = 1 And
        S.Selezionato = 1 And
        D.Selezionato = 1
) Rip
INNER JOIN
    TP_ANAGRAFICABUYER AB
ON
    AB.CODICE = Rip.CodBuyer
INNER JOIN
    ANAGRAFICACF [AS]
ON 
    [AS].CodConto = Rip.CodFornitore
INNER JOIN 
    ANAGRAFICADEPOSITI AD
ON
    AD.CODICE = Rip.CodDeposito


GO
GRANT SELECT
    ON OBJECT::[dbo].[View_Of_BuyerSupplierDockSelezionati] TO [Metodo98]
    AS [dbo];

