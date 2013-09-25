package commands
{
	import events.WinampEvent;

	import flash.events.IEventDispatcher;

	import robotlegs.bender.bundles.mvcs.Command;

	public class ApplicationStartupCommand extends Command
	{
		[Inject]
		public var dispatcher:IEventDispatcher;

		override public function execute(): void
		{
			dispatcher.dispatchEvent(new WinampEvent(WinampEvent.LOAD_SETUP_EVENT));
		}
	}
}