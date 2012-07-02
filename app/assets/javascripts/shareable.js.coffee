# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('#candidate_catchphrase').focus()
  $('#email_input').focus()
  $('#email_input').focusout -> insertEmails('email_input','email_display')