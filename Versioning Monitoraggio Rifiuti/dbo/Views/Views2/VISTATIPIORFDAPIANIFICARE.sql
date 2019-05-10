create view [VISTATIPIORFDAPIANIFICARE] as
	select TIPODOC71 as TIPODOC from TABVINCOLIPRODUZIONE where (isnull(TIPODOC71,'')<>'')
	union
	select TIPODOC72 as TIPODOC from TABVINCOLIPRODUZIONE where (isnull(TIPODOC72,'')<>'')
	union
	select TIPODOC73 as TIPODOC from TABVINCOLIPRODUZIONE where (isnull(TIPODOC73,'')<>'')
	union
	select TIPODOC74 as TIPODOC from TABVINCOLIPRODUZIONE where (isnull(TIPODOC74,'')<>'')
	union
	select TIPODOC75 as TIPODOC from TABVINCOLIPRODUZIONE where (isnull(TIPODOC75,'')<>'')
	union
	select TIPODOC76 as TIPODOC from TABVINCOLIPRODUZIONE where (isnull(TIPODOC76,'')<>'')
	union
	select TIPODOC77 as TIPODOC from TABVINCOLIPRODUZIONE where (isnull(TIPODOC77,'')<>'')
	union
	select TIPODOC78 as TIPODOC from TABVINCOLIPRODUZIONE where (isnull(TIPODOC78,'')<>'')
	union
	select TIPODOC79 as TIPODOC from TABVINCOLIPRODUZIONE where (isnull(TIPODOC79,'')<>'')
	union
	select TIPODOC70 as TIPODOC from TABVINCOLIPRODUZIONE where (isnull(TIPODOC70,'')<>'')

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTATIPIORFDAPIANIFICARE] TO [Metodo98]
    AS [dbo];

