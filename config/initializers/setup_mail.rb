ActionMailer::Base.smtp_settings = {
  address:              'smtp.gmail.com',
  port:                 587,
  domain:               'juntostudio.com',
  user_name:            'hola@juntostudio.com',
  password:             'benfranklin',
  authentication:       'plain',
  enable_starttls_auto: true  }