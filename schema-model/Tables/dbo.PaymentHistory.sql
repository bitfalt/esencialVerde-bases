CREATE TABLE [dbo].[PaymentHistory]
(
[paymenthistoryid] [int] NOT NULL IDENTITY(1, 1),
[producerid] [int] NULL,
[collectorid] [int] NULL,
[entityid] [int] NULL,
[paymentdate] [date] NOT NULL,
[amount] [decimal] (12, 2) NOT NULL,
[percentageid] [int] NOT NULL,
[currencyid] [int] NOT NULL,
[posttime] [datetime] NOT NULL CONSTRAINT [DF_PaymentHistory_posttime] DEFAULT (getdate()),
[computer] [nchar] (30) NOT NULL,
[username] [nchar] (30) NOT NULL,
[checksum] [varbinary] (150) NOT NULL
)
GO
ALTER TABLE [dbo].[PaymentHistory] ADD CONSTRAINT [PK_PaymentHistory] PRIMARY KEY CLUSTERED ([paymenthistoryid])
GO
ALTER TABLE [dbo].[PaymentHistory] ADD CONSTRAINT [FK_PaymentHistory_ContractActors] FOREIGN KEY ([percentageid]) REFERENCES [dbo].[ContractActors] ([contractactorsid])
GO
ALTER TABLE [dbo].[PaymentHistory] ADD CONSTRAINT [FK_PaymentHistory_Currency] FOREIGN KEY ([currencyid]) REFERENCES [dbo].[Currency] ([currencyid])
GO
