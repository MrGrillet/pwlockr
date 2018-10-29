class MarketingController < ApplicationController
  skip_before_action :authenticate_tenant!

  def index
  end

  def about
  end

  def features
  end
end
