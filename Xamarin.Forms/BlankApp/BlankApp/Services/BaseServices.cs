using Prism.Events;
using Prism.Navigation;
using Prism.Services;
using Prism.Services.Dialogs;

namespace BlankApp.Services
{
    public class BaseServices
    {
        public BaseServices(INavigationService navigationService,
                            IDialogService dialogService,
                            IPageDialogService pageDialogService,
                            IEventAggregator eventAggregator)
        {
            NavigationService = navigationService;
            DialogService = dialogService;
            PageDialogService = pageDialogService;
            EventAggregator = eventAggregator;
        }

        public IEventAggregator EventAggregator { get; }

        public INavigationService NavigationService { get; }

        public IDialogService DialogService { get; }

        public IPageDialogService PageDialogService { get; }
    }
}
