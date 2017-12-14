class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :"figures/index"
  end

  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :"figures/new"
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])

    if params[:title][:name] != ""
      @title = Title.create(params[:title])
      @figure.titles << @title
    end

    if params[:landmark][:name] != ""
      @landmark = Landmark.create(params[:landmark])
      @figure.landmarks << @landmark
    end


    # if params[:figure][:titles]
    #   params[:figure][:titles].each do |title_id|
    #     @figure.titles << Title.find(title_id.to_i)
    #   end
    # end
    #
    # if params[:figure][:landmarks]
    #   params[:figure][:landmarks].each do |landmark_id|
    #     @figure.landmarks << Landmark.find(landmark_id.to_i)
    #   end
    # end
    #
    # if params[:figure][:landmark_new][:name] != ""
    #   @figure.landmarks << Landmark.create(params[:figure][:landmark_new])
    # end
    #
    # if params[:figure][:title_new] != ""
    #   @figure.titles << Title.create(name: params[:figure][:title_new])
    # end

    redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.all.find(params[:id])
    erb :"figures/show"
  end

  get '/figures/:id/edit' do
    @landmarks = Landmark.all
    @titles = Title.all
    @figure = Figure.find(params[:id])
    erb :"figures/edit"
  end

  patch '/figures/:id' do
    
    @figure = Figure.find(params[:id])

    @figure.update(params[:figure])

    if params[:title][:name] != ""
      @title = Title.create(params[:title])
      @figure.titles << @title
    end

    if params[:landmark][:name] != ""
      @landmark = Landmark.create(params[:landmark])
      @figure.landmarks << @landmark
    end

    # @figure.landmarks = []
    # @figure.titles = []
    # if params[:figure][:titles]
    #   params[:figure][:titles].each do |title_id|
    #     @figure.titles << Title.find(title_id.to_i)
    #   end
    # end
    #
    # if params[:figure][:landmarks]
    #   params[:figure][:landmarks].each do |landmark_id|
    #     @figure.landmarks << Landmark.find(landmark_id.to_i)
    #   end
    # end
    #
    # if params[:figure][:landmark_new][:name] != ""
    #   @figure.landmarks << Landmark.create(params[:figure][:landmark_new])
    # end
    #
    # if params[:figure][:title_new] != ""
    #   @figure.titles << Title.create(name: params[:figure][:title_new])
    # end
    #
    # @figure.save

    redirect to "/figures/#{@figure.id}"
  end

end # Class end
