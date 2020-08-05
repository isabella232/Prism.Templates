using System;
using System.Collections.Generic;
using System.Text;
using BlankApp.Services;
using Prism.Commands;
using Prism.Mvvm;
using Prism.Navigation;

namespace BlankApp.ViewModels
{
    public abstract class ViewModelBase : BindableBase, IInitialize, INavigationAware, IDestructible
    {
        protected INavigationService NavigationService { get; private set; }

        protected ViewModelBase(BaseServices baseServices)
        {
            NavigationService = baseServices.NavigationService;
        }

        private string _title;
        public string Title
        {
            get => _title;
            set => SetProperty(ref _title, value);
        }

        public virtual void Initialize(INavigationParameters parameters)
        {

        }

        public virtual void OnNavigatedFrom(INavigationParameters parameters)
        {

        }

        public virtual void OnNavigatedTo(INavigationParameters parameters)
        {

        }

        public virtual void Destroy()
        {

        }
    }
}
