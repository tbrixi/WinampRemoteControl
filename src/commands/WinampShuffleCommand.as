package commands
{
	import events.WinampEvent;

	import flash.events.Event;
	import flash.events.IEventDispatcher;

	public class WinampShuffleCommand extends WinampCommand
	{
		[Inject]
		public var dispatcher:IEventDispatcher;

		override public function execute(): void
		{
			switch(event.type)
			{
				case WinampEvent.GET_SHUFFLE_EVENT:
				{
					urlLoader.addEventListener(Event.COMPLETE, onCompleateHandler);
					urlRequest.url = "http://" + configModel.ip + ":" + configModel.port + "/" + "shuffle_status" +"?p=" + configModel.password;
					urlLoader.load(urlRequest);
					break;
				}

				case WinampEvent.SET_SHUFFLE_EVENT:
				{
					var shuffle:uint = winampModel.shuffleOn ? 1:0;
					urlRequest.url = "http://" + configModel.ip + ":" + configModel.port + "/" + "shuffle" +"?p=" + configModel.password + "&enable=" + shuffle;
					trace("WinampShuffleCommand, set shuffle: "+shuffle)
					urlLoader.load(urlRequest);
					break;
				}

				default:
				{
					break;
				}
			}
		}

		public function onCompleateHandler(e:Event):void
		{
			winampModel.shuffleOn = e.target.data == "1" ? true:false;
		}
	}
}