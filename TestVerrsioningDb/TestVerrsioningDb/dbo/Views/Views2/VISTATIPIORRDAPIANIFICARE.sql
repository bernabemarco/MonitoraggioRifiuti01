create view [dbo].[VISTATIPIORRDAPIANIFICARE] as
	select TIPODOC90 as TIPODOC from TABVINCOLIPRODUZIONE where (isnull(TIPODOC90,'')<>'')
	union
	select TIPODOC91 as TIPODOC from TABVINCOLIPRODUZIONE where (isnull(TIPODOC91,'')<>'')
	union
	select TIPODOC92 as TIPODOC from TABVINCOLIPRODUZIONE where (isnull(TIPODOC92,'')<>'')
	union
	select TIPODOC93 as TIPODOC from TABVINCOLIPRODUZIONE where (isnull(TIPODOC93,'')<>'')
	union
	select TIPODOC94 as TIPODOC from TABVINCOLIPRODUZIONE where (isnull(TIPODOC94,'')<>'')
	union
	select TIPODOC95 as TIPODOC from TABVINCOLIPRODUZIONE where (isnull(TIPODOC95,'')<>'')
	union
	select TIPODOC96 as TIPODOC from TABVINCOLIPRODUZIONE where (isnull(TIPODOC96,'')<>'')
	union
	select TIPODOC97 as TIPODOC from TABVINCOLIPRODUZIONE where (isnull(TIPODOC97,'')<>'')
	union
	select TIPODOC98 as TIPODOC from TABVINCOLIPRODUZIONE where (isnull(TIPODOC98,'')<>'')
	union
	select TIPODOC99 as TIPODOC from TABVINCOLIPRODUZIONE where (isnull(TIPODOC99,'')<>'')

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTATIPIORRDAPIANIFICARE] TO [Metodo98]
    AS [dbo];

