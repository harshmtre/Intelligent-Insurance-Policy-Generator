require 'rho/rhocontroller'
require 'helpers/browser_helper'

class OtherDiseasesController < Rho::RhoController
  include BrowserHelper

  # GET /OtherDiseases
  def index
    @otherdiseaseses = OtherDiseases.find(:all)
    render :back => '/app'
  end

  # GET /OtherDiseases/{1}
  def show
    @otherdiseases = OtherDiseases.find(:first, :conditions => {'id' => @params['id'][1..-1].chop})

    @otherdiseases = OtherDiseases.find(@params['id'])
    if @otherdiseases
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /OtherDiseases/new
  def new
    @otherdiseases = OtherDiseases.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /OtherDiseases/{1}/edit
  def edit
    @otherdiseases = OtherDiseases.find(@params['id'])
    if @otherdiseases
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /OtherDiseases/create
  def create
    @other = OtherDiseases.create(@params['otherdiseases'])
    fileNameW = File.join(Rho::RhoApplication::get_base_app_path(), 'diseasefile.txt')
              afile=File.new(fileNameW,'a+')
        
            afile.write(@other.cancer+","+@other.hiv+","+@other.leprosy+","+@other.rheumatism+","+@other.tumor+","+@other.gout+",")
    redirect :controller => :BodilyDefects, :action => :new
  end

  # POST /OtherDiseases/{1}/update
  def update
    @otherdiseases = OtherDiseases.find(@params['id'])
    @otherdiseases.update_attributes(@params['otherdiseases']) if @otherdiseases
    redirect :action => :index
  end

  # POST /OtherDiseases/{1}/delete
  def delete
    @otherdiseases = OtherDiseases.find(@params['id'])
    @otherdiseases.destroy if @otherdiseases
    redirect :action => :index  
  end
end
