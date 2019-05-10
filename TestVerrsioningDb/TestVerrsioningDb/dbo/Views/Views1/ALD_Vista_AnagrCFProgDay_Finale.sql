
create view ALD_Vista_AnagrCFProgDay_Finale
as 
SELECT   CODCLIFOR 
FROM           ALD_Vista_AnagrCFProgDay
group by CODCLIFOR

GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_Vista_AnagrCFProgDay_Finale] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_Vista_AnagrCFProgDay_Finale] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_Vista_AnagrCFProgDay_Finale] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_Vista_AnagrCFProgDay_Finale] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_Vista_AnagrCFProgDay_Finale] TO [Metodo98]
    AS [dbo];

