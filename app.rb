require 'sinatra'
require 'sinatra/contrib/all'
require_relative './models/xml_parser'
require_relative './models/dates'
require_relative './models/currency'
require_relative './models/fx_calculation'

get '/' do
  dates = Dates.new('data/rates.xml')
  currency = Currency.new('data/rates.xml')
  @dates = dates.get_dates
  @currency = currency.get_currency_list_at("2017-01-27")
  erb :index
end

post '/' do
  @date = params[:date]
  @amount = params[:amount]
  @currency_from = params[:currency_from]
  @currency_to = params[:currency_to]
  @conversion = Fx_calculation.calculate_rate(@amount.to_f, @currency_from.to_f, @currency_to.to_f)
  redirect to '/conversion'
end 

get '/conversion' do
  erb :conversion 
end