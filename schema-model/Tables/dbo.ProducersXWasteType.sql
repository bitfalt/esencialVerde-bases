CREATE TABLE [dbo].[ProducersXWasteType]
(
[producersxwastetypeid] [int] NOT NULL IDENTITY(1, 1),
[producerxcountryid] [int] NULL,
[producerxstateid] [int] NULL,
[producerxcityid] [int] NULL,
[wastetypeid] [int] NOT NULL
)
GO
ALTER TABLE [dbo].[ProducersXWasteType] ADD CONSTRAINT [PK_ProducersXWasteType] PRIMARY KEY CLUSTERED ([producersxwastetypeid])
GO
ALTER TABLE [dbo].[ProducersXWasteType] ADD CONSTRAINT [FK_ProducersXWasteType_ProducersXCity] FOREIGN KEY ([producerxcityid]) REFERENCES [dbo].[ProducersXCity] ([producerxcityid])
GO
ALTER TABLE [dbo].[ProducersXWasteType] ADD CONSTRAINT [FK_ProducersXWasteType_ProducersXCountry] FOREIGN KEY ([producerxcountryid]) REFERENCES [dbo].[ProducersXCountry] ([producerxcountryid])
GO
ALTER TABLE [dbo].[ProducersXWasteType] ADD CONSTRAINT [FK_ProducersXWasteType_ProducersXState] FOREIGN KEY ([producerxstateid]) REFERENCES [dbo].[ProducersXState] ([producerxstateid])
GO
ALTER TABLE [dbo].[ProducersXWasteType] ADD CONSTRAINT [FK_ProducersXWasteType_WasteTypes] FOREIGN KEY ([wastetypeid]) REFERENCES [dbo].[WasteTypes] ([wastetypeid])
GO
