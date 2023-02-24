﻿CREATE TABLE [dbo].[DriverDutyScheduleLocoPart]
(
    [Id] INT NOT NULL IDENTITY (1, 1),
    [DriverDutyId] INT NOT NULL,
    [ScheduleLocoPartId] INT NOT NULL
    
    CONSTRAINT [PK_DriverDutyScheduleLocoPart] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_DriverDutyScheduleLocoPart_DriverDuty] FOREIGN KEY ([DriverDutyId]) REFERENCES [dbo].[DriverDuty] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_DriverDutyScheduleLocoPart_ScheduleTrainPart] FOREIGN KEY ([ScheduleLocoPartId]) REFERENCES [dbo].[ScheduleTrainPart] ([Id])
    
)
