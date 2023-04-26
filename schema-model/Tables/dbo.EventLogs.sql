CREATE TABLE [dbo].[EventLogs]
(
[eventlogid] [int] NOT NULL IDENTITY(1, 1),
[posttime] [datetime] NOT NULL CONSTRAINT [DF_EventLogs_posttime] DEFAULT (getdate()),
[computer] [nchar] (30) NOT NULL,
[username] [nchar] (30) NOT NULL,
[checksum] [varbinary] (150) NOT NULL,
[description] [nchar] (20) NOT NULL,
[referenceid1] [bigint] NOT NULL,
[referenceid2] [bigint] NOT NULL,
[value1] [nchar] (80) NOT NULL,
[value2] [nchar] (80) NOT NULL,
[levelid] [int] NOT NULL,
[eventtypeid] [int] NOT NULL,
[objecttypeid] [int] NOT NULL,
[sourceid] [int] NOT NULL
)
GO
ALTER TABLE [dbo].[EventLogs] ADD CONSTRAINT [PK_EventLogs] PRIMARY KEY CLUSTERED ([eventlogid])
GO
ALTER TABLE [dbo].[EventLogs] ADD CONSTRAINT [FK_EventLogs_EventTypes] FOREIGN KEY ([eventtypeid]) REFERENCES [dbo].[EventTypes] ([eventtypeid])
GO
ALTER TABLE [dbo].[EventLogs] ADD CONSTRAINT [FK_EventLogs_Levels] FOREIGN KEY ([levelid]) REFERENCES [dbo].[Levels] ([levelid])
GO
ALTER TABLE [dbo].[EventLogs] ADD CONSTRAINT [FK_EventLogs_ObjectTypes] FOREIGN KEY ([objecttypeid]) REFERENCES [dbo].[ObjectTypes] ([objecttypeid])
GO
ALTER TABLE [dbo].[EventLogs] ADD CONSTRAINT [FK_EventLogs_Sources] FOREIGN KEY ([sourceid]) REFERENCES [dbo].[Sources] ([sourceid])
GO
