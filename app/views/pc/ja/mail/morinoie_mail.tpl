{$meta.inquiry_mailform_header}

[お名前]
{$value.name|default:$tpl_value.default}

[性別]
{html_radios options=$metafile.gender selected=$value.gender mode='mail'}

[年齢]
{$value.age|default:$tpl_value.default}

[ご住所]
{$value.address|default:$tpl_value.default}

[メールアドレス]
{$value.mail|default:$tpl_value.default}

[電話番号]
{$value.phone|default:$tpl_value.default}

[備考]
{$value.body|default:$tpl_value.default}


-----------------------------------------------------------------------

[徳武建設の見学会・イベントに参加したい]
{html_radios name='join' options=$metafile.join selected=$value.join mode='mail'}

[OMソーラーハウス「杜の家」に宿泊体験したい]
{html_radios name='stay' options=$metafile.stay selected=$value.stay mode='mail'}

[うれし徳武建設の家づくりについて良く分かる資料を請求したい]
{html_radios name='brochure' options=$metafile.brochure selected=$value.brochure mode='mail'}

[徳武建設の何に興味をもたれましたか？]
{html_checkboxes name='interest' options=$metafile.interest selected=$value.interest mode='mail'}

[住宅計画はありますか？]
{html_radios name='plan' options=$metafile.plan selected=$value.plan mode='mail'}

[住宅建築予定はありますか？]
{html_radios name='intend' options=$metafile.intend selected=$value.intend mode='mail'}

[住宅建築予定地はありますか？]
{html_radios name='place' options=$metafile.place selected=$value.place mode='mail'}

[上記質問で住宅建築予定地が「ある」とお答えいただいた方（住宅建設予定地）]
{$value.place_txt|default:$tpl_value.default}市

[上記質問で住宅建築予定地を「探している」とお答えいただいた方（土地希望地）]
{$value.place_search|default:$tpl_value.default}方面

-----------------------------------------------------------------------

{$meta.inquiry_mailform_footer}

{sendersinfo}