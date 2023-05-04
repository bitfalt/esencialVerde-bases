SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
PRINT N'Dropping foreign keys from [dbo].[BalanceHistory]'
GO
ALTER TABLE [dbo].[BalanceHistory] DROP CONSTRAINT [FK_BalanceHistory_EntityBalances]
GO
ALTER TABLE [dbo].[BalanceHistory] DROP CONSTRAINT [FK_BalanceHistory_TransactionTypes]
GO
PRINT N'Dropping foreign keys from [dbo].[ContractLog]'
GO
ALTER TABLE [dbo].[ContractLog] DROP CONSTRAINT [FK_ContractLog_Contracts]
GO
ALTER TABLE [dbo].[ContractLog] DROP CONSTRAINT [FK_ContractLog_ContractTerms]
GO
PRINT N'Dropping foreign keys from [dbo].[EntityBalances]'
GO
ALTER TABLE [dbo].[EntityBalances] DROP CONSTRAINT [FK_EntityBalances_Producers]
GO
ALTER TABLE [dbo].[EntityBalances] DROP CONSTRAINT [FK_EntityBalances_Collectors]
GO
ALTER TABLE [dbo].[EntityBalances] DROP CONSTRAINT [FK_EntityBalances_Entities]
GO
ALTER TABLE [dbo].[EntityBalances] DROP CONSTRAINT [FK_EntityBalances_Currency]
GO
PRINT N'Dropping foreign keys from [dbo].[Invoices]'
GO
ALTER TABLE [dbo].[Invoices] DROP CONSTRAINT [FK_Sales_Entities]
GO
ALTER TABLE [dbo].[Invoices] DROP CONSTRAINT [FK_Sales_Products]
GO
ALTER TABLE [dbo].[Invoices] DROP CONSTRAINT [FK_Sales_Entities_Seller]
GO
ALTER TABLE [dbo].[Invoices] DROP CONSTRAINT [FK_Invoices_Currency]
GO
ALTER TABLE [dbo].[Invoices] DROP CONSTRAINT [FK_Sales_PaymentTypes]
GO
PRINT N'Dropping foreign keys from [dbo].[PaymentHistory]'
GO
ALTER TABLE [dbo].[PaymentHistory] DROP CONSTRAINT [FK_PaymentHistory_ContractActors]
GO
ALTER TABLE [dbo].[PaymentHistory] DROP CONSTRAINT [FK_PaymentHistory_Currency]
GO
PRINT N'Dropping constraints from [dbo].[BalanceHistory]'
GO
ALTER TABLE [dbo].[BalanceHistory] DROP CONSTRAINT [PK_BalanceHistory]
GO
PRINT N'Dropping constraints from [dbo].[ContractLog]'
GO
ALTER TABLE [dbo].[ContractLog] DROP CONSTRAINT [PK_ContractLog]
GO
PRINT N'Dropping constraints from [dbo].[EntityBalances]'
GO
ALTER TABLE [dbo].[EntityBalances] DROP CONSTRAINT [PK_EntityBalances]
GO
PRINT N'Dropping constraints from [dbo].[Invoices]'
GO
ALTER TABLE [dbo].[Invoices] DROP CONSTRAINT [PK_Sales]
GO
PRINT N'Dropping constraints from [dbo].[PaymentHistory]'
GO
ALTER TABLE [dbo].[PaymentHistory] DROP CONSTRAINT [PK_PaymentHistory]
GO
PRINT N'Dropping constraints from [dbo].[TransactionTypes]'
GO
ALTER TABLE [dbo].[TransactionTypes] DROP CONSTRAINT [PK_TransactionTypes]
GO
PRINT N'Dropping constraints from [dbo].[ContractLog]'
GO
ALTER TABLE [dbo].[ContractLog] DROP CONSTRAINT [DF_ContractLog_posttime]
GO
PRINT N'Dropping constraints from [dbo].[Invoices]'
GO
ALTER TABLE [dbo].[Invoices] DROP CONSTRAINT [DF_Sales_posttime]
GO
PRINT N'Dropping constraints from [dbo].[PaymentHistory]'
GO
ALTER TABLE [dbo].[PaymentHistory] DROP CONSTRAINT [DF_PaymentHistory_posttime]
GO
PRINT N'Dropping [dbo].[TransactionTypes]'
GO
DROP TABLE [dbo].[TransactionTypes]
GO
PRINT N'Dropping [dbo].[BalanceHistory]'
GO
DROP TABLE [dbo].[BalanceHistory]
GO
PRINT N'Dropping [dbo].[EntityBalances]'
GO
DROP TABLE [dbo].[EntityBalances]
GO
PRINT N'Dropping [dbo].[PaymentHistory]'
GO
DROP TABLE [dbo].[PaymentHistory]
GO
PRINT N'Dropping [dbo].[Invoices]'
GO
DROP TABLE [dbo].[Invoices]
GO
PRINT N'Dropping [dbo].[ContractLog]'
GO
DROP TABLE [dbo].[ContractLog]
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
PRINT N'Adding foreign keys to [dbo].[Sales]'
GO
ALTER TABLE [dbo].[Sales] ADD CONSTRAINT [FK_Sales_Entities] FOREIGN KEY ([cliententityid]) REFERENCES [dbo].[Entities] ([entityid])
GO
ALTER TABLE [dbo].[Sales] ADD CONSTRAINT [FK_Sales_Products] FOREIGN KEY ([productid]) REFERENCES [dbo].[Products] ([productid])
GO
ALTER TABLE [dbo].[Sales] ADD CONSTRAINT [FK_Sales_Entities_Seller] FOREIGN KEY ([sellerentityid]) REFERENCES [dbo].[Entities] ([entityid])
GO
ALTER TABLE [dbo].[Sales] ADD CONSTRAINT [FK_Sales_PaymentTypes] FOREIGN KEY ([paymenttypeid]) REFERENCES [dbo].[PaymentTypes] ([paymenttypeid])
GO

