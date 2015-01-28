require 'rho/rhocontroller'
require 'helpers/browser_helper'

class DiabetesController < Rho::RhoController
  include BrowserHelper

  # GET /Diabetes
  def index
    @diabeteses = Diabetes.find(:all)
    render :back => '/app'
  end

  # GET /Diabetes/{1}
  def show
    @diabetes = Diabetes.find(:first, :conditions => {'id' => @params['id'][1..-1].chop})

    #@diabetes = Diabetes.find(@params['id'])
    if @diabetes
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Diabetes/new
  def new
    @diabetes = Diabetes.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Diabetes/{1}/edit
  def edit
    @diabetes = Diabetes.find(@params['id'])
    if @diabetes
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Diabetes/create
  def create
    @diabetes = Diabetes.create(@params['diabetes'])
    fileNameW = File.join(Rho::RhoApplication::get_base_app_path(), 'diseasefile.txt')
                  afile=File.new(fileNameW,'a+')
            
                afile.write(@diabetes.type1+","+@diabetes.typ2+","+@diabetes.gestationaldiabetes+",")
    redirect :controller => OtherDiseases, :action => :new
  end

  # POST /Diabetes/{1}/update
  def update
    @diabetes = Diabetes.find(@params['id'])
    @diabetes.update_attributes(@params['diabetes']) if @diabetes
    redirect :action => :index
  end

  # POST /Diabetes/{1}/delete
  def delete
    @diabetes = Diabetes.find(@params['id'])
    @diabetes.destroy if @diabetes
    redirect :action => :index  
  end
end
