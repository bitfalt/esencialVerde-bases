SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
PRINT N'Dropping foreign keys from [dbo].[Sales]'
GO
ALTER TABLE [dbo].[Sales] DROP CONSTRAINT [FK_Sales_Entities]
GO
ALTER TABLE [dbo].[Sales] DROP CONSTRAINT [FK_Sales_Products]
GO
ALTER TABLE [dbo].[Sales] DROP CONSTRAINT [FK_Sales_Entities_Seller]
GO
ALTER TABLE [dbo].[Sales] DROP CONSTRAINT [FK_Sales_PaymentTypes]
GO
PRINT N'Dropping foreign keys from [dbo].[ContainerStatus]'
GO
ALTER TABLE [dbo].[ContainerStatus] DROP CONSTRAINT [FK_ContainerStatus_Status]
GO
PRINT N'Dropping constraints from [dbo].[Sales]'
GO
ALTER TABLE [dbo].[Sales] DROP CONSTRAINT [PK_Sales]
GO
PRINT N'Dropping constraints from [dbo].[Status]'
GO
ALTER TABLE [dbo].[Status] DROP CONSTRAINT [PK_Status]
GO
PRINT N'Dropping constraints from [dbo].[Sales]'
GO
ALTER TABLE [dbo].[Sales] DROP CONSTRAINT [DF_Sales_posttime]
GO
PRINT N'Dropping [dbo].[Sales]'
GO
DROP TABLE [dbo].[Sales]
GO
PRINT N'Dropping [dbo].[Status]'
GO
DROP TABLE [dbo].[Status]
GO
PRINT N'Creating [dbo].[ContractLog]'
GO
CREATE TABLE [dbo].[ContractLog]
(
[contractlogid] [int] NOT NULL IDENTITY(1, 1),
[contractid] [int] NOT NULL,
[posttime] [datetime] NOT NULL CONSTRAINT [DF_ContractLog_posttime] DEFAULT (getdate()),
[computer] [nchar] (30) NOT NULL,
[username] [nchar] (30) NOT NULL,
[checksum] [varbinary] (150) NOT NULL,
[description] [nchar] (50) NOT NULL,
[contracttermid] [int] NOT NULL,
[value1] [nchar] (50) NOT NULL,
[value2] [nchar] (50) NOT NULL
)
GO
PRINT N'Creating primary key [PK_ContractLog] on [dbo].[ContractLog]'
GO
ALTER TABLE [dbo].[ContractLog] ADD CONSTRAINT [PK_ContractLog] PRIMARY KEY CLUSTERED ([contractlogid])
GO
PRINT N'Creating [dbo].[Invoices]'
GO
CREATE TABLE [dbo].[Invoices]
(
[invoiceid] [int] NOT NULL IDENTITY(1, 1),
[cliententityid] [int] NOT NULL,
[productid] [int] NOT NULL,
[quantity] [decimal] (12, 2) NOT NULL,
[sellerentityid] [int] NOT NULL,
[totalPrice] [decimal] (12, 2) NOT NULL,
[currencyid] [int] NOT NULL,
[posttime] [datetime] NOT NULL CONSTRAINT [DF_Sales_posttime] DEFAULT (getdate()),
[computer] [nchar] (30) NOT NULL,
[username] [nchar] (30) NOT NULL,
[checksum] [varbinary] (150) NOT NULL,
[paymenttypeid] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_Sales] on [dbo].[Invoices]'
GO
ALTER TABLE [dbo].[Invoices] ADD CONSTRAINT [PK_Sales] PRIMARY KEY CLUSTERED ([invoiceid])
GO
PRINT N'Creating [dbo].[PaymentHistory]'
GO
CREATE TABLE [dbo].[PaymentHistory]
(
[paymenthistoryid] [int] NOT NULL IDENTITY(1, 1),
[producerid] [int] NULL,
[collectorid] [int] NULL,
[entityid] [int] NULL,
[paymentdate] [date] NOT NULL,
[amount] [decimal] (12, 2) NOT NULL,
[percentageid] [int] NOT NULL,
[currencyid] [int] NOT NULL,
[posttime] [datetime] NOT NULL CONSTRAINT [DF_PaymentHistory_posttime] DEFAULT (getdate()),
[computer] [nchar] (30) NOT NULL,
[username] [nchar] (30) NOT NULL,
[checksum] [varbinary] (150) NOT NULL
)
GO
PRINT N'Creating primary key [PK_PaymentHistory] on [dbo].[PaymentHistory]'
GO
ALTER TABLE [dbo].[PaymentHistory] ADD CONSTRAINT [PK_PaymentHistory] PRIMARY KEY CLUSTERED ([paymenthistoryid])
GO
PRINT N'Creating [dbo].[EntityBalances]'
GO
CREATE TABLE [dbo].[EntityBalances]
(
[entitybalanceid] [int] NOT NULL IDENTITY(1, 1),
[producerid] [int] NULL,
[collectorid] [int] NULL,
[entityid] [int] NULL,
[balance] [decimal] (12, 2) NOT NULL,
[currencyid] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_EntityBalances] on [dbo].[EntityBalances]'
GO
ALTER TABLE [dbo].[EntityBalances] ADD CONSTRAINT [PK_EntityBalances] PRIMARY KEY CLUSTERED ([entitybalanceid])
GO
PRINT N'Creating [dbo].[BalanceHistory]'
GO
CREATE TABLE [dbo].[BalanceHistory]
(
[balancehistoryid] [int] NOT NULL IDENTITY(1, 1),
[entitybalanceid] [int] NOT NULL,
[transactiontype] [int] NOT NULL,
[date] [date] NOT NULL,
[amount] [decimal] (12, 2) NOT NULL,
[balance] [decimal] (12, 2) NOT NULL
)
GO
PRINT N'Creating primary key [PK_BalanceHistory] on [dbo].[BalanceHistory]'
GO
ALTER TABLE [dbo].[BalanceHistory] ADD CONSTRAINT [PK_BalanceHistory] PRIMARY KEY CLUSTERED ([balancehistoryid])
GO
PRINT N'Creating [dbo].[TransactionTypes]'
GO
CREATE TABLE [dbo].[TransactionTypes]
(
[transactiontypeid] [int] NOT NULL IDENTITY(1, 1),
[name] [nchar] (20) NOT NULL
)
GO
PRINT N'Creating primary key [PK_TransactionTypes] on [dbo].[TransactionTypes]'
GO
ALTER TABLE [dbo].[TransactionTypes] ADD CONSTRAINT [PK_TransactionTypes] PRIMARY KEY CLUSTERED ([transactiontypeid])
GO
PRINT N'Adding foreign keys to [dbo].[BalanceHistory]'
GO
ALTER TABLE [dbo].[BalanceHistory] ADD CONSTRAINT [FK_BalanceHistory_EntityBalances] FOREIGN KEY ([entitybalanceid]) REFERENCES [dbo].[EntityBalances] ([entitybalanceid])
GO
ALTER TABLE [dbo].[BalanceHistory] ADD CONSTRAINT [FK_BalanceHistory_TransactionTypes] FOREIGN KEY ([transactiontype]) REFERENCES [dbo].[TransactionTypes] ([transactiontypeid])
GO
PRINT N'Adding foreign keys to [dbo].[ContractLog]'
GO
ALTER TABLE [dbo].[ContractLog] ADD CONSTRAINT [FK_ContractLog_Contracts] FOREIGN KEY ([contractid]) REFERENCES [dbo].[Contracts] ([contractid])
GO
ALTER TABLE [dbo].[ContractLog] ADD CONSTRAINT [FK_ContractLog_ContractTerms] FOREIGN KEY ([contracttermid]) REFERENCES [dbo].[ContractTerms] ([contracttermsid])
GO
PRINT N'Adding foreign keys to [dbo].[EntityBalances]'
GO
ALTER TABLE [dbo].[EntityBalances] ADD CONSTRAINT [FK_EntityBalances_Producers] FOREIGN KEY ([producerid]) REFERENCES [dbo].[Producers] ([producerid])
GO
ALTER TABLE [dbo].[EntityBalances] ADD CONSTRAINT [FK_EntityBalances_Collectors] FOREIGN KEY ([collectorid]) REFERENCES [dbo].[Collectors] ([collectorid])
GO
ALTER TABLE [dbo].[EntityBalances] ADD CONSTRAINT [FK_EntityBalances_Entities] FOREIGN KEY ([entityid]) REFERENCES [dbo].[Entities] ([entityid])
GO
ALTER TABLE [dbo].[EntityBalances] ADD CONSTRAINT [FK_EntityBalances_Currency] FOREIGN KEY ([currencyid]) REFERENCES [dbo].[Currency] ([currencyid])
GO
PRINT N'Adding foreign keys to [dbo].[Invoices]'
GO
ALTER TABLE [dbo].[Invoices] ADD CONSTRAINT [FK_Sales_Entities] FOREIGN KEY ([cliententityid]) REFERENCES [dbo].[Entities] ([entityid])
GO
ALTER TABLE [dbo].[Invoices] ADD CONSTRAINT [FK_Sales_Products] FOREIGN KEY ([productid]) REFERENCES [dbo].[Products] ([productid])
GO
ALTER TABLE [dbo].[Invoices] ADD CONSTRAINT [FK_Sales_Entities_Seller] FOREIGN KEY ([sellerentityid]) REFERENCES [dbo].[Entities] ([entityid])
GO
ALTER TABLE [dbo].[Invoices] ADD CONSTRAINT [FK_Invoices_Currency] FOREIGN KEY ([currencyid]) REFERENCES [dbo].[Currency] ([currencyid])
GO
ALTER TABLE [dbo].[Invoices] ADD CONSTRAINT [FK_Sales_PaymentTypes] FOREIGN KEY ([paymenttypeid]) REFERENCES [dbo].[PaymentTypes] ([paymenttypeid])
GO
PRINT N'Adding foreign keys to [dbo].[PaymentHistory]'
GO
ALTER TABLE [dbo].[PaymentHistory] ADD CONSTRAINT [FK_PaymentHistory_ContractActors] FOREIGN KEY ([percentageid]) REFERENCES [dbo].[ContractActors] ([contractactorsid])
GO
ALTER TABLE [dbo].[PaymentHistory] ADD CONSTRAINT [FK_PaymentHistory_Currency] FOREIGN KEY ([currencyid]) REFERENCES [dbo].[Currency] ([currencyid])
GO

