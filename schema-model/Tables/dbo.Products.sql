CREATE TABLE [dbo].[Products]
(
[productid] [int] NOT NULL IDENTITY(1, 1),
[name] [nchar] (20) NOT NULL,
[price] [decimal] (12, 2) NOT NULL,
[expenses] [decimal] (12, 2) NOT NULL
)
GO
ALTER TABLE [dbo].[Products] ADD CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED ([productid])
GO
