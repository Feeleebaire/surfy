class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @camps = Camp.all
    @organisations = Organisation.all
  end

end
