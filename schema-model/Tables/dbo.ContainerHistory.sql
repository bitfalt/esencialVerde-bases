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
ALTER TABLE [dbo].[ContainerHistory] ADD CONSTRAINT [PK_ContainerHistory] PRIMARY KEY CLUSTERED ([containerhistoryid])
GO
ALTER TABLE [dbo].[ContainerHistory] ADD CONSTRAINT [FK_ContainerHistory_Containers] FOREIGN KEY ([containerid]) REFERENCES [dbo].[Containers] ([containerid])
GO
ALTER TABLE [dbo].[ContainerHistory] ADD CONSTRAINT [FK_ContainerHistory_MovementTypes] FOREIGN KEY ([movementtype]) REFERENCES [dbo].[MovementTypes] ([movementtype])
GO
