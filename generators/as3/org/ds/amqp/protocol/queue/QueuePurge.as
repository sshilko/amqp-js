/**
---------------------------------------------------------------------------

Copyright (c) 2009 Dan Simpson

Auto-Generated @ Tue Jul 28 23:54:30 -0700 2009.  Do not edit this file, extend it you must.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

---------------------------------------------------------------------------
**/

/*
Documentation

        This method removes all messages from a queue which are not awaiting
        acknowledgment.
      
*/
package org.ds.amqp.protocol.queue
{
	import flash.utils.ByteArray;
	import org.ds.amqp.datastructures.*;
	import org.ds.amqp.protocol.Method;
	import org.ds.amqp.transport.Buffer;
	
	public dynamic class QueuePurge extends Method
	{
		public static var EVENT:String = "50/30";

		//
		public var reserved1               :uint = 0;

		//
		public var queue                   :String = "";

		//
		public var noWait                  :Boolean = false;

		
		public function QueuePurge() {
			_classId  = 50;
			_methodId = 30;
			
			_synchronous = true;

			_responses = [QueuePurgeOk];

		}


		public override function writeArguments(buf:Buffer):void {

			buf.writeShortInt(this.reserved1);
			buf.writeShortString(this.queue);
			buf.writeBit(this.noWait);
		}
		
		public override function readArguments(buf:Buffer):void {

			this.reserved1        = buf.readShortInt();
			this.queue            = buf.readShortString();
			this.noWait           = buf.readBit();
		}
		
		public override function print():void {
			var props:Array = [
				"reserved1","queue","noWait"
			];
			printObj("QueuePurge", props);
		}

	}
}