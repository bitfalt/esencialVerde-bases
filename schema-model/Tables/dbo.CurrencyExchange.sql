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
ALTER TABLE [dbo].[CurrencyExchange] ADD CONSTRAINT [PK_CurrencyExchange] PRIMARY KEY CLUSTERED ([currencyexchangeid])
GO
ALTER TABLE [dbo].[CurrencyExchange] ADD CONSTRAINT [FK_CurrencyExchange_Currency] FOREIGN KEY ([currencyid]) REFERENCES [dbo].[Currency] ([currencyid])
GO
