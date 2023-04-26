CREATE TABLE [dbo].[ProducersXCity]
(
[producerxcityid] [int] NOT NULL IDENTITY(1, 1),
[producerid] [int] NOT NULL,
[cityid] [int] NOT NULL
)
GO
ALTER TABLE [dbo].[ProducersXCity] ADD CONSTRAINT [PK_ProducersXCity] PRIMARY KEY CLUSTERED ([producerxcityid])
GO
ALTER TABLE [dbo].[ProducersXCity] ADD CONSTRAINT [FK_ProducersXCity_Cities] FOREIGN KEY ([cityid]) REFERENCES [dbo].[Cities] ([cityid])
GO
ALTER TABLE [dbo].[ProducersXCity] ADD CONSTRAINT [FK_ProducersXCity_Producers] FOREIGN KEY ([producerid]) REFERENCES [dbo].[Producers] ([producerid])
GO
