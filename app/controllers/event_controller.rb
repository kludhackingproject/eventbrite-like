class EventController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
    @end_date = self.end_date
  end

  def create
    my_date = Time.now + 6.days
    @event = Event.new(
      start_date: my_date,
      duration: params[:duration],
      title: params[:title],
      description: params[:description],
      price: params[:price],
      location: params[:location],
      user_id: current_user.id
    )

    if @event.save # essaie de sauvegarder en base @event
      # si ça marche, il redirige vers la page d'index du site
      puts "Tu as réussi"
      render :show
    else
      # sinon, il render la view new (qui est celle sur laquelle on est déjà)
      puts "ca ne fontionne pas"
      render new_event_path
    end
  end

  def end_date
    event_start = Event.find(params[:id]).start_date
    event_duration = Event.find(params[:id]).duration

    return event_start + (event_duration*60*60)
  end
end
