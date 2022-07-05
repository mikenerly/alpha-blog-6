module ApplicationHelper
    
    #for all method that gonna be using in the view, we can simply add them here, in application_helper.rb
    def gravatar_for(user, option = {size: 80})
        #following the code on gravatar website
        email_address = user.email.downcase
        hash = Digest::MD5.hexdigest(email_address)
        size = option[:size]
        gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
        image_tag(gravatar_url, alt: user.username, class: "rounded shadow mx-auto d-block") 
    end
    
end
