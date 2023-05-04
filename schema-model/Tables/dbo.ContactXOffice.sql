CREATE TABLE [dbo].[ContactXOffice]
(
[contactxofficeid] [int] NOT NULL,
[contactvalueid] [int] NOT NULL,
[officeid] [int] NOT NULL
)
GO
ALTER TABLE [dbo].[ContactXOffice] ADD CONSTRAINT [PK_ContactXOffice] PRIMARY KEY CLUSTERED ([contactxofficeid])
GO
ALTER TABLE [dbo].[ContactXOffice] ADD CONSTRAINT [FK_ContactXOffice_ContactValues] FOREIGN KEY ([contactvalueid]) REFERENCES [dbo].[ContactValues] ([contactvalueid])
GO
ALTER TABLE [dbo].[ContactXOffice] ADD CONSTRAINT [FK_ContactXOffice_Offices] FOREIGN KEY ([officeid]) REFERENCES [dbo].[Offices] ([officeid])
GO
