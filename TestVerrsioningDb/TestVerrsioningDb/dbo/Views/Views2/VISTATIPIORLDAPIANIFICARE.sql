create view [VISTATIPIORLDAPIANIFICARE] as
	select TIPODOC61 as TIPODOC from TABVINCOLIPRODUZIONE where (isnull(TIPODOC61,'')<>'')
	union
	select TIPODOC62 as TIPODOC from TABVINCOLIPRODUZIONE where (isnull(TIPODOC62,'')<>'')
	union
	select TIPODOC63 as TIPODOC from TABVINCOLIPRODUZIONE where (isnull(TIPODOC63,'')<>'')
	union
	select TIPODOC64 as TIPODOC from TABVINCOLIPRODUZIONE where (isnull(TIPODOC64,'')<>'')
	union
	select TIPODOC65 as TIPODOC from TABVINCOLIPRODUZIONE where (isnull(TIPODOC65,'')<>'')
	union
	select TIPODOC66 as TIPODOC from TABVINCOLIPRODUZIONE where (isnull(TIPODOC66,'')<>'')
	union
	select TIPODOC67 as TIPODOC from TABVINCOLIPRODUZIONE where (isnull(TIPODOC67,'')<>'')
	union
	select TIPODOC68 as TIPODOC from TABVINCOLIPRODUZIONE where (isnull(TIPODOC68,'')<>'')
	union
	select TIPODOC69 as TIPODOC from TABVINCOLIPRODUZIONE where (isnull(TIPODOC69,'')<>'')
	union
	select TIPODOC60 as TIPODOC from TABVINCOLIPRODUZIONE where (isnull(TIPODOC60,'')<>'')

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTATIPIORLDAPIANIFICARE] TO [Metodo98]
    AS [dbo];

