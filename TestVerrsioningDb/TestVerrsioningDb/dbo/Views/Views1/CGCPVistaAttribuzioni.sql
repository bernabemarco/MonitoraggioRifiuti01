CREATE VIEW CGCPVistaAttribuzioni AS 
   SELECT ATT.Progressivo, ATT.TipoScheda, ATT.Voce, ATT.Tipo, ATT.VoceRiferimento, ATT.Anno, ATT.Mese, ATT.Note, 
          ATR.Progressivo AS ProgressivoRiga, ATR.Categoria, ATR.Articolo, ATR.OggettoCalcolo, ATR.ValoreVariabile, 
          ATR.ValoreFisso, ATR.Percentuale 
   FROM CGCPAttribuzioni ATT INNER JOIN CGCPAttribuzioniRighe ATR ON ATT.Progressivo = ATR.RifProgressivo

GO
GRANT SELECT
    ON OBJECT::[dbo].[CGCPVistaAttribuzioni] TO [Metodo98]
    AS [dbo];

