package commands
{
	import events.ApplicationEvent;
	import events.WinampEvent;

	import flash.events.Event;
	import flash.events.IEventDispatcher;

	public class WinampSetCommand extends WinampCommand
	{
		[Inject]
		public var dispatcher:IEventDispatcher;

		override public function execute(): void
		{
			trace("WinampSetCommand execute, event: "+ event.type);

			urlLoader.addEventListener(Event.COMPLETE, onCompleateHandler);

			switch(event.type)
			{
				case WinampEvent.PLAY_EVENT:
				{
					sendRequest("play");
					break;
				}

				case WinampEvent.STOP_EVENT:
				{
					sendRequest("stop");
					break;
				}

				case WinampEvent.PAUSE_EVENT:
				{
					sendRequest("pause");
					break;
				}

				case WinampEvent.NEXT_EVENT:
				{
					sendRequest("next");
					break;
				}

				case WinampEvent.PREV_EVENT:
				{
					sendRequest("prev");
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
			urlRequest.url = "http://" + configModel.ip + ":" + configModel.port + "/" + request +"?p=" + configModel.password;
			urlLoader.load(urlRequest);
		}

		public function onCompleateHandler(e:Event):void
		{
			switch(event.type)
			{
				case WinampEvent.PLAY_EVENT:
				{
					winampModel.isPlaying = e.target.data == "1" ? true:false;
					winampModel.timerStart();
					break;
				}

				case WinampEvent.STOP_EVENT:
				{
					winampModel.isPlaying = e.target.data == "1" ? false:true;
					winampModel.timerStop();
					break;
				}

				case WinampEvent.PAUSE_EVENT:
				{
					winampModel.isPlaying = e.target.data == "1" ? false:true;

					if(!winampModel.isPlaying)
						winampModel.timerStop();
					break;
				}

				case WinampEvent.NEXT_EVENT:
				{
					winampModel.btnNextEnable = true;
					winampModel.timerStop();
					refresh();

					break;
				}

				case WinampEvent.PREV_EVENT:
				{
					winampModel.btnPrevEnable = true;
					winampModel.timerStop();
					refresh();

					break;
				}
			}
		}

		private function refresh():void
		{
			dispatcher.dispatchEvent(new WinampEvent(WinampEvent.REFRESH_EVENT));
		}
	}
}