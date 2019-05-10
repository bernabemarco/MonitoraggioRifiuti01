CREATE VIEW CGesVistaRegistrazioniMetodo AS 
   SELECT BT.Nome, BT.Ambiente, BT.AnnoInizio, BT.MeseInizio, BT.AnnoFine, BT.MeseFine, BT.DesIntestazione, 
          BR.Numero, BR.ContoVoce, BR.Descrizione, BR.Importo, TD.CodDestinazione, Td.Anno, TD.Mese, 
          TD.CodContoRaccordo, TD.ValoreVariabile AS ValoreVariabileTD, TD.ValoreFisso AS ValoreFissoTD, 
          MM.Valore AS ValoreMetodo, MD.ProgressivoCont, MD.RigaCont, MD.RigaContComp, MD.ProgressivoCDC
   FROM CGesBilancioTeste BT INNER JOIN CGesBilancioRighe BR ON BT.Progressivo = BR.RifProgressivo
        LEFT OUTER JOIN CGesTransazioniDistribuite TD ON TD.CodConto = BR.ContoVoce AND TD.Ambiente = BT.Ambiente AND 
        ((TD.Anno * 12) + TD.Mese) >= ((BT.AnnoInizio * 12) + BT.MeseInizio)  AND 
        ((TD.Anno * 12) + TD.Mese) <= ((BT.AnnoFine * 12) + BT.MeseFine) LEFT OUTER JOIN CGesMovimentiMetodo MM ON
        TD.Ambiente = MM.Ambiente AND TD.Anno = MM.Anno AND TD.Mese = MM.Mese AND (TD.RifProgressivo = MM.NumTransazione1 OR 
        TD.RifProgressivo = MM.NumTransazione2 OR TD.RifProgressivo = MM.NumTransazione3) 
        LEFT OUTER JOIN CGesMovimentiMetodoDettaglio MD ON MM.Progressivo = MD.RifProgressivo
   WHERE BT.TipoReport = 0 AND TD.Usa = 1 OR TD.Usa IS NULL

GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesVistaRegistrazioniMetodo] TO [Metodo98]
    AS [dbo];

