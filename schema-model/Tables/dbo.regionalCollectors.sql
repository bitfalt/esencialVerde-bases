CREATE TABLE [dbo].[regionalCollectors]
(
[regionalCollectorid] [int] NOT NULL IDENTITY(1, 1),
[name] [nchar] (30) NOT NULL
)
GO
ALTER TABLE [dbo].[regionalCollectors] ADD CONSTRAINT [PK_regionalCollectors] PRIMARY KEY CLUSTERED ([regionalCollectorid])
GO
