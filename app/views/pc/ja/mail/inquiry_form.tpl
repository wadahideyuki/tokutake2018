{include file='../userHeader.tpl'
_description='木の家の新築資料請求・お問い合わせなら長野市のうれし徳武建設まで。長野市の太陽光発電やＯＭソーラー、ゼロエネルギー住宅を県産材・無垢材・自然素材で健康住宅、長持ちするエコ住宅で建てる長野市の地元工務店だから、新築資料請求・お問い合わせならうれし徳武建設です。'
_fixedTitle='資料請求・お問い合わせ｜長野市の新築なら徳武建設'}

				<!-- /mainContents //-->
				<div class="mainContents pageInquiry">
					<div id="bc_navi">
						<ul class="inner">
							<li class="top"><a href="{$appPath}/">HOME</a></li>
							<li>資料請求・お問い合わせ</li>
						</ul>
					</div>


					<div id="inquiry_form" class="entryform cf">
						<div class="inner">
							<h1 class="ttl-lv2">家づくり資料請求・<br>お問い合わせなら徳武建設</h1>

							<form action="{self}" method="post" autocomplete="off" name="form">

								{if $isError}
								<div class="error">
									エラー ： 赤枠で表示中の項目をご確認ください
								</div>
								{/if}

								<p class="note">
										このページはあなたと徳武建設を結ぶ、アクセスページです。<br class="pcBrows">家づくり以外の方でもお気軽にアンケートにお答えください。こちらからの訪問はいたしません。
								</p>

									<table class="tblNo1">
										<tr>
											<th>お名前<img src="{$appPath}/img/required.jpg" alt="必須" /></th>
											<td>
												{$error.class.name}
												<input class="W100P" name="name" type="text" value="{$value.name|escape}" />
												{$error.msg.name}
											</td>
										</tr>
										<tr>
											<th>年齢<img src="{$appPath}/img/required.jpg" alt="必須" /></th>
											<td>
												{$error.class.age}
												<input class="W100P" name="age" type="text" value="{$value.age|escape}" />
												{$error.msg.age}
											</td>
										</tr>
										<tr>
											<th>ご住所<img src="{$appPath}/img/required.jpg" alt="必須" /></th>
											<td>
												{$error.class.address}
												<input class="W100P" name="address" type="text" value="{$value.address|escape}" />
												{$error.msg.address}
											</td>
										</tr>
										<tr>
											<th>メールアドレス<img src="{$appPath}/img/required.jpg" alt="必須" /></th>
											<td>
												{$error.class.mail}
												<input class="W100P" name="mail" type="text" value="{$value.mail|escape}" />
												{$error.msg.mail}
											</td>
										</tr>
										<tr>
											<th>電話番号<img src="{$appPath}/img/required.jpg" alt="必須" /></th>
											<td>
												{$error.class.phone}
												<input class="W100P" name="phone" type="text" value="{$value.phone|escape}" />
												{$error.msg.phone}
											</td>
										</tr>
										<tr>
											<th>言いたい放題</th>
											<td>
												{$error.class.body}
												<textarea class="W100P" id="body" name="body" cols="45" rows="10">{$value.body|escape}</textarea>
												{$error.msg.body}
											</td>
										</tr>
									</table>


