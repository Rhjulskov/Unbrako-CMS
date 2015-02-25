using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Umbraco.Core;

namespace umbraco.MacroEngines.xsltDataTypeModels
{
    [xsltDataTypeModel(Constants.PropertyEditors.Integer, 90)]
    [xsltDataTypeModel("f231cd8a-e447-424a-94a4-bc73b11736bb", 90)]
    [xsltDataTypeModel(Constants.PropertyEditors.RadioButtonList, 90)]
    [xsltDataTypeModel(Constants.PropertyEditors.MemberPicker, 90)]
    [xsltDataTypeModel("f6524852-2fb0-11e0-a9fa-6f1cdfd72085", 90)] //Extended Content Picker http://our.umbraco.org/projects/backoffice-extensions/extended-content-picker
    public class IntegerDataTypeModel : IxsltDataTypeModel
    {
        public bool Init(int CurrentNodeId, string PropertyData, out object instance)
        {
            int integer = 0;
            if (int.TryParse(PropertyData, System.Globalization.NumberStyles.Number, System.Globalization.CultureInfo.CurrentCulture, out integer))
            {
                instance = integer;
                return true;
            }
            instance = null;
            return false;
        }
    }
}
