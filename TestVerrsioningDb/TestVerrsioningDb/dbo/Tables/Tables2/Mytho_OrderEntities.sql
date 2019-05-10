CREATE TABLE [dbo].[Mytho_OrderEntities] (
    [OrderOxId]                            INT             NOT NULL,
    [MetodoImportedState]                  TINYINT         CONSTRAINT [DF_Mytho_OrderEntities_MetodoImportedState] DEFAULT ((0)) NULL,
    [MetodoImportedRef]                    NVARCHAR (100)  NULL,
    [BillingAddress]                       NVARCHAR (255)  NULL,
    [BillingAddressBuilding]               NVARCHAR (38)   NULL,
    [BillingAddressFloor]                  NVARCHAR (38)   NULL,
    [BillingAddressL1]                     NVARCHAR (60)   NULL,
    [BillingAddressL2]                     NVARCHAR (60)   NULL,
    [BillingAddressL3]                     NVARCHAR (60)   NULL,
    [BillingAddressL4]                     NVARCHAR (60)   NULL,
    [BillingAddressOtherInfo]              NVARCHAR (38)   NULL,
    [BillingAddressStreet]                 NVARCHAR (38)   NULL,
    [BillingCellPhone]                     NVARCHAR (30)   NULL,
    [BillingCity]                          NVARCHAR (30)   NULL,
    [BillingCompany]                       NVARCHAR (50)   NULL,
    [BillingCountryISOCode]                NVARCHAR (2)    NULL,
    [BillingCountryName]                   NVARCHAR (50)   NULL,
    [BillingFax]                           NVARCHAR (30)   NULL,
    [BillingPhone]                         NVARCHAR (30)   NULL,
    [BillingState]                         NVARCHAR (30)   NULL,
    [BillingTitle]                         NVARCHAR (5)    NULL,
    [BillingZipCode]                       NVARCHAR (20)   NULL,
    [CartCoupon]                           NVARCHAR (20)   NULL,
    [CompanyVATNumber]                     NVARCHAR (50)   NULL,
    [CurrencyCode]                         NVARCHAR (3)    NULL,
    [EcoTaxAmountTaxIncl]                  DECIMAL (19, 6) NULL,
    [EcoTaxIncluded]                       BIT             NULL,
    [FiscalCode]                           NVARCHAR (30)   NULL,
    [GlobalDiscountAmount]                 DECIMAL (19, 6) NULL,
    [GlobalDiscountRate]                   DECIMAL (19, 6) NULL,
    [InternalNote]                         NVARCHAR (250)  NULL,
    [InvoiceDate]                          DATETIME        NULL,
    [InvoiceFileName]                      NVARCHAR (50)   NULL,
    [InvoiceURL]                           NVARCHAR (MAX)  NULL,
    [InvoiceID]                            NVARCHAR (25)   NULL,
    [Language]                             NVARCHAR (2)    NULL,
    [LogisticsServiceProviderAccess]       DATETIME        NULL,
    [LogisticsServiceProviderInstructions] NVARCHAR (100)  NULL,
    [PaymentMethodName]                    NVARCHAR (100)  NULL,
    [PaymentStatusLastModifiedDate]        DATETIME        NULL,
    [PMProcessorCode]                      INT             NULL,
    [ProgressStateID]                      INT             NULL,
    [RemoteIPAddr]                         NVARCHAR (50)   NULL,
    [SalesRepCode]                         NVARCHAR (50)   NULL,
    [SalesRepFirstName]                    NVARCHAR (30)   NULL,
    [SalesRepLastName]                     NVARCHAR (50)   NULL,
    [ShippingAddress]                      NVARCHAR (255)  NULL,
    [ShippingAddressBuilding]              NVARCHAR (38)   NULL,
    [ShippingAddressFloor]                 NVARCHAR (38)   NULL,
    [ShippingAddressL1]                    NVARCHAR (60)   NULL,
    [ShippingAddressL2]                    NVARCHAR (60)   NULL,
    [ShippingAddressL3]                    NVARCHAR (60)   NULL,
    [ShippingAddressL4]                    NVARCHAR (60)   NULL,
    [ShippingAddressOtherInfo]             NVARCHAR (38)   NULL,
    [ShippingAddressStreet]                NVARCHAR (38)   NULL,
    [ShippingCity]                         NVARCHAR (30)   NULL,
    [ShippingCompany]                      NVARCHAR (50)   NULL,
    [ShippingCountryISOCode]               NVARCHAR (2)    NULL,
    [ShippingCountryName]                  NVARCHAR (50)   NULL,
    [ShippingFirstName]                    NVARCHAR (30)   NULL,
    [ShippingID]                           INT             NULL,
    [ShippingInfo]                         NVARCHAR (255)  NULL,
    [ShippingLastName]                     NVARCHAR (50)   NULL,
    [ShippingMethodName]                   NVARCHAR (100)  NULL,
    [ShippingParam1]                       NVARCHAR (10)   NULL,
    CONSTRAINT [PK_OrderEntities_1] PRIMARY KEY CLUSTERED ([OrderOxId] ASC)
);


