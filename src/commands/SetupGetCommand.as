package commands
{
	import flash.events.Event;
	import flash.net.SharedObject;


	public class SetupGetCommand extends WinampCommand
	{
		override public function execute():void
		{
			var so:SharedObject = SharedObject.getLocal("HTPC_control");

			configModel.ip = so.data['ip'];
			configModel.port = so.data['port'];
			configModel.password = so.data['password'];
		}
	}
}