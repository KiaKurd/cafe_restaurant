require 'net/http'

class link_validator 
    
    def working_link?(url)
        uri = URI(url)
        res = Net::HTTP.get_response(uri)
        res.code == "200"
    end
end