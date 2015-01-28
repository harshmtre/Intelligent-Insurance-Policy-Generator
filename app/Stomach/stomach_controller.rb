require 'rho/rhocontroller'
require 'helpers/browser_helper'

class StomachController < Rho::RhoController
  include BrowserHelper

  # GET /Stomach
  def index
    @stomaches = Stomach.find(:all)
    render :back => '/app'
  end

  # GET /Stomach/{1}
  def show
    @stomach = Stomach.find(:first, :conditions => {'id' => @params['id'][1..-1].chop})

    #@stomach = Stomach.find(@params['id'])
    if @stomach
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Stomach/new
  def new
    @stomach = Stomach.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Stomach/{1}/edit
  def edit
    @stomach = Stomach.find(@params['id'])
    if @stomach
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Stomach/create
  def create
    @stomach = Stomach.create(@params['stomach'])
    fileNameW = File.join(Rho::RhoApplication::get_base_app_path(), 'diseasefile.txt')
              afile=File.new(fileNameW,'a+')
        
  afile.write(@stomach.hepatitis+","+@stomach.ulcer+","+@stomach.colitis+","+@stomach.piles+","+@stomach.anaemia+","+@stomach.jaundice+","+@stomach.dysentery+","+@stomach.gallstone+",")
      
      redirect :controller => :ExcretarySystem, :action => :new
  end

  # POST /Stomach/{1}/update
  def update
    @stomach = Stomach.find(@params['id'])
    @stomach.update_attributes(@params['stomach']) if @stomach
    redirect :action => :index
  end

  # POST /Stomach/{1}/delete
  def delete
    @stomach = Stomach.find(@params['id'])
    @stomach.destroy if @stomach
    redirect :action => :index  
  end
end
