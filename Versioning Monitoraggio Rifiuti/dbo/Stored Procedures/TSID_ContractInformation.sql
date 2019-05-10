
CREATE PROCEDURE [dbo].[TSID_ContractInformation]
/*
RETURNS @retContractInformation TABLE 
(
    Identifier varchar(200) NOT NULL, 
    DataVerify DateTime		NULL,
	PartitaIVA varchar(12)	NULL
)
*/
AS 

BEGIN

declare @PartitaIVA varchar(12);

	/*Verifica TabDitta*/
	select @PartitaIVA = TD.PARTITAIVA from TABDITTE TD

	/*Verifica GDPR_Registry*/
	if not exists(select top 1 identifier from GDPR_Registry)
	insert into GDPR_Registry(CUser_code,TSID_CompanyCode,TSID_EnvironmentCode,TSID_InstallationCode,DataVerify)
	select '','','','',dateadd(d,-1, getdate());

	select top 1 Identifier,DataVerify,@PartitaIVA as PartitaIva from GDPR_Registry;

    RETURN;
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[TSID_ContractInformation] TO [Metodo98]
    AS [dbo];

