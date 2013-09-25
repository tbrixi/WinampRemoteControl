package commands
{
	import flash.events.Event;


	public class WinampInternetCommand extends WinampCommand
	{
		override public function execute(): void
		{
			urlLoader.addEventListener(Event.COMPLETE, onCompleateHandler);

			urlRequest.url = "http://" + configModel.ip + ":" + configModel.port + "/" + "internet" +"?p=" + configModel.password;
			urlLoader.load(urlRequest);
		}

		public function onCompleateHandler(e:Event):void
		{
			configModel.isConnected = e.target.data == 1 ? true:false;
		}
	}
}