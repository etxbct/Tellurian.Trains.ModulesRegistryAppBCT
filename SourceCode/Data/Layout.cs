﻿#nullable disable

namespace ModulesRegistry.Data
{
    public class Layout
    {
        public int Id { get; set; }
        public int MeetingId { get; set; }
        public int ResponsibleGroupId { get; set; }
        public int PrimaryModuleStandardId { get; set; }
        public int? StartWeekdayId { get; set; }
        public string Note { get; set; }
        public short? FirstYear { get; set; }
        public short? LastYear { get; set; }
        public short? StartHour { get; set; }
        public short? EndHour { get; set; }

        public virtual Meeting Meeting { get; set; }
        public virtual Group ResponsibleGroup { get; set; }
        public virtual ModuleStandard PrimaryModuleStandard { get; set; }
        public virtual OperatingDay StartWeekday { get; set; }
    }
}