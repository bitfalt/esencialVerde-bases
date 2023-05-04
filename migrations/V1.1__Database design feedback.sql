SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
PRINT N'Dropping foreign keys from [dbo].[CollectionAssignments]'
GO
ALTER TABLE [dbo].[CollectionAssignments] DROP CONSTRAINT [FK_CollectionAssignments_ProducersXState]
GO
ALTER TABLE [dbo].[CollectionAssignments] DROP CONSTRAINT [FK_CollectionAssignments_ProducersXCity]
GO
ALTER TABLE [dbo].[CollectionAssignments] DROP CONSTRAINT [FK_CollectionAssignments_CollectorsXCountry]
GO
ALTER TABLE [dbo].[CollectionAssignments] DROP CONSTRAINT [FK_CollectionAssignments_CollectorsXState]
GO
ALTER TABLE [dbo].[CollectionAssignments] DROP CONSTRAINT [FK_CollectionAssignments_CollectorXCity]
GO
ALTER TABLE [dbo].[CollectionAssignments] DROP CONSTRAINT [FK_CollectionAssignments_ProducersXCountry]
GO
PRINT N'Dropping foreign keys from [dbo].[ContactXCollectorXCity]'
GO
ALTER TABLE [dbo].[ContactXCollectorXCity] DROP CONSTRAINT [FK_ContactXCollectorXCity_CollectorXCity]
GO
ALTER TABLE [dbo].[ContactXCollectorXCity] DROP CONSTRAINT [FK_ContactXCollectorXCity_ContactValues]
GO
PRINT N'Dropping foreign keys from [dbo].[ContractActors]'
GO
ALTER TABLE [dbo].[ContractActors] DROP CONSTRAINT [FK_ContractActors_CollectorXCity]
GO
ALTER TABLE [dbo].[ContractActors] DROP CONSTRAINT [FK_ContractActors_CollectorsXCountry]
GO
ALTER TABLE [dbo].[ContractActors] DROP CONSTRAINT [FK_ContractActors_CollectorsXState]
GO
ALTER TABLE [dbo].[ContractActors] DROP CONSTRAINT [FK_ContractActors_Contracts]
GO
ALTER TABLE [dbo].[ContractActors] DROP CONSTRAINT [FK_ContractActors_Entities]
GO
ALTER TABLE [dbo].[ContractActors] DROP CONSTRAINT [FK_ContractActors_ProducersXCity]
GO
ALTER TABLE [dbo].[ContractActors] DROP CONSTRAINT [FK_ContractActors_ProducersXCountry]
GO
ALTER TABLE [dbo].[ContractActors] DROP CONSTRAINT [FK_ContractActors_ProducersXState]
GO
PRINT N'Dropping foreign keys from [dbo].[CollectorXCity]'
GO
ALTER TABLE [dbo].[CollectorXCity] DROP CONSTRAINT [FK_CollectorXCity_Collectors]
GO
ALTER TABLE [dbo].[CollectorXCity] DROP CONSTRAINT [FK_CollectorXCity_Cities]
GO
PRINT N'Dropping foreign keys from [dbo].[ContactXCollectorXCountry]'
GO
ALTER TABLE [dbo].[ContactXCollectorXCountry] DROP CONSTRAINT [FK_ContactXCollectorXCountry_CollectorsXCountry]
GO
ALTER TABLE [dbo].[ContactXCollectorXCountry] DROP CONSTRAINT [FK_ContactXCollectorXCountry_ContactValues]
GO
PRINT N'Dropping foreign keys from [dbo].[CollectorsXCountry]'
GO
ALTER TABLE [dbo].[CollectorsXCountry] DROP CONSTRAINT [FK_CollectorsXCountry_Collectors]
GO
ALTER TABLE [dbo].[CollectorsXCountry] DROP CONSTRAINT [FK_CollectorsXCountry_Country]
GO
PRINT N'Dropping foreign keys from [dbo].[ContactXCollectorXState]'
GO
ALTER TABLE [dbo].[ContactXCollectorXState] DROP CONSTRAINT [FK_ContactXCollectorXState_CollectorsXState]
GO
ALTER TABLE [dbo].[ContactXCollectorXState] DROP CONSTRAINT [FK_ContactXCollectorXState_ContactValues]
GO
PRINT N'Dropping foreign keys from [dbo].[CollectorsXState]'
GO
ALTER TABLE [dbo].[CollectorsXState] DROP CONSTRAINT [FK_CollectorsXState_Collectors]
GO
ALTER TABLE [dbo].[CollectorsXState] DROP CONSTRAINT [FK_CollectorsXState_States]
GO
PRINT N'Dropping foreign keys from [dbo].[ContactXEntity]'
GO
ALTER TABLE [dbo].[ContactXEntity] DROP CONSTRAINT [FK_ContactXEntity_Entities]
GO
ALTER TABLE [dbo].[ContactXEntity] DROP CONSTRAINT [FK_ContactXEntity_ContactValues]
GO
PRINT N'Dropping foreign keys from [dbo].[ContactXProducerXCity]'
GO
ALTER TABLE [dbo].[ContactXProducerXCity] DROP CONSTRAINT [FK_ContactXProducerXCity_ContactValues]
GO
ALTER TABLE [dbo].[ContactXProducerXCity] DROP CONSTRAINT [FK_ContactXProducerXCity_ProducersXCity]
GO
PRINT N'Dropping foreign keys from [dbo].[ContactXProducerXCountry]'
GO
ALTER TABLE [dbo].[ContactXProducerXCountry] DROP CONSTRAINT [FK_ContactXProducerXCountry_ContactValues]
GO
ALTER TABLE [dbo].[ContactXProducerXCountry] DROP CONSTRAINT [FK_ContactXProducerXCountry_ProducersXCountry]
GO
PRINT N'Dropping foreign keys from [dbo].[ContactXProducerXState]'
GO
ALTER TABLE [dbo].[ContactXProducerXState] DROP CONSTRAINT [FK_ContactXProducerXState_ContactValues]
GO
ALTER TABLE [dbo].[ContactXProducerXState] DROP CONSTRAINT [FK_ContactXProducerXState_ProducersXState]
GO
PRINT N'Dropping foreign keys from [dbo].[ContractActorsPercentage]'
GO
ALTER TABLE [dbo].[ContractActorsPercentage] DROP CONSTRAINT [FK_ContractActorsPercentage_ContractActors]
GO
PRINT N'Dropping foreign keys from [dbo].[CurrencyTransactions]'
GO
ALTER TABLE [dbo].[CurrencyTransactions] DROP CONSTRAINT [FK_CurrencyTransactions_Currency]
GO
ALTER TABLE [dbo].[CurrencyTransactions] DROP CONSTRAINT [FK_CurrencyTransactions_CurrencyExchange]
GO
PRINT N'Dropping foreign keys from [dbo].[Entities]'
GO
ALTER TABLE [dbo].[Entities] DROP CONSTRAINT [FK_Entities_Country]
GO
ALTER TABLE [dbo].[Entities] DROP CONSTRAINT [FK_Entities_States]
GO
ALTER TABLE [dbo].[Entities] DROP CONSTRAINT [FK_Entities_Cities]
GO
PRINT N'Dropping foreign keys from [dbo].[ProducersXWasteType]'
GO
ALTER TABLE [dbo].[ProducersXWasteType] DROP CONSTRAINT [FK_ProducersXWasteType_ProducersXCity]
GO
ALTER TABLE [dbo].[ProducersXWasteType] DROP CONSTRAINT [FK_ProducersXWasteType_ProducersXCountry]
GO
ALTER TABLE [dbo].[ProducersXWasteType] DROP CONSTRAINT [FK_ProducersXWasteType_ProducersXState]
GO
ALTER TABLE [dbo].[ProducersXWasteType] DROP CONSTRAINT [FK_ProducersXWasteType_WasteTypes]
GO
PRINT N'Dropping foreign keys from [dbo].[ProducersXCity]'
GO
ALTER TABLE [dbo].[ProducersXCity] DROP CONSTRAINT [FK_ProducersXCity_Producers]
GO
ALTER TABLE [dbo].[ProducersXCity] DROP CONSTRAINT [FK_ProducersXCity_Cities]
GO
PRINT N'Dropping foreign keys from [dbo].[ProducersXCountry]'
GO
ALTER TABLE [dbo].[ProducersXCountry] DROP CONSTRAINT [FK_ProducersXCountry_Producers]
GO
ALTER TABLE [dbo].[ProducersXCountry] DROP CONSTRAINT [FK_ProducersXCountry_Country]
GO
PRINT N'Dropping foreign keys from [dbo].[ProducersXState]'
GO
ALTER TABLE [dbo].[ProducersXState] DROP CONSTRAINT [FK_ProducersXState_Producers]
GO
ALTER TABLE [dbo].[ProducersXState] DROP CONSTRAINT [FK_ProducersXState_States]
GO
PRINT N'Dropping foreign keys from [dbo].[WasteTypeXProcess]'
GO
ALTER TABLE [dbo].[WasteTypeXProcess] DROP CONSTRAINT [FK_WasteTypeXProcess_Processes]
GO
ALTER TABLE [dbo].[WasteTypeXProcess] DROP CONSTRAINT [FK_WasteTypeXProcess_WasteTypes]
GO
PRINT N'Dropping constraints from [dbo].[CollectorXCity]'
GO
ALTER TABLE [dbo].[CollectorXCity] DROP CONSTRAINT [PK_CollectorXCity]
GO
PRINT N'Dropping constraints from [dbo].[CollectorsXCountry]'
GO
ALTER TABLE [dbo].[CollectorsXCountry] DROP CONSTRAINT [PK_CollectorsXCountry]
GO
PRINT N'Dropping constraints from [dbo].[CollectorsXState]'
GO
ALTER TABLE [dbo].[CollectorsXState] DROP CONSTRAINT [PK_CollectorsXState]
GO
PRINT N'Dropping constraints from [dbo].[ContactXCollectorXCity]'
GO
ALTER TABLE [dbo].[ContactXCollectorXCity] DROP CONSTRAINT [PK_ContactXCollectorXCity]
GO
PRINT N'Dropping constraints from [dbo].[ContactXCollectorXCountry]'
GO
ALTER TABLE [dbo].[ContactXCollectorXCountry] DROP CONSTRAINT [PK_ContactXCollectorXCountry]
GO
PRINT N'Dropping constraints from [dbo].[ContactXCollectorXState]'
GO
ALTER TABLE [dbo].[ContactXCollectorXState] DROP CONSTRAINT [PK_ContactXCollectorXState]
GO
PRINT N'Dropping constraints from [dbo].[ContactXEntity]'
GO
ALTER TABLE [dbo].[ContactXEntity] DROP CONSTRAINT [PK_ContactXEntity]
GO
PRINT N'Dropping constraints from [dbo].[ContactXProducerXCity]'
GO
ALTER TABLE [dbo].[ContactXProducerXCity] DROP CONSTRAINT [PK_ContactXProducerXCity]
GO
PRINT N'Dropping constraints from [dbo].[ContactXProducerXCountry]'
GO
ALTER TABLE [dbo].[ContactXProducerXCountry] DROP CONSTRAINT [PK_ContactXProducerXCountry]
GO
PRINT N'Dropping constraints from [dbo].[ContactXProducerXState]'
GO
ALTER TABLE [dbo].[ContactXProducerXState] DROP CONSTRAINT [PK_ContactXProducerXState]
GO
PRINT N'Dropping constraints from [dbo].[ContractActorsPercentage]'
GO
ALTER TABLE [dbo].[ContractActorsPercentage] DROP CONSTRAINT [PK_ContractActorsPercentage]
GO
PRINT N'Dropping constraints from [dbo].[ContractActors]'
GO
ALTER TABLE [dbo].[ContractActors] DROP CONSTRAINT [PK_ContractActors]
GO
PRINT N'Dropping constraints from [dbo].[CurrencyTransactions]'
GO
ALTER TABLE [dbo].[CurrencyTransactions] DROP CONSTRAINT [PK_CurrencyTransactions]
GO
PRINT N'Dropping constraints from [dbo].[ProducersXCity]'
GO
ALTER TABLE [dbo].[ProducersXCity] DROP CONSTRAINT [PK_ProducersXCity]
GO
PRINT N'Dropping constraints from [dbo].[ProducersXCountry]'
GO
ALTER TABLE [dbo].[ProducersXCountry] DROP CONSTRAINT [PK_ProducersXCountry]
GO
PRINT N'Dropping constraints from [dbo].[ProducersXState]'
GO
ALTER TABLE [dbo].[ProducersXState] DROP CONSTRAINT [PK_ProducersXState]
GO
PRINT N'Dropping constraints from [dbo].[ProducersXWasteType]'
GO
ALTER TABLE [dbo].[ProducersXWasteType] DROP CONSTRAINT [PK_ProducersXWasteType]
GO
PRINT N'Dropping constraints from [dbo].[WasteTypeXProcess]'
GO
ALTER TABLE [dbo].[WasteTypeXProcess] DROP CONSTRAINT [PK_WasteTypeXProcess]
GO
PRINT N'Dropping constraints from [dbo].[regionalCollectors]'
GO
ALTER TABLE [dbo].[regionalCollectors] DROP CONSTRAINT [PK_regionalCollectors]
GO
PRINT N'Dropping [dbo].[regionalCollectors]'
GO
DROP TABLE [dbo].[regionalCollectors]
GO
PRINT N'Dropping [dbo].[CurrencyTransactions]'
GO
DROP TABLE [dbo].[CurrencyTransactions]
GO
PRINT N'Dropping [dbo].[ContractActorsPercentage]'
GO
DROP TABLE [dbo].[ContractActorsPercentage]
GO
PRINT N'Dropping [dbo].[ContactXProducerXState]'
GO
DROP TABLE [dbo].[ContactXProducerXState]
GO
PRINT N'Dropping [dbo].[ContactXProducerXCountry]'
GO
DROP TABLE [dbo].[ContactXProducerXCountry]
GO
PRINT N'Dropping [dbo].[ContactXProducerXCity]'
GO
DROP TABLE [dbo].[ContactXProducerXCity]
GO
PRINT N'Dropping [dbo].[ContactXEntity]'
GO
DROP TABLE [dbo].[ContactXEntity]
GO
PRINT N'Dropping [dbo].[ContactXCollectorXState]'
GO
DROP TABLE [dbo].[ContactXCollectorXState]
GO
PRINT N'Dropping [dbo].[ContactXCollectorXCountry]'
GO
DROP TABLE [dbo].[ContactXCollectorXCountry]
GO
PRINT N'Dropping [dbo].[ContactXCollectorXCity]'
GO
DROP TABLE [dbo].[ContactXCollectorXCity]
GO
PRINT N'Dropping [dbo].[ProducersXState]'
GO
DROP TABLE [dbo].[ProducersXState]
GO
PRINT N'Dropping [dbo].[ProducersXCountry]'
GO
DROP TABLE [dbo].[ProducersXCountry]
GO
PRINT N'Dropping [dbo].[ProducersXCity]'
GO
DROP TABLE [dbo].[ProducersXCity]
GO
PRINT N'Dropping [dbo].[CollectorXCity]'
GO
DROP TABLE [dbo].[CollectorXCity]
GO
PRINT N'Dropping [dbo].[CollectorsXState]'
GO
DROP TABLE [dbo].[CollectorsXState]
GO
PRINT N'Dropping [dbo].[CollectorsXCountry]'
GO
DROP TABLE [dbo].[CollectorsXCountry]
GO
PRINT N'Creating [dbo].[Addresses]'
GO
CREATE TABLE [dbo].[Addresses]
(
[addressid] [int] NOT NULL IDENTITY(1, 1),
[countryid] [int] NOT NULL,
[stateid] [int] NOT NULL,
[city] [nchar] (30) NOT NULL,
[street] [nchar] (80) NOT NULL,
[postalCode] [nchar] (20) NOT NULL
)
GO
PRINT N'Creating primary key [PK_Addresses] on [dbo].[Addresses]'
GO
ALTER TABLE [dbo].[Addresses] ADD CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED ([addressid])
GO
PRINT N'Altering [dbo].[CollectionAssignments]'
GO
ALTER TABLE [dbo].[CollectionAssignments] DROP
COLUMN [producerxstateid],
COLUMN [producerxcityid]
GO
EXEC sp_rename N'[dbo].[CollectionAssignments].[collectorxcountryid]', N'producerid', N'COLUMN'
GO
EXEC sp_rename N'[dbo].[CollectionAssignments].[collectorxstateid]', N'collectorid', N'COLUMN'
GO
EXEC sp_rename N'[dbo].[CollectionAssignments].[collectorxcityid]', N'producerofficeid', N'COLUMN'
GO
EXEC sp_rename N'[dbo].[CollectionAssignments].[producerxcountryid]', N'collectorofficeid', N'COLUMN'
GO
PRINT N'Creating [dbo].[ContactXOffice]'
GO
CREATE TABLE [dbo].[ContactXOffice]
(
[contactxofficeid] [int] NOT NULL,
[contactvalueid] [int] NOT NULL,
[officeid] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_ContactXOffice] on [dbo].[ContactXOffice]'
GO
ALTER TABLE [dbo].[ContactXOffice] ADD CONSTRAINT [PK_ContactXOffice] PRIMARY KEY CLUSTERED ([contactxofficeid])
GO
PRINT N'Creating [dbo].[Offices]'
GO
CREATE TABLE [dbo].[Offices]
(
[officeid] [int] NOT NULL IDENTITY(1, 1),
[name] [nchar] (30) NOT NULL,
[addressid] [int] NOT NULL,
[producerid] [int] NULL,
[collectorid] [int] NULL,
[entityid] [int] NULL
)
GO
PRINT N'Creating primary key [PK_Offices] on [dbo].[Offices]'
GO
ALTER TABLE [dbo].[Offices] ADD CONSTRAINT [PK_Offices] PRIMARY KEY CLUSTERED ([officeid])
GO
PRINT N'Rebuilding [dbo].[ContractActors]'
GO
CREATE TABLE [dbo].[RG_Recovery_1_ContractActors]
(
[contractactorsid] [int] NOT NULL IDENTITY(1, 1),
[contractid] [int] NOT NULL,
[producerid] [int] NULL,
[collectorid] [int] NULL,
[entityid] [int] NULL,
[officeid] [int] NULL,
[percentage] [decimal] (5, 2) NOT NULL
)
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_1_ContractActors] ON
GO
INSERT INTO [dbo].[RG_Recovery_1_ContractActors]([contractactorsid], [contractid], [producerid], [collectorid], [entityid], [officeid]) SELECT [contractactorsid], [contractid], [producerxcountryid], [producerxstateid], [entityid], [collectorxcountryid] FROM [dbo].[ContractActors]
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_1_ContractActors] OFF
GO
DECLARE @idVal BIGINT
SELECT @idVal = IDENT_CURRENT(N'[dbo].[ContractActors]')
IF @idVal IS NOT NULL
    DBCC CHECKIDENT(N'[dbo].[RG_Recovery_1_ContractActors]', RESEED, @idVal)
