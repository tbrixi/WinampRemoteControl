package models
{
	[Bindable]
	public class ConfigModel
	{

		public var ip:String = "192.168.1.20";

		public var port:String = "4800";

		public var password:String = "heslo";

		public var isConnected:Boolean = false;


		public function ConfigModel()
		{

		}
	}
}