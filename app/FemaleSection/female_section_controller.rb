require 'rho/rhocontroller'
require 'helpers/browser_helper'

class FemaleSectionController < Rho::RhoController
  include BrowserHelper

  # GET /FemaleSection
  def index
    @femalesections = FemaleSection.find(:all)
    render :back => '/app'
  end

  # GET /FemaleSection/{1}
  def show
#    @femalesection = FemaleSection.find(@params['id'])
    @femalesection = FemaleSection.find(:first, :conditions => {'Id' => @params['id'][1..-1].chop})

    if @femalesection
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /FemaleSection/new
  def new
    @femalesection = FemaleSection.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /FemaleSection/{1}/edit
  def edit
    @femalesection = FemaleSection.find(@params['id'])
    if @femalesection
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /FemaleSection/create
  def create
    @femalesection = FemaleSection.create(@params['femalesection'])
           
      redirect :controller => :DentalIssues, :action => :new
  end

  # POST /FemaleSection/{1}/update
  def update
    @femalesection = FemaleSection.find(@params['id'])
    @femalesection.update_attributes(@params['femalesection']) if @femalesection
    redirect :action => :index
  end

  # POST /FemaleSection/{1}/delete
  def delete
    @femalesection = FemaleSection.find(@params['id'])
    @femalesection.destroy if @femalesection
    redirect :action => :index  
  end
end
