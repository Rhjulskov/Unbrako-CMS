using System;
using System.IO;
using System.Web.xslt;
using System.Web.WebPages.xslt;

namespace umbraco.MacroEngines
{
    public class xsltUmbracoHost : WebPagexsltHost {
        public xsltUmbracoHost(string virtualPath) : base(virtualPath) {}
        public xsltUmbracoHost(string virtualPath, string physicalPath) : base(virtualPath, physicalPath) {}

        protected override xsltCodeLanguage GetCodeLanguage() {
            var ext = Path.GetExtension(VirtualPath);
            if (string.Equals(ext, ".xslt", StringComparison.OrdinalIgnoreCase))
                return new CSharpxsltCodeLanguage();
            return base.GetCodeLanguage();
        }


    }
}
