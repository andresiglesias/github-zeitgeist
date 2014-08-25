class TimelineController < ApplicationController

  def show
    

  end
  
  
  def get_events
    timeline = Timeline.find(1)
    
    headline = timeline.name
    type = "default"
    text = timeline.description
    media = timeline.media
    credit = timeline.media_attribution
    caption = timeline.media_description
    events = Event.all.map { |x| x.get_json }
    puts events.to_s
    startDate = timeline.since.strftime("%Y,%m,%e")
    endDate = timeline.until.strftime("%Y,%m,%e")
    headline = timeline.name
    textEra = ""
    tag = ""  
    
    json = { "timeline"=> { "headline"=> headline, "type"=> type,"text"=> text, 
      "asset"=> { "media"=> media,  "credit"=> credit, "caption"=> caption },
      "date"=> events,
      "era"=> [  { "startDate"=> startDate, "endDate"=> endDate, "headline"=> headline, 
            "text"=> textEra, "tag"=> tag  }  ] 
       }  }.to_json
       
    respond_to do |format|
      format.json { render :json => json }
    end
  end
  
  def generate_statistics

    Event.all.map { |x| x.calculate }
    
    timeline = Timeline.find(1)
    timeline.last_updated = Time.new
    timeline.save
    
    json = { "result" => true }
    respond_to do |format|
      format.json { render :json => json }
    end
  end
  

end
