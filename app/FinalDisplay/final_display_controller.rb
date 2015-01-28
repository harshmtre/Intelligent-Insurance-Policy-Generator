require 'rho/rhocontroller'
require 'helpers/browser_helper'

class FinalDisplayController < Rho::RhoController
  include BrowserHelper

  # GET /FinalDisplay
  def index
    @finaldisplays = FinalDisplay.find(:all)
    render :back => '/app'
  end

  # GET /FinalDisplay/{1}
  def show
    @finaldisplay = FinalDisplay.find(@params['id'])
    if @finaldisplay
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /FinalDisplay/new
  def new
    @finaldisplay = FinalDisplay.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /FinalDisplay/{1}/edit
  def edit
    @finaldisplay = FinalDisplay.find(@params['id'])
    if @finaldisplay
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /FinalDisplay/create
  def create
    @finaldisplay = FinalDisplay.create(@params['finaldisplay'])
    redirect :controller => :Login, :action => :MainPage
  end

  # POST /FinalDisplay/{1}/update
  def update
    @finaldisplay = FinalDisplay.find(@params['id'])
    @finaldisplay.update_attributes(@params['finaldisplay']) if @finaldisplay
    redirect :action => :index
  end

  # POST /FinalDisplay/{1}/delete
  def delete
    @finaldisplay = FinalDisplay.find(@params['id'])
    @finaldisplay.destroy if @finaldisplay
    redirect :action => :index  
  end
end
