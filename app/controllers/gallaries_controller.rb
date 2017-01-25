class GallariesController < ApplicationController
  def index
    @gallaries = Gallary.order(priority: 'asc')
  end

  def new
    @gallary = Gallary.new
  end

  def create
    @gallary = Gallary.create(task_params)
    if @gallary.save
      redirect_to root_path, notice: 'Gallary saved successfully'
    else
      render 'new'
    end
  end

  def show

  end

  def sort
    params[:order].each do |key,value|
      Gallary.find(value[:id]).update_attribute(:priority, value[:position])
    end
    render :nothing => true
  end

  private

  def task_params
    params.require(:gallary).permit(:image, :alt, :priority)
  end
end
