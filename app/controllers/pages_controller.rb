class PagesController < ApplicationController
  allow_unauthenticated_access
  def home
    render layout: false
  end

  def subscribe
    require "stripe"
    Stripe.api_key = ENV["STRIPE_SECRET_KEY"]

    session = Stripe::Checkout::Session.create({
      line_items: [ {
        # Provide the exact Price ID (for example, price_1234) of the product you want to sell
        price: "pretextplus_sustaining",
        quantity: 1
      } ],
      mode: "subscription",
      success_url: "https://pretext.plus/session"
    })

    redirect_to session.url, allow_other_host: true
  end
end
