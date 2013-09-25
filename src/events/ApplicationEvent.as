package events
{
	import flash.events.Event;


	public class ApplicationEvent extends Event
	{
		public static const APPLICATION_STARTUP: String = "applicationStartup";
		public static const APPLICATION_SHUTDOWN: String = "applicationShutdown";

		public function ApplicationEvent(type: String)
		{
			super(type);
		}

		override public function clone(): Event
		{
			return ApplicationEvent(type);
		}

	}
}