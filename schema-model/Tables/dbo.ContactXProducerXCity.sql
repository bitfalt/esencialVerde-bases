CREATE TABLE [dbo].[ContactXProducerXCity]
(
[contactxproducerxcityid] [int] NOT NULL IDENTITY(1, 1),
[contactvalueid] [int] NOT NULL,
[producerxcityid] [int] NOT NULL
)
GO
ALTER TABLE [dbo].[ContactXProducerXCity] ADD CONSTRAINT [PK_ContactXProducerXCity] PRIMARY KEY CLUSTERED ([contactxproducerxcityid])
GO
ALTER TABLE [dbo].[ContactXProducerXCity] ADD CONSTRAINT [FK_ContactXProducerXCity_ContactValues] FOREIGN KEY ([contactvalueid]) REFERENCES [dbo].[ContactValues] ([contactvalueid])
GO
ALTER TABLE [dbo].[ContactXProducerXCity] ADD CONSTRAINT [FK_ContactXProducerXCity_ProducersXCity] FOREIGN KEY ([producerxcityid]) REFERENCES [dbo].[ProducersXCity] ([producerxcityid])
GO
