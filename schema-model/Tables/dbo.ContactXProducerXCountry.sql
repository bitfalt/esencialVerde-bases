CREATE TABLE [dbo].[ContactXProducerXCountry]
(
[contactxproducerxcountryid] [int] NOT NULL IDENTITY(1, 1),
[contactvalueid] [int] NOT NULL,
[producerxcountryid] [int] NOT NULL
)
GO
ALTER TABLE [dbo].[ContactXProducerXCountry] ADD CONSTRAINT [PK_ContactXProducerXCountry] PRIMARY KEY CLUSTERED ([contactxproducerxcountryid])
GO
ALTER TABLE [dbo].[ContactXProducerXCountry] ADD CONSTRAINT [FK_ContactXProducerXCountry_ContactValues] FOREIGN KEY ([contactvalueid]) REFERENCES [dbo].[ContactValues] ([contactvalueid])
GO
ALTER TABLE [dbo].[ContactXProducerXCountry] ADD CONSTRAINT [FK_ContactXProducerXCountry_ProducersXCountry] FOREIGN KEY ([producerxcountryid]) REFERENCES [dbo].[ProducersXCountry] ([producerxcountryid])
GO
