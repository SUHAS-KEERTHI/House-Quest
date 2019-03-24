class ReplyMailer < ApplicationMailer
    
    default from: "housingclassified517@gmail.com"
    
    def reply_email(email)
        mail(to: email, from: "housingclassified517@gmail.com", subject: 'Inquiry Reply Email')
    end
  
end
