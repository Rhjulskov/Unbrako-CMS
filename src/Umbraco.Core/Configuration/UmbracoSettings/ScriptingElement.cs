using System.Collections.Generic;
using System.Configuration;

namespace Umbraco.Core.Configuration.UmbracoSettings
{
    internal class ScriptingElement : ConfigurationElement, IScriptingSection
    {
        [ConfigurationProperty("xslt")]
        internal xsltElement xslt
        {
            get { return (xsltElement) base["xslt"]; }
        }

        IEnumerable<INotDynamicXmlDocument> IScriptingSection.NotDynamicXmlDocumentElements
        {
            get { return xslt.NotDynamicXmlDocumentElements; }
        }

        IEnumerable<IxsltStaticMapping> IScriptingSection.DataTypeModelStaticMappings
        {
            get { return xslt.DataTypeModelStaticMappings; }
        }
    }
}