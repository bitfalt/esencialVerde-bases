CREATE TABLE [dbo].[MaterialXProduct]
(
[materialxproductid] [int] NOT NULL IDENTITY(1, 1),
[materialid] [int] NOT NULL,
[productid] [int] NOT NULL
)
GO
ALTER TABLE [dbo].[MaterialXProduct] ADD CONSTRAINT [PK_MaterialXProduct] PRIMARY KEY CLUSTERED ([materialxproductid])
GO
ALTER TABLE [dbo].[MaterialXProduct] ADD CONSTRAINT [FK_MaterialXProduct_Materials] FOREIGN KEY ([materialid]) REFERENCES [dbo].[Materials] ([materialid])
GO
ALTER TABLE [dbo].[MaterialXProduct] ADD CONSTRAINT [FK_MaterialXProduct_Products] FOREIGN KEY ([productid]) REFERENCES [dbo].[Products] ([productid])
GO
