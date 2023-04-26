CREATE TABLE [dbo].[Collectors]
(
[collectorid] [int] NOT NULL IDENTITY(1, 1),
[name] [nchar] (30) NOT NULL
)
GO
ALTER TABLE [dbo].[Collectors] ADD CONSTRAINT [PK_Collectors] PRIMARY KEY CLUSTERED ([collectorid])
GO
