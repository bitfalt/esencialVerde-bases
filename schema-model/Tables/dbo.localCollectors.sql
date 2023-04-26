CREATE TABLE [dbo].[localCollectors]
(
[localCollectorid] [int] NOT NULL IDENTITY(1, 1),
[name] [nchar] (30) NOT NULL
)
GO
ALTER TABLE [dbo].[localCollectors] ADD CONSTRAINT [PK_localCollectors] PRIMARY KEY CLUSTERED ([localCollectorid])
GO
