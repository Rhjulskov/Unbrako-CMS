using System.Web.WebPages.xslt;

namespace umbraco.MacroEngines {
    public class xsltUmbracoFactory : WebxsltHostFactory {
        public override WebPagexsltHost CreateHost(string virtualPath, string physicalPath) {
            return new xsltUmbracoHost(virtualPath, physicalPath);
        }
    }
}
