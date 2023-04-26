CREATE TABLE [dbo].[Containers]
(
[containerid] [smallint] NOT NULL IDENTITY(1, 1),
[name] [nchar] (20) NOT NULL,
[description] [nchar] (80) NOT NULL,
[capacity] [decimal] (6, 2) NOT NULL,
[measure] [nchar] (10) NOT NULL,
[brandid] [int] NOT NULL,
[modelid] [int] NOT NULL
)
GO
ALTER TABLE [dbo].[Containers] ADD CONSTRAINT [PK_Containers] PRIMARY KEY CLUSTERED ([containerid])
GO
ALTER TABLE [dbo].[Containers] ADD CONSTRAINT [FK_Containers_Brands] FOREIGN KEY ([brandid]) REFERENCES [dbo].[Brands] ([brandid])
GO
ALTER TABLE [dbo].[Containers] ADD CONSTRAINT [FK_Containers_Models] FOREIGN KEY ([modelid]) REFERENCES [dbo].[Models] ([modelid])
GO
