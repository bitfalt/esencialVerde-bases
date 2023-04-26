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
ALTER TABLE [dbo].[CurrencyTransactions] ADD CONSTRAINT [PK_CurrencyTransactions] PRIMARY KEY CLUSTERED ([currencytransactionid])
GO
ALTER TABLE [dbo].[CurrencyTransactions] ADD CONSTRAINT [FK_CurrencyTransactions_Currency] FOREIGN KEY ([currencyid]) REFERENCES [dbo].[Currency] ([currencyid])
GO
ALTER TABLE [dbo].[CurrencyTransactions] ADD CONSTRAINT [FK_CurrencyTransactions_CurrencyExchange] FOREIGN KEY ([currencyexchangeid]) REFERENCES [dbo].[CurrencyExchange] ([currencyexchangeid])
GO
