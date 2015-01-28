require 'rho/rhocontroller'
require 'helpers/browser_helper'

class GeneralHealthController < Rho::RhoController
  include BrowserHelper

  # GET /GeneralHealth
  def index
    @generalhealths = GeneralHealth.find(:all)
    render :back => '/app'
  end

  # GET /GeneralHealth/{1}
  def show
   # @generalhealth = GeneralHealth.find(@params['id'][1..-1].chop)
  @generalhealth = GeneralHealth.find(:first, :conditions => {'Id' => @params['id'][1..-1].chop})

      if @generalhealth
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /GeneralHealth/new
  def new
    @generalhealth = GeneralHealth.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /GeneralHealth/{1}/edit
  def edit
    @generalhealth = GeneralHealth.find(@params['id'])
    if @generalhealth
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /GeneralHealth/create
  def create
    @generalhealth = GeneralHealth.create(@params['generalhealth'])
    
    redirect :controller => :Narcotics, :action => :new
  end

  # POST /GeneralHealth/{1}/update
  def update
    @generalhealth = GeneralHealth.find(@params['id'])
    @generalhealth.update_attributes(@params['generalhealth']) if @generalhealth
    redirect :action => :index
  end

  # POST /GeneralHealth/{1}/delete
  def delete
    @generalhealth = GeneralHealth.find(@params['id'])
    @generalhealth.destroy if @generalhealth
    redirect :action => :index  
  end
end
