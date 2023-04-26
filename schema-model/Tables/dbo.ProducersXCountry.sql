CREATE TABLE [dbo].[ProducersXCountry]
(
[producerxcountryid] [int] NOT NULL IDENTITY(1, 1),
[producerid] [int] NOT NULL,
[countryid] [int] NOT NULL
)
GO
ALTER TABLE [dbo].[ProducersXCountry] ADD CONSTRAINT [PK_ProducersXCountry] PRIMARY KEY CLUSTERED ([producerxcountryid])
GO
ALTER TABLE [dbo].[ProducersXCountry] ADD CONSTRAINT [FK_ProducersXCountry_Country] FOREIGN KEY ([countryid]) REFERENCES [dbo].[Country] ([countryid])
GO
ALTER TABLE [dbo].[ProducersXCountry] ADD CONSTRAINT [FK_ProducersXCountry_Producers] FOREIGN KEY ([producerid]) REFERENCES [dbo].[Producers] ([producerid])
GO
