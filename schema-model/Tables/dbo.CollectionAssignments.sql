CREATE TABLE [dbo].[CollectionAssignments]
(
[collectionassignmentid] [int] NOT NULL IDENTITY(1, 1),
[collectorxcountryid] [int] NULL,
[collectorxstateid] [int] NULL,
[collectorxcityid] [int] NULL,
[producerxcountryid] [int] NULL,
[producerxstateid] [int] NULL,
[producerxcityid] [int] NULL,
[collectiondate] [date] NOT NULL,
[collectionsite] [sys].[geography] NOT NULL
)
GO
ALTER TABLE [dbo].[CollectionAssignments] ADD CONSTRAINT [PK_CollectionAssignments] PRIMARY KEY CLUSTERED ([collectionassignmentid])
GO
ALTER TABLE [dbo].[CollectionAssignments] ADD CONSTRAINT [FK_CollectionAssignments_CollectorsXCountry] FOREIGN KEY ([collectorxcountryid]) REFERENCES [dbo].[CollectorsXCountry] ([collectorxcountryid])
GO
ALTER TABLE [dbo].[CollectionAssignments] ADD CONSTRAINT [FK_CollectionAssignments_CollectorsXState] FOREIGN KEY ([collectorxstateid]) REFERENCES [dbo].[CollectorsXState] ([collectorxstateid])
GO
ALTER TABLE [dbo].[CollectionAssignments] ADD CONSTRAINT [FK_CollectionAssignments_CollectorXCity] FOREIGN KEY ([collectorxcityid]) REFERENCES [dbo].[CollectorXCity] ([collectorxcityid])
GO
ALTER TABLE [dbo].[CollectionAssignments] ADD CONSTRAINT [FK_CollectionAssignments_ProducersXCity] FOREIGN KEY ([producerxcityid]) REFERENCES [dbo].[ProducersXCity] ([producerxcityid])
GO
ALTER TABLE [dbo].[CollectionAssignments] ADD CONSTRAINT [FK_CollectionAssignments_ProducersXCountry] FOREIGN KEY ([producerxcountryid]) REFERENCES [dbo].[ProducersXCountry] ([producerxcountryid])
GO
ALTER TABLE [dbo].[CollectionAssignments] ADD CONSTRAINT [FK_CollectionAssignments_ProducersXState] FOREIGN KEY ([producerxstateid]) REFERENCES [dbo].[ProducersXState] ([producerxstateid])
GO
