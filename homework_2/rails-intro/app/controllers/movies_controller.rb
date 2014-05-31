class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @all_ratings = Movie.all_ratings

    if !params[:ratings] or !params[:sortBy]
      # missing parameters
      ratings = !!params[:ratings] ? params[:ratings] : session[:ratings]
      ratings = !!ratings ? ratings : @all_ratings

      sortBy = !!params[:sortBy] ? params[:sortBy] : session[:sortBy]
      sortBy = !!sortBy ? sortBy : ""

      session[:ratings] = ratings
      session[:sortBy] = sortBy

      redirect_to movies_path(:ratings => session[:ratings], :sortBy => session[:sortBy])
    end
    
    @sortBy = params[:sortBy]
    @checked = params[:ratings].is_a?(Hash) ? params[:ratings].keys : params[:ratings]

    if @sortBy != "" && !!@checked
      @movies = Movie.find(:all, :conditions => {rating: @checked}, :order => @sortBy)
    elsif !!@checked
      @movies = Movie.find(:all, :conditions => {rating: @checked})
    elsif @sortBy != ""
      @movies = Movie.find(:all, :order => @sortBy)
    else
      @movies = Movie.all
    end

    session[:ratings] = @checked
    session[:sortBy] = @sortBy
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end