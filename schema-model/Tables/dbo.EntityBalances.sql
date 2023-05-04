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
ALTER TABLE [dbo].[EntityBalances] ADD CONSTRAINT [PK_EntityBalances] PRIMARY KEY CLUSTERED ([entitybalanceid])
GO
ALTER TABLE [dbo].[EntityBalances] ADD CONSTRAINT [FK_EntityBalances_Collectors] FOREIGN KEY ([collectorid]) REFERENCES [dbo].[Collectors] ([collectorid])
GO
ALTER TABLE [dbo].[EntityBalances] ADD CONSTRAINT [FK_EntityBalances_Currency] FOREIGN KEY ([currencyid]) REFERENCES [dbo].[Currency] ([currencyid])
GO
ALTER TABLE [dbo].[EntityBalances] ADD CONSTRAINT [FK_EntityBalances_Entities] FOREIGN KEY ([entityid]) REFERENCES [dbo].[Entities] ([entityid])
GO
ALTER TABLE [dbo].[EntityBalances] ADD CONSTRAINT [FK_EntityBalances_Producers] FOREIGN KEY ([producerid]) REFERENCES [dbo].[Producers] ([producerid])
GO
