# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@camaar.local"
  layout "mailer"
end
