﻿using System;
using System.Collections.Generic;

#nullable disable

namespace ModulesRegistry.Data
{
    public partial class Group
    {
        public Group()
        {
            ModuleOwnerships = new HashSet<ModuleOwnership>();
        }

        public int Id { get; set; }
        public int CountryId { get; set; }
        public string FullName { get; set; }
        public string ShortName { get; set; }
        public string Purpose { get; set; }

        public virtual Country Country { get; set; }
        public virtual ICollection<ModuleOwnership> ModuleOwnerships { get; set; }
    }
}