<!--
									<table class="tblNo2">
										<tr>
											<th>うれし徳武建設の家づくりについて良く分かる資料を請求したい（複数回答可）</th>
										</tr>
										<tr>
											<td class="radio narabi">
												<div class="flex-box flexWrap">
											{$error.class.brochure}
												{html_checkboxes name='brochure' options=$metafile.brochure selected=$value.brochure}
											{$error.msg.brochure}
												</div>
											</td>
										</tr>
										<tr>
											<th>徳武建設の何に興味をもたれましたか？（複数回答可）</th>
										</tr>
										<tr>
											<td class="radio narabi">
												<div class="flex-box flexWrap">
											{$error.class.interest}
												{html_checkboxes name='interest' options=$metafile.interest selected=$value.interest}
											{$error.msg.interest}
												</div>
											</td>
										</tr>
										<tr>
											<th>徳武建設の見学会・イベントに参加したい　<span class="hint">⇒ 家づくりの参考になります</span></th>
										</tr>
										<tr>
											<td class="radio">
												{$error.class.join}
												<label class="spMB2P">
													<input type="radio" value="1" name="join"{checked var=$value.join value='1'} />
													{$metafile.join.1}
												</label>
												→ 希望日
												<input type="text" name="join_txt" value="{$value.join_txt|escape}" class="spW100P" />
												<br>
												<label class="spMT5P">
													<input type="radio" value="2" name="join"{checked var=$value.join value='2'} />
													{$metafile.join.2}
												</label>
												{$error.msg.join}
											</td>
										</tr>
										<tr>
											<th>OMソーラーハウス「杜の家 生活展示場」を見学したい　<span class="hint">⇒ どんな会社（社長）かわかります</span></th>
										</tr>
										<tr>
											<td class="radio">
											{$error.class.stay}
												<label class="spMB2P">
													<input type="radio" value="1" name="stay"{checked var=$value.stay value='1'} />
													{$metafile.stay.1}
												</label>
												→ 希望日
												<input type="text" name="stay_txt" value="{$value.stay_txt|escape}" class="spW100P" />
												<br>
												<label class="spMT5P">
													<input type="radio" value="2" name="stay"{checked var=$value.stay value='2'} />
													{$metafile.stay.2}
												</label>
											{$error.msg.stay}
											</td>
										</tr>
										<tr>
											<th>イマコレ（賃貸計画・暮らし）相談会に申込みたい　<span class="hint">⇒ 今を知りこれからを考えるお手伝いをします</span></th>
										</tr>
										<tr>
											<td class="radio">
											{$error.class.advice}
												<label class="spMB2P">
													<input type="radio" value="1" name="advice"{checked var=$value.advice value='1'} />
													{$metafile.advice.1}
												</label>
												→ 希望日
												<input type="text" name="advice_txt" value="{$value.advice_txt|escape}" class="spW100P" />
												<br>
												<label class="spMT5P">
													<input type="radio" value="2" name="advice"{checked var=$value.advice value='2'} />
													{$metafile.advice.2}
												</label>
											{$error.msg.advice}
											</td>
										</tr>
										<tr>
											<th>住宅計画はありますか？</th>
										</tr>
										<tr>
											<td class="radio narabi">
											{$error.class.plan}
												{html_radios name='plan' options=$metafile.plan selected=$value.plan}
											{$error.msg.plan}
											</td>
										</tr>
										<tr>
											<th>住宅建築予定地はありますか？</th>
										</tr>
										<tr>
											<td class="radio cf">
												<div class="disIBBox">
													<div>
														{$error.class.place}
															{html_checkboxes name='place' options=$metafile.place selected=$value.place}
															→ <input type="text" name="place_txt" value="{$value.place_txt|escape}" class="W150 spW120" /> 市
														{$error.msg.place}
													</div>
													<div>
														{$error.class.place_search}
															{html_checkboxes name='place_search' options=$metafile.place_search selected=$value.place_search}
															→ <input type="text" name="place_search_txt" value="{$value.place_search_txt|escape}" class="W150 spW120" /> 方面
														{$error.msg.place_search}
													</div>
												</div>
											</td>
										</tr>
									</table>
-->

									<p class="form_notice">
										この申し込みページはSSLに対応しています。 お客様の大切なデータは暗号化して通信されます。 安心してお申込みください。
									</p>

									<div class="email_notice">
										<h4>携帯メールをご利用のお客さまへのお願い</h4>
										<p>
											ドメイン指定受信を設定されている方は、弊社からのメールが
											届かない場合がありますので、「@tokutake-kensetsu.co.jp」の
											メールが受け取れるようドメイン指定受信の設定を行ってください。
										</p>
										<p>
											フォームの内容を送信後、すぐに自動返信メールが送信されます。
											メールが届かない場合はPCのメールアドレスで再度送信いただくか、
											またはお電話にてご連絡ください。
										</p>
									</div>

									<div class="btn taC">
										{$_token_input}
										<input type="hidden" name="id" value="{$value.id|escape}" />
										<input class="btn1" type="submit" name="_mode_mail_submit_" value="上記内容で送信する" />
									</div>

								</form>

								


							</div>
						</div>
					</div>

{include file='../userFooter.tpl' pagetopLink='1'}