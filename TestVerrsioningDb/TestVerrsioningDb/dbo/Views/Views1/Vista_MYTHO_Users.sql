CREATE VIEW [dbo].[Vista_MYTHO_Users]
As 
SELECT   ANAGRAFICACF.CODCONTO CODICE,  ANAGRAFICACF.*,
                         ISNULL(dbo.MYTHO_Users_TMP.CHANGED,0) CHANGED,
                         CASE WHEN  ISNULL(dbo.MYTHO_UserEntities.UserOxID,0)  = 0 THEN 0 ELSE 1 END As Sincronizzato
FROM            ANAGRAFICACF LEFT OUTER JOIN
                         dbo.MYTHO_Users_TMP ON dbo.MYTHO_Users_TMP.CODICEMETODO = dbo.ANAGRAFICACF.CODCONTO 
                          LEFT OUTER JOIN
                         dbo.MYTHO_UserEntities ON dbo.MYTHO_UserEntities.UserEntityId = dbo.MYTHO_Users_TMP.IDUSER 
                         
                         INNER JOIN
                         ANAGRAFICARISERVATICF ON ANAGRAFICACF.CODCONTO = ANAGRAFICARISERVATICF.CODCONTO INNER JOIN
                        
                         TABUTENTI ON ANAGRAFICARISERVATICF.ESERCIZIO = TABUTENTI.ESERCIZIOATTIVO
WHERE    ANAGRAFICACF.TIPOCONTO ='C'  AND  (TABUTENTI.USERDB = CAST(USER_NAME() AS VARCHAR(25))) AND (TABUTENTI.SUPERVISOR = 1)


GO
GRANT SELECT
    ON OBJECT::[dbo].[Vista_MYTHO_Users] TO [Metodo98]
    AS [dbo];

