package config
{
	import commands.ApplicationStartupCommand;
	import commands.SetupGetCommand;
	import commands.SetupSetCommand;
	import commands.WinampGetCommand;
	import commands.WinampInternetCommand;
	import commands.WinampRefreshCommand;
	import commands.WinampRepeatCommand;
	import commands.WinampSetCommand;
	import commands.WinampShuffleCommand;
	import commands.WinampTimeCommand;
	import commands.WinampVolumeCommand;

	import events.ApplicationEvent;
	import events.WinampEvent;

	import flash.events.Event;

	import mediators.SetupViewMediator;
	import mediators.WinampViewMediator;

	import models.ConfigModel;
	import models.WinampModel;

	import robotlegs.bender.extensions.contextView.ContextView;
	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.framework.api.IConfig;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.api.IInjector;
	import robotlegs.bender.framework.api.LogLevel;

	import views.SetupView;
	import views.WinampView;

	public class AppConfig implements IConfig
	{
		[Inject]
		public var context:IContext;

		[Inject]
		public var injector:IInjector;

		[Inject]
		public var mediatorMap:IMediatorMap;

		[Inject]
		public var commandMap:IEventCommandMap;

		[Inject]
		public var contextView:ContextView;


		public function configure():void
		{
			context.logLevel = LogLevel.DEBUG;

			// model
			injector.map(ConfigModel).asSingleton();
			injector.map(WinampModel).asSingleton();

			// controller
			commandMap.map(ApplicationEvent.APPLICATION_STARTUP).toCommand(ApplicationStartupCommand);

			commandMap.map(WinampEvent.REFRESH_EVENT).toCommand(WinampRefreshCommand);


			commandMap.map(WinampEvent.PLAY_EVENT).toCommand(WinampSetCommand);
			commandMap.map(WinampEvent.PAUSE_EVENT).toCommand(WinampSetCommand);
			commandMap.map(WinampEvent.NEXT_EVENT).toCommand(WinampSetCommand);
			commandMap.map(WinampEvent.PREV_EVENT).toCommand(WinampSetCommand);


			commandMap.map(WinampEvent.SET_SHUFFLE_EVENT).toCommand(WinampSetCommand);

			commandMap.map(WinampEvent.IS_PLAYING_EVENT).toCommand(WinampGetCommand);
			commandMap.map(WinampEvent.GET_CURRENT_TITLE_EVENT).toCommand(WinampGetCommand);

			commandMap.map(WinampEvent.GET_DURATION_EVENT).toCommand(WinampTimeCommand);
			commandMap.map(WinampEvent.GET_CURRENT_TIME_EVENT).toCommand(WinampTimeCommand);

			commandMap.map(WinampEvent.GET_VOLUME_EVENT).toCommand(WinampVolumeCommand);
			commandMap.map(WinampEvent.SET_VOLUME_EVENT).toCommand(WinampVolumeCommand);

			commandMap.map(WinampEvent.GET_SHUFFLE_EVENT).toCommand(WinampShuffleCommand);
			commandMap.map(WinampEvent.SET_SHUFFLE_EVENT).toCommand(WinampShuffleCommand);

			commandMap.map(WinampEvent.GET_REPEAT_EVENT).toCommand(WinampRepeatCommand);
			commandMap.map(WinampEvent.SET_REPEAT_EVENT).toCommand(WinampRepeatCommand);


			commandMap.map(WinampEvent.GET_INTERNET_EVENT).toCommand(WinampInternetCommand);
			commandMap.map(WinampEvent.SAVE_SETUP_EVENT).toCommand(SetupSetCommand);
			commandMap.map(WinampEvent.LOAD_SETUP_EVENT).toCommand(SetupGetCommand);


			// View
			mediatorMap.map(WinampView).toMediator(WinampViewMediator);
			mediatorMap.map(SetupView).toMediator(SetupViewMediator);



		}
	}
}