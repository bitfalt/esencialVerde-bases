CREATE TABLE [dbo].[CollectionAssignments]
(
[collectionassignmentid] [int] NOT NULL IDENTITY(1, 1),
[producerid] [int] NULL,
[collectorid] [int] NULL,
[producerofficeid] [int] NULL,
[collectorofficeid] [int] NULL,
[collectiondate] [date] NOT NULL,
[collectionsite] [sys].[geography] NOT NULL
)
GO
ALTER TABLE [dbo].[CollectionAssignments] ADD CONSTRAINT [PK_CollectionAssignments] PRIMARY KEY CLUSTERED ([collectionassignmentid])
GO
