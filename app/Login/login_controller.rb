require 'rho/rhocontroller'
require 'helpers/browser_helper'

class LoginController < Rho::RhoController
  include BrowserHelper

  # GET /Login
  def index
    @logins = Login.find(:all)
    render :back => '/app'
  end
  def syncit
      file_name = File.join(Rho::RhoApplication::get_base_app_path, '/public/network/testsync.txt')
        
          # :filename     Full path to download file target.
          Rho::AsyncHttp.download_file( 
            :url => "http://192.168.1.122/buzz.txt",
            :filename => file_name,
            :headers => {},
            :callback => url_for(:action => :httpdownload_callback)
              )
              
      file_name = File.join(Rho::RhoApplication::get_base_app_path, '/public/network/testsync1.txt')
            
              # :filename     Full path to download file target.
              Rho::AsyncHttp.download_file( 
                :url => "http://192.168.1.122/buzz1.txt",
                :filename => file_name,
                :headers => {},
                :callback => url_for(:action => :httpdownload_callback)
                  )
              
      redirect :action => :MainPage
    end

  # GET /Login/{1}
  def show
    @login = Login.find(@params['id'])
    if @login
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Login/new
  def new
    @login = Login.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Login/{1}/edit
  def edit
    @login = Login.find(@params['id'])
    if @login
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Login/create
  def create
    @login = Login.create(@params['login'])
      if @login.user == 'Agent007' && @login.pass == '007'
        redirect :action => :MainPage
      else
        redirect :action => :new
      end
    
  end

  # POST /Login/{1}/update
  def update
    @login = Login.find(@params['id'])
    @login.update_attributes(@params['login']) if @login
    redirect :action => :index
  end

  # POST /Login/{1}/delete
  def delete
    @login = Login.find(@params['id'])
    @login.destroy if @login
    redirect :action => :index  
  end
end
