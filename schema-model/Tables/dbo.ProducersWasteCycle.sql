CREATE TABLE [dbo].[ProducersWasteCycle]
(
[producerswastecycleid] [int] NOT NULL IDENTITY(1, 1),
[producerxcountryid] [int] NULL,
[producerxstateid] [int] NULL,
[producerxcityid] [int] NULL
)
GO
ALTER TABLE [dbo].[ProducersWasteCycle] ADD CONSTRAINT [PK_ProducersWasteCycle] PRIMARY KEY CLUSTERED ([producerswastecycleid])
GO
