require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'sinatra/contrib/all'
require_relative './models/xml_parser'
require_relative './models/dates'
require_relative './models/currency'
require_relative './models/fx_calculation'

enable :sessions

get '/' do
  dates = Dates.new('data/rates.xml')
  @dates = dates.get_dates
  erb :index
end

post '/' do
  @@date = params[:date]
  redirect to '/currency'
end 

get '/currency' do
  currency = Currency.new('data/rates.xml')
  @currency = currency.get_currency_list_at(@@date)
  erb :currency
end

post '/currency' do
  @@amount = params[:amount]
  @@currency_from = params[:currency_from]
  @@currency_to = params[:currency_to]
  redirect to '/conversion'
end

get '/conversion' do
  conversion = FxCalculation.new
  @conversion = conversion.calculate_rate(@@amount.to_f, @@currency_from, @@currency_to)
  erb :conversion 
end