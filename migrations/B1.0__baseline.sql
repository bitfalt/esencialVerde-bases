SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
PRINT N'Creating [dbo].[States]'
GO
CREATE TABLE [dbo].[States]
(
[stateid] [int] NOT NULL IDENTITY(1, 1),
[name] [nchar] (30) NOT NULL,
[countryid] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_States] on [dbo].[States]'
GO
ALTER TABLE [dbo].[States] ADD CONSTRAINT [PK_States] PRIMARY KEY CLUSTERED ([stateid])
GO
PRINT N'Creating [dbo].[Cities]'
GO
CREATE TABLE [dbo].[Cities]
(
[cityid] [int] NOT NULL IDENTITY(1, 1),
[name] [nchar] (30) NOT NULL,
[stateid] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_Cities] on [dbo].[Cities]'
GO
ALTER TABLE [dbo].[Cities] ADD CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED ([cityid])
GO
PRINT N'Creating [dbo].[CollectorsXCountry]'
GO
CREATE TABLE [dbo].[CollectorsXCountry]
(
[collectorxcountryid] [int] NOT NULL IDENTITY(1, 1),
[collectorid] [int] NOT NULL,
[countryid] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_CollectorsXCountry] on [dbo].[CollectorsXCountry]'
GO
ALTER TABLE [dbo].[CollectorsXCountry] ADD CONSTRAINT [PK_CollectorsXCountry] PRIMARY KEY CLUSTERED ([collectorxcountryid])
GO
PRINT N'Creating [dbo].[CollectionAssignments]'
GO
CREATE TABLE [dbo].[CollectionAssignments]
(
[collectionassignmentid] [int] NOT NULL IDENTITY(1, 1),
[collectorxcountryid] [int] NULL,
[collectorxstateid] [int] NULL,
[collectorxcityid] [int] NULL,
[producerxcountryid] [int] NULL,
[producerxstateid] [int] NULL,
[producerxcityid] [int] NULL,
[collectiondate] [date] NOT NULL,
[collectionsite] [sys].[geography] NOT NULL
)
GO
PRINT N'Creating primary key [PK_CollectionAssignments] on [dbo].[CollectionAssignments]'
GO
ALTER TABLE [dbo].[CollectionAssignments] ADD CONSTRAINT [PK_CollectionAssignments] PRIMARY KEY CLUSTERED ([collectionassignmentid])
GO
PRINT N'Creating [dbo].[CollectorsXState]'
GO
CREATE TABLE [dbo].[CollectorsXState]
(
[collectorxstateid] [int] NOT NULL IDENTITY(1, 1),
[collectorid] [int] NOT NULL,
[stateid] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_CollectorsXState] on [dbo].[CollectorsXState]'
GO
ALTER TABLE [dbo].[CollectorsXState] ADD CONSTRAINT [PK_CollectorsXState] PRIMARY KEY CLUSTERED ([collectorxstateid])
GO
PRINT N'Creating [dbo].[CollectorXCity]'
GO
CREATE TABLE [dbo].[CollectorXCity]
(
[collectorxcityid] [int] NOT NULL IDENTITY(1, 1),
[collectorid] [int] NOT NULL,
[cityid] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_CollectorXCity] on [dbo].[CollectorXCity]'
GO
ALTER TABLE [dbo].[CollectorXCity] ADD CONSTRAINT [PK_CollectorXCity] PRIMARY KEY CLUSTERED ([collectorxcityid])
GO
PRINT N'Creating [dbo].[ProducersXCity]'
GO
CREATE TABLE [dbo].[ProducersXCity]
(
[producerxcityid] [int] NOT NULL IDENTITY(1, 1),
[producerid] [int] NOT NULL,
[cityid] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_ProducersXCity] on [dbo].[ProducersXCity]'
GO
ALTER TABLE [dbo].[ProducersXCity] ADD CONSTRAINT [PK_ProducersXCity] PRIMARY KEY CLUSTERED ([producerxcityid])
GO
PRINT N'Creating [dbo].[ProducersXCountry]'
GO
CREATE TABLE [dbo].[ProducersXCountry]
(
[producerxcountryid] [int] NOT NULL IDENTITY(1, 1),
[producerid] [int] NOT NULL,
[countryid] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_ProducersXCountry] on [dbo].[ProducersXCountry]'
GO
ALTER TABLE [dbo].[ProducersXCountry] ADD CONSTRAINT [PK_ProducersXCountry] PRIMARY KEY CLUSTERED ([producerxcountryid])
GO
PRINT N'Creating [dbo].[ProducersXState]'
GO
CREATE TABLE [dbo].[ProducersXState]
(
[producerxstateid] [int] NOT NULL IDENTITY(1, 1),
[producerid] [int] NOT NULL,
[stateid] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_ProducersXState] on [dbo].[ProducersXState]'
GO
ALTER TABLE [dbo].[ProducersXState] ADD CONSTRAINT [PK_ProducersXState] PRIMARY KEY CLUSTERED ([producerxstateid])
GO
PRINT N'Creating [dbo].[CollectionWasteDetails]'
GO
CREATE TABLE [dbo].[CollectionWasteDetails]
(
[collectionwasteid] [int] NOT NULL IDENTITY(1, 1),
[collectionassignmentid] [int] NOT NULL,
[wastetid] [int] NOT NULL,
[containerid] [smallint] NOT NULL
)
GO
PRINT N'Creating primary key [PK_CollectionWasteDetails] on [dbo].[CollectionWasteDetails]'
GO
ALTER TABLE [dbo].[CollectionWasteDetails] ADD CONSTRAINT [PK_CollectionWasteDetails] PRIMARY KEY CLUSTERED ([collectionwasteid])
GO
PRINT N'Creating [dbo].[Containers]'
GO
CREATE TABLE [dbo].[Containers]
(
[containerid] [smallint] NOT NULL IDENTITY(1, 1),
[name] [nchar] (20) NOT NULL,
[description] [nchar] (80) NOT NULL,
[capacity] [decimal] (6, 2) NOT NULL,
[measure] [nchar] (10) NOT NULL,
[brandid] [int] NOT NULL,
[modelid] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_Containers] on [dbo].[Containers]'
GO
ALTER TABLE [dbo].[Containers] ADD CONSTRAINT [PK_Containers] PRIMARY KEY CLUSTERED ([containerid])
GO
PRINT N'Creating [dbo].[Wastes]'
GO
CREATE TABLE [dbo].[Wastes]
(
[wasteid] [int] NOT NULL IDENTITY(1, 1),
[name] [nchar] (20) NOT NULL,
[wastetypeid] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_Wastes] on [dbo].[Wastes]'
GO
ALTER TABLE [dbo].[Wastes] ADD CONSTRAINT [PK_Wastes] PRIMARY KEY CLUSTERED ([wasteid])
GO
PRINT N'Creating [dbo].[Collectors]'
GO
CREATE TABLE [dbo].[Collectors]
(
[collectorid] [int] NOT NULL IDENTITY(1, 1),
[name] [nchar] (30) NOT NULL
)
GO
PRINT N'Creating primary key [PK_Collectors] on [dbo].[Collectors]'
GO
ALTER TABLE [dbo].[Collectors] ADD CONSTRAINT [PK_Collectors] PRIMARY KEY CLUSTERED ([collectorid])
GO
PRINT N'Creating [dbo].[Country]'
GO
CREATE TABLE [dbo].[Country]
(
[countryid] [int] NOT NULL IDENTITY(1, 1),
[name] [nchar] (30) NOT NULL
)
GO
PRINT N'Creating primary key [PK_Country] on [dbo].[Country]'
GO
ALTER TABLE [dbo].[Country] ADD CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED ([countryid])
GO
PRINT N'Creating [dbo].[ContactTypes]'
GO
CREATE TABLE [dbo].[ContactTypes]
(
[contacttypeid] [int] NOT NULL IDENTITY(1, 1),
[name] [nchar] (20) NOT NULL
)
GO
PRINT N'Creating primary key [PK_ContactTypes] on [dbo].[ContactTypes]'
GO
ALTER TABLE [dbo].[ContactTypes] ADD CONSTRAINT [PK_ContactTypes] PRIMARY KEY CLUSTERED ([contacttypeid])
GO
PRINT N'Creating [dbo].[ContactValues]'
GO
CREATE TABLE [dbo].[ContactValues]
(
[contactvalueid] [int] NOT NULL IDENTITY(1, 1),
[value] [nchar] (30) NOT NULL,
[posttime] [datetime] NOT NULL CONSTRAINT [DF_ContactValues_posttime] DEFAULT (getdate()),
[enabled] [binary] (1) NOT NULL,
[contacttypeid] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_ContactValues] on [dbo].[ContactValues]'
GO
ALTER TABLE [dbo].[ContactValues] ADD CONSTRAINT [PK_ContactValues] PRIMARY KEY CLUSTERED ([contactvalueid])
GO
PRINT N'Creating [dbo].[ContactXCollectorXCity]'
GO
CREATE TABLE [dbo].[ContactXCollectorXCity]
(
[contactxcollectorxcityid] [int] NOT NULL IDENTITY(1, 1),
[contactvalueid] [int] NOT NULL,
[collectorxcityid] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_ContactXCollectorXCity] on [dbo].[ContactXCollectorXCity]'
GO
ALTER TABLE [dbo].[ContactXCollectorXCity] ADD CONSTRAINT [PK_ContactXCollectorXCity] PRIMARY KEY CLUSTERED ([contactxcollectorxcityid])
GO
PRINT N'Creating [dbo].[ContactXCollectorXCountry]'
GO
CREATE TABLE [dbo].[ContactXCollectorXCountry]
(
[contactxcollectorxcountryid] [int] NOT NULL IDENTITY(1, 1),
[contactvalueid] [int] NOT NULL,
[collectorxcountryid] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_ContactXCollectorXCountry] on [dbo].[ContactXCollectorXCountry]'
GO
ALTER TABLE [dbo].[ContactXCollectorXCountry] ADD CONSTRAINT [PK_ContactXCollectorXCountry] PRIMARY KEY CLUSTERED ([contactxcollectorxcountryid])
GO
PRINT N'Creating [dbo].[ContactXCollectorXState]'
GO
CREATE TABLE [dbo].[ContactXCollectorXState]
(
[contactxcollectorxstateid] [int] NOT NULL IDENTITY(1, 1),
[contactvalueid] [int] NOT NULL,
[collectorxstateid] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_ContactXCollectorXState] on [dbo].[ContactXCollectorXState]'
GO
ALTER TABLE [dbo].[ContactXCollectorXState] ADD CONSTRAINT [PK_ContactXCollectorXState] PRIMARY KEY CLUSTERED ([contactxcollectorxstateid])
GO
PRINT N'Creating [dbo].[ContactXEntity]'
GO
CREATE TABLE [dbo].[ContactXEntity]
(
[contactxentityid] [int] NOT NULL IDENTITY(1, 1),
[entityid] [int] NOT NULL,
[contactvalueid] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_ContactXEntity] on [dbo].[ContactXEntity]'
GO
ALTER TABLE [dbo].[ContactXEntity] ADD CONSTRAINT [PK_ContactXEntity] PRIMARY KEY CLUSTERED ([contactxentityid])
GO
PRINT N'Creating [dbo].[Entities]'
GO
CREATE TABLE [dbo].[Entities]
(
[entityid] [int] NOT NULL IDENTITY(1, 1),
[entitytypeid] [int] NOT NULL,
[name] [nchar] (30) NOT NULL,
[countryid] [int] NULL,
[stateid] [int] NULL,
[cityid] [int] NULL
)
GO
PRINT N'Creating primary key [PK_Entities] on [dbo].[Entities]'
GO
ALTER TABLE [dbo].[Entities] ADD CONSTRAINT [PK_Entities] PRIMARY KEY CLUSTERED ([entityid])
GO
PRINT N'Creating [dbo].[ContactXProducerXCity]'
GO
CREATE TABLE [dbo].[ContactXProducerXCity]
(
[contactxproducerxcityid] [int] NOT NULL IDENTITY(1, 1),
[contactvalueid] [int] NOT NULL,
[producerxcityid] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_ContactXProducerXCity] on [dbo].[ContactXProducerXCity]'
GO
ALTER TABLE [dbo].[ContactXProducerXCity] ADD CONSTRAINT [PK_ContactXProducerXCity] PRIMARY KEY CLUSTERED ([contactxproducerxcityid])
GO
PRINT N'Creating [dbo].[ContactXProducerXCountry]'
GO
CREATE TABLE [dbo].[ContactXProducerXCountry]
(
[contactxproducerxcountryid] [int] NOT NULL IDENTITY(1, 1),
[contactvalueid] [int] NOT NULL,
[producerxcountryid] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_ContactXProducerXCountry] on [dbo].[ContactXProducerXCountry]'
GO
ALTER TABLE [dbo].[ContactXProducerXCountry] ADD CONSTRAINT [PK_ContactXProducerXCountry] PRIMARY KEY CLUSTERED ([contactxproducerxcountryid])
GO
PRINT N'Creating [dbo].[ContactXProducerXState]'
GO
CREATE TABLE [dbo].[ContactXProducerXState]
(
[contactxproducerxstateid] [int] NOT NULL IDENTITY(1, 1),
[contactvalueid] [int] NOT NULL,
[producerxstateid] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_ContactXProducerXState] on [dbo].[ContactXProducerXState]'
GO
ALTER TABLE [dbo].[ContactXProducerXState] ADD CONSTRAINT [PK_ContactXProducerXState] PRIMARY KEY CLUSTERED ([contactxproducerxstateid])
GO
PRINT N'Creating [dbo].[Brands]'
GO
CREATE TABLE [dbo].[Brands]
(
[brandid] [int] NOT NULL IDENTITY(1, 1),
[name] [nchar] (20) NOT NULL
)
GO
PRINT N'Creating primary key [PK_Brands] on [dbo].[Brands]'
GO
ALTER TABLE [dbo].[Brands] ADD CONSTRAINT [PK_Brands] PRIMARY KEY CLUSTERED ([brandid])
GO
PRINT N'Creating [dbo].[Models]'
GO
CREATE TABLE [dbo].[Models]
(
[modelid] [int] NOT NULL IDENTITY(1, 1),
[name] [nchar] (20) NOT NULL,
[capacity] [decimal] (6, 2) NOT NULL,
[measure] [nchar] (10) NOT NULL
)
GO
PRINT N'Creating primary key [PK_Models] on [dbo].[Models]'
GO
ALTER TABLE [dbo].[Models] ADD CONSTRAINT [PK_Models] PRIMARY KEY CLUSTERED ([modelid])
GO
PRINT N'Creating [dbo].[ContainerStatus]'
GO
CREATE TABLE [dbo].[ContainerStatus]
(
[containerstatusid] [int] NOT NULL IDENTITY(1, 1),
[containerid] [smallint] NOT NULL,
[statusid] [smallint] NOT NULL,
[quantity] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_ContainerStatus] on [dbo].[ContainerStatus]'
GO
ALTER TABLE [dbo].[ContainerStatus] ADD CONSTRAINT [PK_ContainerStatus] PRIMARY KEY CLUSTERED ([containerstatusid])
GO
PRINT N'Creating [dbo].[Status]'
GO
CREATE TABLE [dbo].[Status]
(
[statusid] [smallint] NOT NULL IDENTITY(1, 1),
[name] [nchar] (20) NOT NULL
)
GO
PRINT N'Creating primary key [PK_Status] on [dbo].[Status]'
GO
ALTER TABLE [dbo].[Status] ADD CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED ([statusid])
GO
PRINT N'Creating [dbo].[ContainerXWaste]'
GO
CREATE TABLE [dbo].[ContainerXWaste]
(
[contxwasteid] [int] NOT NULL IDENTITY(1, 1),
[wastetypeid] [int] NOT NULL,
[containerid] [smallint] NOT NULL
)
GO
PRINT N'Creating primary key [PK_ContainerXWaste] on [dbo].[ContainerXWaste]'
GO
ALTER TABLE [dbo].[ContainerXWaste] ADD CONSTRAINT [PK_ContainerXWaste] PRIMARY KEY CLUSTERED ([contxwasteid])
GO
PRINT N'Creating [dbo].[WasteTypes]'
GO
CREATE TABLE [dbo].[WasteTypes]
(
[wastetypeid] [int] NOT NULL IDENTITY(1, 1),
[name] [nchar] (20) NOT NULL,
[recyclable] [binary] (1) NOT NULL
)
GO
PRINT N'Creating primary key [PK_WasteTypes] on [dbo].[WasteTypes]'
GO
ALTER TABLE [dbo].[WasteTypes] ADD CONSTRAINT [PK_WasteTypes] PRIMARY KEY CLUSTERED ([wastetypeid])
GO
PRINT N'Creating [dbo].[ContractActors]'
GO
CREATE TABLE [dbo].[ContractActors]
(
[contractactorsid] [int] NOT NULL IDENTITY(1, 1),
[contractid] [int] NOT NULL,
[producerxcountryid] [int] NULL,
[producerxstateid] [int] NULL,
[producerxcityid] [int] NULL,
[collectorxcountryid] [int] NULL,
[collectorxstateid] [int] NULL,
[collectorxcityid] [int] NULL,
[entityid] [int] NULL
)
GO
PRINT N'Creating primary key [PK_ContractActors] on [dbo].[ContractActors]'
GO
ALTER TABLE [dbo].[ContractActors] ADD CONSTRAINT [PK_ContractActors] PRIMARY KEY CLUSTERED ([contractactorsid])
GO
PRINT N'Creating [dbo].[Contracts]'
GO
CREATE TABLE [dbo].[Contracts]
(
[contractid] [int] NOT NULL IDENTITY(1, 1),
[startdate] [date] NOT NULL,
[enddate] [date] NOT NULL,
[status] [nchar] (20) NOT NULL
)
GO
PRINT N'Creating primary key [PK_Contracts] on [dbo].[Contracts]'
GO
ALTER TABLE [dbo].[Contracts] ADD CONSTRAINT [PK_Contracts] PRIMARY KEY CLUSTERED ([contractid])
GO
PRINT N'Creating [dbo].[ContractActorsPercentage]'
GO
CREATE TABLE [dbo].[ContractActorsPercentage]
(
[contractactorspercentageid] [int] NOT NULL IDENTITY(1, 1),
[contractactorsid] [int] NOT NULL,
[percentage] [decimal] (5, 2) NOT NULL
)
GO
PRINT N'Creating primary key [PK_ContractActorsPercentage] on [dbo].[ContractActorsPercentage]'
GO
ALTER TABLE [dbo].[ContractActorsPercentage] ADD CONSTRAINT [PK_ContractActorsPercentage] PRIMARY KEY CLUSTERED ([contractactorspercentageid])
GO
PRINT N'Creating [dbo].[ContractTerms]'
GO
CREATE TABLE [dbo].[ContractTerms]
(
[contracttermsid] [int] NOT NULL IDENTITY(1, 1),
[contractid] [int] NULL,
[termid] [int] NULL,
[value] [nchar] (50) NULL
)
GO
PRINT N'Creating primary key [PK_ContractTerms] on [dbo].[ContractTerms]'
GO
ALTER TABLE [dbo].[ContractTerms] ADD CONSTRAINT [PK_ContractTerms] PRIMARY KEY CLUSTERED ([contracttermsid])
GO
PRINT N'Creating [dbo].[Terms]'
GO
CREATE TABLE [dbo].[Terms]
(
[termid] [int] NOT NULL IDENTITY(1, 1),
[name] [nchar] (20) NOT NULL,
[description] [nchar] (50) NOT NULL
)
GO
PRINT N'Creating primary key [PK_Terms] on [dbo].[Terms]'
GO
ALTER TABLE [dbo].[Terms] ADD CONSTRAINT [PK_Terms] PRIMARY KEY CLUSTERED ([termid])
GO
PRINT N'Creating [dbo].[Currency]'
GO
CREATE TABLE [dbo].[Currency]
(
[currencyid] [int] NOT NULL IDENTITY(1, 1),
[name] [nchar] (20) NOT NULL,
[symbol] [nchar] (10) NOT NULL,
[default] [int] NOT NULL,
[acronym] [nchar] (5) NOT NULL
)
GO
PRINT N'Creating primary key [PK_Currency] on [dbo].[Currency]'
GO
ALTER TABLE [dbo].[Currency] ADD CONSTRAINT [PK_Currency] PRIMARY KEY CLUSTERED ([currencyid])
GO
PRINT N'Creating [dbo].[CurrencyExchange]'
GO
CREATE TABLE [dbo].[CurrencyExchange]
(
[currencyexchangeid] [int] NOT NULL IDENTITY(1, 1),
[currencyid] [int] NOT NULL,
[startdate] [date] NOT NULL,
[enddate] [date] NOT NULL,
[default] [int] NOT NULL,
[exchangerate] [decimal] (10, 4) NOT NULL,
[computer] [nchar] (30) NOT NULL,
[username] [nchar] (30) NOT NULL,
[checksum] [varbinary] (150) NOT NULL,
[posttime] [datetime] NOT NULL CONSTRAINT [DF_CurrencyExchange_posttime] DEFAULT (getdate())
)
GO
PRINT N'Creating primary key [PK_CurrencyExchange] on [dbo].[CurrencyExchange]'
GO
ALTER TABLE [dbo].[CurrencyExchange] ADD CONSTRAINT [PK_CurrencyExchange] PRIMARY KEY CLUSTERED ([currencyexchangeid])
GO
PRINT N'Creating [dbo].[CurrencyTransactions]'
GO
CREATE TABLE [dbo].[CurrencyTransactions]
(
[currencytransactionid] [int] NOT NULL IDENTITY(1, 1),
[currencyid] [int] NOT NULL,
[currencyexchangeid] [int] NOT NULL,
[exchangerate] [decimal] (10, 4) NOT NULL,
[computer] [nchar] (30) NOT NULL,
[username] [nchar] (30) NOT NULL,
[checksum] [varbinary] (150) NOT NULL,
[amount] [decimal] (12, 2) NOT NULL
)
GO
PRINT N'Creating primary key [PK_CurrencyTransactions] on [dbo].[CurrencyTransactions]'
GO
ALTER TABLE [dbo].[CurrencyTransactions] ADD CONSTRAINT [PK_CurrencyTransactions] PRIMARY KEY CLUSTERED ([currencytransactionid])
GO
PRINT N'Creating [dbo].[EntityTypes]'
GO
CREATE TABLE [dbo].[EntityTypes]
(
[entitytypeid] [int] NOT NULL IDENTITY(1, 1),
[name] [nchar] (20) NOT NULL
)
GO
PRINT N'Creating primary key [PK_EntityTypes] on [dbo].[EntityTypes]'
GO
ALTER TABLE [dbo].[EntityTypes] ADD CONSTRAINT [PK_EntityTypes] PRIMARY KEY CLUSTERED ([entitytypeid])
GO
PRINT N'Creating [dbo].[EventTypes]'
GO
CREATE TABLE [dbo].[EventTypes]
(
[eventtypeid] [int] NOT NULL IDENTITY(1, 1),
[name] [nchar] (20) NOT NULL
)
GO
PRINT N'Creating primary key [PK_EventTypes] on [dbo].[EventTypes]'
GO
ALTER TABLE [dbo].[EventTypes] ADD CONSTRAINT [PK_EventTypes] PRIMARY KEY CLUSTERED ([eventtypeid])
GO
PRINT N'Creating [dbo].[EventLogs]'
GO
CREATE TABLE [dbo].[EventLogs]
(
[eventlogid] [int] NOT NULL IDENTITY(1, 1),
[posttime] [datetime] NOT NULL CONSTRAINT [DF_EventLogs_posttime] DEFAULT (getdate()),
[computer] [nchar] (30) NOT NULL,
[username] [nchar] (30) NOT NULL,
[checksum] [varbinary] (150) NOT NULL,
[description] [nchar] (20) NOT NULL,
[referenceid1] [bigint] NOT NULL,
[referenceid2] [bigint] NOT NULL,
[value1] [nchar] (80) NOT NULL,
[value2] [nchar] (80) NOT NULL,
[levelid] [int] NOT NULL,
[eventtypeid] [int] NOT NULL,
[objecttypeid] [int] NOT NULL,
[sourceid] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_EventLogs] on [dbo].[EventLogs]'
GO
ALTER TABLE [dbo].[EventLogs] ADD CONSTRAINT [PK_EventLogs] PRIMARY KEY CLUSTERED ([eventlogid])
GO
PRINT N'Creating [dbo].[Levels]'
GO
CREATE TABLE [dbo].[Levels]
(
[levelid] [int] NOT NULL IDENTITY(1, 1),
[description] [nchar] (20) NOT NULL
)
GO
PRINT N'Creating primary key [PK_Levels] on [dbo].[Levels]'
GO
ALTER TABLE [dbo].[Levels] ADD CONSTRAINT [PK_Levels] PRIMARY KEY CLUSTERED ([levelid])
GO
PRINT N'Creating [dbo].[ObjectTypes]'
GO
CREATE TABLE [dbo].[ObjectTypes]
(
[objecttypeid] [int] NOT NULL IDENTITY(1, 1),
[name] [nchar] (20) NOT NULL
)
GO
PRINT N'Creating primary key [PK_ObjectTypes] on [dbo].[ObjectTypes]'
GO
ALTER TABLE [dbo].[ObjectTypes] ADD CONSTRAINT [PK_ObjectTypes] PRIMARY KEY CLUSTERED ([objecttypeid])
GO
PRINT N'Creating [dbo].[Sources]'
GO
CREATE TABLE [dbo].[Sources]
(
[sourceid] [int] NOT NULL IDENTITY(1, 1),
[name] [nchar] (20) NOT NULL
)
GO
PRINT N'Creating primary key [PK_Sources] on [dbo].[Sources]'
GO
ALTER TABLE [dbo].[Sources] ADD CONSTRAINT [PK_Sources] PRIMARY KEY CLUSTERED ([sourceid])
GO
PRINT N'Creating [dbo].[LanguageXCountry]'
GO
CREATE TABLE [dbo].[LanguageXCountry]
(
[languagexcountryid] [int] NOT NULL IDENTITY(1, 1),
[languageid] [int] NOT NULL,
[countryid] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_LanguageXCountry] on [dbo].[LanguageXCountry]'
GO
ALTER TABLE [dbo].[LanguageXCountry] ADD CONSTRAINT [PK_LanguageXCountry] PRIMARY KEY CLUSTERED ([languagexcountryid])
GO
PRINT N'Creating [dbo].[Languages]'
GO
CREATE TABLE [dbo].[Languages]
(
[languageid] [int] NOT NULL IDENTITY(1, 1),
[name] [nchar] (20) NOT NULL,
[abbreviation] [nchar] (10) NOT NULL
)
GO
PRINT N'Creating primary key [PK_Languages] on [dbo].[Languages]'
GO
ALTER TABLE [dbo].[Languages] ADD CONSTRAINT [PK_Languages] PRIMARY KEY CLUSTERED ([languageid])
GO
PRINT N'Creating [dbo].[Materials]'
GO
CREATE TABLE [dbo].[Materials]
(
[materialid] [int] NOT NULL IDENTITY(1, 1),
[name] [nchar] (20) NOT NULL,
[wastetypeid] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_Materials] on [dbo].[Materials]'
GO
ALTER TABLE [dbo].[Materials] ADD CONSTRAINT [PK_Materials] PRIMARY KEY CLUSTERED ([materialid])
GO
PRINT N'Creating [dbo].[MaterialXProduct]'
GO
CREATE TABLE [dbo].[MaterialXProduct]
(
[materialxproductid] [int] NOT NULL IDENTITY(1, 1),
[materialid] [int] NOT NULL,
[productid] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_MaterialXProduct] on [dbo].[MaterialXProduct]'
GO
ALTER TABLE [dbo].[MaterialXProduct] ADD CONSTRAINT [PK_MaterialXProduct] PRIMARY KEY CLUSTERED ([materialxproductid])
GO
PRINT N'Creating [dbo].[Products]'
GO
CREATE TABLE [dbo].[Products]
(
[productid] [int] NOT NULL IDENTITY(1, 1),
[name] [nchar] (20) NOT NULL,
[price] [decimal] (12, 2) NOT NULL,
[expenses] [decimal] (12, 2) NOT NULL
)
GO
PRINT N'Creating primary key [PK_Products] on [dbo].[Products]'
GO
ALTER TABLE [dbo].[Products] ADD CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED ([productid])
GO
PRINT N'Creating [dbo].[ModelXBrand]'
GO
CREATE TABLE [dbo].[ModelXBrand]
(
[modelxbrandid] [int] NOT NULL IDENTITY(1, 1),
[brandid] [int] NOT NULL,
[modelid] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_ModelXBrand] on [dbo].[ModelXBrand]'
GO
ALTER TABLE [dbo].[ModelXBrand] ADD CONSTRAINT [PK_ModelXBrand] PRIMARY KEY CLUSTERED ([modelxbrandid])
GO
PRINT N'Creating [dbo].[ProcessesXCountry]'
GO
CREATE TABLE [dbo].[ProcessesXCountry]
(
[processid] [int] NOT NULL,
[countryid] [int] NOT NULL,
[stateid] [int] NULL,
[priceXkg] [money] NOT NULL,
[enabled] [binary] (1) NOT NULL
)
GO
PRINT N'Creating [dbo].[Processes]'
GO
CREATE TABLE [dbo].[Processes]
(
[processid] [int] NOT NULL IDENTITY(1, 1),
[name] [nchar] (30) NOT NULL,
[description] [nchar] (80) NOT NULL,
[status] [nchar] (20) NOT NULL
)
GO
PRINT N'Creating primary key [PK_Processes] on [dbo].[Processes]'
GO
ALTER TABLE [dbo].[Processes] ADD CONSTRAINT [PK_Processes] PRIMARY KEY CLUSTERED ([processid])
GO
PRINT N'Creating [dbo].[ProcessPriceHistory]'
GO
CREATE TABLE [dbo].[ProcessPriceHistory]
(
[processpricehistoryid] [int] NOT NULL IDENTITY(1, 1),
[processid] [int] NOT NULL,
[startdate] [date] NOT NULL,
[enddate] [date] NOT NULL
)
GO
PRINT N'Creating primary key [PK_ProcessPriceHistory] on [dbo].[ProcessPriceHistory]'
GO
ALTER TABLE [dbo].[ProcessPriceHistory] ADD CONSTRAINT [PK_ProcessPriceHistory] PRIMARY KEY CLUSTERED ([processpricehistoryid])
GO
PRINT N'Creating [dbo].[ProcessPriceXCountry]'
GO
CREATE TABLE [dbo].[ProcessPriceXCountry]
(
[processpricexcountryid] [int] NOT NULL IDENTITY(1, 1),
[countryid] [int] NOT NULL,
[stateid] [int] NULL,
[pricexkg] [decimal] (12, 2) NOT NULL,
[enabled] [binary] (1) NOT NULL,
[processid] [int] NOT NULL,
[computer] [nchar] (30) NOT NULL,
[username] [nchar] (30) NOT NULL,
[checksum] [varbinary] (150) NOT NULL,
[posttime] [datetime] NOT NULL CONSTRAINT [DF_ProcessPriceXCountry_posttime] DEFAULT (getdate()),
[currencyexchangeid] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_ProcessPriceXCountry] on [dbo].[ProcessPriceXCountry]'
GO
ALTER TABLE [dbo].[ProcessPriceXCountry] ADD CONSTRAINT [PK_ProcessPriceXCountry] PRIMARY KEY CLUSTERED ([processpricexcountryid])
GO
PRINT N'Creating [dbo].[Producers]'
GO
CREATE TABLE [dbo].[Producers]
(
[producerid] [int] NOT NULL IDENTITY(1, 1),
[name] [nchar] (30) NOT NULL
)
GO
PRINT N'Creating primary key [PK_wasteProducers] on [dbo].[Producers]'
GO
ALTER TABLE [dbo].[Producers] ADD CONSTRAINT [PK_wasteProducers] PRIMARY KEY CLUSTERED ([producerid])
GO
PRINT N'Creating [dbo].[ProducersXWasteType]'
GO
CREATE TABLE [dbo].[ProducersXWasteType]
(
[producersxwastetypeid] [int] NOT NULL IDENTITY(1, 1),
[producerxcountryid] [int] NULL,
[producerxstateid] [int] NULL,
[producerxcityid] [int] NULL,
[wastetypeid] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_ProducersXWasteType] on [dbo].[ProducersXWasteType]'
GO
ALTER TABLE [dbo].[ProducersXWasteType] ADD CONSTRAINT [PK_ProducersXWasteType] PRIMARY KEY CLUSTERED ([producersxwastetypeid])
GO
PRINT N'Creating [dbo].[Sales]'
GO
CREATE TABLE [dbo].[Sales]
(
[saleid] [int] NOT NULL IDENTITY(1, 1),
[cliententityid] [int] NOT NULL,
[productid] [int] NOT NULL,
[quantity] [decimal] (12, 2) NOT NULL,
[sellerentityid] [int] NOT NULL,
[totalPrice] [decimal] (12, 2) NOT NULL,
[posttime] [datetime] NOT NULL CONSTRAINT [DF_Sales_posttime] DEFAULT (getdate()),
[computer] [nchar] (30) NOT NULL,
[username] [nchar] (30) NOT NULL,
[checksum] [varbinary] (150) NOT NULL,
[paymenttypeid] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_Sales] on [dbo].[Sales]'
GO
ALTER TABLE [dbo].[Sales] ADD CONSTRAINT [PK_Sales] PRIMARY KEY CLUSTERED ([saleid])
GO
PRINT N'Creating [dbo].[PaymentTypes]'
GO
CREATE TABLE [dbo].[PaymentTypes]
(
[paymenttypeid] [int] NOT NULL IDENTITY(1, 1),
[name] [nchar] (20) NOT NULL
)
GO
PRINT N'Creating primary key [PK_PaymentTypes] on [dbo].[PaymentTypes]'
GO
ALTER TABLE [dbo].[PaymentTypes] ADD CONSTRAINT [PK_PaymentTypes] PRIMARY KEY CLUSTERED ([paymenttypeid])
GO
PRINT N'Creating [dbo].[WasteTypeXProcess]'
GO
CREATE TABLE [dbo].[WasteTypeXProcess]
(
[wastetypexprocessid] [int] NOT NULL IDENTITY(1, 1),
[processid] [int] NOT NULL,
[wastetypeid] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_WasteTypeXProcess] on [dbo].[WasteTypeXProcess]'
GO
ALTER TABLE [dbo].[WasteTypeXProcess] ADD CONSTRAINT [PK_WasteTypeXProcess] PRIMARY KEY CLUSTERED ([wastetypexprocessid])
GO
PRINT N'Creating [dbo].[ContractsTerms]'
GO
CREATE TABLE [dbo].[ContractsTerms]
(
[termid] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_ContractsTerms] on [dbo].[ContractsTerms]'
GO
ALTER TABLE [dbo].[ContractsTerms] ADD CONSTRAINT [PK_ContractsTerms] PRIMARY KEY CLUSTERED ([termid])
GO
PRINT N'Creating [dbo].[ProducersWasteCycle]'
GO
CREATE TABLE [dbo].[ProducersWasteCycle]
(
[producerswastecycleid] [int] NOT NULL IDENTITY(1, 1),
[producerxcountryid] [int] NULL,
[producerxstateid] [int] NULL,
[producerxcityid] [int] NULL
)
GO
PRINT N'Creating primary key [PK_ProducersWasteCycle] on [dbo].[ProducersWasteCycle]'
GO
ALTER TABLE [dbo].[ProducersWasteCycle] ADD CONSTRAINT [PK_ProducersWasteCycle] PRIMARY KEY CLUSTERED ([producerswastecycleid])
GO
PRINT N'Creating [dbo].[TermsXContract]'
GO
CREATE TABLE [dbo].[TermsXContract]
(
[termsxcontractid] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_TermsXContract] on [dbo].[TermsXContract]'
GO
ALTER TABLE [dbo].[TermsXContract] ADD CONSTRAINT [PK_TermsXContract] PRIMARY KEY CLUSTERED ([termsxcontractid])
GO
PRINT N'Creating [dbo].[localCollectors]'
GO
CREATE TABLE [dbo].[localCollectors]
(
[localCollectorid] [int] NOT NULL IDENTITY(1, 1),
[name] [nchar] (30) NOT NULL
)
GO
PRINT N'Creating primary key [PK_localCollectors] on [dbo].[localCollectors]'
GO
ALTER TABLE [dbo].[localCollectors] ADD CONSTRAINT [PK_localCollectors] PRIMARY KEY CLUSTERED ([localCollectorid])
GO
PRINT N'Creating [dbo].[regionalCollectors]'
GO
CREATE TABLE [dbo].[regionalCollectors]
(
[regionalCollectorid] [int] NOT NULL IDENTITY(1, 1),
[name] [nchar] (30) NOT NULL
)
GO
PRINT N'Creating primary key [PK_regionalCollectors] on [dbo].[regionalCollectors]'
GO
ALTER TABLE [dbo].[regionalCollectors] ADD CONSTRAINT [PK_regionalCollectors] PRIMARY KEY CLUSTERED ([regionalCollectorid])
GO
PRINT N'Adding foreign keys to [dbo].[Containers]'
GO
ALTER TABLE [dbo].[Containers] ADD CONSTRAINT [FK_Containers_Brands] FOREIGN KEY ([brandid]) REFERENCES [dbo].[Brands] ([brandid])
GO
ALTER TABLE [dbo].[Containers] ADD CONSTRAINT [FK_Containers_Models] FOREIGN KEY ([modelid]) REFERENCES [dbo].[Models] ([modelid])
GO
PRINT N'Adding foreign keys to [dbo].[ModelXBrand]'
GO
ALTER TABLE [dbo].[ModelXBrand] ADD CONSTRAINT [FK_ModelXBrand_Brands] FOREIGN KEY ([brandid]) REFERENCES [dbo].[Brands] ([brandid])
GO
ALTER TABLE [dbo].[ModelXBrand] ADD CONSTRAINT [FK_ModelXBrand_Models] FOREIGN KEY ([modelid]) REFERENCES [dbo].[Models] ([modelid])
GO
PRINT N'Adding foreign keys to [dbo].[CollectorXCity]'
GO
ALTER TABLE [dbo].[CollectorXCity] ADD CONSTRAINT [FK_CollectorXCity_Cities] FOREIGN KEY ([cityid]) REFERENCES [dbo].[Cities] ([cityid])
GO
ALTER TABLE [dbo].[CollectorXCity] ADD CONSTRAINT [FK_CollectorXCity_Collectors] FOREIGN KEY ([collectorid]) REFERENCES [dbo].[Collectors] ([collectorid])
GO
PRINT N'Adding foreign keys to [dbo].[Entities]'
GO
ALTER TABLE [dbo].[Entities] ADD CONSTRAINT [FK_Entities_Cities] FOREIGN KEY ([cityid]) REFERENCES [dbo].[Cities] ([cityid])
GO
ALTER TABLE [dbo].[Entities] ADD CONSTRAINT [FK_Entities_Country] FOREIGN KEY ([countryid]) REFERENCES [dbo].[Country] ([countryid])
GO
ALTER TABLE [dbo].[Entities] ADD CONSTRAINT [FK_Entities_EntityTypes] FOREIGN KEY ([entitytypeid]) REFERENCES [dbo].[EntityTypes] ([entitytypeid])
GO
ALTER TABLE [dbo].[Entities] ADD CONSTRAINT [FK_Entities_States] FOREIGN KEY ([stateid]) REFERENCES [dbo].[States] ([stateid])
GO
PRINT N'Adding foreign keys to [dbo].[ProducersXCity]'
GO
ALTER TABLE [dbo].[ProducersXCity] ADD CONSTRAINT [FK_ProducersXCity_Cities] FOREIGN KEY ([cityid]) REFERENCES [dbo].[Cities] ([cityid])
GO
ALTER TABLE [dbo].[ProducersXCity] ADD CONSTRAINT [FK_ProducersXCity_Producers] FOREIGN KEY ([producerid]) REFERENCES [dbo].[Producers] ([producerid])
GO
PRINT N'Adding foreign keys to [dbo].[Cities]'
GO
ALTER TABLE [dbo].[Cities] ADD CONSTRAINT [FK_Cities_States] FOREIGN KEY ([stateid]) REFERENCES [dbo].[States] ([stateid])
GO
PRINT N'Adding foreign keys to [dbo].[CollectionWasteDetails]'
GO
ALTER TABLE [dbo].[CollectionWasteDetails] ADD CONSTRAINT [FK_CollectionWasteDetails_CollectionAssignments] FOREIGN KEY ([collectionassignmentid]) REFERENCES [dbo].[CollectionAssignments] ([collectionassignmentid])
GO
ALTER TABLE [dbo].[CollectionWasteDetails] ADD CONSTRAINT [FK_CollectionWasteDetails_Wastes] FOREIGN KEY ([wastetid]) REFERENCES [dbo].[Wastes] ([wasteid])
GO
ALTER TABLE [dbo].[CollectionWasteDetails] ADD CONSTRAINT [FK_CollectionWasteDetails_Containers] FOREIGN KEY ([containerid]) REFERENCES [dbo].[Containers] ([containerid])
GO
PRINT N'Adding foreign keys to [dbo].[CollectionAssignments]'
GO
ALTER TABLE [dbo].[CollectionAssignments] ADD CONSTRAINT [FK_CollectionAssignments_CollectorsXCountry] FOREIGN KEY ([collectorxcountryid]) REFERENCES [dbo].[CollectorsXCountry] ([collectorxcountryid])
GO
ALTER TABLE [dbo].[CollectionAssignments] ADD CONSTRAINT [FK_CollectionAssignments_CollectorsXState] FOREIGN KEY ([collectorxstateid]) REFERENCES [dbo].[CollectorsXState] ([collectorxstateid])
GO
ALTER TABLE [dbo].[CollectionAssignments] ADD CONSTRAINT [FK_CollectionAssignments_CollectorXCity] FOREIGN KEY ([collectorxcityid]) REFERENCES [dbo].[CollectorXCity] ([collectorxcityid])
GO
ALTER TABLE [dbo].[CollectionAssignments] ADD CONSTRAINT [FK_CollectionAssignments_ProducersXCountry] FOREIGN KEY ([producerxcountryid]) REFERENCES [dbo].[ProducersXCountry] ([producerxcountryid])
GO
ALTER TABLE [dbo].[CollectionAssignments] ADD CONSTRAINT [FK_CollectionAssignments_ProducersXState] FOREIGN KEY ([producerxstateid]) REFERENCES [dbo].[ProducersXState] ([producerxstateid])
GO
ALTER TABLE [dbo].[CollectionAssignments] ADD CONSTRAINT [FK_CollectionAssignments_ProducersXCity] FOREIGN KEY ([producerxcityid]) REFERENCES [dbo].[ProducersXCity] ([producerxcityid])
GO
PRINT N'Adding foreign keys to [dbo].[ContactXCollectorXCity]'
GO
ALTER TABLE [dbo].[ContactXCollectorXCity] ADD CONSTRAINT [FK_ContactXCollectorXCity_CollectorXCity] FOREIGN KEY ([collectorxcityid]) REFERENCES [dbo].[CollectorXCity] ([collectorxcityid])
GO
ALTER TABLE [dbo].[ContactXCollectorXCity] ADD CONSTRAINT [FK_ContactXCollectorXCity_ContactValues] FOREIGN KEY ([contactvalueid]) REFERENCES [dbo].[ContactValues] ([contactvalueid])
GO
PRINT N'Adding foreign keys to [dbo].[ContractActors]'
GO
ALTER TABLE [dbo].[ContractActors] ADD CONSTRAINT [FK_ContractActors_CollectorXCity] FOREIGN KEY ([collectorxcityid]) REFERENCES [dbo].[CollectorXCity] ([collectorxcityid])
GO
ALTER TABLE [dbo].[ContractActors] ADD CONSTRAINT [FK_ContractActors_CollectorsXCountry] FOREIGN KEY ([collectorxcountryid]) REFERENCES [dbo].[CollectorsXCountry] ([collectorxcountryid])
GO
ALTER TABLE [dbo].[ContractActors] ADD CONSTRAINT [FK_ContractActors_CollectorsXState] FOREIGN KEY ([collectorxstateid]) REFERENCES [dbo].[CollectorsXState] ([collectorxstateid])
GO
ALTER TABLE [dbo].[ContractActors] ADD CONSTRAINT [FK_ContractActors_Contracts] FOREIGN KEY ([contractid]) REFERENCES [dbo].[Contracts] ([contractid])
GO
ALTER TABLE [dbo].[ContractActors] ADD CONSTRAINT [FK_ContractActors_ProducersXCountry] FOREIGN KEY ([producerxcountryid]) REFERENCES [dbo].[ProducersXCountry] ([producerxcountryid])
GO
ALTER TABLE [dbo].[ContractActors] ADD CONSTRAINT [FK_ContractActors_ProducersXState] FOREIGN KEY ([producerxstateid]) REFERENCES [dbo].[ProducersXState] ([producerxstateid])
GO
ALTER TABLE [dbo].[ContractActors] ADD CONSTRAINT [FK_ContractActors_ProducersXCity] FOREIGN KEY ([producerxcityid]) REFERENCES [dbo].[ProducersXCity] ([producerxcityid])
GO
ALTER TABLE [dbo].[ContractActors] ADD CONSTRAINT [FK_ContractActors_Entities] FOREIGN KEY ([entityid]) REFERENCES [dbo].[Entities] ([entityid])
GO
PRINT N'Adding foreign keys to [dbo].[ContactXCollectorXCountry]'
GO
ALTER TABLE [dbo].[ContactXCollectorXCountry] ADD CONSTRAINT [FK_ContactXCollectorXCountry_CollectorsXCountry] FOREIGN KEY ([collectorxcountryid]) REFERENCES [dbo].[CollectorsXCountry] ([collectorxcountryid])
GO
ALTER TABLE [dbo].[ContactXCollectorXCountry] ADD CONSTRAINT [FK_ContactXCollectorXCountry_ContactValues] FOREIGN KEY ([contactvalueid]) REFERENCES [dbo].[ContactValues] ([contactvalueid])
GO
PRINT N'Adding foreign keys to [dbo].[CollectorsXCountry]'
GO
ALTER TABLE [dbo].[CollectorsXCountry] ADD CONSTRAINT [FK_CollectorsXCountry_Collectors] FOREIGN KEY ([collectorid]) REFERENCES [dbo].[Collectors] ([collectorid])
GO
ALTER TABLE [dbo].[CollectorsXCountry] ADD CONSTRAINT [FK_CollectorsXCountry_Country] FOREIGN KEY ([countryid]) REFERENCES [dbo].[Country] ([countryid])
GO
PRINT N'Adding foreign keys to [dbo].[ContactXCollectorXState]'
GO
ALTER TABLE [dbo].[ContactXCollectorXState] ADD CONSTRAINT [FK_ContactXCollectorXState_CollectorsXState] FOREIGN KEY ([collectorxstateid]) REFERENCES [dbo].[CollectorsXState] ([collectorxstateid])
GO
ALTER TABLE [dbo].[ContactXCollectorXState] ADD CONSTRAINT [FK_ContactXCollectorXState_ContactValues] FOREIGN KEY ([contactvalueid]) REFERENCES [dbo].[ContactValues] ([contactvalueid])
GO
PRINT N'Adding foreign keys to [dbo].[CollectorsXState]'
GO
ALTER TABLE [dbo].[CollectorsXState] ADD CONSTRAINT [FK_CollectorsXState_Collectors] FOREIGN KEY ([collectorid]) REFERENCES [dbo].[Collectors] ([collectorid])
GO
ALTER TABLE [dbo].[CollectorsXState] ADD CONSTRAINT [FK_CollectorsXState_States] FOREIGN KEY ([stateid]) REFERENCES [dbo].[States] ([stateid])
GO
PRINT N'Adding foreign keys to [dbo].[ContactValues]'
GO
ALTER TABLE [dbo].[ContactValues] ADD CONSTRAINT [FK_ContactValues_ContactTypes] FOREIGN KEY ([contacttypeid]) REFERENCES [dbo].[ContactTypes] ([contacttypeid])
GO
PRINT N'Adding foreign keys to [dbo].[ContactXEntity]'
GO
ALTER TABLE [dbo].[ContactXEntity] ADD CONSTRAINT [FK_ContactXEntity_ContactValues] FOREIGN KEY ([contactvalueid]) REFERENCES [dbo].[ContactValues] ([contactvalueid])
GO
ALTER TABLE [dbo].[ContactXEntity] ADD CONSTRAINT [FK_ContactXEntity_Entities] FOREIGN KEY ([entityid]) REFERENCES [dbo].[Entities] ([entityid])
GO
PRINT N'Adding foreign keys to [dbo].[ContactXProducerXCity]'
GO
ALTER TABLE [dbo].[ContactXProducerXCity] ADD CONSTRAINT [FK_ContactXProducerXCity_ContactValues] FOREIGN KEY ([contactvalueid]) REFERENCES [dbo].[ContactValues] ([contactvalueid])
GO
ALTER TABLE [dbo].[ContactXProducerXCity] ADD CONSTRAINT [FK_ContactXProducerXCity_ProducersXCity] FOREIGN KEY ([producerxcityid]) REFERENCES [dbo].[ProducersXCity] ([producerxcityid])
GO
PRINT N'Adding foreign keys to [dbo].[ContactXProducerXCountry]'
GO
ALTER TABLE [dbo].[ContactXProducerXCountry] ADD CONSTRAINT [FK_ContactXProducerXCountry_ContactValues] FOREIGN KEY ([contactvalueid]) REFERENCES [dbo].[ContactValues] ([contactvalueid])
GO
ALTER TABLE [dbo].[ContactXProducerXCountry] ADD CONSTRAINT [FK_ContactXProducerXCountry_ProducersXCountry] FOREIGN KEY ([producerxcountryid]) REFERENCES [dbo].[ProducersXCountry] ([producerxcountryid])
GO
PRINT N'Adding foreign keys to [dbo].[ContactXProducerXState]'
GO
ALTER TABLE [dbo].[ContactXProducerXState] ADD CONSTRAINT [FK_ContactXProducerXState_ContactValues] FOREIGN KEY ([contactvalueid]) REFERENCES [dbo].[ContactValues] ([contactvalueid])
GO
ALTER TABLE [dbo].[ContactXProducerXState] ADD CONSTRAINT [FK_ContactXProducerXState_ProducersXState] FOREIGN KEY ([producerxstateid]) REFERENCES [dbo].[ProducersXState] ([producerxstateid])
GO
PRINT N'Adding foreign keys to [dbo].[ContainerStatus]'
GO
ALTER TABLE [dbo].[ContainerStatus] ADD CONSTRAINT [FK_ContainerStatus_Containers] FOREIGN KEY ([containerid]) REFERENCES [dbo].[Containers] ([containerid])
GO
ALTER TABLE [dbo].[ContainerStatus] ADD CONSTRAINT [FK_ContainerStatus_Status] FOREIGN KEY ([statusid]) REFERENCES [dbo].[Status] ([statusid])
GO
PRINT N'Adding foreign keys to [dbo].[ContainerXWaste]'
GO
ALTER TABLE [dbo].[ContainerXWaste] ADD CONSTRAINT [FK_ContainerXWaste_WasteTypes] FOREIGN KEY ([wastetypeid]) REFERENCES [dbo].[WasteTypes] ([wastetypeid])
GO
ALTER TABLE [dbo].[ContainerXWaste] ADD CONSTRAINT [FK_ContainerXWaste_Containers] FOREIGN KEY ([containerid]) REFERENCES [dbo].[Containers] ([containerid])
GO
PRINT N'Adding foreign keys to [dbo].[ContractActorsPercentage]'
GO
ALTER TABLE [dbo].[ContractActorsPercentage] ADD CONSTRAINT [FK_ContractActorsPercentage_ContractActors] FOREIGN KEY ([contractactorsid]) REFERENCES [dbo].[ContractActors] ([contractactorsid])
GO
PRINT N'Adding foreign keys to [dbo].[ContractTerms]'
GO
ALTER TABLE [dbo].[ContractTerms] ADD CONSTRAINT [FK_ContractTerms_Contracts] FOREIGN KEY ([contractid]) REFERENCES [dbo].[Contracts] ([contractid])
GO
ALTER TABLE [dbo].[ContractTerms] ADD CONSTRAINT [FK_ContractTerms_Terms] FOREIGN KEY ([termid]) REFERENCES [dbo].[Terms] ([termid])
GO
PRINT N'Adding foreign keys to [dbo].[LanguageXCountry]'
GO
ALTER TABLE [dbo].[LanguageXCountry] ADD CONSTRAINT [FK_LanguageXCountry_Country] FOREIGN KEY ([countryid]) REFERENCES [dbo].[Country] ([countryid])
GO
ALTER TABLE [dbo].[LanguageXCountry] ADD CONSTRAINT [FK_LanguageXCountry_Languages] FOREIGN KEY ([languageid]) REFERENCES [dbo].[Languages] ([languageid])
GO
PRINT N'Adding foreign keys to [dbo].[ProcessesXCountry]'
GO
ALTER TABLE [dbo].[ProcessesXCountry] ADD CONSTRAINT [FK_ProcessesXCountry_Country] FOREIGN KEY ([countryid]) REFERENCES [dbo].[Country] ([countryid])
GO
ALTER TABLE [dbo].[ProcessesXCountry] ADD CONSTRAINT [FK_ProcessesXCountry_Processes] FOREIGN KEY ([processid]) REFERENCES [dbo].[Processes] ([processid])
GO
ALTER TABLE [dbo].[ProcessesXCountry] ADD CONSTRAINT [FK_ProcessesXCountry_States] FOREIGN KEY ([stateid]) REFERENCES [dbo].[States] ([stateid])
GO
PRINT N'Adding foreign keys to [dbo].[ProcessPriceXCountry]'
GO
ALTER TABLE [dbo].[ProcessPriceXCountry] ADD CONSTRAINT [FK_ProcessPriceXCountry_Country] FOREIGN KEY ([countryid]) REFERENCES [dbo].[Country] ([countryid])
GO
ALTER TABLE [dbo].[ProcessPriceXCountry] ADD CONSTRAINT [FK_ProcessPriceXCountry_CurrencyExchange] FOREIGN KEY ([currencyexchangeid]) REFERENCES [dbo].[CurrencyExchange] ([currencyexchangeid])
GO
ALTER TABLE [dbo].[ProcessPriceXCountry] ADD CONSTRAINT [FK_ProcessPriceXCountry_States] FOREIGN KEY ([stateid]) REFERENCES [dbo].[States] ([stateid])
GO
ALTER TABLE [dbo].[ProcessPriceXCountry] ADD CONSTRAINT [FK_ProcessPriceXCountry_Processes] FOREIGN KEY ([processid]) REFERENCES [dbo].[Processes] ([processid])
GO
PRINT N'Adding foreign keys to [dbo].[ProducersXCountry]'
GO
ALTER TABLE [dbo].[ProducersXCountry] ADD CONSTRAINT [FK_ProducersXCountry_Country] FOREIGN KEY ([countryid]) REFERENCES [dbo].[Country] ([countryid])
GO
ALTER TABLE [dbo].[ProducersXCountry] ADD CONSTRAINT [FK_ProducersXCountry_Producers] FOREIGN KEY ([producerid]) REFERENCES [dbo].[Producers] ([producerid])
GO
PRINT N'Adding foreign keys to [dbo].[States]'
GO
ALTER TABLE [dbo].[States] ADD CONSTRAINT [FK_States_Country] FOREIGN KEY ([countryid]) REFERENCES [dbo].[Country] ([countryid])
GO
PRINT N'Adding foreign keys to [dbo].[CurrencyTransactions]'
GO
ALTER TABLE [dbo].[CurrencyTransactions] ADD CONSTRAINT [FK_CurrencyTransactions_CurrencyExchange] FOREIGN KEY ([currencyexchangeid]) REFERENCES [dbo].[CurrencyExchange] ([currencyexchangeid])
GO
ALTER TABLE [dbo].[CurrencyTransactions] ADD CONSTRAINT [FK_CurrencyTransactions_Currency] FOREIGN KEY ([currencyid]) REFERENCES [dbo].[Currency] ([currencyid])
GO
PRINT N'Adding foreign keys to [dbo].[CurrencyExchange]'
GO
ALTER TABLE [dbo].[CurrencyExchange] ADD CONSTRAINT [FK_CurrencyExchange_Currency] FOREIGN KEY ([currencyid]) REFERENCES [dbo].[Currency] ([currencyid])
GO
PRINT N'Adding foreign keys to [dbo].[Sales]'
GO
ALTER TABLE [dbo].[Sales] ADD CONSTRAINT [FK_Sales_Entities] FOREIGN KEY ([cliententityid]) REFERENCES [dbo].[Entities] ([entityid])
GO
ALTER TABLE [dbo].[Sales] ADD CONSTRAINT [FK_Sales_Entities_Seller] FOREIGN KEY ([sellerentityid]) REFERENCES [dbo].[Entities] ([entityid])
GO
ALTER TABLE [dbo].[Sales] ADD CONSTRAINT [FK_Sales_PaymentTypes] FOREIGN KEY ([paymenttypeid]) REFERENCES [dbo].[PaymentTypes] ([paymenttypeid])
GO
ALTER TABLE [dbo].[Sales] ADD CONSTRAINT [FK_Sales_Products] FOREIGN KEY ([productid]) REFERENCES [dbo].[Products] ([productid])
GO
PRINT N'Adding foreign keys to [dbo].[EventLogs]'
GO
ALTER TABLE [dbo].[EventLogs] ADD CONSTRAINT [FK_EventLogs_Levels] FOREIGN KEY ([levelid]) REFERENCES [dbo].[Levels] ([levelid])
GO
ALTER TABLE [dbo].[EventLogs] ADD CONSTRAINT [FK_EventLogs_EventTypes] FOREIGN KEY ([eventtypeid]) REFERENCES [dbo].[EventTypes] ([eventtypeid])
GO
ALTER TABLE [dbo].[EventLogs] ADD CONSTRAINT [FK_EventLogs_ObjectTypes] FOREIGN KEY ([objecttypeid]) REFERENCES [dbo].[ObjectTypes] ([objecttypeid])
GO
ALTER TABLE [dbo].[EventLogs] ADD CONSTRAINT [FK_EventLogs_Sources] FOREIGN KEY ([sourceid]) REFERENCES [dbo].[Sources] ([sourceid])
GO
PRINT N'Adding foreign keys to [dbo].[MaterialXProduct]'
GO
ALTER TABLE [dbo].[MaterialXProduct] ADD CONSTRAINT [FK_MaterialXProduct_Materials] FOREIGN KEY ([materialid]) REFERENCES [dbo].[Materials] ([materialid])
GO
ALTER TABLE [dbo].[MaterialXProduct] ADD CONSTRAINT [FK_MaterialXProduct_Products] FOREIGN KEY ([productid]) REFERENCES [dbo].[Products] ([productid])
GO
PRINT N'Adding foreign keys to [dbo].[Materials]'
GO
ALTER TABLE [dbo].[Materials] ADD CONSTRAINT [FK_Materials_WasteTypes] FOREIGN KEY ([wastetypeid]) REFERENCES [dbo].[WasteTypes] ([wastetypeid])
GO
PRINT N'Adding foreign keys to [dbo].[ProcessPriceHistory]'
GO
ALTER TABLE [dbo].[ProcessPriceHistory] ADD CONSTRAINT [FK_ProcessPriceHistory_Processes] FOREIGN KEY ([processid]) REFERENCES [dbo].[Processes] ([processid])
GO
PRINT N'Adding foreign keys to [dbo].[WasteTypeXProcess]'
GO
ALTER TABLE [dbo].[WasteTypeXProcess] ADD CONSTRAINT [FK_WasteTypeXProcess_Processes] FOREIGN KEY ([processid]) REFERENCES [dbo].[Processes] ([processid])
GO
ALTER TABLE [dbo].[WasteTypeXProcess] ADD CONSTRAINT [FK_WasteTypeXProcess_WasteTypes] FOREIGN KEY ([wastetypeid]) REFERENCES [dbo].[WasteTypes] ([wastetypeid])
GO
PRINT N'Adding foreign keys to [dbo].[ProducersXWasteType]'
GO
ALTER TABLE [dbo].[ProducersXWasteType] ADD CONSTRAINT [FK_ProducersXWasteType_ProducersXCity] FOREIGN KEY ([producerxcityid]) REFERENCES [dbo].[ProducersXCity] ([producerxcityid])
GO
ALTER TABLE [dbo].[ProducersXWasteType] ADD CONSTRAINT [FK_ProducersXWasteType_ProducersXCountry] FOREIGN KEY ([producerxcountryid]) REFERENCES [dbo].[ProducersXCountry] ([producerxcountryid])
GO
ALTER TABLE [dbo].[ProducersXWasteType] ADD CONSTRAINT [FK_ProducersXWasteType_ProducersXState] FOREIGN KEY ([producerxstateid]) REFERENCES [dbo].[ProducersXState] ([producerxstateid])
GO
ALTER TABLE [dbo].[ProducersXWasteType] ADD CONSTRAINT [FK_ProducersXWasteType_WasteTypes] FOREIGN KEY ([wastetypeid]) REFERENCES [dbo].[WasteTypes] ([wastetypeid])
GO
PRINT N'Adding foreign keys to [dbo].[ProducersXState]'
GO
ALTER TABLE [dbo].[ProducersXState] ADD CONSTRAINT [FK_ProducersXState_Producers] FOREIGN KEY ([producerid]) REFERENCES [dbo].[Producers] ([producerid])
GO
ALTER TABLE [dbo].[ProducersXState] ADD CONSTRAINT [FK_ProducersXState_States] FOREIGN KEY ([stateid]) REFERENCES [dbo].[States] ([stateid])
GO
PRINT N'Adding foreign keys to [dbo].[Wastes]'
GO
ALTER TABLE [dbo].[Wastes] ADD CONSTRAINT [FK_Wastes_WasteTypes] FOREIGN KEY ([wastetypeid]) REFERENCES [dbo].[WasteTypes] ([wastetypeid])
GO

