@switch_mode = (mode) ->
  $.ajax '/ajax/switch_mode',
  dataType: 'html'
  type: 'GET'
  data: {mode:mode}
  success: (data) ->
    location.reload()

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

@filter_role = ->
  array_div = [ ['#carole_d','#caroline_b','#mathieu_t','#vincent_v'], ['#caroline_b','#vincent_v'], ['#carole_d'], [], ['#mathieu_t'] ]
  for div_id in array_div[0]
    do (div_id) ->
      $(div_id).hide()
  for div_id in array_div[$('#select01').val()]
    do (div_id) ->
      $(div_id).show()

@starred = (id,way) ->
  if way is 'star'
    $('#'+id).addClass('icon-star').removeClass('icon-star-empty')
    $('#'+id).click -> starred(id,'unstar')
  else
    $('#'+id).addClass('icon-star-empty').removeClass('icon-star')
    $('#'+id).click -> starred(id,'star')

@import_linkedin = (type) ->
  $('#'+type+'_full_name').val('John Macey')
  $('#'+type+'_city').val('London')
  $('#'+type+'_country').val('England')
  $('#'+type+'_experience').val('5')
  $('#'+type+'_education').val('Master Degree in network & telecoms')
  $('#'+type+'_catchphrase').val('Looking for a long-term challenge after a couple of small experiences!')
  $('#'+type+'_pro_skill_1').val('Team work')
  $('#'+type+'_pro_skill_2').val('Telecoms')
  $('#'+type+'_pro_skill_3').val('Project management')
  $('#'+type+'_pro_skill_level_1').val('advanced')
  $('#'+type+'_pro_skill_level_2').val('expert')
  $('#'+type+'_pro_skill_level_3').val('advanced')
  $('#'+type+'_inter_skill_1').val('Perfectionnist')
  $('#'+type+'_inter_skill_2').val('Open-minded')
  $('#'+type+'_inter_skill_3').val('Traveller')
  $('#'+type+'_inter_skill_level_1').val('beginner')
  $('#'+type+'_inter_skill_level_2').val('expert')
  $('#'+type+'_inter_skill_level_3').val('intermediate')
  starred(type+'_pro_skill_star_2','star')
  starred(type+'_inter_skill_star_3','star')
