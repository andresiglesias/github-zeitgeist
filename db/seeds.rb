#Timeline
timeline = Timeline.new
timeline.name = "Github Zeitgeist 2014"
timeline.description = "<p>How the world events changed what you code</p><p>by @andresiglesias</p>"
timeline.media = "http://upload.wikimedia.org/wikipedia/commons/thumb/3/30/Brazil_and_Croatia_match_at_the_FIFA_World_Cup_2014-06-12_%2815%29.jpg/320px-Brazil_and_Croatia_match_at_the_FIFA_World_Cup_2014-06-12_%2815%29.jpg"
timeline.media_attribution = "By Agência Brasil [CC-BY-3.0-br (http://creativecommons.org/licenses/by/3.0/br/deed.en)], via Wikimedia Commons"
timeline.media_description = "h<a href='http://agenciabrasil.ebc.com.br/geral/foto/2014-06/brasil-e-croacia-primeiro-jogo-da-copa-do-mundo-de-2014' alt='Brazil and Croatia match at the FIFA World Cup 2014-06-12' target='_new'>Brazil and Croatia match at the FIFA World Cup 2014-06-12</a>"
timeline.since = Date.parse('01-01-2014')
timeline.until = Date.parse('31-12-2014') 
timeline.save

#Compare values
#1 = compares last month
#2 = compares same period last year

#Event
#event = Event.new
#event.title = "Heartbleed attacks"
#event.description = "<p></p>"
#event.media = "http://heartbleed.com/heartbleed.png"
#event.media_attribution = "Heartbleed logo"
#event.media_description = "http://heartbleed.com/"
#event.since = Date.parse('01-04-2014')
#event.until = Date.parse('30-04-2014') 
#event.compare = 1
#event.category = "Security"
#event.keyword_push = "security"
#event.save

event = Event.new
event.title = "Heartbleed attacks"
event.description = "<p></p>"
event.media = "http://heartbleed.com/heartbleed.png"
event.media_attribution = "Heartbleed logo"
event.media_description = "http://heartbleed.com/"
event.since = Date.parse('01-04-2014')
event.until = Date.parse('30-04-2014') 
event.compare = 1
event.category = "Security"
event.keyword_push = "SSL"
event.save

event = Event.new
event.title = "2014 FIFA World Cup"
event.description = "<p></p>"
event.media = "https://www.youtube.com/watch?v=FzeBkx5z4RM"
event.media_attribution = "Youtube"
event.media_description = "FIFA World Cup 2014 - Best Moments Highlights"
event.since = Date.parse('12-06-2014')
event.until = Date.parse('13-07-2014') 
event.compare = 2
event.category = "Sports"
event.keyword_push = "world cup"
event.keyword_repos = "world cup"
event.save

event = Event.new
event.title = "2014 Winter Olympics"
event.description = "<p></p>"
event.media = "http://upload.wikimedia.org/wikipedia/commons/2/2d/Olympic_Park_2014.jpg"
event.media_attribution = '<a rel="nofollow" class="external text" href="http://www.flickr.com/photos/atosorigin/12608916125/">Atos - at the Winter Olympic Games - Olympic Park - panorama by daylight</a>. Licensed under <a href="http://creativecommons.org/licenses/by-sa/2.0" title="Creative Commons Attribution-Share Alike 2.0">CC BY-SA 2.0</a> via <a href="//commons.wikimedia.org/wiki/">Wikimedia Commons</a>.'
event.media_description = ""
event.since = Date.parse('07-02-2014')
event.until = Date.parse('23-02-2014') 
event.compare = 2
event.category = "Sports"
event.keyword_push = "sochi"
event.keyword_repos = "sochi"
event.save


event = Event.new
event.title = "Google cast SDK goes public"
event.description = "<p></p>"
event.media = "http://upload.wikimedia.org/wikipedia/commons/8/8b/Chromecast_dongle.jpg"
event.media_attribution = '"<a href="http://commons.wikimedia.org/wiki/File:Chromecast_dongle.jpg#mediaviewer/File:Chromecast_dongle.jpg">Chromecast dongle</a>" by <a href="//www.flickr.com/people/80775449@N00" class="extiw" title="flickruser:80775449@N00">EricaJoy</a> - <a href="//commons.wikimedia.org/wiki/Flickr" title="Flickr" class="mw-redirect">Flickr</a>: <a rel="nofollow" class="external text" href="http://flickr.com/photos/80775449@N00/9366309711">Chromecast</a>. Licensed under <a href="http://creativecommons.org/licenses/by-sa/2.0" title="Creative Commons Attribution-Share Alike 2.0">CC BY-SA 2.0</a> via <a href="//commons.wikimedia.org/wiki/">Wikimedia Commons</a>.'
event.media_description = ""
event.since = Date.parse('01-02-2014')
event.until = Date.parse('28-02-2014') 
event.compare = 1
event.category = "Technology"
event.keyword_push = "chromecast"
event.keyword_repos = "chromecast"
event.save

event = Event.new
event.title = "Swift is introduced"
event.description = "<p></p>"
event.media = "http://upload.wikimedia.org/wikipedia/en/4/43/Apple_Swift_Logo.png"
event.media_attribution = "Apple Swift Logo"
event.media_description = ""
event.since = Date.parse('01-06-2014')
event.until = Date.parse('30-06-2014') 
event.compare = 1
event.category = "Technology"
event.language = "Swift"
event.save


