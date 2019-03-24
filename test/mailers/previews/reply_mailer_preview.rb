# Preview all emails at http://localhost:3000/rails/mailers/reply_mailer
class ReplyMailerPreview < ActionMailer::Preview
    
    def reply_mail_preview
        ExampleMailer.reply_email(User.first)
    end
end
