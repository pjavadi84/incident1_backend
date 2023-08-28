require 'httparty'
require 'json'
require 'nokogiri'
require "crack"

class FetchIncidentsService
   

    def self.call
        url = "https://inciweb.nwcg.gov/incidents/rss.xml"
        response = HTTParty.get(url) 
        myJSON  = Crack::XML.parse(response)
        # myJSON = myXML.to_json

        myJSON["rss"]["channel"]["item"].each do |incident|
            Incident.create(
                title: incident["title"],
                link: incident["link"],
                description: incident["description"],
                pubDate: incident["pubDate"]
            )
        end
        
    end

end
