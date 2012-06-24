@switch_mode = (mode) ->
	$.ajax '/ajax/switch_mode',
	dataType: 'html'
	data: { mode: mode }
	type: 'GET'
	success: (data) ->
	  location.reload()

@add_message = (picture) ->
  $('#dynamic_content').html($('#dynamic_content').html()+"
    <div class='row'>
      <div class='span5 offset3'>
        <div class='well'>
          <div class='row'>
            <div class='span1'>
              <a href='/recruiter_profile'><img alt='Dom' src='/assets/"+picture+"' /></a>
            </div>
            <div class='span3'>
              <h5>You said:</h5>
              <p>"+$('#message').val()+"</p>
            </div>
          </div>
        </div>
      </div>
    </div>")
  $('#message').val('')

@accept = (first_name) ->
  $('#dynamic_content').html($('#dynamic_content').html()+"
    <div class='row'>
      <div class='span7 offset1'>
        <div class='alert alert-success'>
          <i class='icon-ok'>
            You accepted "+first_name+"'s application.
          </i>
        </div>
      </div>
    </div>")
  $('#buttons').hide()

@reject = (first_name) ->
  $('#dynamic_content').html($('#dynamic_content').html()+"
    <div class='row'>
      <div class='span7 offset1'>
        <div class='alert alert-danger'>
          <i class='icon-remove'>
            You rejected "+first_name+"'s application.
          </i>
        </div>
      </div>
    </div>")
  $('#buttons').hide()

@clean = ->
	$('#message').val('')

@add_tool = (tool) ->
	switch tool
		when 'choice' then message = "<div class='btn btn-danger'>No</div> <div class='btn btn-success'>Yes</div>"
		when 'email'	then message = "<div class='input-append'><input class='span2' size='16' type='text'><div class='btn btn-primary' style='margin-left:-5px' type='button'>Send</div></div>"
		when 'cv'			then message = "<div class='btn-group'><div class='btn'><i class='icon-download'></i> Download my CV</div></div>"
		when 'share' then message = "<div class='btn-group'><a class='btn dropdown-toggle' data-toggle='dropdown' href='#'><i class='icon-share'></i> Share my profile <span class='caret'></span></a><ul class='dropdown-menu'><li><a href='#'>by email</a></li><li><a href='#'>on LinkedIn</a></li><li><a href='#'>on Twitter</a></li><li><a href='#'>on Facebook</a></li><li><a href='#'>on Google+</a></li></ul></div>"
		when 'link' then message = "<a target='_new' href='http://www.engaccino.com'>Engaccino</a>"
	$('#message').val($('#message').val()+message)

