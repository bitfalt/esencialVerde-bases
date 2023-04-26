CREATE TABLE [dbo].[Models]
(
[modelid] [int] NOT NULL IDENTITY(1, 1),
[name] [nchar] (20) NOT NULL,
[capacity] [decimal] (6, 2) NOT NULL,
[measure] [nchar] (10) NOT NULL
)
GO
ALTER TABLE [dbo].[Models] ADD CONSTRAINT [PK_Models] PRIMARY KEY CLUSTERED ([modelid])
GO
