CREATE TABLE [dbo].[CollectorsXState]
(
[collectorxstateid] [int] NOT NULL IDENTITY(1, 1),
[collectorid] [int] NOT NULL,
[stateid] [int] NOT NULL
)
GO
ALTER TABLE [dbo].[CollectorsXState] ADD CONSTRAINT [PK_CollectorsXState] PRIMARY KEY CLUSTERED ([collectorxstateid])
GO
ALTER TABLE [dbo].[CollectorsXState] ADD CONSTRAINT [FK_CollectorsXState_Collectors] FOREIGN KEY ([collectorid]) REFERENCES [dbo].[Collectors] ([collectorid])
GO
ALTER TABLE [dbo].[CollectorsXState] ADD CONSTRAINT [FK_CollectorsXState_States] FOREIGN KEY ([stateid]) REFERENCES [dbo].[States] ([stateid])
GO
