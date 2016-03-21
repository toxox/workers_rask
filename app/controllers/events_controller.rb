class EventsController < ApplicationController
  def index
    @events = Event.all

    date_range = nil

    if params[:start_date] && params[:end_date]
      start_params = params[:start_date]
      end_params = params[:end_date]

      @start_date = Time.new(start_params[:year], start_params[:month],
                    start_params[:day], start_params[:hour], start_params[:minute])
      @end_date = Time.new(end_params[:year], end_params[:month],
                    end_params[:day], end_params[:hour], end_params[:minute])

      date_range = @start_date..@end_date
    end

    @visits = Event.where(event_type: "visit")
    @registrations = Event.where(event_type: "registration")
    @cashouts = Event.where(event_type: "cashout")
    @payments = Event.where(event_type: "payment")

    @lines = [
      {name: "visits", data: @visits.group_by_minute(:created_at, range: date_range).count},
      {name: "registrations", data: @registrations.group_by_minute(:created_at, range: date_range).count},
      {name: "cashouts", data: @cashouts.group_by_minute(:created_at, range: date_range).count},
      {name: "payments", data: @payments.group_by_minute(:created_at, range: date_range).count}
    ]
  end

  def create
    @event = Event.new(:event)
    @event.save
  end
end
