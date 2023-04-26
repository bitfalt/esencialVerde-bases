CREATE TABLE [dbo].[ContainerXWaste]
(
[contxwasteid] [int] NOT NULL IDENTITY(1, 1),
[wastetypeid] [int] NOT NULL,
[containerid] [smallint] NOT NULL
)
GO
ALTER TABLE [dbo].[ContainerXWaste] ADD CONSTRAINT [PK_ContainerXWaste] PRIMARY KEY CLUSTERED ([contxwasteid])
GO
ALTER TABLE [dbo].[ContainerXWaste] ADD CONSTRAINT [FK_ContainerXWaste_Containers] FOREIGN KEY ([containerid]) REFERENCES [dbo].[Containers] ([containerid])
GO
ALTER TABLE [dbo].[ContainerXWaste] ADD CONSTRAINT [FK_ContainerXWaste_WasteTypes] FOREIGN KEY ([wastetypeid]) REFERENCES [dbo].[WasteTypes] ([wastetypeid])
GO
