<table>{section name=each loop=$value}{if !($value[each].Field == 'id' or $value[each].Field == 'ip' or $value[each].Field == 'created' or $value[each].Field == 'modified')}

	<tr>
		<th class="sideHead">{$value[each].Comment}{if $value[each].Null == 'YES'}<span class="required">*</span>{/if}</th>
		<td>
			{literal}{$error.class.{/literal}{$value[each].Field}{literal}}{/literal}
			<input type="text" name="{$value[each].Field}" value="{literal}{$value.{/literal}{$value[each].Field}{literal}|escape}{/literal}" class="w256 ime-active" />
			{literal}{$error.msg.{/literal}{$value[each].Field}{literal}}{/literal}
		</td>
	</tr>{/if}{/section}

</table>
