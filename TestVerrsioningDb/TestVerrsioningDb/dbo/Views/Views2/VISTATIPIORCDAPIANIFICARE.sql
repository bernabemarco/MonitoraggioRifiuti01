create view VISTATIPIORCDAPIANIFICARE as
	select TIPODOC41 as TIPODOC from TABVINCOLIPRODUZIONE where (isnull(TIPODOC41,'')<>'')
	union
	select TIPODOC42 as TIPODOC from TABVINCOLIPRODUZIONE where (isnull(TIPODOC42,'')<>'')
	union
	select TIPODOC43 as TIPODOC from TABVINCOLIPRODUZIONE where (isnull(TIPODOC43,'')<>'')
	union
	select TIPODOC44 as TIPODOC from TABVINCOLIPRODUZIONE where (isnull(TIPODOC44,'')<>'')
	union
	select TIPODOC45 as TIPODOC from TABVINCOLIPRODUZIONE where (isnull(TIPODOC45,'')<>'')
	union
	select TIPODOC46 as TIPODOC from TABVINCOLIPRODUZIONE where (isnull(TIPODOC46,'')<>'')
	union
	select TIPODOC47 as TIPODOC from TABVINCOLIPRODUZIONE where (isnull(TIPODOC47,'')<>'')
	union
	select TIPODOC48 as TIPODOC from TABVINCOLIPRODUZIONE where (isnull(TIPODOC48,'')<>'')
	union
	select TIPODOC49 as TIPODOC from TABVINCOLIPRODUZIONE where (isnull(TIPODOC49,'')<>'')
	union
	select TIPODOC40 as TIPODOC from TABVINCOLIPRODUZIONE where (isnull(TIPODOC40,'')<>'')

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTATIPIORCDAPIANIFICARE] TO [Metodo98]
    AS [dbo];

