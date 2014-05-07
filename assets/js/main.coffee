#= require 'jquery.smooth-scroll'
#= require 'markedmap'
#= require 'mapstyles'

class Main

  body: $('body')
  window: $(window)

  constructor: ->
    $('nav a').smoothScroll(offset: -60)
    @map = new MarkedMap
      el: $('#map')[0]
      latlng: [32.530236, -117.036371]
      icon: "http://makers.amfmf.com/img/pin.png"
      styles: window.MAP_STYLES

  viewport: ->
    if typeof window.innerWidth is 'undefined'
      width: document.documentElement.clientWidth
      height: document.documentElement.clientHeight
    else
      width: window.innerWidth
      height: window.innerHeight

$(document).ready ->
  window.app = new Main