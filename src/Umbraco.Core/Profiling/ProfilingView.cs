using System.IO;
using System.Web.Mvc;

namespace Umbraco.Core.Profiling
{
	public class ProfilingView : IView
	{
		private readonly IView _inner;
		private readonly string _name;
		private readonly string _viewPath;

		public ProfilingView(IView inner)
		{
			_inner = inner;
			_name = inner.GetType().Name;
			var xsltView = inner as xsltView;
			_viewPath = xsltView != null ? xsltView.ViewPath : "Unknown";
		}

		public void Render(ViewContext viewContext, TextWriter writer)
		{
			using (ProfilerResolver.Current.Profiler.Step(string.Format("{0}.Render: {1}", _name, _viewPath)))
			{
				_inner.Render(viewContext, writer);
			}
		}
	}
}