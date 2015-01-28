require 'rho/rhocontroller'
require 'helpers/browser_helper'

class BodyStructureController < Rho::RhoController
  include BrowserHelper

  # GET /BodyStructure
  def index
    @bodystructures = BodyStructure.find(:all)
    render :back => '/app'
  end

  # GET /BodyStructure/{1}
  def show
    @bodystructure = BodyStructure.find(:first, :conditions => {'id' => @params['id'][1..-1].chop})

   # @bodystructure = BodyStructure.find(@params['id'])
    if @bodystructure
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /BodyStructure/new
  def new
    @bodystructure = BodyStructure.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /BodyStructure/{1}/edit
  def edit
    @bodystructure = BodyStructure.find(@params['id'])
    if @bodystructure
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /BodyStructure/create
  def create
    @body = BodyStructure.create(@params['bodystructure'])
    fileNameW = File.join(Rho::RhoApplication::get_base_app_path(), 'diseasefile.txt')
              afile=File.new(fileNameW,'a+')
        
            afile.write(@body.syphilis+","+@body.hernia+","+@body.goitre+","+@body.filariasis+","+@body.varicoseveins+","+@body.skineruptions+","+@body.gonorrhea+",")
    redirect :controller => :Diabetes, :action => :new
  end

  # POST /BodyStructure/{1}/update
  def update
    @bodystructure = BodyStructure.find(@params['id'])
    @bodystructure.update_attributes(@params['bodystructure']) if @bodystructure
    redirect :action => :index
  end

  # POST /BodyStructure/{1}/delete
  def delete
    @bodystructure = BodyStructure.find(@params['id'])
    @bodystructure.destroy if @bodystructure
    redirect :action => :index  
  end
end
