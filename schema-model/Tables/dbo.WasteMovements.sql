CREATE TABLE [dbo].[WasteMovements]
(
[wastemovementid] [int] NOT NULL IDENTITY(1, 1),
[containerid] [int] NOT NULL,
[wastetypeid] [int] NOT NULL,
[processid] [int] NOT NULL,
[wastetypexprocessid] [int] NOT NULL,
[movementdate] [date] NOT NULL,
[quantity] [decimal] (12, 2) NOT NULL
)
GO
ALTER TABLE [dbo].[WasteMovements] ADD CONSTRAINT [PK_WasteMovements] PRIMARY KEY CLUSTERED ([wastemovementid])
GO
ALTER TABLE [dbo].[WasteMovements] ADD CONSTRAINT [FK_WasteMovements_Containers] FOREIGN KEY ([containerid]) REFERENCES [dbo].[Containers] ([containerid])
GO
ALTER TABLE [dbo].[WasteMovements] ADD CONSTRAINT [FK_WasteMovements_Processes] FOREIGN KEY ([processid]) REFERENCES [dbo].[Processes] ([processid])
GO
ALTER TABLE [dbo].[WasteMovements] ADD CONSTRAINT [FK_WasteMovements_WasteTypes] FOREIGN KEY ([wastetypeid]) REFERENCES [dbo].[WasteTypes] ([wastetypeid])
GO
ALTER TABLE [dbo].[WasteMovements] ADD CONSTRAINT [FK_WasteMovements_WasteTypeXProcess] FOREIGN KEY ([wastetypexprocessid]) REFERENCES [dbo].[WasteTypeXProcess] ([wastetypexprocessid])
GO
