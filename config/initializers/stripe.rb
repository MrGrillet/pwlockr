Rails.configuration.stripe = {
  :publishable_key => STRIPE_PUBLISHABLE,
  :secret_key => STRIPE_SECRET
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
# STRIPE_PUBLIC_KEY = Rails.configuration.stripe[:publishable_key]
