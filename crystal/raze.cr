require "raze"

# Define middlewares
class Authenticator < Raze::Handler
  def call(ctx, done)
    puts "Authenticate here..."
    done.call
  end
end

class DDoSBlocker < Raze::Handler
  def call(ctx, done)
    puts "Prevent DDoS attack here..."
    done.call
  end
end

class UserFetcher < Raze::Handler
  def call(ctx, done)
    # Fetch user record from DB here...
    ctx.state["user_name"] = "Sam"
    done.call
  end
end

# Define routes, attach middlewares
get "/api/**", [Authenticator.new, DDoSBlocker.new]

get "/api/user/:user_id", UserFetcher.new do |ctx|
  "hello, #{ctx.state["user_name"]}!"
end

Raze.run
