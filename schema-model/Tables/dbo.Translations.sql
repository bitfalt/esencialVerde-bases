CREATE TABLE [dbo].[Translations]
(
[translationid] [int] NOT NULL IDENTITY(1, 1),
[srcLanguage] [int] NOT NULL,
[tgtLanguage] [int] NOT NULL,
[srcText] [nchar] (100) NOT NULL,
[tgtText] [nchar] (100) NOT NULL
)
GO
ALTER TABLE [dbo].[Translations] ADD CONSTRAINT [PK_Translations] PRIMARY KEY CLUSTERED ([translationid])
GO
ALTER TABLE [dbo].[Translations] ADD CONSTRAINT [FK_Translations_Languages] FOREIGN KEY ([srcLanguage]) REFERENCES [dbo].[Languages] ([languageid])
GO
ALTER TABLE [dbo].[Translations] ADD CONSTRAINT [FK_Translations_Languages1] FOREIGN KEY ([tgtLanguage]) REFERENCES [dbo].[Languages] ([languageid])
GO
