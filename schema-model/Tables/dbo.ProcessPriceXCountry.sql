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
ALTER TABLE [dbo].[ProcessPriceXCountry] ADD CONSTRAINT [PK_ProcessPriceXCountry] PRIMARY KEY CLUSTERED ([processpricexcountryid])
GO
ALTER TABLE [dbo].[ProcessPriceXCountry] ADD CONSTRAINT [FK_ProcessPriceXCountry_Country] FOREIGN KEY ([countryid]) REFERENCES [dbo].[Country] ([countryid])
GO
ALTER TABLE [dbo].[ProcessPriceXCountry] ADD CONSTRAINT [FK_ProcessPriceXCountry_CurrencyExchange] FOREIGN KEY ([currencyexchangeid]) REFERENCES [dbo].[CurrencyExchange] ([currencyexchangeid])
GO
ALTER TABLE [dbo].[ProcessPriceXCountry] ADD CONSTRAINT [FK_ProcessPriceXCountry_Processes] FOREIGN KEY ([processid]) REFERENCES [dbo].[Processes] ([processid])
GO
ALTER TABLE [dbo].[ProcessPriceXCountry] ADD CONSTRAINT [FK_ProcessPriceXCountry_States] FOREIGN KEY ([stateid]) REFERENCES [dbo].[States] ([stateid])
GO
