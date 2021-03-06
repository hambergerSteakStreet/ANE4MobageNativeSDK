/*
*The MIT License (MIT)
*Copyright (c) 2013 DeNA Co., Ltd.
*
*Permission is hereby granted, free of charge, to any person obtaining a copy
*of this software and associated documentation files (the "Software"), to deal
*in the Software without restriction, including without limitation the rights
*to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
*copies of the Software, and to permit persons to whom the Software is
*furnished to do so, subject to the following conditions:
*
*The above copyright notice and this permission notice shall be included in
*all copies or substantial portions of the Software.
*
*THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
*IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
*FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
*AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
*LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
*OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
*THE SOFTWARE.
*/
package com.mobage.air.ad
{
	import com.mobage.air.Mobage;
	import com.mobage.air.Extension;

	public class MobageAdEventReporter
	{
		/**
		 * 
		 * @param eventId
		 * @param onSendEventSuccess	<code>function() :void</code>
		 * @param onError	<code>function(error :ErrorCode) :void</code>
		 * 
		 */		
		public static function sendCustomEvent(eventId :String, onSendEventSuccess :Function,
			onError :Function) :void{
				const funcId :String = 'com.mobage.air.extension.ad.MobageAdEventReporter.sendCustomEvent';
				const sId :String = Mobage.once(funcId, onSendEventSuccess);
				const eId :String = Mobage.once(funcId, onError);
				Extension.call(funcId, eventId, sId, eId);
			}
	}
}
