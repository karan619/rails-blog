# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ringLoad = (e) ->
  $(@).html('<div class="preloader-wrapper active">
      <div class="spinner-layer spinner-blue-only">
        <div class="circle-clipper left">
          <div class="circle"></div>
        </div><div class="gap-patch">
          <div class="circle"></div>
        </div><div class="circle-clipper right">
          <div class="circle"></div>
        </div>
      </div>
    </div>')
$(document).on 'ready', (event) =>
  $(document).on 'click', '.ringLoad', ringLoad
jQuery ->
  $('#search').autocomplete
    source: '/search_suggestions'
    select: (event, ui) ->
      $("input#search").val ui.item.value
      $("#searchform").submit()
  $("#searchform").on 'submit', (e) =>
    e.preventDefault()
    $('ul#ui-id-1').remove()
    $(@).trigger('submit');