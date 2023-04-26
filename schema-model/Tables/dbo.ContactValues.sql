CREATE TABLE [dbo].[ContactValues]
(
[contactvalueid] [int] NOT NULL IDENTITY(1, 1),
[value] [nchar] (30) NOT NULL,
[posttime] [datetime] NOT NULL CONSTRAINT [DF_ContactValues_posttime] DEFAULT (getdate()),
[enabled] [binary] (1) NOT NULL,
[contacttypeid] [int] NOT NULL
)
GO
ALTER TABLE [dbo].[ContactValues] ADD CONSTRAINT [PK_ContactValues] PRIMARY KEY CLUSTERED ([contactvalueid])
GO
ALTER TABLE [dbo].[ContactValues] ADD CONSTRAINT [FK_ContactValues_ContactTypes] FOREIGN KEY ([contacttypeid]) REFERENCES [dbo].[ContactTypes] ([contacttypeid])
GO
