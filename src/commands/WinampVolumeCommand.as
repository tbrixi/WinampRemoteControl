package commands
{
	import events.WinampEvent;

	import flash.events.Event;
	import flash.events.IEventDispatcher;

	public class WinampVolumeCommand extends WinampCommand
	{
		[Inject]
		public var dispatcher:IEventDispatcher;

		override public function execute(): void
		{
			switch(event.type)
			{
				case WinampEvent.GET_VOLUME_EVENT:
				{
					urlLoader.addEventListener(Event.COMPLETE, onCompleateHandler);
					urlRequest.url = "http://" + configModel.ip + ":" + configModel.port + "/" + "getvolume" +"?p=" + configModel.password;
					urlLoader.load(urlRequest);
					break;
				}

				case WinampEvent.SET_VOLUME_EVENT:
				{
					var vol:int = winampModel.volume * 255 / 100;
					trace("WinampSetCommand, vol: "+vol);
					urlRequest.url = "http://" + configModel.ip + ":" + configModel.port + "/" + "setvolume" +"?p=" + configModel.password + "&level=" + vol;
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
			var winAmpVol:uint = e.target.data;
			winampModel.volume = (winAmpVol/255) * 100;
			winampModel.volVisible = true;

		}
	}
}