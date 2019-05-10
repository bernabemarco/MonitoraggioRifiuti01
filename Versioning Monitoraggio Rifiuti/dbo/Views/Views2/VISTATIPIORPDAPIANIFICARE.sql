create view [VISTATIPIORPDAPIANIFICARE] as
	select TIPODOC51 as TIPODOC from TABVINCOLIPRODUZIONE where (isnull(TIPODOC51,'')<>'')
	union
	select TIPODOC52 as TIPODOC from TABVINCOLIPRODUZIONE where (isnull(TIPODOC52,'')<>'')
	union
	select TIPODOC53 as TIPODOC from TABVINCOLIPRODUZIONE where (isnull(TIPODOC53,'')<>'')
	union
	select TIPODOC54 as TIPODOC from TABVINCOLIPRODUZIONE where (isnull(TIPODOC54,'')<>'')
	union
	select TIPODOC55 as TIPODOC from TABVINCOLIPRODUZIONE where (isnull(TIPODOC55,'')<>'')
	union
	select TIPODOC56 as TIPODOC from TABVINCOLIPRODUZIONE where (isnull(TIPODOC56,'')<>'')
	union
	select TIPODOC57 as TIPODOC from TABVINCOLIPRODUZIONE where (isnull(TIPODOC57,'')<>'')
	union
	select TIPODOC58 as TIPODOC from TABVINCOLIPRODUZIONE where (isnull(TIPODOC58,'')<>'')
	union
	select TIPODOC59 as TIPODOC from TABVINCOLIPRODUZIONE where (isnull(TIPODOC59,'')<>'')
	union
	select TIPODOC50 as TIPODOC from TABVINCOLIPRODUZIONE where (isnull(TIPODOC50,'')<>'')

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTATIPIORPDAPIANIFICARE] TO [Metodo98]
    AS [dbo];

