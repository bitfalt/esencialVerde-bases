SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
PRINT N'Dropping extended properties'
GO
EXEC sp_dropextendedproperty N'MS_Description', 'SCHEMA', N'dbo', 'TABLE', N'CollectionAssignments', NULL, NULL
GO
EXEC sp_dropextendedproperty N'MS_Description', 'SCHEMA', N'dbo', 'TABLE', N'CollectionWasteDetails', NULL, NULL
GO
PRINT N'Dropping foreign keys from [dbo].[CollectionWasteDetails]'
GO
ALTER TABLE [dbo].[CollectionWasteDetails] DROP CONSTRAINT [FK_CollectionWasteDetails_Containers]
GO
PRINT N'Dropping foreign keys from [dbo].[ContainerHistory]'
GO
ALTER TABLE [dbo].[ContainerHistory] DROP CONSTRAINT [FK_ContainerHistory_Containers]
GO
ALTER TABLE [dbo].[ContainerHistory] DROP CONSTRAINT [FK_ContainerHistory_MovementTypes]
GO
PRINT N'Dropping foreign keys from [dbo].[ContainerXWaste]'
GO
ALTER TABLE [dbo].[ContainerXWaste] DROP CONSTRAINT [FK_ContainerXWaste_Containers]
GO
PRINT N'Dropping foreign keys from [dbo].[WasteMovements]'
GO
ALTER TABLE [dbo].[WasteMovements] DROP CONSTRAINT [FK_WasteMovements_Containers]
GO
ALTER TABLE [dbo].[WasteMovements] DROP CONSTRAINT [FK_WasteMovements_WasteTypes]
GO
ALTER TABLE [dbo].[WasteMovements] DROP CONSTRAINT [FK_WasteMovements_Processes]
GO
ALTER TABLE [dbo].[WasteMovements] DROP CONSTRAINT [FK_WasteMovements_WasteTypeXProcess]
GO
PRINT N'Dropping constraints from [dbo].[ContainerHistory]'
GO
ALTER TABLE [dbo].[ContainerHistory] DROP CONSTRAINT [PK_ContainerHistory]
GO
PRINT N'Dropping constraints from [dbo].[Containers]'
GO
ALTER TABLE [dbo].[Containers] DROP CONSTRAINT [PK_Containers]
GO
PRINT N'Dropping constraints from [dbo].[MovementTypes]'
GO
ALTER TABLE [dbo].[MovementTypes] DROP CONSTRAINT [PK_Status]
GO
PRINT N'Dropping constraints from [dbo].[WasteMovements]'
GO
ALTER TABLE [dbo].[WasteMovements] DROP CONSTRAINT [PK_WasteMovements]
GO
PRINT N'Dropping [dbo].[WasteMovements]'
GO
DROP TABLE [dbo].[WasteMovements]
GO
PRINT N'Dropping [dbo].[MovementTypes]'
GO
DROP TABLE [dbo].[MovementTypes]
GO
PRINT N'Dropping [dbo].[ContainerHistory]'
GO
DROP TABLE [dbo].[ContainerHistory]
GO
PRINT N'Altering [dbo].[CollectionAssignments]'
GO
ALTER TABLE [dbo].[CollectionAssignments] ALTER COLUMN [producerid] [int] NULL
GO
ALTER TABLE [dbo].[CollectionAssignments] ALTER COLUMN [collectorid] [int] NULL
GO
ALTER TABLE [dbo].[CollectionAssignments] ALTER COLUMN [producerofficeid] [int] NULL
GO
ALTER TABLE [dbo].[CollectionAssignments] ALTER COLUMN [collectorofficeid] [int] NULL
GO
PRINT N'Altering [dbo].[CollectionWasteDetails]'
GO
ALTER TABLE [dbo].[CollectionWasteDetails] ALTER COLUMN [containerid] [smallint] NOT NULL
GO
PRINT N'Altering [dbo].[Containers]'
GO
ALTER TABLE [dbo].[Containers] ALTER COLUMN [containerid] [smallint] NOT NULL
GO
PRINT N'Creating primary key [PK_Containers] on [dbo].[Containers]'
GO
ALTER TABLE [dbo].[Containers] ADD CONSTRAINT [PK_Containers] PRIMARY KEY CLUSTERED ([containerid])
GO
PRINT N'Creating [dbo].[ContainerStatus]'
GO
CREATE TABLE [dbo].[ContainerStatus]
(
[containerstatusid] [int] NOT NULL IDENTITY(1, 1),
[containerid] [smallint] NOT NULL,
[statusid] [smallint] NOT NULL,
[quantity] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_ContainerStatus] on [dbo].[ContainerStatus]'
GO
ALTER TABLE [dbo].[ContainerStatus] ADD CONSTRAINT [PK_ContainerStatus] PRIMARY KEY CLUSTERED ([containerstatusid])
GO
PRINT N'Altering [dbo].[ContainerXWaste]'
GO
ALTER TABLE [dbo].[ContainerXWaste] ALTER COLUMN [containerid] [smallint] NOT NULL
GO
PRINT N'Adding foreign keys to [dbo].[CollectionWasteDetails]'
GO
ALTER TABLE [dbo].[CollectionWasteDetails] ADD CONSTRAINT [FK_CollectionWasteDetails_Containers] FOREIGN KEY ([containerid]) REFERENCES [dbo].[Containers] ([containerid])
GO
PRINT N'Adding foreign keys to [dbo].[ContainerStatus]'
GO
ALTER TABLE [dbo].[ContainerStatus] ADD CONSTRAINT [FK_ContainerStatus_Containers] FOREIGN KEY ([containerid]) REFERENCES [dbo].[Containers] ([containerid])
GO
PRINT N'Adding foreign keys to [dbo].[ContainerXWaste]'
GO
ALTER TABLE [dbo].[ContainerXWaste] ADD CONSTRAINT [FK_ContainerXWaste_Containers] FOREIGN KEY ([containerid]) REFERENCES [dbo].[Containers] ([containerid])
GO

