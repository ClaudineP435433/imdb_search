class MoviesController < ApplicationController
  def index
    if params[:query].present?
      PgSearch::Multisearch.rebuild(Movie)
      PgSearch::Multisearch.rebuild(Serie)
      @movies = PgSearch.multisearch(params[:query])
     else
      @movies = Movie.all
    end
  end
end
