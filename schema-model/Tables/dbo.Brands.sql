CREATE TABLE [dbo].[Brands]
(
[brandid] [int] NOT NULL IDENTITY(1, 1),
[name] [nchar] (20) NOT NULL
)
GO
ALTER TABLE [dbo].[Brands] ADD CONSTRAINT [PK_Brands] PRIMARY KEY CLUSTERED ([brandid])
GO
