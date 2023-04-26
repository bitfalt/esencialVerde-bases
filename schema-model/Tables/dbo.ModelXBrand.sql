CREATE TABLE [dbo].[ModelXBrand]
(
[modelxbrandid] [int] NOT NULL IDENTITY(1, 1),
[brandid] [int] NOT NULL,
[modelid] [int] NOT NULL
)
GO
ALTER TABLE [dbo].[ModelXBrand] ADD CONSTRAINT [PK_ModelXBrand] PRIMARY KEY CLUSTERED ([modelxbrandid])
GO
ALTER TABLE [dbo].[ModelXBrand] ADD CONSTRAINT [FK_ModelXBrand_Brands] FOREIGN KEY ([brandid]) REFERENCES [dbo].[Brands] ([brandid])
GO
ALTER TABLE [dbo].[ModelXBrand] ADD CONSTRAINT [FK_ModelXBrand_Models] FOREIGN KEY ([modelid]) REFERENCES [dbo].[Models] ([modelid])
GO
