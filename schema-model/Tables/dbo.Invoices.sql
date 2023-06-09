CREATE TABLE [dbo].[Invoices]
(
[invoiceid] [int] NOT NULL IDENTITY(1, 1),
[cliententityid] [int] NOT NULL,
[productid] [int] NOT NULL,
[quantity] [decimal] (12, 2) NOT NULL,
[sellerentityid] [int] NOT NULL,
[totalPrice] [decimal] (12, 2) NOT NULL,
[currencyid] [int] NOT NULL,
[posttime] [datetime] NOT NULL CONSTRAINT [DF_Sales_posttime] DEFAULT (getdate()),
[computer] [nchar] (30) NOT NULL,
[username] [nchar] (30) NOT NULL,
[checksum] [varbinary] (150) NOT NULL,
[paymenttypeid] [int] NOT NULL
)
GO
ALTER TABLE [dbo].[Invoices] ADD CONSTRAINT [PK_Sales] PRIMARY KEY CLUSTERED ([invoiceid])
GO
ALTER TABLE [dbo].[Invoices] ADD CONSTRAINT [FK_Invoices_Currency] FOREIGN KEY ([currencyid]) REFERENCES [dbo].[Currency] ([currencyid])
GO
ALTER TABLE [dbo].[Invoices] ADD CONSTRAINT [FK_Sales_Entities] FOREIGN KEY ([cliententityid]) REFERENCES [dbo].[Entities] ([entityid])
GO
ALTER TABLE [dbo].[Invoices] ADD CONSTRAINT [FK_Sales_Entities_Seller] FOREIGN KEY ([sellerentityid]) REFERENCES [dbo].[Entities] ([entityid])
GO
ALTER TABLE [dbo].[Invoices] ADD CONSTRAINT [FK_Sales_PaymentTypes] FOREIGN KEY ([paymenttypeid]) REFERENCES [dbo].[PaymentTypes] ([paymenttypeid])
GO
ALTER TABLE [dbo].[Invoices] ADD CONSTRAINT [FK_Sales_Products] FOREIGN KEY ([productid]) REFERENCES [dbo].[Products] ([productid])
GO
