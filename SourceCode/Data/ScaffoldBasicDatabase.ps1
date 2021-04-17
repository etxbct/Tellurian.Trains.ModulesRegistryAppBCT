﻿Scaffold-DbContext Name=ConnectionStrings:TimetablePlanningDatabase Microsoft.EntityFrameworkCore.SqlServer -Force `
	-Context ModulesDbContext -Namespace ModulesRegistry.Data -OutputDir . `
	-ContextNamespace ModulesRegistry.Data -ContextDir . `
	-Tables Document, Country, Group, GroupMember, User, Person, Group, GroupDomain, GroupMember, Scale, ModuleStandard, Module, ModuleOwnership, ModuleGable, Property, Cargo, OperatingDay, OperatingBasicDay, Operator,  Region, Station, StationTrack, StationCustomer, StationCustomerCargo, ExternalStation, ExternalStationCustomer, CargoDirection, CargoReadyTime, CargoRelation, CargoUnit, ExternalStationCustomerCargo 