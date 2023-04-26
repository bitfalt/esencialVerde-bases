CREATE TABLE [dbo].[ContactXProducerXState]
(
[contactxproducerxstateid] [int] NOT NULL IDENTITY(1, 1),
[contactvalueid] [int] NOT NULL,
[producerxstateid] [int] NOT NULL
)
GO
ALTER TABLE [dbo].[ContactXProducerXState] ADD CONSTRAINT [PK_ContactXProducerXState] PRIMARY KEY CLUSTERED ([contactxproducerxstateid])
GO
ALTER TABLE [dbo].[ContactXProducerXState] ADD CONSTRAINT [FK_ContactXProducerXState_ContactValues] FOREIGN KEY ([contactvalueid]) REFERENCES [dbo].[ContactValues] ([contactvalueid])
GO
ALTER TABLE [dbo].[ContactXProducerXState] ADD CONSTRAINT [FK_ContactXProducerXState_ProducersXState] FOREIGN KEY ([producerxstateid]) REFERENCES [dbo].[ProducersXState] ([producerxstateid])
GO
