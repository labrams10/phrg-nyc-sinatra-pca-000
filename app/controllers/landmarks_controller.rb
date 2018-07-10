# frozen_string_literal: true

class LandmarksController < ApplicationController
  get "/" do
    redirect "/landmarks"
  end

  get "/landmarks" do
    @landmarks = Landmark.all
    @figures = Figure.all

    erb :'landmarks/index'
  end

  get "/landmarks/new" do
    erb :'/landmarks/new'
  end

  get "/landmarks/:id" do
    @landmark = Landmark.find_by(id: params[:id])

    erb :'/landmarks/show'
  end

  get "/landmarks/:id/edit" do
    @landmark = Landmark.find_by(id: params[:id])
    erb :'/landmarks/edit'
  end

  post "/landmarks" do
    @l = Landmark.new(name: params["landmark"]["name"])
    @l.year_completed = params["landmark"]["year_completed"]
    @l.save
    redirect "/landmarks"
  end

  post "/landmarks/:id" do
    @landmark = Landmark.find_by(id: params[:id])
    @landmark.name = params["landmark"]["name"]
    @landmark.year_completed = params["landmark"]["year_completed"]
    @landmark.save
    redirect to "/landmarks/#{@landmark.id}"
  end
end
