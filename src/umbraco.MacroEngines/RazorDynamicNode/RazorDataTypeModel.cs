using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace umbraco.MacroEngines
{
    [AttributeUsage(AttributeTargets.Class, Inherited = true, AllowMultiple = true)]
    public sealed class xsltDataTypeModel : Attribute
    {
        public readonly Guid DataTypeEditorId;
        public readonly int Priority;

        public xsltDataTypeModel(string DataTypeEditorId)
        {
            this.DataTypeEditorId = new Guid(DataTypeEditorId);
            Priority = 100;
        }

        public xsltDataTypeModel(string DataTypeEditorId, int Priority)
        {
            this.DataTypeEditorId = new Guid(DataTypeEditorId);
            this.Priority = Priority;
        }
    }

}
