CREATE TABLE [dbo].[WasteTypeXProcess]
(
[wastetypexprocessid] [int] NOT NULL IDENTITY(1, 1),
[processid] [int] NOT NULL,
[wastetypeid] [int] NOT NULL,
[enabled] [binary] (1) NOT NULL CONSTRAINT [DF_WasteTypeXProcess_enabled] DEFAULT ((1))
)
GO
ALTER TABLE [dbo].[WasteTypeXProcess] ADD CONSTRAINT [PK_WasteTypeXProcess] PRIMARY KEY CLUSTERED ([wastetypexprocessid])
GO
ALTER TABLE [dbo].[WasteTypeXProcess] ADD CONSTRAINT [FK_WasteTypeXProcess_Processes] FOREIGN KEY ([processid]) REFERENCES [dbo].[Processes] ([processid])
GO
ALTER TABLE [dbo].[WasteTypeXProcess] ADD CONSTRAINT [FK_WasteTypeXProcess_WasteTypes] FOREIGN KEY ([wastetypeid]) REFERENCES [dbo].[WasteTypes] ([wastetypeid])
GO
