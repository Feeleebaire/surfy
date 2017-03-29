class OrganisationsController < ApplicationController

  def new
    @organisation = Organisation.new
  end

  def create
    @organisation = Organisation.new(organisation_params)
    @organisation.user = current_user
     if @organisation.save
      redirect_to organisation_path(@organisation)
    else
      render :new
    end
  end

  def show
    @organisation = Organisation.find(params[:id])
  end

  def update
  end


  private

  def organisation_params
    params.require(:organisation).permit(:name, :address)
  end


end
