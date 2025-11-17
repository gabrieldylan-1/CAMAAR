# frozen_string_literal: true

# Be sure to restart your server when you modify this file.

# Define an application-wide content security policy.
# See the Securing Rails Applications Guide for more information:
# https://guides.rubyonrails.org/security.html#content-security-policy
#
# Rails.application.configure do
#   config.content_security_policy do |policy|
#     policy.default_src :self, :https
#     policy.font_src    :self, :https, :data
#     policy.img_src     :self, :https, :data
#     policy.object_src  :none
#     policy.script_src  :self, :https
#     policy.style_src   :self, :https
#     # Specifies whether inline scripts are allowed if they have a nonce.
#     policy.script_src  :self, :https, :unsafe_inline
#
#     # Specify URI for violation reports
#     # policy.report_uri "/csp-violation-report-endpoint"
#   end
#
#   # If you are using UJS then enable automatic nonce generation
#   # config.content_security_policy_nonce_generator = -> request { SecureRandom.base64(16) }
#   # config.content_security_policy_nonce_directives = %w(script-src)
#
#   # Report CSP violations to a specified URI. Note: This relies on
#   # an additional CSP header.
#   # config.content_security_policy_report_only = true
# end
