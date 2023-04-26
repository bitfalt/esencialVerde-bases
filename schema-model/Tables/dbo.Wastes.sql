CREATE TABLE [dbo].[Wastes]
(
[wasteid] [int] NOT NULL IDENTITY(1, 1),
[name] [nchar] (20) NOT NULL,
[wastetypeid] [int] NOT NULL
)
GO
ALTER TABLE [dbo].[Wastes] ADD CONSTRAINT [PK_Wastes] PRIMARY KEY CLUSTERED ([wasteid])
GO
ALTER TABLE [dbo].[Wastes] ADD CONSTRAINT [FK_Wastes_WasteTypes] FOREIGN KEY ([wastetypeid]) REFERENCES [dbo].[WasteTypes] ([wastetypeid])
GO
