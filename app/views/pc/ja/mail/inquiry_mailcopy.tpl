{$meta.inquiry_mailform_header}

[お名前]
{$value.name|default:$tpl_value.default}

[年齢]
{$value.age|default:$tpl_value.default}

[ご住所]
{$value.address|default:$tpl_value.default}

[メールアドレス]
{$value.mail|default:$tpl_value.default}

[電話番号]
{$value.phone|default:$tpl_value.default}

[言いたい放題]
{$value.body|default:$tpl_value.default}


----------------------------------------------------

[うれし徳武建設の家づくりについて良く分かる資料を請求したい]
{html_checkboxes name='brochure' options=$metafile.brochure selected=$value.brochure mode='mail'}

[徳武建設の何に興味をもたれましたか？]
{html_checkboxes name='interest' options=$metafile.interest selected=$value.interest mode='mail'}

[徳武建設の見学会・イベントに参加したい]
{html_radios name='join' options=$metafile.join selected=$value.join mode='mail'}{if $value.join == '1'}→{$value.join_txt|default:$tpl_value.default}{/if}


[OMソーラーハウス「杜の家 生活展示場」を見学したい]
{html_radios name='stay' options=$metafile.stay selected=$value.stay mode='mail'}{if $value.stay == '1'}→{$value.stay_txt|default:$tpl_value.default}{/if}


[イマコレ（賃貸計画・暮らし）相談会に申込みたい]
{html_radios name='advice' options=$metafile.advice selected=$value.advice mode='mail'}{if $value.advice == '1'}→{$value.advice_txt|default:$tpl_value.default}{/if}


[住宅計画はありますか？]
{html_radios name='plan' options=$metafile.plan selected=$value.plan mode='mail'}

[住宅建築予定はありますか？]
{html_checkboxes name='place' options=$metafile.place selected=$value.place mode='mail'}{if $value.place && in_array('1', $value.place)}→{$value.place_txt|default:$tpl_value.default}市{else}なし{/if}

{html_checkboxes name='place_search' options=$metafile.place_search selected=$value.place_search mode='mail'}{if $value.place_search && in_array('1', $value.place_search)}→{$value.place_search_txt|default:$tpl_value.default}方面{else}探していない{/if}




{$meta.inquiry_mailform_footer}
