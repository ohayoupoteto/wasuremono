class ChatMailer < ApplicationMailer
    default from: 'ワスレン管理人<wasuremono.a@gmail.com>', subject: "ワスレン管理人よりメッセージが届きました"
    def send_mail(user,message)
        @user=user
        @message=message
        mail to: user.email
    end
end
