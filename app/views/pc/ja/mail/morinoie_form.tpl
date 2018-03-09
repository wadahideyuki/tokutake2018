{include file='../userHeader.tpl' _title='杜の家モデルハウス見学申込'}

				<!-- /mainContents //-->

				<div class="mainContents pageInquiry">
					<div id="bc_navi">
						<ul class="inner">
						<li class="top"><a href="{$appPath}/">HOME</a></li>
						<li>杜の家モデルハウス見学申込</li>
						</ul>
					</div>




					<div id="inquiry_form" class="entryform cf">

					<h1 class="ttl-lv2">杜の家モデルハウス見学申込</h1>
						<form action="{self}" method="post" autocomplete="off" name="form" class="inner">
						
							{if $isError}
							<div class="error">
								エラー ： 赤枠で表示中の項目をご確認ください
							</div>
							{/if}
						
							<p class="note">
									{* このページはあなたと徳武建設を結ぶ、アクセスページです。家づくり以外の方でもお気軽にアンケートにお答えください。*}
							</p>
							
								<table style="margin-bottom:48px;">
									<tr>
										<th>お名前<img src="{$appPath}/img/required.jpg" alt="必須" /></th>
										<td>
											{$error.class.name}
											<input name="name" type="text" value="{$value.name|escape}" />
											{$error.msg.name}
										</td>
									</tr>
									<tr>
										<th>性別<img src="{$appPath}/img/required.jpg" alt="必須" /></th>
										<td class="radio">
											{$error.class.gender}
												{html_radios name='gender' options=$metafile.gender selected=$value.gender}
											{$error.msg.gender}
										</td>
									</tr>
									<tr>
										<th>年齢<img src="{$appPath}/img/required.jpg" alt="必須" /></th>
										<td>
											{$error.class.age}
											<input name="age" type="text" value="{$value.age|escape}" />
											{$error.msg.age}
										</td>
									</tr>
									<tr>
										<th>ご住所<img src="{$appPath}/img/required.jpg" alt="必須" /></th>
										<td>
											{$error.class.address}
											<input name="address" type="text" value="{$value.address|escape}" />
											{$error.msg.address}
										</td>
									</tr>
									<tr>
										<th>メールアドレス<img src="{$appPath}/img/required.jpg" alt="必須" /></th>
										<td>
											{$error.class.mail}
											<input name="mail" type="text" value="{$value.mail|escape}" />
											{$error.msg.mail}
										</td>
									</tr>
									<tr>
										<th>電話番号<img src="{$appPath}/img/required.jpg" alt="必須" /></th>
										<td>
											{$error.class.phone}
											<input name="phone" type="text" value="{$value.phone|escape}" />
											{$error.msg.phone}
										</td>
									</tr>
									<tr>
										<th>備考</th>
										<td>
											{$error.class.body}
											<textarea id="body" name="body" cols="45" rows="10">{$value.body|escape}</textarea>
											{$error.msg.body}
										</td>
									</tr>
								</table>

								<table>
									<tr>
										<th>徳武建設の見学会・イベントに参加したい</th>
									</tr>
									<tr>
										<td class="radio">
										{$error.class.join}
											{html_radios name='join' options=$metafile.join selected=$value.join}
										{$error.msg.join}
										</td>
									</tr>
									<tr>
										<th>OMソーラーハウス「杜の家」に宿泊体験したい</th>
									</tr>
									<tr>
										<td class="radio">
										{$error.class.stay}
											{html_radios name='stay' options=$metafile.stay selected=$value.stay}
										{$error.msg.stay}
										</td>
									</tr>
									<tr>
										<th>うれし徳武建設の家づくりについて良く分かる資料を請求したい</th>
									</tr>
									<tr>
										<td class="radio">
										{$error.class.brochure}
											{html_radios name='brochure' options=$metafile.brochure selected=$value.brochure}
										{$error.msg.brochure}
										</td>
									</tr>
									<tr>
										<th>徳武建設の何に興味をもたれましたか？（複数回答可）</th>
									</tr>
									<tr>
										<td class="radio">
										{$error.class.interest}
											{html_checkboxes name='interest' options=$metafile.interest selected=$value.interest}
										{$error.msg.interest}
										</td>
									</tr>
									<tr>
										<th>住宅計画はありますか？</th>
									</tr>
									<tr>
										<td class="radio">
										{$error.class.plan}
											{html_radios name='plan' options=$metafile.plan selected=$value.plan}
										{$error.msg.plan}
										</td>
									</tr>
									<tr>
										<th>住宅建築予定はありますか？</th>
									</tr>
									<tr>
										<td class="radio">
										{$error.class.intend}
											{html_radios name='intend' options=$metafile.intend selected=$value.intend}
										{$error.msg.intend}
										</td>
									</tr>
									<tr>
										<th>住宅建築予定地はありますか？</th>
									</tr>
									<tr>
										<td class="radio">
										{$error.class.place}
											{html_radios name='place' options=$metafile.place selected=$value.place}
										{$error.msg.place}
										</td>
									</tr>
									<tr>
										<th>上記質問で住宅建築予定地が「ある」とお答えいただいた方</th>
									</tr>
									<tr>
										<td>
										{$error.class.place_txt}
											住宅建設予定地 <input name="place_txt" type="text" value="{$value.place_txt|escape}" style="width:160px" /> 市
										{$error.msg.place_txt}
										</td>
									</tr>
									<tr>
										<th>上記質問で住宅建築予定地を「探している」とお答えいただいた方</th>
									</tr>
									<tr>
										<td>
										{$error.class.place_search}
											土地希望地 <input name="place_search" type="text" value="{$value.place_search|escape}" style="width:160px" /> 方面
										{$error.msg.place_search}
										</td>
									</tr>
								</table>
								<p class="note">
									この申し込みページはSSLに対応しています。 お客様の大切なデータは暗号化して通信されます。 安心してお申込みください。
								</p> 

								<div class="btn taC">
									{$_token_input}
									<input type="hidden" name="id" value="{$value.id|escape}" />
									<input class="btn1" type="submit" name="_mode_mail_submit_" value="上記内容で送信する" />
								</div>
								
							</form>
							

						</div>
					</div>

{include file='../userFooter.tpl' pagetopLink='1'}
