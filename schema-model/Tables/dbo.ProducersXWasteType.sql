CREATE TABLE [dbo].[ProducersXWasteType]
(
[producersxwastetypeid] [int] NOT NULL IDENTITY(1, 1),
[producerid] [int] NOT NULL,
[officeid] [int] NOT NULL,
[wastetypeid] [int] NOT NULL
)
GO
ALTER TABLE [dbo].[ProducersXWasteType] ADD CONSTRAINT [PK_ProducersXWasteType] PRIMARY KEY CLUSTERED ([producersxwastetypeid])
GO
ALTER TABLE [dbo].[ProducersXWasteType] ADD CONSTRAINT [FK_ProducersXWasteType_Offices] FOREIGN KEY ([officeid]) REFERENCES [dbo].[Offices] ([officeid])
GO
ALTER TABLE [dbo].[ProducersXWasteType] ADD CONSTRAINT [FK_ProducersXWasteType_Producers] FOREIGN KEY ([producerid]) REFERENCES [dbo].[Producers] ([producerid])
GO
ALTER TABLE [dbo].[ProducersXWasteType] ADD CONSTRAINT [FK_ProducersXWasteType_WasteTypes] FOREIGN KEY ([wastetypeid]) REFERENCES [dbo].[WasteTypes] ([wastetypeid])
GO
