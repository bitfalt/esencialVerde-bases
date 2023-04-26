CREATE TABLE [dbo].[LanguageXCountry]
(
[languagexcountryid] [int] NOT NULL IDENTITY(1, 1),
[languageid] [int] NOT NULL,
[countryid] [int] NOT NULL
)
GO
ALTER TABLE [dbo].[LanguageXCountry] ADD CONSTRAINT [PK_LanguageXCountry] PRIMARY KEY CLUSTERED ([languagexcountryid])
GO
ALTER TABLE [dbo].[LanguageXCountry] ADD CONSTRAINT [FK_LanguageXCountry_Country] FOREIGN KEY ([countryid]) REFERENCES [dbo].[Country] ([countryid])
GO
ALTER TABLE [dbo].[LanguageXCountry] ADD CONSTRAINT [FK_LanguageXCountry_Languages] FOREIGN KEY ([languageid]) REFERENCES [dbo].[Languages] ([languageid])
GO
