CREATE TABLE [dbo].[ObjectTypes]
(
[objecttypeid] [int] NOT NULL IDENTITY(1, 1),
[name] [nchar] (20) NOT NULL
)
GO
ALTER TABLE [dbo].[ObjectTypes] ADD CONSTRAINT [PK_ObjectTypes] PRIMARY KEY CLUSTERED ([objecttypeid])
GO
