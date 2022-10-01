﻿namespace ModulesRegistry.Data;

/// <summary>
/// This is not an entity that is stored in the database 
/// </summary>
public class ModulePackage
{
    public ModulePackage(int id, ModulePackageType type, string name, string ownerName, IEnumerable<Module> modules)
    {
        Id = id;
        Name = name;
        OwnerName = ownerName;
        Modules = modules;
        PackageType = type;
    }
    public int Id { get; }
    public string Name { get; }
    public string OwnerName { get; }
    public IEnumerable<Module> Modules { get; }
    public ModulePackageType PackageType { get; }
    public int ScaleId { get; init; }
    public int LayoutId { get; set; }
    public override string ToString() => this.ModuleNames();
}
