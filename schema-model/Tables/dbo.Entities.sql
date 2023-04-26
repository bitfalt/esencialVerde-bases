CREATE TABLE [dbo].[Entities]
(
[entityid] [int] NOT NULL IDENTITY(1, 1),
[entitytypeid] [int] NOT NULL,
[name] [nchar] (30) NOT NULL,
[countryid] [int] NULL,
[stateid] [int] NULL,
[cityid] [int] NULL
)
GO
ALTER TABLE [dbo].[Entities] ADD CONSTRAINT [PK_Entities] PRIMARY KEY CLUSTERED ([entityid])
GO
ALTER TABLE [dbo].[Entities] ADD CONSTRAINT [FK_Entities_Cities] FOREIGN KEY ([cityid]) REFERENCES [dbo].[Cities] ([cityid])
GO
ALTER TABLE [dbo].[Entities] ADD CONSTRAINT [FK_Entities_Country] FOREIGN KEY ([countryid]) REFERENCES [dbo].[Country] ([countryid])
GO
ALTER TABLE [dbo].[Entities] ADD CONSTRAINT [FK_Entities_EntityTypes] FOREIGN KEY ([entitytypeid]) REFERENCES [dbo].[EntityTypes] ([entitytypeid])
GO
ALTER TABLE [dbo].[Entities] ADD CONSTRAINT [FK_Entities_States] FOREIGN KEY ([stateid]) REFERENCES [dbo].[States] ([stateid])
GO
