﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ModulesInventory.Services
{
    public interface IListboxService
    {
        Task<IEnumerable<ListboxItem>> Countries();
    }
}
