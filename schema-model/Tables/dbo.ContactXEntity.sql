CREATE TABLE [dbo].[ContactXEntity]
(
[contactxentityid] [int] NOT NULL IDENTITY(1, 1),
[entityid] [int] NOT NULL,
[contactvalueid] [int] NOT NULL
)
GO
ALTER TABLE [dbo].[ContactXEntity] ADD CONSTRAINT [PK_ContactXEntity] PRIMARY KEY CLUSTERED ([contactxentityid])
GO
ALTER TABLE [dbo].[ContactXEntity] ADD CONSTRAINT [FK_ContactXEntity_ContactValues] FOREIGN KEY ([contactvalueid]) REFERENCES [dbo].[ContactValues] ([contactvalueid])
GO
ALTER TABLE [dbo].[ContactXEntity] ADD CONSTRAINT [FK_ContactXEntity_Entities] FOREIGN KEY ([entityid]) REFERENCES [dbo].[Entities] ([entityid])
GO
