CREATE TABLE [dbo].[TransactionTypes]
(
[transactiontypeid] [int] NOT NULL IDENTITY(1, 1),
[name] [nchar] (20) NOT NULL
)
GO
ALTER TABLE [dbo].[TransactionTypes] ADD CONSTRAINT [PK_TransactionTypes] PRIMARY KEY CLUSTERED ([transactiontypeid])
GO