GO
DROP TABLE [dbo].[ContractActors]
GO
EXEC sp_rename N'[dbo].[RG_Recovery_1_ContractActors]', N'ContractActors', N'OBJECT'
GO
PRINT N'Creating primary key [PK_ContractActors] on [dbo].[ContractActors]'
GO
ALTER TABLE [dbo].[ContractActors] ADD CONSTRAINT [PK_ContractActors] PRIMARY KEY CLUSTERED ([contractactorsid])
GO
PRINT N'Altering [dbo].[Entities]'
GO
ALTER TABLE [dbo].[Entities] DROP
COLUMN [countryid],
COLUMN [stateid],
COLUMN [cityid]
GO
PRINT N'Rebuilding [dbo].[ProducersXWasteType]'
GO
CREATE TABLE [dbo].[RG_Recovery_2_ProducersXWasteType]
(
[producersxwastetypeid] [int] NOT NULL IDENTITY(1, 1),
[producerid] [int] NOT NULL,
[officeid] [int] NOT NULL,
[wastetypeid] [int] NOT NULL
)
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_2_ProducersXWasteType] ON
GO
INSERT INTO [dbo].[RG_Recovery_2_ProducersXWasteType]([producersxwastetypeid], [wastetypeid]) SELECT [producersxwastetypeid], [wastetypeid] FROM [dbo].[ProducersXWasteType]
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_2_ProducersXWasteType] OFF
GO
DECLARE @idVal BIGINT
SELECT @idVal = IDENT_CURRENT(N'[dbo].[ProducersXWasteType]')
IF @idVal IS NOT NULL
    DBCC CHECKIDENT(N'[dbo].[RG_Recovery_2_ProducersXWasteType]', RESEED, @idVal)
