{include file='../userHeader.tpl' _subTitle = $event.title}

		<link rel="stylesheet" href="../../../../../htdocs/css/layout.css" />

			<div class="mainContents pageEventDetail">

				<div id="bc_navi">
				<ul class="inner">
					<li class="top"><a href="{$appPath}/">HOME</a></li>
					{if $param._cal}
					<li><a href="{$appPath}/event/calendar/">イベントカレンダー</a></li>
					{else}
					<li><a href="{$appPath}/event/listup/">見学会とイベント情報</a></li>
					{/if}

					<li>{$event.title|escape}</li></ul>
				</div>

				<div id="event">
					<div class="eventHeader">
					<div class="event_title_wrapper cf">
						<h1 class="event_title">{if $event.past}{else}<div class="reserve_required"><span>{if $event.reservation}要予約{else}予約不要{/if}</span></div>{/if}{$event.title|escape}</h1>
						<div class="date_time">

								{if $event.date_text}
								<div class="detail_date_txt">
									{$event.date_text|escape}
								</div>
								{else}
								<div class="detail_date">
									{$event.from_date|datetime:'n/j'}<img src="{$appPath}/img/week_{$event.from_date_week}{if $event.from_date_holiday}s{/if}.jpg" alt="" style="width:36px;margin-left:4px" /
									>{if $event.term == 2}・{elseif $event.term == 3}～{/if}{if $event.term == 1}{else}{$event.to_date|datetime:'n/j'}<img src="{$appPath}/img/week_{$event.to_date_week}{if $event.to_date_holiday}s{/if}.jpg" alt="" style="width:36px;;margin-left:4px" />{/if}
								</div>
								{/if}

							<div class="opening_time">
								{$event.opening_time|escape}
							</div>

						</div>
					</div>
						<ul class="contact">

							{if $event.past}
							<li>終了しました</li>
							{else}
							<li><a href="#form">参加予約</a></li>
							<li><a href="#tel" >電話お問合せ</a></li>
							<li><a href="mailto:morinoie@topaz.ocn.ne.jp">メールお問合せ</a></li>
							{/if}
						</ul>


					</div>

				
				
					<article>

						{$event.descriptions|escape|nl2br|autolink:'_blank'}

						<p>
							{$event.body|escape|nl2br|autolink:'_blank'}
						</p>

						{section name='file' loop=$files}

							{if $smarty.section.file.first}
							<ul class="file">
							{/if}
								<li><a href="{$appPath}/{$param.controller}/file/?id={$event.id}&amp;file={$files[file].escapeName}"{$files[file].target}>{$files[file].icon}{$files[file].name}</a></li>
							{if $smarty.section.file.last}
							</ul>
							{/if}

						{/section}

						</article>

						<aside>

							{section name='image' loop=$images}
							<a href="{$appPath}/images/{$param.controller}/{$event.id}/{$images[image].file}" rel="lightbox[a]" title="{$images[image].caption}">
								<img src="{$appPath}/images/{$param.controller}/{$event.id}/{$images[image].tmb}" title="{$images[image].caption}" />
							</a>
							<p class="caption">
								{$images[image].caption}
							</p>
							{/section}

						</aside>

					</div>


					{if $event.past}

					{else}


					<div class=" pageInquiry">

						{$isError|if:'<div class="error">エラー ： 赤いワクで表示されている項目をご確認ください</div>':''}

						<form action="{self}" method="post" class="entryform" >

						<h2 class="ttl-lv2">
							{if $event.type == 1}{else}イベント{/if}参加予約フォーム
							<span>お客様の連絡先をご入力ください</span>
						</h2>
							<table>
								<tr>
									<th>{if $event.type == 1}ギャラリー・教室名{else}イベント名{/if}</th>
									<td>
										{$event.title|escape|default:'-'}
										<input name="id" type="hidden" value="{$value.id|escape}" />
									</td>
								</tr>
								{if $event.type == 1}
								{else}
								<tr>
									<th>ご希望日時{if $event.reservation}<img src="{$appPath}/img/required.jpg" alt="必須" />{/if}</th>
									<td>
										{$error.class.date}
										<input name="date" type="text" value="{$value.date|escape}" class="w100p" />
										{$error.msg.date}
									</td>
								</tr>
								{/if}
								<tr>
									<th class="required">お名前<img src="{$appPath}/img/required.jpg" alt="必須" /></th>
									<td>
										{$error.class.name}
										<input id="name" name="name" type="text" value="{$value.name|escape}" class="w100p" />
										{$error.msg.name}
									</td>
								</tr>
								<tr>
									<th class="required">ふりがな<img src="{$appPath}/img/required.jpg" alt="必須" /></th>
									<td>
										{$error.class.name_kana}
										<input name="name_kana" type="text" value="{$value.name_kana|escape}" class="w100p" />
										{$error.msg.name_kana}
									</td>
								</tr>
								<tr>
									<th class="required">ご住所{if $event.reservation}<img src="{$appPath}/img/required.jpg" alt="必須" />{/if}</th>
									<td>
										{$error.class.address}
										<input name="address" type="text" value="{$value.address|escape}" class="w100p" />
										{$error.msg.address}
									</td>
								</tr>
								<tr>
									<th class="required">メールアドレス<img src="{$appPath}/img/required.jpg" alt="必須" /></th>
									<td>
										{$error.class.mail}
										<input id="mail" name="mail" type="text" value="{$value.mail|escape}" class="w100p" />
										{$error.msg.mail}
									</td>
								</tr>
								<tr>
									<th class="required">電話番号{if $event.reservation}<img src="{$appPath}/img/required.jpg" alt="必須" />{/if}</th>
									<td>
										{$error.class.phone}
										<input id="phone" name="phone" type="text" value="{$value.phone|escape}" class="w100p" />
										{$error.msg.phone}
									</td>
								</tr>
								<tr>
									<th>備考</th>
									<td>
										{$error.class.body}
										<textarea id="body" name="body" class="w100p">{$value.body|escape}</textarea>
										{$error.msg.body}
									</td>
								</tr>
							</table>

							<div class="form_notice">
								この申し込みページはSSLに対応しています。
								お客様の大切なデータは暗号化して通信されます。
								安心してお申込みください。
							</div>

							<div class="email_notice" style="width:94%;padding:0">
								<h4 style="padding:0 1em;">携帯メールをご利用のお客さまへのお願い</h4>

								<p style="padding:0 1em;">
								ドメイン指定受信を設定されている方は、弊社からのメールが
								届かない場合がありますので、「@tokutake-kensetsu.co.jp」の
								メールが受け取れるようドメイン指定受信の設定を行ってください。
								</p>
								<p style="padding:0 1em;">
								フォームの内容を送信後、すぐに自動返信メールが送信されます。
								メールが届かない場合はPCのメールアドレスで再度送信いただくか、
								またはお電話にてご連絡ください。
								</p>
							</div>

							<div class="btn">
								{$_token_input}
								<input type="hidden" name="id" value="{$value.id|escape}" />
								<input type="submit" name="_mode_event_submit_" value="上記内容で予約する" class="btn1" />
							</div>
