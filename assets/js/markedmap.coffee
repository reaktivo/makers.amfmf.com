window.MarkedMap = class MarkedMap

  constructor: (opts = {}) ->
    @el = opts.el or document.getElementById('map')
    @latlng = opts.latlng
    @icon = opts.icon
    @styles = opts.styles
    @loadMaps()

  loadMaps: =>
    if google?.maps
      @setupMap()
    else
      window.setupMap = @setupMap
      script = document.createElement('script')
      script.type = 'text/javascript'
      script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyAmB9uoZqqUj6bLknBEqsAvsH0pFDoxKkM&sensor=false&callback=setupMap'
      document.body.appendChild(script)

  setupMap: =>
    { Map, LatLng, Marker } = google.maps
    @latlng = new LatLng(@latlng[0], @latlng[1])

    @map = new Map @el,
      center: @latlng
      zoom: 16
      styles: @styles
      streetViewControl: false
      mapTypeControl: false
      scrollwheel: false

    marker = new Marker
      map: @map
      position: @latlng
      icon: @icon

    $(window).resize @centerMap

  centerMap: =>
    @map.setCenter(@latlng)

