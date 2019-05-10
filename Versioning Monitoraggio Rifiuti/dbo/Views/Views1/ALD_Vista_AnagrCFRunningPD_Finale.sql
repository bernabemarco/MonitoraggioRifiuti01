CREATE view [dbo].ALD_Vista_AnagrCFRunningPD_Finale
as 
SELECT   CODCLIFOR, esercizio, periodo 
FROM           ALD_Vista_AnagrCFRunningPD
group by CODCLIFOR, esercizio, periodo


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_Vista_AnagrCFRunningPD_Finale] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_Vista_AnagrCFRunningPD_Finale] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_Vista_AnagrCFRunningPD_Finale] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_Vista_AnagrCFRunningPD_Finale] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_Vista_AnagrCFRunningPD_Finale] TO [Metodo98]
    AS [dbo];

