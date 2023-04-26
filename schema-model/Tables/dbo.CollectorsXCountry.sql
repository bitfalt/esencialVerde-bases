CREATE TABLE [dbo].[CollectorsXCountry]
(
[collectorxcountryid] [int] NOT NULL IDENTITY(1, 1),
[collectorid] [int] NOT NULL,
[countryid] [int] NOT NULL
)
GO
ALTER TABLE [dbo].[CollectorsXCountry] ADD CONSTRAINT [PK_CollectorsXCountry] PRIMARY KEY CLUSTERED ([collectorxcountryid])
GO
ALTER TABLE [dbo].[CollectorsXCountry] ADD CONSTRAINT [FK_CollectorsXCountry_Collectors] FOREIGN KEY ([collectorid]) REFERENCES [dbo].[Collectors] ([collectorid])
GO
ALTER TABLE [dbo].[CollectorsXCountry] ADD CONSTRAINT [FK_CollectorsXCountry_Country] FOREIGN KEY ([countryid]) REFERENCES [dbo].[Country] ([countryid])
GO
