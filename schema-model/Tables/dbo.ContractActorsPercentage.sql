CREATE TABLE [dbo].[ContractActorsPercentage]
(
[contractactorspercentageid] [int] NOT NULL IDENTITY(1, 1),
[contractactorsid] [int] NOT NULL,
[percentage] [decimal] (5, 2) NOT NULL
)
GO
ALTER TABLE [dbo].[ContractActorsPercentage] ADD CONSTRAINT [PK_ContractActorsPercentage] PRIMARY KEY CLUSTERED ([contractactorspercentageid])
GO
ALTER TABLE [dbo].[ContractActorsPercentage] ADD CONSTRAINT [FK_ContractActorsPercentage_ContractActors] FOREIGN KEY ([contractactorsid]) REFERENCES [dbo].[ContractActors] ([contractactorsid])
GO
