CREATE TABLE [dbo].[CollectionAssignments]
(
[collectionassignmentid] [int] NOT NULL IDENTITY(1, 1),
[producerid] [int] NOT NULL,
[collectorid] [int] NOT NULL,
[producerofficeid] [int] NOT NULL,
[collectorofficeid] [int] NOT NULL,
[collectiondate] [date] NOT NULL,
[collectionsite] [sys].[geography] NOT NULL
)
GO
ALTER TABLE [dbo].[CollectionAssignments] ADD CONSTRAINT [PK_CollectionAssignments] PRIMARY KEY CLUSTERED ([collectionassignmentid])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Where and when the collector should go to which producer', 'SCHEMA', N'dbo', 'TABLE', N'CollectionAssignments', NULL, NULL
GO
