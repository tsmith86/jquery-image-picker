#  Project:
#  Description:
#  Author:
#  License:
 
# Note that when compiling with coffeescript, the plugin is wrapped in another
# anonymous function. We do not need to pass in undefined as well, since
# coffeescript uses (void 0) instead.
(($, window, document) -> 

  # window and document are passed through as local variable rather than global
  # as this (slightly) quickens the resolution process and can be more efficiently
  # minified (especially when both are regularly referenced in your plugin).

  # Create the defaults once
  pluginName = "jip"
  defaults = 
    fillerImg: "http://placehold.it/200x200" 
    getImagesFrom: null
    galleryUrl: "/gallery/"
    modalTitle : "Select A Image"
    saveBtnText : "Save"
    paging : true
    per_page: 10
    showImageName: true
    showFolders : true
    folders : ['main':'/url/main','avatars':'/url/avatars']
    allowDelete : true
    resize : true
    resizeHeight : 100
    resizeWidth : 100

 
  # The actual plugin constructor
  class Plugin
    constructor: (@element, options) ->
      # jQuery has an extend method which merges the contents of two or
      # more objects, storing the result in the first object. The first object
      # is generally empty as we don't want to alter the default options for
      # future instances of the plugin
      @options = $.extend {}, defaults, options
      @_defaults = defaults
      @_name = pluginName
      @init()

    init: ->
      # Place initialization logic here
      # You already have access to the DOM element and the options via the instance,
      # e.g., @element and @options

    yourOtherFunction: ->
      # some logic

  # A really lightweight plugin wrapper around the constructor,
  # preventing against multiple instantiations
  $.fn[pluginName] = (options) ->
    @each ->
      if !$.data(@, "plugin_#{pluginName}")
        $.data(@, "plugin_#{pluginName}", new Plugin(@, options))

)(jQuery, window, document) 