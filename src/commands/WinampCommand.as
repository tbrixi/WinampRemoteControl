package commands
{
	import events.WinampEvent;

	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLVariables;

	import models.ConfigModel;
	import models.WinampModel;

	import robotlegs.bender.bundles.mvcs.Command;

	public class WinampCommand extends Command
	{
		[Inject]
		public var event:WinampEvent;

		[Inject]
		public var winampModel:WinampModel;

		[Inject]
		public var configModel:ConfigModel;

		public var urlLoader:URLLoader = new URLLoader();
		public var urlRequest:URLRequest = new URLRequest();
		public var urlVariables:URLVariables = new URLVariables();

		public function WinampCommand():void
		{
			urlRequest.method = "GET";
			urlLoader.addEventListener(IOErrorEvent.IO_ERROR, onFaultHandler);
		}

		public function onFaultHandler(e:IOErrorEvent):void
		{
			trace("Error: WinampCommand", e.text);
		}
	}
}