(function() {

    CodeMirror.xsltHints['@'] = [
              'inherits',
              'Library',
              'Model',
              'Parameter',
              'using',
              'Dictionary',
              ['if/else', 'if(SomeCondition){\n\n}else{\n\n}\n'],
              ['if', 'if(SomeCondition){\n\n}\n'],
              ['foreach', 'foreach(var item in collection){\n\n}\n'],
              ['context', 'inherits umbraco.MacroEngines.DynamicNodeContext\n\n'],
              ['helper', 'helperMethod(Model)\n\n@helperMethod(dynamic val){\n\t<p>Hello @val.Name\n}\n\n'],
          ];

    CodeMirror.xsltHints['.'] = [
              'Ancestors',
              'AncestorsOrSelf',
              'Children',
              'Descendants',
              'DescendantsOrSelf',
              'Parent',
              'First()',
              'Last()',
              'Up()',
              'Next()',
              'Previous()',
              'AncestorOrSelf()',
              'Where()',
              'OrderBy()',
              'GroupBy()',
              'InGroupsOf()',
              'Pluck()',
              'Take()',
              'Skip()',
              'Count()',
              'XPath()',
              'Search()',

              'Id',
              'Template',
              'SortOrder',
              'Name',
              'Visible',
              'Url',
              'UrlName',
              'NodeTypeAlias',
              'WriterName',
              'CreatorName',
              'WriterId',
              'CreatorId',
              'Path',
              'CreateDate',
              'UpdateDate',
              'NiceUrl',
              'Level',
          ];

    CodeMirror.xsltHints['@Library.'] = [
            'Search()',
            'NodeById()',
          ];

    CodeMirror.xsltHints['@Model.'] =
          CodeMirror.xsltHints['<levelRoot><'] =
          CodeMirror.xsltHints['<mainLevel><'] = [
              'second',
              'two'
          ];

    CodeMirror.xsltHints['<levelTop><second '] = [
            'secondProperty'
          ];

    CodeMirror.xsltHints['<levelTop><second><'] = [
            'three',
            'x-three'
          ];

})();