package commands
{
	import events.WinampEvent;

	import flash.events.Event;


	public class WinampTimeCommand extends WinampCommand
	{
		override public function execute(): void
		{
			switch(event.type)
			{
				case WinampEvent.GET_DURATION_EVENT:
				{
					urlLoader.addEventListener(Event.COMPLETE, onDurationHandler);

					urlRequest.url = "http://" + configModel.ip + ":" + configModel.port + "/" + "getoutputtime" +"?p=" + configModel.password + "&frmt=1";
					urlLoader.load(urlRequest);
					break;
				}

				case WinampEvent.GET_CURRENT_TIME_EVENT:
				{
					urlLoader.addEventListener(Event.COMPLETE, onCurrentTimeHandler);

					urlRequest.url = "http://" + configModel.ip + ":" + configModel.port + "/" + "getoutputtime" +"?p=" + configModel.password + "&frmt=0";
					urlLoader.load(urlRequest);
					break;
				}

				default:
				{
					break;
				}
			}
		}

		public function onDurationHandler(e:Event):void
		{
			var time:uint = e.target.data;
			winampModel.duration = time;
		}

		public function onCurrentTimeHandler(e:Event):void
		{
			var data:String = e.target.data;
			if(data == "-1") return;

			var time:int = int(data);
			time = time/1000;
			winampModel.currentTime = time;
			winampModel.timerStart();
		}
	}
}