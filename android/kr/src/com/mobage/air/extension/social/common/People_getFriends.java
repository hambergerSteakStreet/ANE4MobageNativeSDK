/*******************************************************************************
 * The MIT License (MIT)
 * Copyright (c) 2013 DeNA Co., Ltd.
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 ******************************************************************************/
package com.mobage.air.extension.social.common;

import java.util.ArrayList;

import org.json.JSONArray;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.mobage.air.extension.ArgsParser;
import com.mobage.air.extension.Convert;
import com.mobage.air.extension.Dispatcher;
import com.mobage.android.Error;
import com.mobage.android.social.PagingOption;
import com.mobage.android.social.PagingResult;
import com.mobage.android.social.User;
import com.mobage.android.social.common.People;
import com.mobage.android.social.common.People.OnGetUsersComplete;

public class People_getFriends implements FREFunction {

	@Override
	public FREObject call(final FREContext context, FREObject[] args) {
		try {
			ArgsParser a = new ArgsParser(args);
			String userId = a.nextString();
			User.Field[] fields = a.nextUserFields();
			PagingOption option = a.nextPagingOption();
			final String onGetUsersSuccessId = a.nextString();
			final String onErrorId = a.nextString();
			a.finish();

			OnGetUsersComplete cb = new OnGetUsersComplete() {
				@Override
				public void onSuccess(ArrayList<User> users, PagingResult result) {
					try {
						JSONArray args = new JSONArray();
						args.put(Convert.userListToJSON(users));
						args.put(Convert.pagingResultToJSON(result));
						Dispatcher.dispatch(context, onGetUsersSuccessId, args);
					} catch (Exception e) {
						Dispatcher.exception(context, e);
					}
				}

				@Override
				public void onError(Error error) {
					Dispatcher.dispatch(context, onErrorId, error);
				}
			};
			People.getFriends(userId, fields, option, cb);
		} catch (Exception e) {
			Dispatcher.exception(context, e);
		}
		return null;
	}
}
