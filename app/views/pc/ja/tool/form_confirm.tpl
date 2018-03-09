<table>{section name=each loop=$value}{if !($value[each].Field == 'id' or $value[each].Field == 'ip' or $value[each].Field == 'created' or $value[each].Field == 'modified')}

	<tr>
		<th class="sideHead">{$value[each].Comment}</th>
		<td>
			{literal}{$value.{/literal}{$value[each].Field}{literal}|escape}{/literal}
			<input type="hidden" name="{$value[each].Field}" value="{literal}{$value.{/literal}{$value[each].Field}{literal}|escape}{/literal}" />
		</td>
	</tr>{/if}{/section}

</table>
