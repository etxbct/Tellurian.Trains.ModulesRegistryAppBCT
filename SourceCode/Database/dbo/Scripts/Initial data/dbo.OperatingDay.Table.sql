-- NOTE: This script inserts data in two tables and in the right order.

INSERT [dbo].[OperatingDay] ([Id], [Flag], [FullName], [ShortName], [IsBasicDay], [IsMonday], [IsTuesday], [IsWednesday], [IsThursday], [IsFriday], [IsSaturday], [IsSunday]) VALUES (1, 1, N'Monday', N'Mo', 1, 1, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[OperatingDay] ([Id], [Flag], [FullName], [ShortName], [IsBasicDay], [IsMonday], [IsTuesday], [IsWednesday], [IsThursday], [IsFriday], [IsSaturday], [IsSunday]) VALUES (2, 2, N'Tuesday', N'Tu', 1, 0, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[OperatingDay] ([Id], [Flag], [FullName], [ShortName], [IsBasicDay], [IsMonday], [IsTuesday], [IsWednesday], [IsThursday], [IsFriday], [IsSaturday], [IsSunday]) VALUES (3, 4, N'Wednesday', N'We', 1, 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[OperatingDay] ([Id], [Flag], [FullName], [ShortName], [IsBasicDay], [IsMonday], [IsTuesday], [IsWednesday], [IsThursday], [IsFriday], [IsSaturday], [IsSunday]) VALUES (4, 8, N'Thursday', N'Th', 1, 0, 0, 0, 1, 0, 0, 0)
INSERT [dbo].[OperatingDay] ([Id], [Flag], [FullName], [ShortName], [IsBasicDay], [IsMonday], [IsTuesday], [IsWednesday], [IsThursday], [IsFriday], [IsSaturday], [IsSunday]) VALUES (5, 16, N'Friday', N'Fr', 1, 0, 0, 0, 0, 1, 0, 0)
INSERT [dbo].[OperatingDay] ([Id], [Flag], [FullName], [ShortName], [IsBasicDay], [IsMonday], [IsTuesday], [IsWednesday], [IsThursday], [IsFriday], [IsSaturday], [IsSunday]) VALUES (6, 32, N'Saturday', N'Sa', 1, 0, 0, 0, 0, 0, 1, 0)
INSERT [dbo].[OperatingDay] ([Id], [Flag], [FullName], [ShortName], [IsBasicDay], [IsMonday], [IsTuesday], [IsWednesday], [IsThursday], [IsFriday], [IsSaturday], [IsSunday]) VALUES (7, 64, N'Sunday', N'Su', 1, 0, 0, 0, 0, 0, 0, 1)
INSERT [dbo].[OperatingDay] ([Id], [Flag], [FullName], [ShortName], [IsBasicDay], [IsMonday], [IsTuesday], [IsWednesday], [IsThursday], [IsFriday], [IsSaturday], [IsSunday]) VALUES (8, 127, N'Dagligen', N'Dagl', 0, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[OperatingDay] ([Id], [Flag], [FullName], [ShortName], [IsBasicDay], [IsMonday], [IsTuesday], [IsWednesday], [IsThursday], [IsFriday], [IsSaturday], [IsSunday]) VALUES (9, 21, N'Måndag, onsdag, fredag', N'M,O,F', 0, 1, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[OperatingDay] ([Id], [Flag], [FullName], [ShortName], [IsBasicDay], [IsMonday], [IsTuesday], [IsWednesday], [IsThursday], [IsFriday], [IsSaturday], [IsSunday]) VALUES (10, 31, N'Måndag-fredag', N'M-F', 0, 1, 1, 1, 1, 1, 0, 0)
INSERT [dbo].[OperatingDay] ([Id], [Flag], [FullName], [ShortName], [IsBasicDay], [IsMonday], [IsTuesday], [IsWednesday], [IsThursday], [IsFriday], [IsSaturday], [IsSunday]) VALUES (11, 63, N'Måndag-lördag', N'M-L', 0, 1, 1, 1, 1, 1, 1, 0)
INSERT [dbo].[OperatingDay] ([Id], [Flag], [FullName], [ShortName], [IsBasicDay], [IsMonday], [IsTuesday], [IsWednesday], [IsThursday], [IsFriday], [IsSaturday], [IsSunday]) VALUES (12, 62, N'Tisdag-lördag', N'Ti-L', 0, 0, 1, 1, 1, 1, 1, 0)
INSERT [dbo].[OperatingDay] ([Id], [Flag], [FullName], [ShortName], [IsBasicDay], [IsMonday], [IsTuesday], [IsWednesday], [IsThursday], [IsFriday], [IsSaturday], [IsSunday]) VALUES (13, 95, N'Söndag-fredag', N'M-F,S', 0, 1, 1, 1, 1, 1, 0, 1)
INSERT [dbo].[OperatingDay] ([Id], [Flag], [FullName], [ShortName], [IsBasicDay], [IsMonday], [IsTuesday], [IsWednesday], [IsThursday], [IsFriday], [IsSaturday], [IsSunday]) VALUES (14, 96, N'Lördag och söndag', N'L,S', 0, 0, 0, 0, 0, 0, 1, 1)
INSERT [dbo].[OperatingDay] ([Id], [Flag], [FullName], [ShortName], [IsBasicDay], [IsMonday], [IsTuesday], [IsWednesday], [IsThursday], [IsFriday], [IsSaturday], [IsSunday]) VALUES (15, 10, N'Tisdag, torsdag', N'Ti,To', 0, 0, 1, 0, 1, 0, 0, 0)
INSERT [dbo].[OperatingDay] ([Id], [Flag], [FullName], [ShortName], [IsBasicDay], [IsMonday], [IsTuesday], [IsWednesday], [IsThursday], [IsFriday], [IsSaturday], [IsSunday]) VALUES (16, 42, N'Tisdag, torsdag, lördag', N'Ti,To,Lö', 0, 0, 1, 0, 1, 0, 1, 0)
INSERT [dbo].[OperatingDay] ([Id], [Flag], [FullName], [ShortName], [IsBasicDay], [IsMonday], [IsTuesday], [IsWednesday], [IsThursday], [IsFriday], [IsSaturday], [IsSunday]) VALUES (17, 9, N'Måndag, torsdag', N'M,To', 0, 1, 0, 0, 1, 0, 0, 0)
INSERT [dbo].[OperatingDay] ([Id], [Flag], [FullName], [ShortName], [IsBasicDay], [IsMonday], [IsTuesday], [IsWednesday], [IsThursday], [IsFriday], [IsSaturday], [IsSunday]) VALUES (18, 18, N'Tisdag, fredag', N'Ti,F', 0, 0, 1, 0, 0, 1, 0, 0)
INSERT [dbo].[OperatingDay] ([Id], [Flag], [FullName], [ShortName], [IsBasicDay], [IsMonday], [IsTuesday], [IsWednesday], [IsThursday], [IsFriday], [IsSaturday], [IsSunday]) VALUES (19, 15, N'Måndag till torsdag', N'M-To', 0, 1, 1, 1, 1, 0, 0, 0)
INSERT [dbo].[OperatingDay] ([Id], [Flag], [FullName], [ShortName], [IsBasicDay], [IsMonday], [IsTuesday], [IsWednesday], [IsThursday], [IsFriday], [IsSaturday], [IsSunday]) VALUES (20, 71, N'Söndag till onsdag', N'S-O', 0, 1, 1, 1, 0, 0, 0, 1)
INSERT [dbo].[OperatingDay] ([Id], [Flag], [FullName], [ShortName], [IsBasicDay], [IsMonday], [IsTuesday], [IsWednesday], [IsThursday], [IsFriday], [IsSaturday], [IsSunday]) VALUES (21, 56, N'Torsdag till lördag', N'To-L', 0, 0, 0, 0, 1, 1, 1, 0)
INSERT [dbo].[OperatingDay] ([Id], [Flag], [FullName], [ShortName], [IsBasicDay], [IsMonday], [IsTuesday], [IsWednesday], [IsThursday], [IsFriday], [IsSaturday], [IsSunday]) VALUES (22, 67, N'Söndag till tisdag', N'S-Ti', 0, 1, 1, 0, 0, 0, 0, 1)
INSERT [dbo].[OperatingDay] ([Id], [Flag], [FullName], [ShortName], [IsBasicDay], [IsMonday], [IsTuesday], [IsWednesday], [IsThursday], [IsFriday], [IsSaturday], [IsSunday]) VALUES (23, 60, N'Onsdag till lördag', N'O-L', 0, 0, 0, 1, 1, 1, 1, 0)
INSERT [dbo].[OperatingDay] ([Id], [Flag], [FullName], [ShortName], [IsBasicDay], [IsMonday], [IsTuesday], [IsWednesday], [IsThursday], [IsFriday], [IsSaturday], [IsSunday]) VALUES (24, 30, N'Tisdag-fredag', N'Ti-F', 0, 0, 1, 1, 1, 1, 0, 0)
INSERT [dbo].[OperatingDay] ([Id], [Flag], [FullName], [ShortName], [IsBasicDay], [IsMonday], [IsTuesday], [IsWednesday], [IsThursday], [IsFriday], [IsSaturday], [IsSunday]) VALUES (25, 79, N'Söndag-torsdag', N'S-To', 0, 1, 1, 1, 1, 0, 0, 1)
INSERT [dbo].[OperatingDay] ([Id], [Flag], [FullName], [ShortName], [IsBasicDay], [IsMonday], [IsTuesday], [IsWednesday], [IsThursday], [IsFriday], [IsSaturday], [IsSunday]) VALUES (26, 48, N'Fredag-lördag', N'F-L', 0, 0, 0, 0, 0, 1, 1, 0)
INSERT [dbo].[OperatingDay] ([Id], [Flag], [FullName], [ShortName], [IsBasicDay], [IsMonday], [IsTuesday], [IsWednesday], [IsThursday], [IsFriday], [IsSaturday], [IsSunday]) VALUES (27, 255, N'Vid behov', N'Behov', 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[OperatingDay] ([Id], [Flag], [FullName], [ShortName], [IsBasicDay], [IsMonday], [IsTuesday], [IsWednesday], [IsThursday], [IsFriday], [IsSaturday], [IsSunday]) VALUES (28, 36, N'Onsdag,lördag', N'O,L', 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[OperatingDay] ([Id], [Flag], [FullName], [ShortName], [IsBasicDay], [IsMonday], [IsTuesday], [IsWednesday], [IsThursday], [IsFriday], [IsSaturday], [IsSunday]) VALUES (29, 3, N'Måndag, tisdag', N'M,Ti', 0, 1, 1, 0, 0, 0, 0, 0)
GO

INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (1, 1)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (2, 2)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (3, 3)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (4, 4)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (5, 5)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (6, 6)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (7, 7)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (8, 1)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (8, 2)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (8, 3)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (8, 4)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (8, 5)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (8, 6)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (8, 7)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (9, 1)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (9, 3)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (9, 5)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (10, 1)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (10, 2)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (10, 3)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (10, 4)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (10, 5)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (11, 1)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (11, 6)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (12, 2)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (12, 3)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (12, 4)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (12, 5)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (12, 6)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (13, 1)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (13, 2)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (13, 3)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (13, 4)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (13, 5)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (13, 7)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (14, 6)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (14, 7)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (15, 2)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (15, 4)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (16, 2)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (16, 4)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (16, 6)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (17, 1)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (17, 4)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (18, 2)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (18, 5)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (19, 1)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (19, 2)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (19, 3)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (19, 4)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (20, 1)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (20, 2)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (20, 3)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (20, 7)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (21, 4)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (21, 5)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (21, 6)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (22, 1)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (22, 2)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (22, 7)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (23, 3)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (23, 4)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (23, 5)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (23, 6)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (24, 2)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (24, 3)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (24, 4)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (24, 5)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (25, 1)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (25, 2)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (25, 3)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (25, 4)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (25, 7)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (26, 5)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (26, 6)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (28, 3)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (28, 6)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (29, 1)
INSERT [dbo].[OperatingBasicDay] ([OperatingDayId], [BasicDayId]) VALUES (29, 2)
GO
