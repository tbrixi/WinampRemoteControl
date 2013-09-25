package commands
{
	import flash.events.Event;
	import flash.net.SharedObject;


	public class SetupSetCommand extends WinampCommand
	{
		override public function execute():void
		{
			var so:SharedObject = SharedObject.getLocal("HTPC_control");

			so.data['ip'] = configModel.ip;
			so.data['port'] = configModel.port;
			so.data['password'] = configModel.password;

			so.flush();
		}
	}
}