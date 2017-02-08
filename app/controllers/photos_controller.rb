
class PhotosController < ApplicationController
  def index

    @list_of_photos = Photo.all
  end
  def new_form
    render("photos/new_form.html.erb")
  end
  def create_row
    p = Photo.new
    p.source = params[:the_source]
    p.caption = params[:the_caption]
    p.save
redirect_to("http://localhost:3000/photos")
  end
  def show
    p = Photo.find(params[:id])
    @source = p.source
    @caption = p.caption
    @id = params[:id]
    render("photos/show.html.erb")
  end

  def edit_form
    p = Photo.find(params[:id])
    @source = p.source
    @caption = p.caption
    @id=params[:id]
    render("photos/edit_form.html.erb")
  end
  def update_row
    p = Photo.find(params[:id])
    p.source = params[:source]
    p.caption = params[:caption]
    p.save
    redirect_to("http://localhost:3000/photos/" + params[:id])
  end
  def delete_photo
    Photo.find(params[:id]).destroy

    redirect_to("http://localhost:3000/photos")
  end
end
