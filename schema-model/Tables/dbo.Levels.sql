CREATE TABLE [dbo].[Levels]
(
[levelid] [int] NOT NULL IDENTITY(1, 1),
[description] [nchar] (20) NOT NULL
)
GO
ALTER TABLE [dbo].[Levels] ADD CONSTRAINT [PK_Levels] PRIMARY KEY CLUSTERED ([levelid])
GO
