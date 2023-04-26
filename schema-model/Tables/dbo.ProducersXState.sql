CREATE TABLE [dbo].[ProducersXState]
(
[producerxstateid] [int] NOT NULL IDENTITY(1, 1),
[producerid] [int] NOT NULL,
[stateid] [int] NOT NULL
)
GO
ALTER TABLE [dbo].[ProducersXState] ADD CONSTRAINT [PK_ProducersXState] PRIMARY KEY CLUSTERED ([producerxstateid])
GO
ALTER TABLE [dbo].[ProducersXState] ADD CONSTRAINT [FK_ProducersXState_Producers] FOREIGN KEY ([producerid]) REFERENCES [dbo].[Producers] ([producerid])
GO
ALTER TABLE [dbo].[ProducersXState] ADD CONSTRAINT [FK_ProducersXState_States] FOREIGN KEY ([stateid]) REFERENCES [dbo].[States] ([stateid])
GO
