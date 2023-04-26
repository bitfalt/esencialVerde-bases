CREATE TABLE [dbo].[Languages]
(
[languageid] [int] NOT NULL IDENTITY(1, 1),
[name] [nchar] (20) NOT NULL,
[abbreviation] [nchar] (10) NOT NULL
)
GO
ALTER TABLE [dbo].[Languages] ADD CONSTRAINT [PK_Languages] PRIMARY KEY CLUSTERED ([languageid])
GO
