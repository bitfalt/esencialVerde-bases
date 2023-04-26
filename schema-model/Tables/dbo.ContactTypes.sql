CREATE TABLE [dbo].[ContactTypes]
(
[contacttypeid] [int] NOT NULL IDENTITY(1, 1),
[name] [nchar] (20) NOT NULL
)
GO
ALTER TABLE [dbo].[ContactTypes] ADD CONSTRAINT [PK_ContactTypes] PRIMARY KEY CLUSTERED ([contacttypeid])
GO
