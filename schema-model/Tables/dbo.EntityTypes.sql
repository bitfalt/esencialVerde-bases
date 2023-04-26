CREATE TABLE [dbo].[EntityTypes]
(
[entitytypeid] [int] NOT NULL IDENTITY(1, 1),
[name] [nchar] (20) NOT NULL
)
GO
ALTER TABLE [dbo].[EntityTypes] ADD CONSTRAINT [PK_EntityTypes] PRIMARY KEY CLUSTERED ([entitytypeid])
GO
