using System;

namespace Umbraco.Core.Configuration.UmbracoSettings
{
    public interface IxsltStaticMapping
    {
        Guid DataTypeGuid { get; }
        string NodeTypeAlias { get; }
        string PropertyTypeAlias { get; }
        string MappingName { get; }
    }
}