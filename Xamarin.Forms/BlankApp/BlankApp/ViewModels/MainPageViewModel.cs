using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BlankApp.Services;
using Prism.Commands;
using Prism.Mvvm;
using Prism.Navigation;

namespace BlankApp.ViewModels
{
    public class MainPageViewModel : ViewModelBase
    {
        public MainPageViewModel(BaseServices baseServices)
            : base (baseServices)
        {
            Title = "Main Page";
        }
    }
}