GO
DROP TABLE [dbo].[ProducersXWasteType]
GO
EXEC sp_rename N'[dbo].[RG_Recovery_2_ProducersXWasteType]', N'ProducersXWasteType', N'OBJECT'
GO
PRINT N'Creating primary key [PK_ProducersXWasteType] on [dbo].[ProducersXWasteType]'
GO
ALTER TABLE [dbo].[ProducersXWasteType] ADD CONSTRAINT [PK_ProducersXWasteType] PRIMARY KEY CLUSTERED ([producersxwastetypeid])
GO
PRINT N'Creating [dbo].[Translations]'
GO
CREATE TABLE [dbo].[Translations]
(
[translationid] [int] NOT NULL IDENTITY(1, 1),
[srcLanguage] [int] NOT NULL,
[tgtLanguage] [int] NOT NULL,
[srcText] [nchar] (100) NOT NULL,
[tgtText] [nchar] (100) NOT NULL
)
GO
PRINT N'Creating primary key [PK_Translations] on [dbo].[Translations]'
GO
ALTER TABLE [dbo].[Translations] ADD CONSTRAINT [PK_Translations] PRIMARY KEY CLUSTERED ([translationid])
GO
PRINT N'Rebuilding [dbo].[WasteTypeXProcess]'
GO
CREATE TABLE [dbo].[RG_Recovery_3_WasteTypeXProcess]
(
[wastetypexprocessid] [int] NOT NULL IDENTITY(1, 1),
[processid] [int] NOT NULL,
[wastetypeid] [int] NOT NULL,
[enabled] [binary] (1) NOT NULL
)
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_3_WasteTypeXProcess] ON
GO
INSERT INTO [dbo].[RG_Recovery_3_WasteTypeXProcess]([wastetypexprocessid], [processid], [wastetypeid]) SELECT [wastetypexprocessid], [processid], [wastetypeid] FROM [dbo].[WasteTypeXProcess]
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_3_WasteTypeXProcess] OFF
GO
DECLARE @idVal BIGINT
SELECT @idVal = IDENT_CURRENT(N'[dbo].[WasteTypeXProcess]')
IF @idVal IS NOT NULL
    DBCC CHECKIDENT(N'[dbo].[RG_Recovery_3_WasteTypeXProcess]', RESEED, @idVal)
