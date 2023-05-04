SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
PRINT N'Dropping foreign keys from [dbo].[CollectionWasteDetails]'
GO
ALTER TABLE [dbo].[CollectionWasteDetails] DROP CONSTRAINT [FK_CollectionWasteDetails_Containers]
GO
PRINT N'Dropping foreign keys from [dbo].[ContainerStatus]'
GO
ALTER TABLE [dbo].[ContainerStatus] DROP CONSTRAINT [FK_ContainerStatus_Containers]
GO
PRINT N'Dropping foreign keys from [dbo].[ContainerXWaste]'
GO
ALTER TABLE [dbo].[ContainerXWaste] DROP CONSTRAINT [FK_ContainerXWaste_Containers]
GO
PRINT N'Dropping constraints from [dbo].[ContainerStatus]'
GO
ALTER TABLE [dbo].[ContainerStatus] DROP CONSTRAINT [PK_ContainerStatus]
GO
PRINT N'Dropping constraints from [dbo].[Containers]'
GO
ALTER TABLE [dbo].[Containers] DROP CONSTRAINT [PK_Containers]
GO
PRINT N'Dropping [dbo].[ContainerStatus]'
GO
DROP TABLE [dbo].[ContainerStatus]
GO
PRINT N'Altering [dbo].[CollectionAssignments]'
GO
ALTER TABLE [dbo].[CollectionAssignments] ALTER COLUMN [producerid] [int] NOT NULL
GO
ALTER TABLE [dbo].[CollectionAssignments] ALTER COLUMN [collectorid] [int] NOT NULL
GO
ALTER TABLE [dbo].[CollectionAssignments] ALTER COLUMN [producerofficeid] [int] NOT NULL
GO
ALTER TABLE [dbo].[CollectionAssignments] ALTER COLUMN [collectorofficeid] [int] NOT NULL
GO
PRINT N'Altering [dbo].[CollectionWasteDetails]'
GO
ALTER TABLE [dbo].[CollectionWasteDetails] ALTER COLUMN [containerid] [int] NOT NULL
GO
PRINT N'Altering [dbo].[Containers]'
GO
ALTER TABLE [dbo].[Containers] ALTER COLUMN [containerid] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_Containers] on [dbo].[Containers]'
GO
ALTER TABLE [dbo].[Containers] ADD CONSTRAINT [PK_Containers] PRIMARY KEY CLUSTERED ([containerid])
GO
PRINT N'Creating [dbo].[ContainerHistory]'
GO
CREATE TABLE [dbo].[ContainerHistory]
(
[containerhistoryid] [int] NOT NULL IDENTITY(1, 1),
[containerid] [int] NOT NULL,
[date] [date] NOT NULL,
[movementtype] [smallint] NOT NULL,
[quantity] [int] NOT NULL,
[locationBefore] [sys].[geography] NOT NULL,
[locationAfter] [sys].[geography] NOT NULL
)
GO
PRINT N'Creating primary key [PK_ContainerHistory] on [dbo].[ContainerHistory]'
GO
ALTER TABLE [dbo].[ContainerHistory] ADD CONSTRAINT [PK_ContainerHistory] PRIMARY KEY CLUSTERED ([containerhistoryid])
GO
PRINT N'Creating [dbo].[MovementTypes]'
GO
CREATE TABLE [dbo].[MovementTypes]
(
[movementtype] [smallint] NOT NULL IDENTITY(1, 1),
[name] [nchar] (20) NOT NULL
)
GO
PRINT N'Creating primary key [PK_Status] on [dbo].[MovementTypes]'
GO
ALTER TABLE [dbo].[MovementTypes] ADD CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED ([movementtype])
GO
PRINT N'Altering [dbo].[ContainerXWaste]'
GO
ALTER TABLE [dbo].[ContainerXWaste] ALTER COLUMN [containerid] [int] NOT NULL
GO
PRINT N'Creating [dbo].[WasteMovements]'
GO
CREATE TABLE [dbo].[WasteMovements]
(
[wastemovementid] [int] NOT NULL IDENTITY(1, 1),
[containerid] [int] NOT NULL,
[wastetypeid] [int] NOT NULL,
[processid] [int] NOT NULL,
[wastetypexprocessid] [int] NOT NULL,
[movementdate] [date] NOT NULL,
[quantity] [decimal] (12, 2) NOT NULL
)
GO
PRINT N'Creating primary key [PK_WasteMovements] on [dbo].[WasteMovements]'
GO
ALTER TABLE [dbo].[WasteMovements] ADD CONSTRAINT [PK_WasteMovements] PRIMARY KEY CLUSTERED ([wastemovementid])
GO
PRINT N'Adding foreign keys to [dbo].[CollectionWasteDetails]'
GO
ALTER TABLE [dbo].[CollectionWasteDetails] ADD CONSTRAINT [FK_CollectionWasteDetails_Containers] FOREIGN KEY ([containerid]) REFERENCES [dbo].[Containers] ([containerid])
GO
PRINT N'Adding foreign keys to [dbo].[ContainerHistory]'
GO
ALTER TABLE [dbo].[ContainerHistory] ADD CONSTRAINT [FK_ContainerHistory_Containers] FOREIGN KEY ([containerid]) REFERENCES [dbo].[Containers] ([containerid])
GO
ALTER TABLE [dbo].[ContainerHistory] ADD CONSTRAINT [FK_ContainerHistory_MovementTypes] FOREIGN KEY ([movementtype]) REFERENCES [dbo].[MovementTypes] ([movementtype])
GO
PRINT N'Adding foreign keys to [dbo].[ContainerXWaste]'
GO
ALTER TABLE [dbo].[ContainerXWaste] ADD CONSTRAINT [FK_ContainerXWaste_Containers] FOREIGN KEY ([containerid]) REFERENCES [dbo].[Containers] ([containerid])
GO
PRINT N'Adding foreign keys to [dbo].[WasteMovements]'
GO
ALTER TABLE [dbo].[WasteMovements] ADD CONSTRAINT [FK_WasteMovements_Containers] FOREIGN KEY ([containerid]) REFERENCES [dbo].[Containers] ([containerid])
GO
ALTER TABLE [dbo].[WasteMovements] ADD CONSTRAINT [FK_WasteMovements_WasteTypes] FOREIGN KEY ([wastetypeid]) REFERENCES [dbo].[WasteTypes] ([wastetypeid])
GO
ALTER TABLE [dbo].[WasteMovements] ADD CONSTRAINT [FK_WasteMovements_Processes] FOREIGN KEY ([processid]) REFERENCES [dbo].[Processes] ([processid])
GO
ALTER TABLE [dbo].[WasteMovements] ADD CONSTRAINT [FK_WasteMovements_WasteTypeXProcess] FOREIGN KEY ([wastetypexprocessid]) REFERENCES [dbo].[WasteTypeXProcess] ([wastetypexprocessid])
GO
PRINT N'Creating extended properties'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Where and when the collector should go to which producer', 'SCHEMA', N'dbo', 'TABLE', N'CollectionAssignments', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Wastes that are gonna be collected and the container to be used', 'SCHEMA', N'dbo', 'TABLE', N'CollectionWasteDetails', NULL, NULL
GO

