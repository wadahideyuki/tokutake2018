			<div class="president pc">
				<img src="{$chairman.file|escape}" alt="" class="photo" />
				<img src="{$appPath}/img/president_frame.png" alt="" class="frame" />
				<p class="position"  >{$chairman.position|escape}</p>
				<p class="name"      >{$chairman.name|escape}</p>
				<p class="speciality">{$chairman.speciality|escape|nl2br}</p>
				<p class="comment"   >{$chairman.body|escape|nl2br}</p>
			</div>

			<div class="president_tablet">
				<img src="{$chairman.file|escape}" alt="" class="photo" />
				<img src="{$appPath}/img/president_frame_tablet.png" alt="" class="frame" />
				<p class="position"  >{$chairman.position|escape}</p>
				<p class="name"      >{$chairman.name|escape}</p>
				<p class="speciality">{$chairman.speciality|escape|nl2br}</p>
				<p class="comment"   >{$chairman.body|escape|nl2br}</p>
			</div>

			<div class="president_sp">
				<img src="{$chairman.file|escape}" alt="" class="photo" />
				<img src="{$appPath}/img/president_frame_sp.png" alt="" class="frame" />
				<p class="position"  >{$chairman.position|escape}</p>
				<p class="name"      >{$chairman.name|escape}</p>
				<p class="speciality">{$chairman.speciality|escape|nl2br}</p>
				<p class="comment"   >{$chairman.body|escape|nl2br}</p>
			</div>

			<div class="president pc">
				<img src="{$president.file|escape}" alt="" class="photo" />
				<img src="{$appPath}/img/president_frame.png" alt="" class="frame" />
				<p class="position"  >{$president.position|escape}</p>
				<p class="name"      >{$president.name|escape}</p>
				<p class="speciality">{$president.speciality|escape|nl2br}</p>
				<p class="comment"   >{$president.body|escape|nl2br}</p>
			</div>

			<div class="president_tablet">
				<img src="{$president.file|escape}" alt="" class="photo" />
				<img src="{$appPath}/img/president_frame_tablet.png" alt="" class="frame" />
				<p class="position"  >{$president.position|escape}</p>
				<p class="name"      >{$president.name|escape}</p>
				<p class="speciality">{$president.speciality|escape|nl2br}</p>
				<p class="comment"   >{$president.body|escape|nl2br}</p>
			</div>

			<div class="president_sp">
				<img src="{$president.file|escape}" alt="" class="photo" />
				<img src="{$appPath}/img/president_frame_sp.png" alt="" class="frame" />
				<p class="position"  >{$president.position|escape}</p>
				<p class="name"      >{$president.name|escape}</p>
				<p class="speciality">{$president.speciality|escape|nl2br}</p>
				<p class="comment"   >{$president.body|escape|nl2br}</p>
			</div>

			<ul class="staff">

				{foreach item='value' from=$values name='staff'}
				<li>
					<img src="{$value.file|escape}" alt="" class="photo" />
					<img src="{$appPath}/img/staff_frame.png" alt="" class="frame" />
					<p class="position"  >{$value.position|escape}</p>
					<p class="name"      >{$value.name|escape}</p>
					<p class="speciality">{$value.speciality|escape|nl2br}</p>
					<p class="comment"   >{$value.body|escape|nl2br}</p>
				</li>
				{/foreach}

			</ul>