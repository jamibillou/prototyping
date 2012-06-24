@addMessage = (picture) ->
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
