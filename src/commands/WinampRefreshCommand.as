package commands
{
	import events.WinampEvent;

	import flash.events.Event;
	import flash.events.IEventDispatcher;

	import robotlegs.bender.bundles.mvcs.Command;


	public class WinampRefreshCommand extends Command
	{
		[Inject]
		public var dispatcher:IEventDispatcher;

		override public function execute(): void
		{
			dispatcher.dispatchEvent(new WinampEvent(WinampEvent.GET_CURRENT_TITLE_EVENT));

			dispatcher.dispatchEvent(new WinampEvent(WinampEvent.IS_PLAYING_EVENT));

			dispatcher.dispatchEvent(new WinampEvent(WinampEvent.GET_VOLUME_EVENT));

			dispatcher.dispatchEvent(new WinampEvent(WinampEvent.GET_DURATION_EVENT));
			dispatcher.dispatchEvent(new WinampEvent(WinampEvent.GET_CURRENT_TIME_EVENT));

			dispatcher.dispatchEvent(new WinampEvent(WinampEvent.GET_SHUFFLE_EVENT));
			dispatcher.dispatchEvent(new WinampEvent(WinampEvent.GET_REPEAT_EVENT));
		}


	}
}