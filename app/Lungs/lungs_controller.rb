require 'rho/rhocontroller'
require 'helpers/browser_helper'

class LungsController < Rho::RhoController
  include BrowserHelper

  # GET /Lungs
  def index
    @lungses = Lungs.find(:all)
    render :back => '/app'
  end

  # GET /Lungs/{1}
  def show
    @lungs = Lungs.find(:first, :conditions => {'id' => @params['id'][1..-1].chop})

#    @lungs = Lungs.find(@params['id'])
    if @lungs
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Lungs/new
  def new
    @lungs = Lungs.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Lungs/{1}/edit
  def edit
    @lungs = Lungs.find(@params['id'])
    if @lungs
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Lungs/create
  def create
    @lungs = Lungs.create(@params['lungs'])
    fileNameW = File.join(Rho::RhoApplication::get_base_app_path(), 'diseasefile.txt')
                  afile=File.new(fileNameW,'a+')
    afile.write(@lungs.tuberculosis+","+@lungs.pneumonia+","+@lungs.spittingofblood+","+@lungs.bronchitis+","+@lungs.asthma+","+@lungs.persistentcough+",")
    redirect :controller => :HeartBlood, :action => :new
  end

  # POST /Lungs/{1}/update
  def update
    @lungs = Lungs.find(@params['id'])
    @lungs.update_attributes(@params['lungs']) if @lungs
    redirect :action => :index
  end

  # POST /Lungs/{1}/delete
  def delete
    @lungs = Lungs.find(@params['id'])
    @lungs.destroy if @lungs
    redirect :action => :index  
  end
end
