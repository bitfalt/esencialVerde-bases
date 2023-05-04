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
ALTER TABLE [dbo].[Addresses] ADD CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED ([addressid])
GO
ALTER TABLE [dbo].[Addresses] ADD CONSTRAINT [FK_Addresses_Country] FOREIGN KEY ([countryid]) REFERENCES [dbo].[Country] ([countryid])
GO
ALTER TABLE [dbo].[Addresses] ADD CONSTRAINT [FK_Addresses_States] FOREIGN KEY ([stateid]) REFERENCES [dbo].[States] ([stateid])
GO
