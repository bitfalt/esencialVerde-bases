CREATE TABLE [dbo].[Offices]
(
[officeid] [int] NOT NULL IDENTITY(1, 1),
[name] [nchar] (30) NOT NULL,
[addressid] [int] NOT NULL,
[producerid] [int] NULL,
[collectorid] [int] NULL,
[entityid] [int] NULL
)
GO
ALTER TABLE [dbo].[Offices] ADD CONSTRAINT [PK_Offices] PRIMARY KEY CLUSTERED ([officeid])
GO
ALTER TABLE [dbo].[Offices] ADD CONSTRAINT [FK_Offices_Addresses] FOREIGN KEY ([addressid]) REFERENCES [dbo].[Addresses] ([addressid])
GO
ALTER TABLE [dbo].[Offices] ADD CONSTRAINT [FK_Offices_Collectors] FOREIGN KEY ([collectorid]) REFERENCES [dbo].[Collectors] ([collectorid])
GO
ALTER TABLE [dbo].[Offices] ADD CONSTRAINT [FK_Offices_Entities] FOREIGN KEY ([entityid]) REFERENCES [dbo].[Entities] ([entityid])
GO
ALTER TABLE [dbo].[Offices] ADD CONSTRAINT [FK_Offices_Producers] FOREIGN KEY ([producerid]) REFERENCES [dbo].[Producers] ([producerid])
GO
