package commands
{
	import events.WinampEvent;

	import flash.events.Event;
	import flash.events.IEventDispatcher;

	public class WinampRepeatCommand extends WinampCommand
	{
		[Inject]
		public var dispatcher:IEventDispatcher;

		override public function execute(): void
		{
			switch(event.type)
			{
				case WinampEvent.GET_REPEAT_EVENT:
				{
					urlLoader.addEventListener(Event.COMPLETE, onCompleateHandler);
					urlRequest.url = "http://" + configModel.ip + ":" + configModel.port + "/" + "repeat_status" +"?p=" + configModel.password;
					urlLoader.load(urlRequest);
					break;
				}

				case WinampEvent.SET_REPEAT_EVENT:
				{
					var repeat:uint = winampModel.repeatOn ? 1:0;
					urlRequest.url = "http://" + configModel.ip + ":" + configModel.port + "/" + "repeat" +"?p=" + configModel.password + "&enable=" + repeat;
					trace("WinampRepeatCommand, set repeat: "+repeat)
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
			winampModel.repeatOn = e.target.data == "1" ? true:false;
		}
	}
}