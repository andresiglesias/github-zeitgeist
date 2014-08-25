class Event < ActiveRecord::Base
  
  def get_description(push)
    description = ''
    
    period = ""
    if self.compare == 1
      period = "last month"
    end
    if self.compare == 2
      period = "same period last year"
    end
    
    if push == true
      value_0 = value_push_0
      value_1 = value_push_1
      keyword = keyword_push
      if keyword != nil
        message = 'more push events containing \''+keyword+'\' in its message'
      end
    else
      value_0 = value_repos_0
      value_1 = value_repos_1
      keyword = keyword_repos
      if keyword != nil
        message = 'more repositories created containing \''+keyword+'\' in its description'
      end
    end
    
      difference = 0
      if value_0 != 0
        if value_0 > value_1
          #todo
        else
          difference = (value_1 / (value_0*1.0))
        end
      else
        difference = value_1
      end
      if keyword != nil
        if value_0 == 0
          description += '<span class=\'result\'>'+difference.round.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse + '</span> '+message+' than '+period+'. <br>'+period.capitalize+' value = '+value_0.to_s  
        else
          if difference < 2 and difference > 1
            description += '<span class=\'result\'>'+((difference-1)*100).round(2).to_s  + '%</span> '+message+' than '+period+'.'
          else
            description += '<span class=\'result\'>'+difference.round(2).to_s  + 'x</span> '+message+' than '+period+'.'
          end  
        end
      end
      if self.language != nil
        if value_0 == 0
          description += '<span class=\'result\'>'+difference.round.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse + '</span> more push events in \''+self.language+'\' language repositories than '+period+'. <br>'+period.capitalize+' value = '+value_0.to_s 
        else
          if difference < 2 and difference > 1
            description += '<span class=\'result\'>'+((difference-1)*100).round(2).to_s  + '%</span> more in push events in \''+self.language+'\' language repositories than '+period+'.' 
          else
            description += '<span class=\'result\'>'+difference.round(2).to_s  + 'x</span> more in push events in \''+self.language+'\' language repositories than '+period+'.'
          end  
        end
      end
      return description
  end
  
  def get_json
    
    description = self.description
    if description == nil 
      description = ''
    end
    description_push = ''
    description_repos = ''
    
    if self.value_push_0 != nil and self.value_push_1 != nil
      description_push = '<span class=\'category\'>Push events:</span><br>'+get_description(true)+'<br>'
    end
    if self.value_repos_0 != nil and self.value_repos_1 != nil
      description_repos = '<br><span class=\'category\'>New repositories:</span><br>'+get_description(false)
    end

    description = '<div class=\'event-description\'>'+description+description_push+description_repos+'</div>'
    if self.value_repos_0 != nil
    end
    
    
    return {  "startDate"=> self.since.strftime("%Y,%m,%e"), "endDate"=> self.until.strftime("%Y,%m,%e"), 
            "headline"=> self.title, "text"=> description, 
            "tag"=> self.category, "classname"=> "", 
            "asset"=> { "media"=> self.media, 
               "credit"=> self.media_attribution, 
              "caption"=> self.media_description }  }
  end
  
  def calculate
    @project = 793612564280
    xsql = "SELECT count(*) as result "
    xsql += " FROM [githubarchive:github.timeline] "
    xsql += " where  PARSE_UTC_USEC(created_at) between PARSE_UTC_USEC('?') and PARSE_UTC_USEC('?') "
    xsql += " PARAMETERS "
    
    #if startDate = endDate, the period is the whole month of the date
    if self.since == self.until
      since_1 = Date.new(self.since.year, self.since.month, 1)
      until_1 = Date.civil(self.since.year, self.since.month, -1)
    else
      since_1 = self.since
      until_1 = self.until
    end
    
    #compare = 1, compares same period last month, otherwise compares same period last year
    if self.compare == 1
      if since_1.month != 1
        since_0 = Date.new(since_1.year, since_1.month-1, since_1.day)
        until_0 = Date.new(until_1.year, until_1.month-1, until_1.day)
      else
        since_0 = Date.new(since_1.year-1, 12, since_1.day)
        until_0 = Date.new(until_1.year-1, 12, until_1.day)
      end
    else 
      since_0 = Date.new(since_1.year-1, since_1.month, since_1.day)
      until_0 = Date.new(until_1.year-1, until_1.month, until_1.day)
    end
    
    if self.keyword_push != nil
      
      xsql1 = xsql.dup
      xsql1 = xsql1.sub('PARAMETERS', ' and  type= \'PushEvent\' and upper(payload_commit_msg) like \'%?%\' ')
      
      xsql1 = xsql1.sub('?', since_0.strftime("%F")+' 00:00:00')
      xsql1 = xsql1.sub('?', until_0.strftime("%F")+' 00:00:00')
      xsql1 = xsql1.sub('?', self.keyword_push.upcase)

      puts xsql1
      query = GoogleBigquery::Jobs.query(@project, {"query"=> xsql1 })

      self.value_push_0 =  query['rows'][0]['f'][0]['v']
      
      xsql1 = xsql.dup
      xsql1 = xsql1.sub('PARAMETERS', ' and  type= \'PushEvent\' and upper(payload_commit_msg) like \'%?%\' ')
      
      xsql1 = xsql1.sub('?', since_1.strftime("%F")+' 00:00:00')
      xsql1 = xsql1.sub('?', until_1.strftime("%F")+' 00:00:00')
      xsql1 = xsql1.sub('?', self.keyword_push.upcase)

      puts xsql1
      query = GoogleBigquery::Jobs.query(@project, {"query"=> xsql1 })

      self.value_push_1 =  query['rows'][0]['f'][0]['v']
    end
    
    if self.keyword_repos != nil
      
      xsql1 = xsql.dup
      xsql1 = xsql1.sub('PARAMETERS', ' and type= \'CreateEvent\' and payload_ref_type=\'repository\' and upper(repository_description) like \'%?%\'  ')
      
      xsql1 = xsql1.sub('?', since_0.strftime("%F")+' 00:00:00')
      xsql1 = xsql1.sub('?', until_0.strftime("%F")+' 00:00:00')
      xsql1 = xsql1.sub('?', self.keyword_repos.upcase)

      puts xsql1
      query = GoogleBigquery::Jobs.query(@project, {"query"=> xsql1 })

      self.value_repos_0 =  query['rows'][0]['f'][0]['v']
      
      xsql1 = xsql.dup
      xsql1 = xsql1.sub('PARAMETERS', ' and type= \'CreateEvent\' and payload_ref_type=\'repository\' and upper(repository_description) like \'%?%\'  ')
      
      xsql1 = xsql1.sub('?', since_1.strftime("%F")+' 00:00:00')
      xsql1 = xsql1.sub('?', until_1.strftime("%F")+' 00:00:00')
      xsql1 = xsql1.sub('?', self.keyword_repos.upcase)

      puts xsql1
      query = GoogleBigquery::Jobs.query(@project, {"query"=> xsql1 })

      self.value_repos_1 =  query['rows'][0]['f'][0]['v']
    end
    
    if self.language != nil
      
      xsql1 = xsql.dup
      xsql1 = xsql1.sub('PARAMETERS', ' and  type= \'PushEvent\' and repository_language = \'?\'  ')
      
      xsql1 = xsql1.sub('?', since_0.strftime("%F")+' 00:00:00')
      xsql1 = xsql1.sub('?', until_0.strftime("%F")+' 00:00:00')
      xsql1 = xsql1.sub('?', self.language)

      puts xsql1
      query = GoogleBigquery::Jobs.query(@project, {"query"=> xsql1 })

      self.value_push_0 =  query['rows'][0]['f'][0]['v']
      
      xsql1 = xsql.dup
      xsql1 = xsql1.sub('PARAMETERS', ' and  type= \'PushEvent\' and repository_language = \'?\'  ')      
      
      xsql1 = xsql1.sub('?', since_1.strftime("%F")+' 00:00:00')
      xsql1 = xsql1.sub('?', until_1.strftime("%F")+' 00:00:00')
      xsql1 = xsql1.sub('?', self.language)

      puts xsql1
      query = GoogleBigquery::Jobs.query(@project, {"query"=> xsql1 })

      self.value_push_1 =  query['rows'][0]['f'][0]['v']
    end
    
    self.save

  end

  
end
