package commands
{
	import events.WinampEvent;

	import flash.events.Event;

	import utils.ValueConverter;


	public class WinampGetCommand extends WinampCommand
	{
		override public function execute(): void
		{
			switch(event.type)
			{
				case WinampEvent.GET_CURRENT_TITLE_EVENT:
				{
					sendRequest("getcurrenttitle");
					break;
				}

				case WinampEvent.IS_PLAYING_EVENT:
				{
					sendRequest("isplaying");
					break;
				}

				default:
				{
					break;
				}
			}
		}

		public function sendRequest(request:String):void
		{
			urlLoader.addEventListener(Event.COMPLETE, onCompleateHandler);

			urlRequest.url = "http://" + configModel.ip + ":" + configModel.port + "/" + request +"?p=" + configModel.password;
			urlLoader.load(urlRequest);
		}

		public function onCompleateHandler(e:Event):void
		{
			switch(event.type)
			{
				case WinampEvent.GET_CURRENT_TITLE_EVENT:
				{
					var str:String = e.target.data;
					var lenPos:uint = str.indexOf(". ",0);
					winampModel.playlistPosition = str.substring(0, lenPos);
					var lenArt:uint = str.indexOf(" - ",0);
					winampModel.artist = str.substring(lenPos+2, lenArt);
					winampModel.title = str.substring(lenArt+3, str.length);
					break;
				}

				case WinampEvent.IS_PLAYING_EVENT:
				{
					winampModel.isPlaying = e.target.data == 1 ? true:false;
					break;
				}
			}
		}
	}
}