CREATE TABLE [dbo].[ContainerStatus]
(
[containerstatusid] [int] NOT NULL IDENTITY(1, 1),
[containerid] [smallint] NOT NULL,
[statusid] [smallint] NOT NULL,
[quantity] [int] NOT NULL
)
GO
ALTER TABLE [dbo].[ContainerStatus] ADD CONSTRAINT [PK_ContainerStatus] PRIMARY KEY CLUSTERED ([containerstatusid])
GO
ALTER TABLE [dbo].[ContainerStatus] ADD CONSTRAINT [FK_ContainerStatus_Containers] FOREIGN KEY ([containerid]) REFERENCES [dbo].[Containers] ([containerid])
GO
ALTER TABLE [dbo].[ContainerStatus] ADD CONSTRAINT [FK_ContainerStatus_Status] FOREIGN KEY ([statusid]) REFERENCES [dbo].[Status] ([statusid])
GO
