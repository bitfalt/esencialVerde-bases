SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
PRINT N'Dropping foreign keys from [dbo].[Offices]'
GO
ALTER TABLE [dbo].[Offices] DROP CONSTRAINT [FK_Offices_Addresses]
GO
ALTER TABLE [dbo].[Offices] DROP CONSTRAINT [FK_Offices_Producers]
GO
ALTER TABLE [dbo].[Offices] DROP CONSTRAINT [FK_Offices_Collectors]
GO
ALTER TABLE [dbo].[Offices] DROP CONSTRAINT [FK_Offices_Entities]
GO
PRINT N'Dropping foreign keys from [dbo].[Addresses]'
GO
ALTER TABLE [dbo].[Addresses] DROP CONSTRAINT [FK_Addresses_Country]
GO
ALTER TABLE [dbo].[Addresses] DROP CONSTRAINT [FK_Addresses_States]
GO
PRINT N'Dropping foreign keys from [dbo].[ContactXOffice]'
GO
ALTER TABLE [dbo].[ContactXOffice] DROP CONSTRAINT [FK_ContactXOffice_ContactValues]
GO
ALTER TABLE [dbo].[ContactXOffice] DROP CONSTRAINT [FK_ContactXOffice_Offices]
GO
PRINT N'Dropping foreign keys from [dbo].[ContractActors]'
GO
ALTER TABLE [dbo].[ContractActors] DROP CONSTRAINT [FK_ContractActors_Collectors]
GO
ALTER TABLE [dbo].[ContractActors] DROP CONSTRAINT [FK_ContractActors_Offices]
GO
ALTER TABLE [dbo].[ContractActors] DROP CONSTRAINT [FK_ContractActors_Producers]
GO
PRINT N'Dropping foreign keys from [dbo].[ProducersXWasteType]'
GO
ALTER TABLE [dbo].[ProducersXWasteType] DROP CONSTRAINT [FK_ProducersXWasteType_Offices]
GO
ALTER TABLE [dbo].[ProducersXWasteType] DROP CONSTRAINT [FK_ProducersXWasteType_Producers]
GO
PRINT N'Dropping foreign keys from [dbo].[Translations]'
GO
ALTER TABLE [dbo].[Translations] DROP CONSTRAINT [FK_Translations_Languages]
GO
ALTER TABLE [dbo].[Translations] DROP CONSTRAINT [FK_Translations_Languages1]
GO
PRINT N'Dropping constraints from [dbo].[Addresses]'
GO
ALTER TABLE [dbo].[Addresses] DROP CONSTRAINT [PK_Addresses]
GO
PRINT N'Dropping constraints from [dbo].[ContactXOffice]'
GO
ALTER TABLE [dbo].[ContactXOffice] DROP CONSTRAINT [PK_ContactXOffice]
GO
PRINT N'Dropping constraints from [dbo].[Offices]'
GO
ALTER TABLE [dbo].[Offices] DROP CONSTRAINT [PK_Offices]
GO
PRINT N'Dropping constraints from [dbo].[Translations]'
GO
ALTER TABLE [dbo].[Translations] DROP CONSTRAINT [PK_Translations]
GO
PRINT N'Dropping [dbo].[Translations]'
GO
DROP TABLE [dbo].[Translations]
GO
PRINT N'Dropping [dbo].[Offices]'
GO
DROP TABLE [dbo].[Offices]
GO
PRINT N'Dropping [dbo].[ContactXOffice]'
GO
DROP TABLE [dbo].[ContactXOffice]
GO
PRINT N'Dropping [dbo].[Addresses]'
GO
DROP TABLE [dbo].[Addresses]
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
PRINT N'Altering [dbo].[CollectionAssignments]'
GO
ALTER TABLE [dbo].[CollectionAssignments] ADD
[producerxstateid] [int] NULL,
[producerxcityid] [int] NULL
GO
EXEC sp_rename N'[dbo].[CollectionAssignments].[producerid]', N'collectorxcountryid', N'COLUMN'
GO
EXEC sp_rename N'[dbo].[CollectionAssignments].[collectorid]', N'collectorxstateid', N'COLUMN'
GO
EXEC sp_rename N'[dbo].[CollectionAssignments].[producerofficeid]', N'collectorxcityid', N'COLUMN'
GO
EXEC sp_rename N'[dbo].[CollectionAssignments].[collectorofficeid]', N'producerxcountryid', N'COLUMN'
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
PRINT N'Altering [dbo].[Entities]'
GO
ALTER TABLE [dbo].[Entities] ADD
[countryid] [int] NULL,
[stateid] [int] NULL,
[cityid] [int] NULL
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
PRINT N'Altering [dbo].[ContractActors]'
GO
ALTER TABLE [dbo].[ContractActors] ADD
[collectorxcountryid] [int] NULL,
[collectorxstateid] [int] NULL,
[collectorxcityid] [int] NULL
GO
ALTER TABLE [dbo].[ContractActors] DROP
COLUMN [percentage]
GO
EXEC sp_rename N'[dbo].[ContractActors].[producerid]', N'producerxcountryid', N'COLUMN'
GO
EXEC sp_rename N'[dbo].[ContractActors].[collectorid]', N'producerxstateid', N'COLUMN'
GO
EXEC sp_rename N'[dbo].[ContractActors].[officeid]', N'producerxcityid', N'COLUMN'
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
PRINT N'Altering [dbo].[ProducersXWasteType]'
GO
ALTER TABLE [dbo].[ProducersXWasteType] ADD
[producerxcountryid] [int] NULL,
[producerxstateid] [int] NULL,
[producerxcityid] [int] NULL
GO
ALTER TABLE [dbo].[ProducersXWasteType] DROP
COLUMN [producerid],
COLUMN [officeid]
GO
PRINT N'Altering [dbo].[WasteTypeXProcess]'
GO
ALTER TABLE [dbo].[WasteTypeXProcess] DROP
COLUMN [enabled]
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
PRINT N'Adding foreign keys to [dbo].[CollectionAssignments]'
GO
ALTER TABLE [dbo].[CollectionAssignments] ADD CONSTRAINT [FK_CollectionAssignments_ProducersXState] FOREIGN KEY ([producerxstateid]) REFERENCES [dbo].[ProducersXState] ([producerxstateid])
GO
ALTER TABLE [dbo].[CollectionAssignments] ADD CONSTRAINT [FK_CollectionAssignments_ProducersXCity] FOREIGN KEY ([producerxcityid]) REFERENCES [dbo].[ProducersXCity] ([producerxcityid])
GO
ALTER TABLE [dbo].[CollectionAssignments] ADD CONSTRAINT [FK_CollectionAssignments_CollectorsXCountry] FOREIGN KEY ([collectorxcountryid]) REFERENCES [dbo].[CollectorsXCountry] ([collectorxcountryid])
GO
ALTER TABLE [dbo].[CollectionAssignments] ADD CONSTRAINT [FK_CollectionAssignments_CollectorsXState] FOREIGN KEY ([collectorxstateid]) REFERENCES [dbo].[CollectorsXState] ([collectorxstateid])
GO
ALTER TABLE [dbo].[CollectionAssignments] ADD CONSTRAINT [FK_CollectionAssignments_CollectorXCity] FOREIGN KEY ([collectorxcityid]) REFERENCES [dbo].[CollectorXCity] ([collectorxcityid])
GO
ALTER TABLE [dbo].[CollectionAssignments] ADD CONSTRAINT [FK_CollectionAssignments_ProducersXCountry] FOREIGN KEY ([producerxcountryid]) REFERENCES [dbo].[ProducersXCountry] ([producerxcountryid])
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
ALTER TABLE [dbo].[ContractActors] ADD CONSTRAINT [FK_ContractActors_ProducersXCity] FOREIGN KEY ([producerxcityid]) REFERENCES [dbo].[ProducersXCity] ([producerxcityid])
GO
ALTER TABLE [dbo].[ContractActors] ADD CONSTRAINT [FK_ContractActors_ProducersXCountry] FOREIGN KEY ([producerxcountryid]) REFERENCES [dbo].[ProducersXCountry] ([producerxcountryid])
GO
ALTER TABLE [dbo].[ContractActors] ADD CONSTRAINT [FK_ContractActors_ProducersXState] FOREIGN KEY ([producerxstateid]) REFERENCES [dbo].[ProducersXState] ([producerxstateid])
GO
PRINT N'Adding foreign keys to [dbo].[CollectorXCity]'
GO
ALTER TABLE [dbo].[CollectorXCity] ADD CONSTRAINT [FK_CollectorXCity_Collectors] FOREIGN KEY ([collectorid]) REFERENCES [dbo].[Collectors] ([collectorid])
GO
ALTER TABLE [dbo].[CollectorXCity] ADD CONSTRAINT [FK_CollectorXCity_Cities] FOREIGN KEY ([cityid]) REFERENCES [dbo].[Cities] ([cityid])
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
PRINT N'Adding foreign keys to [dbo].[ContactXEntity]'
GO
ALTER TABLE [dbo].[ContactXEntity] ADD CONSTRAINT [FK_ContactXEntity_Entities] FOREIGN KEY ([entityid]) REFERENCES [dbo].[Entities] ([entityid])
GO
ALTER TABLE [dbo].[ContactXEntity] ADD CONSTRAINT [FK_ContactXEntity_ContactValues] FOREIGN KEY ([contactvalueid]) REFERENCES [dbo].[ContactValues] ([contactvalueid])
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
PRINT N'Adding foreign keys to [dbo].[ContractActorsPercentage]'
GO
ALTER TABLE [dbo].[ContractActorsPercentage] ADD CONSTRAINT [FK_ContractActorsPercentage_ContractActors] FOREIGN KEY ([contractactorsid]) REFERENCES [dbo].[ContractActors] ([contractactorsid])
GO
PRINT N'Adding foreign keys to [dbo].[CurrencyTransactions]'
GO
ALTER TABLE [dbo].[CurrencyTransactions] ADD CONSTRAINT [FK_CurrencyTransactions_Currency] FOREIGN KEY ([currencyid]) REFERENCES [dbo].[Currency] ([currencyid])
GO
ALTER TABLE [dbo].[CurrencyTransactions] ADD CONSTRAINT [FK_CurrencyTransactions_CurrencyExchange] FOREIGN KEY ([currencyexchangeid]) REFERENCES [dbo].[CurrencyExchange] ([currencyexchangeid])
GO
PRINT N'Adding foreign keys to [dbo].[Entities]'
GO
ALTER TABLE [dbo].[Entities] ADD CONSTRAINT [FK_Entities_Country] FOREIGN KEY ([countryid]) REFERENCES [dbo].[Country] ([countryid])
GO
ALTER TABLE [dbo].[Entities] ADD CONSTRAINT [FK_Entities_States] FOREIGN KEY ([stateid]) REFERENCES [dbo].[States] ([stateid])
GO
ALTER TABLE [dbo].[Entities] ADD CONSTRAINT [FK_Entities_Cities] FOREIGN KEY ([cityid]) REFERENCES [dbo].[Cities] ([cityid])
GO
PRINT N'Adding foreign keys to [dbo].[ProducersXWasteType]'
GO
ALTER TABLE [dbo].[ProducersXWasteType] ADD CONSTRAINT [FK_ProducersXWasteType_ProducersXCity] FOREIGN KEY ([producerxcityid]) REFERENCES [dbo].[ProducersXCity] ([producerxcityid])
GO
ALTER TABLE [dbo].[ProducersXWasteType] ADD CONSTRAINT [FK_ProducersXWasteType_ProducersXCountry] FOREIGN KEY ([producerxcountryid]) REFERENCES [dbo].[ProducersXCountry] ([producerxcountryid])
GO
ALTER TABLE [dbo].[ProducersXWasteType] ADD CONSTRAINT [FK_ProducersXWasteType_ProducersXState] FOREIGN KEY ([producerxstateid]) REFERENCES [dbo].[ProducersXState] ([producerxstateid])
GO
PRINT N'Adding foreign keys to [dbo].[ProducersXCity]'
GO
ALTER TABLE [dbo].[ProducersXCity] ADD CONSTRAINT [FK_ProducersXCity_Producers] FOREIGN KEY ([producerid]) REFERENCES [dbo].[Producers] ([producerid])
GO
ALTER TABLE [dbo].[ProducersXCity] ADD CONSTRAINT [FK_ProducersXCity_Cities] FOREIGN KEY ([cityid]) REFERENCES [dbo].[Cities] ([cityid])
GO
PRINT N'Adding foreign keys to [dbo].[ProducersXCountry]'
GO
ALTER TABLE [dbo].[ProducersXCountry] ADD CONSTRAINT [FK_ProducersXCountry_Producers] FOREIGN KEY ([producerid]) REFERENCES [dbo].[Producers] ([producerid])
GO
ALTER TABLE [dbo].[ProducersXCountry] ADD CONSTRAINT [FK_ProducersXCountry_Country] FOREIGN KEY ([countryid]) REFERENCES [dbo].[Country] ([countryid])
GO
PRINT N'Adding foreign keys to [dbo].[ProducersXState]'
GO
ALTER TABLE [dbo].[ProducersXState] ADD CONSTRAINT [FK_ProducersXState_Producers] FOREIGN KEY ([producerid]) REFERENCES [dbo].[Producers] ([producerid])
GO
ALTER TABLE [dbo].[ProducersXState] ADD CONSTRAINT [FK_ProducersXState_States] FOREIGN KEY ([stateid]) REFERENCES [dbo].[States] ([stateid])
GO