<br>
<br>

							<div id="tel" class="inquiry_phone">
							<h2 class="ttl-lv2">電話でのお問い合わせ</h2>
							<p class="btn"><a href="tel:0262956166" class="btn1">お電話での資料請求お問い合わせはこちら<br>
026-295-6166</a></p>
								
							</div>

						</form>



					</div>

					{/if}

					<div class="linkBox" style="display: none;">

						{if $event.type == 1}

						<div class="btn_event" >
							<a href="{$meta.blog_url}">
								<span>「会長ブログ」もご覧下さい！</span>
							</a>
						</div>

						{else}

						<div class="btn_event">
							<div class="modelhouse" style="visibility: hidden;">
								●杜の家モデルハウス体験見学に申込参加の方に<br />
	　							クオカード500円プレゼント!
								</div>
							<a href="{$appPath}/housing.html">
								「うれし徳武 家づくり」もご覧下さい！
							</a>
						</div>

						<div class="btn_event">
							<div class="modelhouse">
								●杜の家モデルハウス体験見学に申込参加の方に<br />
	　							クオカード500円プレゼント!
								</div>
							<a href="{$appPath}/mail/form/?id=inquiry">
								杜の家モデルハウス見学申込フォーム
							</a>
						</div>

						{/if}

					</div>

				</div>

{include file='../userFooter.tpl'}

