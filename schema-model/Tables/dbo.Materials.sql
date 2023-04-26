CREATE TABLE [dbo].[Materials]
(
[materialid] [int] NOT NULL IDENTITY(1, 1),
[name] [nchar] (20) NOT NULL,
[wastetypeid] [int] NOT NULL
)
GO
ALTER TABLE [dbo].[Materials] ADD CONSTRAINT [PK_Materials] PRIMARY KEY CLUSTERED ([materialid])
GO
ALTER TABLE [dbo].[Materials] ADD CONSTRAINT [FK_Materials_WasteTypes] FOREIGN KEY ([wastetypeid]) REFERENCES [dbo].[WasteTypes] ([wastetypeid])
GO
