package mediators
{
	import events.WinampEvent;

	import flash.events.Event;
	import flash.events.MouseEvent;

	import models.ConfigModel;
	import models.WinampModel;

	import robotlegs.bender.bundles.mvcs.Mediator;
	import robotlegs.bender.framework.api.IInjector;

	import views.WinampView;

	public class WinampViewMediator extends Mediator
	{
		[Inject]
		public var view:WinampView;

		[Inject]
		public var winampModel:WinampModel;

		[Inject]
		public var injector:IInjector;

		override public function initialize():void
		{
			injector.injectInto(view);

			view.init();

			view.btnPlay.addEventListener(MouseEvent.CLICK, onPlayPauseEvent);
			view.btnNext.addEventListener(MouseEvent.CLICK, onNextEvent);
			view.btnPrev.addEventListener(MouseEvent.CLICK, onPrevEvent);

			eventMap.mapListener(view.btnVolume.content, 'volumeKnobEvent', onVolEvent);

			view.btnShuffle.addEventListener(Event.CHANGE, onShuffleEvent);
			view.btnRepeat.addEventListener(Event.CHANGE, onRepeatEvent);

			refresh();
		}

		private function refresh():void
		{
			eventDispatcher.dispatchEvent(new WinampEvent(WinampEvent.REFRESH_EVENT));
		}

		private function onPlayPauseEvent(event:MouseEvent):void
		{
			if(winampModel.isPlaying)
				eventDispatcher.dispatchEvent(new WinampEvent(WinampEvent.PAUSE_EVENT));
			else
				eventDispatcher.dispatchEvent(new WinampEvent(WinampEvent.PLAY_EVENT));
		}

		private function onNextEvent(event:MouseEvent):void
		{
			winampModel.btnNextEnable = false;
			eventDispatcher.dispatchEvent(new WinampEvent(WinampEvent.NEXT_EVENT));
		}

		private function onPrevEvent(event:MouseEvent):void
		{
			winampModel.btnPrevEnable = false;
			eventDispatcher.dispatchEvent(new WinampEvent(WinampEvent.PREV_EVENT));
		}

		private function onVolEvent(event:Event):void
		{
			var vol:Number = event.target.vol;
			winampModel.volume = vol*100;
			eventDispatcher.dispatchEvent(new WinampEvent(WinampEvent.SET_VOLUME_EVENT));
		}

		private function onShuffleEvent(event:Event):void
		{
			winampModel.shuffleOn = !winampModel.shuffleOn;
			eventDispatcher.dispatchEvent(new WinampEvent(WinampEvent.SET_SHUFFLE_EVENT));
		}

		private function onRepeatEvent(event:Event):void
		{
			winampModel.repeatOn = !winampModel.repeatOn;
			eventDispatcher.dispatchEvent(new WinampEvent(WinampEvent.SET_REPEAT_EVENT));
		}
	}
}