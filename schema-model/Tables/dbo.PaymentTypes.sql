CREATE TABLE [dbo].[PaymentTypes]
(
[paymenttypeid] [int] NOT NULL IDENTITY(1, 1),
[name] [nchar] (20) NOT NULL
)
GO
ALTER TABLE [dbo].[PaymentTypes] ADD CONSTRAINT [PK_PaymentTypes] PRIMARY KEY CLUSTERED ([paymenttypeid])
GO
