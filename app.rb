#!/usr/bin/env ruby

require "bundler/setup"
require "sinatra"
require "pg"

def connection
  PG.connect(ENV.fetch("DATABASE_URL"))
end

def get_users
  connection.exec( "SELECT * FROM users" )
end

def add_user(u)
  addsql = %[ INSERT INTO users (first_name, last_name, password, email) VALUES ($1, $2, $3, $4) ]
  connection.exec_params(addsql, [ u["first_name"], u["last_name"], u["password"], u["email"] ])
end

get "/users" do
  erb :users, locals: { users: get_users }
end

post "/users" do
  add_user(params)
  redirect "/users"
end
