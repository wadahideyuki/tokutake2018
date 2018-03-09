{$meta.event_mailform_header}

[お申込みイベント名]
{$event.title}
{if $value.date}

[ご希望日時]
{$value.date|default:$tpl_value.default}
{/if}

[お名前]
{$value.name|default:$tpl_value.default}（{$value.name_kana|default:$tpl_value.default}）

[ご住所]
{$value.address|default:$tpl_value.default}

[メールアドレス]
{$value.mail|default:$tpl_value.default}

[電話番号]
{$value.phone|default:$tpl_value.default}

[備考]
{$value.body|default:$tpl_value.default}

{$meta.event_mailform_footer}
