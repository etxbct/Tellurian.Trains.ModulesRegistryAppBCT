﻿using System;
using System.Collections.Generic;

#nullable disable

namespace ModulesRegistry.Data
{
    public partial class StationCustomerCargo
    {
        public StationCustomerCargo()
        {
            CargoRelationConsumerStationCustomerCargos = new HashSet<CargoRelation>();
            CargoRelationSupplierStationCustomerCargos = new HashSet<CargoRelation>();
        }

        public int Id { get; set; }
        public int CargoId { get; set; }
        public int? StationCustomerId { get; set; }
        public string TrackOrArea { get; set; }
        public string TrackOrAreaColor { get; set; }
        public string SpecialCargoName { get; set; }
        public int DirectionId { get; set; }
        public int? OperatingDayId { get; set; }
        public int QuantityUnitId { get; set; }
        public int Quantity { get; set; }
        public int ReadyTimeId { get; set; }
        public short? FromYear { get; set; }
        public short? UptoYear { get; set; }

        public virtual Cargo Cargo { get; set; }
        public virtual CargoDirection Direction { get; set; }
        public virtual OperatingDay OperatingDay { get; set; }
        public virtual CargoReadyTime ReadyTime { get; set; }
        public virtual StationCustomer StationCustomer { get; set; }
        public virtual ICollection<CargoRelation> CargoRelationConsumerStationCustomerCargos { get; set; }
        public virtual ICollection<CargoRelation> CargoRelationSupplierStationCustomerCargos { get; set; }
    }
}