CREATE TABLE [dbo].[ContractTerms]
(
[contracttermsid] [int] NOT NULL IDENTITY(1, 1),
[contractid] [int] NOT NULL,
[termid] [int] NOT NULL,
[value] [nchar] (50) NOT NULL
)
GO
ALTER TABLE [dbo].[ContractTerms] ADD CONSTRAINT [PK_ContractTerms] PRIMARY KEY CLUSTERED ([contracttermsid])
GO
ALTER TABLE [dbo].[ContractTerms] ADD CONSTRAINT [FK_ContractTerms_Contracts] FOREIGN KEY ([contractid]) REFERENCES [dbo].[Contracts] ([contractid])
GO
ALTER TABLE [dbo].[ContractTerms] ADD CONSTRAINT [FK_ContractTerms_Terms] FOREIGN KEY ([termid]) REFERENCES [dbo].[Terms] ([termid])
GO
