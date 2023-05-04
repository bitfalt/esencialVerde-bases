CREATE TABLE [dbo].[ContractActors]
(
[contractactorsid] [int] NOT NULL IDENTITY(1, 1),
[contractid] [int] NOT NULL,
[producerid] [int] NULL,
[collectorid] [int] NULL,
[entityid] [int] NULL,
[officeid] [int] NULL,
[percentage] [decimal] (5, 2) NOT NULL
)
GO
ALTER TABLE [dbo].[ContractActors] ADD CONSTRAINT [PK_ContractActors] PRIMARY KEY CLUSTERED ([contractactorsid])
GO
ALTER TABLE [dbo].[ContractActors] ADD CONSTRAINT [FK_ContractActors_Collectors] FOREIGN KEY ([collectorid]) REFERENCES [dbo].[Collectors] ([collectorid])
GO
ALTER TABLE [dbo].[ContractActors] ADD CONSTRAINT [FK_ContractActors_Contracts] FOREIGN KEY ([contractid]) REFERENCES [dbo].[Contracts] ([contractid])
GO
ALTER TABLE [dbo].[ContractActors] ADD CONSTRAINT [FK_ContractActors_Entities] FOREIGN KEY ([entityid]) REFERENCES [dbo].[Entities] ([entityid])
GO
ALTER TABLE [dbo].[ContractActors] ADD CONSTRAINT [FK_ContractActors_Offices] FOREIGN KEY ([officeid]) REFERENCES [dbo].[Offices] ([officeid])
GO
ALTER TABLE [dbo].[ContractActors] ADD CONSTRAINT [FK_ContractActors_Producers] FOREIGN KEY ([producerid]) REFERENCES [dbo].[Producers] ([producerid])
GO
