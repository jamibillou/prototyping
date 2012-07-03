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
                <img alt='no pic' src='/assets/"+picture+"' />
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
    when 'Email'
      text = '*Send*'
    when 'cv'
      text = '*Download my CV*'
    when 'share'
      text = '*Share my profile*'
    when 'link'
      text = '*link*'
  $('#message').val($('#message').val()+text)
  
@add_tools = (message) ->
  tools = [ {regex: /\*No \/ Yes\*/g, code: "<div class='btn btn-danger'>No</div> <div class='btn btn-success'>Yes</div>"}, {regex: /\*Send\*/g, code: "<div class='input-append'><input class='span2' size='16' type='text'><div class='btn btn-primary' style='margin-left:-5px' type='button'>Send</div></div>"}, {regex: /\*Download my CV\*/g, code: "<div class='btn-group'><div class='btn'><i class='icon-download'></i> Download my CV</div></div>"}, {regex: /\*Share my profile\*/g, code: "<div class='btn-group'><a class='btn dropdown-toggle' data-toggle='dropdown' href='#'><i class='icon-share'></i> Share my profile <span class='caret'></span></a><ul class='dropdown-menu'><li><a href='/candidate_profile_email_share_others'>Email</a></li><li><a href='/candidate_profile_social_share_others'>Social networks</a></li></ul></div>"} ]
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

@import_data = (type) ->
  $('#'+type+'_full_name').val('Stefan Foutain')
  $('#'+type+'_city').val('Amsterdam')
  $('#'+type+'_country').val('Netherlands')
  $('#'+type+'_role').val('Chief Product Monkey')
  $('#'+type+'_company').val('Viadeo')
  $('#'+type+'_experience').val('5')
  $('#'+type+'_education').val('Master of Sciences in Business Intelligence')
  $('#'+type+'_catchphrase').val("I make stuff out of nothing. I break stuff until there's only good stuff left. Above all want to understand how to create value.")
  $('#'+type+'_pro_skill_1').val('Ruby on Rails')
  $('#'+type+'_pro_skill_2').val('Startups')
  $('#'+type+'_pro_skill_3').val('Product Development')
  $('#'+type+'_pro_skill_level_1').val('intermediate')
  $('#'+type+'_pro_skill_level_2').val('expert')
  $('#'+type+'_pro_skill_level_3').val('expert')
  toggleStar('candidate_pro_skill_star_3','pro')
  $('#'+type+'_inter_skill_1').val('Drive')
  $('#'+type+'_inter_skill_2').val('Optimism')
  $('#'+type+'_inter_skill_3').val('Ice breaker')
  $('#'+type+'_inter_skill_level_1').val('advanced')
  $('#'+type+'_inter_skill_level_2').val('expert')
  $('#'+type+'_inter_skill_level_3').val('beginner')
  toggleStar('candidate_inter_skill_star_2','inter')
  
@toggleService = (service) ->
  unless $('#'+service+' img').attr('src') is 'assets/'+service+'2.png'
    $('#'+service+' img').attr('src', 'assets/'+service+'2.png')
  else
    $('#'+service+' img').attr('src', 'assets/'+service+'.png')
    $('#'+service).attr('href', '')

@toggleStar = (id,type,profile) =>
  for i in [1,2,3]
    unless profile+'_'+type+'_star_'+i is id
      $('#'+profile+'_'+type+'_star_'+i).addClass('icon-star-empty').removeClass('icon-star')
  if $('#'+id).attr('class') is 'icon-star-empty star' or $('#'+id).attr('class') is 'star icon-star-empty'
    $('#'+id).addClass('icon-star').removeClass('icon-star-empty')
    $('#'+type+'_star').val(id)
  else
    $('#'+id).addClass('icon-star-empty').removeClass('icon-star')
    $('#'+type+'_star').val('')

@insertEmails = (input_id, insert_id) ->
  if $('#'+input_id).val() isnt ''
    addresses = $('#'+input_id).val().split(/[\s,;]+/)
    for address in addresses
      if $('#'+insert_id).html() is ''
        $('#'+insert_id).html(address) 
      else
        $('#'+insert_id).html($('#'+insert_id).html()+' ; '+address) 
    $('#'+input_id).val('')

@clickButton = (id) ->
  $('#'+id).click()
  