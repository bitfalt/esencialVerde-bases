CREATE TABLE [dbo].[Entities]
(
[entityid] [int] NOT NULL IDENTITY(1, 1),
[entitytypeid] [int] NOT NULL,
[name] [nchar] (30) NOT NULL
)
GO
ALTER TABLE [dbo].[Entities] ADD CONSTRAINT [PK_Entities] PRIMARY KEY CLUSTERED ([entityid])
GO
ALTER TABLE [dbo].[Entities] ADD CONSTRAINT [FK_Entities_EntityTypes] FOREIGN KEY ([entitytypeid]) REFERENCES [dbo].[EntityTypes] ([entitytypeid])
GO
