@switch_mode = (mode) ->
	$.ajax '/ajax/switch_mode',
	dataType: 'html'
	data: { mode: mode }
	type: 'GET'
	success: (data) ->
	  if mode is 'sharable' 
      window.location = '/candidate_profile_public'
    else
      window.location = '/' 

@add_message = (picture) ->
  unless $('#message').val() is ''
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
                <p>"+add_tools($('#message').val())+"</p>
              </div>
            </div>
          </div>
        </div>
      </div>")
    $('#message').val('')

@accept = (fullname) ->
  $('#dynamic_content').html($('#dynamic_content').html()+"
    <div class='row'>
      <div class='span7 offset1'>
        <div class='alert alert-success'>
          <i class='icon-ok'>
            You accepted "+fullname+"'s application.
          </i>
        </div>
      </div>
    </div>")
  $('#buttons').hide()

@reject = (fullname) ->
  $('#dynamic_content').html($('#dynamic_content').html()+"
    <div class='row'>
      <div class='span7 offset1'>
        <div class='alert alert-danger'>
          <i class='icon-remove'>
            You rejected "+fullname+"'s application.
          </i>
        </div>
      </div>
    </div>")
  $('#buttons').hide()

@clean = ->
	$('#message').val('')

@add_tool = (tool) ->
  switch tool
    when 'choice'
      text = '*No / Yes*'
    when 'email'
      text = '*Send*'
    when 'cv'
      text = '*Download my CV*'
    when 'share'
      text = '*Share my profile*'
    when 'link'
      text = '*link*'
  $('#message').val($('#message').val()+text)
  
@add_tools = (message) ->
  tools = [ {regex: /\*No \/ Yes\*/g, code: "<div class='btn btn-danger'>No</div> <div class='btn btn-success'>Yes</div>"}, {regex: /\*Send\*/g, code: "<div class='input-append'><input class='span2' size='16' type='text'><div class='btn btn-primary' style='margin-left:-5px' type='button'>Send</div></div>"}, {regex: /\*Download my CV\*/g, code: "<div class='btn-group'><div class='btn'><i class='icon-download'></i> Download my CV</div></div>"}, {regex: /\*Share my profile\*/g, code: "<div class='btn-group'><a class='btn dropdown-toggle' data-toggle='dropdown' href='#'><i class='icon-share'></i> Share my profile <span class='caret'></span></a><ul class='dropdown-menu'><li><a href='#'>by email</a></li><li><a href='#'>on LinkedIn</a></li><li><a href='#'>on Twitter</a></li><li><a href='#'>on Facebook</a></li><li><a href='#'>on Google+</a></li></ul></div>"} ]
  message = message.replace(tool.regex, tool.code) for tool in tools
  return message
