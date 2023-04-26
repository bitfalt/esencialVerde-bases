CREATE TABLE [dbo].[ContractActors]
(
[contractactorsid] [int] NOT NULL IDENTITY(1, 1),
[contractid] [int] NOT NULL,
[producerxcountryid] [int] NULL,
[producerxstateid] [int] NULL,
[producerxcityid] [int] NULL,
[collectorxcountryid] [int] NULL,
[collectorxstateid] [int] NULL,
[collectorxcityid] [int] NULL,
[entityid] [int] NULL
)
GO
ALTER TABLE [dbo].[ContractActors] ADD CONSTRAINT [PK_ContractActors] PRIMARY KEY CLUSTERED ([contractactorsid])
GO
ALTER TABLE [dbo].[ContractActors] ADD CONSTRAINT [FK_ContractActors_CollectorsXCountry] FOREIGN KEY ([collectorxcountryid]) REFERENCES [dbo].[CollectorsXCountry] ([collectorxcountryid])
GO
ALTER TABLE [dbo].[ContractActors] ADD CONSTRAINT [FK_ContractActors_CollectorsXState] FOREIGN KEY ([collectorxstateid]) REFERENCES [dbo].[CollectorsXState] ([collectorxstateid])
GO
ALTER TABLE [dbo].[ContractActors] ADD CONSTRAINT [FK_ContractActors_CollectorXCity] FOREIGN KEY ([collectorxcityid]) REFERENCES [dbo].[CollectorXCity] ([collectorxcityid])
GO
ALTER TABLE [dbo].[ContractActors] ADD CONSTRAINT [FK_ContractActors_Contracts] FOREIGN KEY ([contractid]) REFERENCES [dbo].[Contracts] ([contractid])
GO
ALTER TABLE [dbo].[ContractActors] ADD CONSTRAINT [FK_ContractActors_Entities] FOREIGN KEY ([entityid]) REFERENCES [dbo].[Entities] ([entityid])
GO
ALTER TABLE [dbo].[ContractActors] ADD CONSTRAINT [FK_ContractActors_ProducersXCity] FOREIGN KEY ([producerxcityid]) REFERENCES [dbo].[ProducersXCity] ([producerxcityid])
GO
ALTER TABLE [dbo].[ContractActors] ADD CONSTRAINT [FK_ContractActors_ProducersXCountry] FOREIGN KEY ([producerxcountryid]) REFERENCES [dbo].[ProducersXCountry] ([producerxcountryid])
GO
ALTER TABLE [dbo].[ContractActors] ADD CONSTRAINT [FK_ContractActors_ProducersXState] FOREIGN KEY ([producerxstateid]) REFERENCES [dbo].[ProducersXState] ([producerxstateid])
GO
