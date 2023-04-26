CREATE TABLE [dbo].[Currency]
(
[currencyid] [int] NOT NULL IDENTITY(1, 1),
[name] [nchar] (20) NOT NULL,
[symbol] [nchar] (10) NOT NULL,
[default] [int] NOT NULL,
[acronym] [nchar] (5) NOT NULL
)
GO
ALTER TABLE [dbo].[Currency] ADD CONSTRAINT [PK_Currency] PRIMARY KEY CLUSTERED ([currencyid])
GO
