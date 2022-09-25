require "roda"

class App < Roda
  route do |r|
   "Hello World!"
  end
end

run App