class SchoolClassesController < ApplicationController
  def index
    @schoolClasses = SchoolClass.all
  end

  def new
    @schoolClass = SchoolClass.new
  end

  def create
    #binding.pry
    @schoolClass = SchoolClass.new(sc_params(:title, :room_number))
    @schoolClass.save
    redirect_to school_class_path(@schoolClass)
  end

  def show
    @schoolClass = SchoolClass.find(params[:id])
  end

  def edit
    @schoolClass = SchoolClass.find(params[:id])
  end

  def update
    @schoolClass = SchoolClass.find(params[:id])
    @schoolClass.update(sc_params(:title, :room_number))
    redirect_to school_class_path(@schoolClass)
  end

  def destroy
  end


  private

  def sc_params(*args)
    params.require(:school_class).permit(*args)
  end
end
