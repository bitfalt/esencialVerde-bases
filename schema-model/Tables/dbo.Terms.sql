CREATE TABLE [dbo].[Terms]
(
[termid] [int] NOT NULL IDENTITY(1, 1),
[name] [nchar] (20) NOT NULL,
[description] [nchar] (50) NOT NULL
)
GO
ALTER TABLE [dbo].[Terms] ADD CONSTRAINT [PK_Terms] PRIMARY KEY CLUSTERED ([termid])
GO
