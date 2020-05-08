require 'gmail'
require 'gmail_xoauth'
# refresh_token = '1//06xDgFoop1rcsCgYIARAAGAYSNwF-L9IrMa06GpKEUNZXvBfeuY2TxIHVpAE3a8ZrsVuv_HBnJTIIMRnyh7D24BMTee4EnOGuvWw'
# my_oauth2_token = 'ya29.a0Ae4lvC2Y_umzc5YqXXV-nfTVJujbd0tezZHTm-lToQ3vs0hTGKw6uu07SjZ_el_M5OhwgtSyPkUow5gRzHEEX58j8UYjSUYL4DnN9qmBn0GjxmllVjvENZZ1bkZ_HGMtC_Ju0HkfhI60JNEgps9xTQ6CccYWE_P93hU'

# imap = Net::IMAP.new('imap.gmail.com', 993, usessl = true, certs = nil, verify = false)
# imap.authenticate('XOAUTH2', 'emmont82@gmail.com', my_oauth2_token)
# messages_count = imap.status('INBOX', ['MESSAGES'])['MESSAGES']
# puts "Seeing #{messages_count} messages in INBOX"

# gmail = Gmail.connect(:xoauth2, "emmont82@gmail.com", my_oauth2_token)
# puts gmail.inbox.count(:unread)
# puts gmail.inbox.count(:read)

class Gmail
  def connect(auth, email)
    access_token = auth.access_token
    refresh_token = auth.access_token
    imap = Net::IMAP.new('imap.gmail.com', 993, usessl = true, certs = nil, verify = false)
    imap.authenticate('XOAUTH2', email, my_oauth2_token)
    imap
  end

  def messages_count(imap)
    imap.status('INBOX', ['MESSAGES'])['MESSAGES')
    puts "Seeing #{messages_count} messages in INBOX"
  end
end