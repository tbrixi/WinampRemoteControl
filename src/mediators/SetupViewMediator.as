package mediators
{
	import events.WinampEvent;

	import models.ConfigModel;
	import models.WinampModel;

	import robotlegs.bender.bundles.mvcs.Mediator;
	import robotlegs.bender.framework.api.IInjector;

	import views.SetupView;
	import views.WinampView;

	public class SetupViewMediator extends Mediator
	{
		[Inject]
		public var view:SetupView;

		[Inject]
		public var model:ConfigModel;

		[Inject]
		public var injector:IInjector;

		override public function initialize():void
		{
			injector.injectInto(view);

			view.addEventListener(WinampEvent.SAVE_SETUP_EVENT, onSaveSetupEvent);
		}

		private function onSaveSetupEvent(event:WinampEvent):void
		{
			eventDispatcher.dispatchEvent(new WinampEvent(WinampEvent.SAVE_SETUP_EVENT));
		}
	}
}