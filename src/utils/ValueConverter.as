package utils
{

	public class ValueConverter
	{


		public static function secToHms(timeInSec:int):String
		{
			var h:int = timeInSec / 3600;
			var m:int = timeInSec % 3600 / 60;
			var s:int = timeInSec % 60;

			return (h>0 ? (h + ":") : "")
				+ ((h>0 && m<10) ? "0" : "")
				+ m + ":"
				+ (s<10 ? "0" : "")
				+ s;
		}

		public function hmsToSec(hms:String):uint
		{
			var result:Array = hms.split(/:/);
			if(result.length == 3)
			{
				var h:int = result[0];
				var m:int = result[1];
				var s:int = result[2];
			}
			return h*3600 + m*60 + s;
		}

		public function digestHexColor(color:String):Number
		{
			var col:Number = parseInt(color.substr(1), 16);

			if (isNaN(col))
				col = 0xffffff;
			return col;
		}

		public function volumeDataTip(item:Object):String
		{
			return "Volume: " + uint(item.toString()) + "%";
		}

		public function formatDate(str:String):String
		{
			//2012 01 09 23 09 32
			var yyyy:String = str.substr(0,4);
			var mm:String = str.substr(4,2);
			var dd:String = str.substr(6,2);
			var hh:String = str.substr(8,2);
			var min:String = str.substr(10,2);
			var sec:String = str.substr(12,2);

			var date:String = yyyy+"."+mm+"."+dd+" "+hh+":"+min+":"+sec;

			return date;
		}

		public function getFileType(fileName:String):String
		{
			var fileNameLen:uint = fileName.length;
			var fileType:String = fileName.substr(fileNameLen-3, fileNameLen);
			fileType = fileType.toLowerCase();

			return fileType;
		}




	}
}