if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_QptcsSTGOkXDxkKTWMNxDV4Z', # test publishable key
    :secret_key => 'sk_test_H4WC0T0d1Bj68NSMbfVJLr73' # test secret key
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]