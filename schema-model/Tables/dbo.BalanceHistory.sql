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
ALTER TABLE [dbo].[BalanceHistory] ADD CONSTRAINT [PK_BalanceHistory] PRIMARY KEY CLUSTERED ([balancehistoryid])
GO
ALTER TABLE [dbo].[BalanceHistory] ADD CONSTRAINT [FK_BalanceHistory_EntityBalances] FOREIGN KEY ([entitybalanceid]) REFERENCES [dbo].[EntityBalances] ([entitybalanceid])
GO
ALTER TABLE [dbo].[BalanceHistory] ADD CONSTRAINT [FK_BalanceHistory_TransactionTypes] FOREIGN KEY ([transactiontype]) REFERENCES [dbo].[TransactionTypes] ([transactiontypeid])
GO
