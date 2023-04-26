CREATE TABLE [dbo].[States]
(
[stateid] [int] NOT NULL IDENTITY(1, 1),
[name] [nchar] (30) NOT NULL,
[countryid] [int] NOT NULL
)
GO
ALTER TABLE [dbo].[States] ADD CONSTRAINT [PK_States] PRIMARY KEY CLUSTERED ([stateid])
GO
ALTER TABLE [dbo].[States] ADD CONSTRAINT [FK_States_Country] FOREIGN KEY ([countryid]) REFERENCES [dbo].[Country] ([countryid])
GO
