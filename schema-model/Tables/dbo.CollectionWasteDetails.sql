CREATE TABLE [dbo].[CollectionWasteDetails]
(
[collectionwasteid] [int] NOT NULL IDENTITY(1, 1),
[collectionassignmentid] [int] NOT NULL,
[wastetid] [int] NOT NULL,
[containerid] [int] NOT NULL
)
GO
ALTER TABLE [dbo].[CollectionWasteDetails] ADD CONSTRAINT [PK_CollectionWasteDetails] PRIMARY KEY CLUSTERED ([collectionwasteid])
GO
ALTER TABLE [dbo].[CollectionWasteDetails] ADD CONSTRAINT [FK_CollectionWasteDetails_CollectionAssignments] FOREIGN KEY ([collectionassignmentid]) REFERENCES [dbo].[CollectionAssignments] ([collectionassignmentid])
GO
ALTER TABLE [dbo].[CollectionWasteDetails] ADD CONSTRAINT [FK_CollectionWasteDetails_Containers] FOREIGN KEY ([containerid]) REFERENCES [dbo].[Containers] ([containerid])
GO
ALTER TABLE [dbo].[CollectionWasteDetails] ADD CONSTRAINT [FK_CollectionWasteDetails_Wastes] FOREIGN KEY ([wastetid]) REFERENCES [dbo].[Wastes] ([wasteid])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Wastes that are gonna be collected and the container to be used', 'SCHEMA', N'dbo', 'TABLE', N'CollectionWasteDetails', NULL, NULL
GO
