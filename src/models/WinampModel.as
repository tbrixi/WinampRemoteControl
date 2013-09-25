package models
{
	import events.WinampEvent;

	import flash.events.IEventDispatcher;
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	import utils.ValueConverter;

	[Bindable]
	public class WinampModel
	{
		[Inject]
		public var dispatcher:IEventDispatcher;

		public var isPlaying:Boolean = false;
		public var currentTime:int = 0;
		public var duration:int = 0;

		public var playlistPosition:String = "1";
		public var artist:String = "Artist";
		public var title:String = "Title";

		public var volume:uint = 90; // 0-100 %
		public var volVisible:Boolean = false;


		public var btnNextEnable:Boolean = true;
		public var btnPrevEnable:Boolean = true;

		public var shuffleOn:Boolean = true;
		public var repeatOn:Boolean = true;


		private var timer:Timer;

		public function WinampModel()
		{
			timer = new Timer(1000,0);
			timer.addEventListener(TimerEvent.TIMER, onTimer);
		}

		public function timerStart():void
		{
			timer.stop();
			timer.start();
		}

		public function timerStop():void
		{
			timer.stop();
		}

		private function onTimer(e:TimerEvent):void
		{
			currentTime = currentTime + 1;
			if(currentTime >= duration)
			{
				timer.stop();
				refresh();
			}
		}

		private function refresh():void
		{
			dispatcher.dispatchEvent(new WinampEvent(WinampEvent.REFRESH_EVENT));
		}

//		public function onPlay():void
//		{
//			isPlaying = !isPlaying;
//		}

//		public function onPause():void
//		{
//			isPlaying = false;
//		}
//
//		public function onStop():void
//		{
//			isPlaying = false;
//		}
	}
}