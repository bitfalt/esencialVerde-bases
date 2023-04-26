CREATE TABLE [dbo].[Producers]
(
[producerid] [int] NOT NULL IDENTITY(1, 1),
[name] [nchar] (30) NOT NULL
)
GO
ALTER TABLE [dbo].[Producers] ADD CONSTRAINT [PK_wasteProducers] PRIMARY KEY CLUSTERED ([producerid])
GO
