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
package com.mobage.air.social.kr
{
    import com.mobage.air.util.Enum;
    
    /**
     * 
     * Data structure for Gravity.
     * specify the corner in which to display the button
     * 
     */
    public final class Gravity extends Enum {
        public static const BOTTOM_LEFT	:Gravity    = new Gravity("BOTTOM_LEFT");
        public static const BOTTOM_RIGHT :Gravity   = new Gravity("BOTTOM_RIGHT");
        public static const TOP_LEFT :Gravity       = new Gravity("TOP_LEFT");
        public static const TOP_RIGHT :Gravity      = new Gravity("TOP_RIGHT");
        
        public function Gravity(name :String) {
            super(name.toUpperCase());
        }
    }
}

