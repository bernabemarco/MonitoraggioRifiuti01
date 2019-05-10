
CREATE VIEW DESTDIV_0 AS
select CodConto,Codice,RagioneSociale,Indirizzo,Cap,Localita from DestinazioniDiverse
union
select CodConto,0,dscconto1,indirizzo,cap,localita from anagraficaCF

GO
GRANT SELECT
    ON OBJECT::[dbo].[DESTDIV_0] TO [Metodo98]
    AS [dbo];

