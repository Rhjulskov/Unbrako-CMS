using System.Collections.Generic;
using System.Configuration;

namespace Umbraco.Core.Configuration.UmbracoSettings
{
    internal class xsltStaticMappingCollection : ConfigurationElementCollection, IEnumerable<IxsltStaticMapping>
    {
        protected override ConfigurationElement CreateNewElement()
        {
            return new xsltStaticMappingElement();
        }

        protected override object GetElementKey(ConfigurationElement element)
        {
            return ((xsltStaticMappingElement) element).DataTypeGuid
                   + ((xsltStaticMappingElement) element).NodeTypeAlias
                   + ((xsltStaticMappingElement) element).PropertyTypeAlias;
        }


        IEnumerator<IxsltStaticMapping> IEnumerable<IxsltStaticMapping>.GetEnumerator()
        {
            for (var i = 0; i < Count; i++)
            {
                yield return BaseGet(i) as IxsltStaticMapping;
            }
        }

        System.Collections.IEnumerator System.Collections.IEnumerable.GetEnumerator()
        {
            return GetEnumerator();
        }
    }
}