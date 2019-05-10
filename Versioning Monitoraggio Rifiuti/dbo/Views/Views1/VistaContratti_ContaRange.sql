
Create View VistaContratti_ContaRange as
select rifprogressivo,count(rifprogressivo) as NrRighe
 from contrattirange_con
group by rifprogressivo


GO
GRANT SELECT
    ON OBJECT::[dbo].[VistaContratti_ContaRange] TO [Metodo98]
    AS [dbo];