GO
DROP TABLE [dbo].[WasteTypeXProcess]
GO
EXEC sp_rename N'[dbo].[RG_Recovery_3_WasteTypeXProcess]', N'WasteTypeXProcess', N'OBJECT'
GO
PRINT N'Creating primary key [PK_WasteTypeXProcess] on [dbo].[WasteTypeXProcess]'
GO
ALTER TABLE [dbo].[WasteTypeXProcess] ADD CONSTRAINT [PK_WasteTypeXProcess] PRIMARY KEY CLUSTERED ([wastetypexprocessid])
GO
PRINT N'Adding foreign keys to [dbo].[Offices]'
GO
ALTER TABLE [dbo].[Offices] ADD CONSTRAINT [FK_Offices_Addresses] FOREIGN KEY ([addressid]) REFERENCES [dbo].[Addresses] ([addressid])
GO
ALTER TABLE [dbo].[Offices] ADD CONSTRAINT [FK_Offices_Producers] FOREIGN KEY ([producerid]) REFERENCES [dbo].[Producers] ([producerid])
GO
ALTER TABLE [dbo].[Offices] ADD CONSTRAINT [FK_Offices_Collectors] FOREIGN KEY ([collectorid]) REFERENCES [dbo].[Collectors] ([collectorid])
GO
ALTER TABLE [dbo].[Offices] ADD CONSTRAINT [FK_Offices_Entities] FOREIGN KEY ([entityid]) REFERENCES [dbo].[Entities] ([entityid])
GO
PRINT N'Adding foreign keys to [dbo].[Addresses]'
GO
ALTER TABLE [dbo].[Addresses] ADD CONSTRAINT [FK_Addresses_Country] FOREIGN KEY ([countryid]) REFERENCES [dbo].[Country] ([countryid])
GO
ALTER TABLE [dbo].[Addresses] ADD CONSTRAINT [FK_Addresses_States] FOREIGN KEY ([stateid]) REFERENCES [dbo].[States] ([stateid])
GO
PRINT N'Adding foreign keys to [dbo].[ContactXOffice]'
GO
ALTER TABLE [dbo].[ContactXOffice] ADD CONSTRAINT [FK_ContactXOffice_ContactValues] FOREIGN KEY ([contactvalueid]) REFERENCES [dbo].[ContactValues] ([contactvalueid])
GO
ALTER TABLE [dbo].[ContactXOffice] ADD CONSTRAINT [FK_ContactXOffice_Offices] FOREIGN KEY ([officeid]) REFERENCES [dbo].[Offices] ([officeid])
GO
PRINT N'Adding foreign keys to [dbo].[ContractActors]'
GO
ALTER TABLE [dbo].[ContractActors] ADD CONSTRAINT [FK_ContractActors_Collectors] FOREIGN KEY ([collectorid]) REFERENCES [dbo].[Collectors] ([collectorid])
GO
ALTER TABLE [dbo].[ContractActors] ADD CONSTRAINT [FK_ContractActors_Contracts] FOREIGN KEY ([contractid]) REFERENCES [dbo].[Contracts] ([contractid])
GO
ALTER TABLE [dbo].[ContractActors] ADD CONSTRAINT [FK_ContractActors_Entities] FOREIGN KEY ([entityid]) REFERENCES [dbo].[Entities] ([entityid])
GO
ALTER TABLE [dbo].[ContractActors] ADD CONSTRAINT [FK_ContractActors_Offices] FOREIGN KEY ([officeid]) REFERENCES [dbo].[Offices] ([officeid])
GO
ALTER TABLE [dbo].[ContractActors] ADD CONSTRAINT [FK_ContractActors_Producers] FOREIGN KEY ([producerid]) REFERENCES [dbo].[Producers] ([producerid])
GO
PRINT N'Adding foreign keys to [dbo].[ProducersXWasteType]'
GO
ALTER TABLE [dbo].[ProducersXWasteType] ADD CONSTRAINT [FK_ProducersXWasteType_Offices] FOREIGN KEY ([officeid]) REFERENCES [dbo].[Offices] ([officeid])
GO
ALTER TABLE [dbo].[ProducersXWasteType] ADD CONSTRAINT [FK_ProducersXWasteType_Producers] FOREIGN KEY ([producerid]) REFERENCES [dbo].[Producers] ([producerid])
GO
ALTER TABLE [dbo].[ProducersXWasteType] ADD CONSTRAINT [FK_ProducersXWasteType_WasteTypes] FOREIGN KEY ([wastetypeid]) REFERENCES [dbo].[WasteTypes] ([wastetypeid])
GO
PRINT N'Adding foreign keys to [dbo].[Translations]'
GO
ALTER TABLE [dbo].[Translations] ADD CONSTRAINT [FK_Translations_Languages] FOREIGN KEY ([srcLanguage]) REFERENCES [dbo].[Languages] ([languageid])
GO
ALTER TABLE [dbo].[Translations] ADD CONSTRAINT [FK_Translations_Languages1] FOREIGN KEY ([tgtLanguage]) REFERENCES [dbo].[Languages] ([languageid])
GO
PRINT N'Adding foreign keys to [dbo].[WasteTypeXProcess]'
GO
ALTER TABLE [dbo].[WasteTypeXProcess] ADD CONSTRAINT [FK_WasteTypeXProcess_Processes] FOREIGN KEY ([processid]) REFERENCES [dbo].[Processes] ([processid])
GO
ALTER TABLE [dbo].[WasteTypeXProcess] ADD CONSTRAINT [FK_WasteTypeXProcess_WasteTypes] FOREIGN KEY ([wastetypeid]) REFERENCES [dbo].[WasteTypes] ([wastetypeid])
GO