GO


CREATE TRIGGER [dbo].[Mytho_OnInsertOrder] 
   ON  [dbo].[Mytho_OrderEntities]
   FOR INSERT
AS 
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

    declare @Esercizio decimal(5,0),
            @TipoConto varchar(1) = 'C',
            @CF varchar(16) = '',
            @PI varchar(11) = '',   
            @Intestazione varchar(80),
            @Indirizzo varchar(80),
            @Telefono varchar(25),
            @Fax varchar(25),
            @Citta varchar(80),
            @CodNazione decimal(5,0),
            @CodiceISO varchar(3),
            @Cap varchar(8),
            @UtenteModifica varchar(25)

    set @Esercizio      = year(getDate())
    set @UtenteModifica = 'trm1'

    Select  @Esercizio      = IsNull(ESERCIZIOATTIVO,year(getDate())),
            @UtenteModifica = IsNull(USERID,'trm1')
    From    TABUTENTI 
    Where   USERDB = CAST(USER_NAME() AS VARCHAR(25))

    -- Insert statements for trigger here
    DECLARE CURINS CURSOR FAST_FORWARD READ_ONLY FOR

        SELECT ltrim(rtrim(left(isnull(inserted.CompanyVATNumber,space(11)),11))) as PIVA,
               ltrim(rtrim(left(isnull(inserted.FiscalCode,space(16)),16))) as CF,
               
               case when ltrim(rtrim(left(isnull(inserted.BillingCompany,space(50)),50))) <> '' then
                    
                    ltrim(rtrim(left(isnull(inserted.BillingCompany,space(50)),50)))
                
               else

                   case when ltrim(rtrim(left(isnull(inserted.ShippingFirstName,space(30)),30))) <> '' and ltrim(rtrim(left(isnull(inserted.ShippingLastName,space(50)),50))) <> '' then                    
                        ltrim(rtrim(left(isnull(inserted.ShippingFirstName,space(30)),29))) + ' ' + ltrim(rtrim(left(isnull(inserted.ShippingLastName,space(50)),49)))
                   else
                        case when ltrim(rtrim(left(isnull(inserted.ShippingFirstName,space(30)),30))) <> '' then
                            ltrim(rtrim(left(isnull(inserted.ShippingFirstName,space(30)),30)))
                        else
                            case when ltrim(rtrim(left(isnull(inserted.ShippingLastName,space(50)),50))) <> '' then
                                ltrim(rtrim(left(isnull(inserted.ShippingLastName,space(50)),50)))
                            else
                                'Cliente importato da Mytho'
                            end
                        end
                   end
                
               end,         

               ltrim(rtrim(left(isnull(inserted.BillingAddress,space(80)),80))) as Indirizzo,
               ltrim(rtrim(left(isnull(inserted.BillingPhone,space(25)),25))) as Telefono,
               ltrim(rtrim(left(isnull(inserted.BillingFax,space(25)),25))) as Fax,
               ltrim(rtrim(left(isnull(inserted.BillingCity,space(30)),30))) as Citta,
               ltrim(rtrim(left(isnull(inserted.BillingCountryISOCode,space(2)),2))) as ISO,
               ltrim(rtrim(left(isnull(inserted.BillingZipCode,space(8)),8))) as CAP

        FROM   inserted 
        Where  isnull(inserted.CompanyVATNumber,'') <> ''
        Or     isnull(inserted.FiscalCode,'') <> '' 

    OPEN CURINS

    FETCH NEXT FROM CURINS INTO @PI,@CF,@Intestazione,@Indirizzo,@Telefono,@Fax,@Citta,@CodiceISO,@Cap

    WHILE(@@FETCH_STATUS=0)
    BEGIN
        
        -- Lancio la SP --
        exec Mytho_SetAnagraficaClienti @TipoConto, 
                                        @CF, 
                                        @PI, 
                                        @Esercizio, 
                                        @UtenteModifica,
                                        @Intestazione,
                                        @Indirizzo,
                                        @Telefono,
                                        @Fax,
                                        @Citta,
                                        @CodiceISO,
                                        @Cap

        FETCH NEXT FROM CURINS INTO @PI,@CF,@Intestazione,@Indirizzo,@Telefono,@Fax,@Citta,@CodiceISO,@Cap

    END

    CLOSE CURINS     
    DEALLOCATE CURINS

END


GO
GRANT DELETE
    ON OBJECT::[dbo].[Mytho_OrderEntities] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Mytho_OrderEntities] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Mytho_OrderEntities] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Mytho_OrderEntities] TO [Metodo98]
    AS [dbo];

