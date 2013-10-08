package events
{
	import flash.events.Event;

	public class WinampEvent extends Event
	{
		public static const PLAY_PAUSE_EVENT: String = "playPauseEvent";
		public static const PLAY_EVENT: String = "playEvent";
		public static const PAUSE_EVENT: String = "pauseEvent";
		public static const STOP_EVENT: String = "stopEvent";

		public static const NEXT_EVENT: String = "nextEvent";
		public static const PREV_EVENT: String = "prevEvent";

		public static const IS_PLAYING_EVENT: String = "isPlayingEvent";

		//public static const SET_VOLUME_DOWN_EVENT: String = "volumeDownEvent";
		//public static const SET_VOLUME_UP_EVENT: String = "volumeUpEvent";
		public static const GET_VOLUME_EVENT: String = "getVolumeEvent";
		public static const SET_VOLUME_EVENT: String = "setVolumeEvent";
		public static const VOLUME_CHANGE_EVENT: String = "volumeChaneEvent";

		public static const GET_CURRENT_TIME_EVENT: String = "getCurrentTimeEvent";
		public static const GET_DURATION_EVENT: String = "getDurationEvent";

		public static const GET_SHUFFLE_EVENT: String = "getShuffleEvent";
		public static const SET_SHUFFLE_EVENT: String = "setShuffleEvent";

		public static const GET_REPEAT_EVENT: String = "getRepeatEvent";
		public static const SET_REPEAT_EVENT: String = "setRepeatEvent";

		public static const GET_INTERNET_EVENT: String = "getInternetEvent";

		public static const SAVE_SETUP_EVENT: String = "saveSetupEvent";
		public static const LOAD_SETUP_EVENT: String = "loadSetupEvent";

		public static const REFRESH_EVENT: String = "refreshEvent";






		public static const GET_CURRENT_TITLE_EVENT: String = "getcurrenttitleEvent";



		public function WinampEvent(type: String)
		{
			super(type);
		}

		override public function clone(): Event
		{
			return WinampEvent(type);
		}

	}
}