defmodule Router do
  use Placid.Router

  # Define one of the versions of the API
  # with a simple version number "1"
  # or following semver "1.0.0"
  # or date of release "2014-09-06"
  version "1" do
    # Define your routes here
    get  "/",               Handlers.V1.Pages, :index
    get  "/pages",          Handlers.V1.Pages, :create
    post "/pages",          Handlers.V1.Pages, :create
    put  "/pages/:page_id" when id == 1,
                            Handlers.V1.Pages, :update_only_one
    get  "/pages/:page_id", Handlers.V1.Pages, :show

    # Auto-create a full set of routes for resources
    #
    resource :users,        Handlers.V1.User, arg: :user_id
    #
    # Generates:
    #
    # get     "/users",           Handlers.V1.User, :index
    # post    "/users",           Handlers.V1.User, :create
    # get     "/users/:user_id",  Handlers.V1.User, :show
    # put     "/users/:user_id",  Handlers.V1.User, :update
    # patch   "/users/:user_id",  Handlers.V1.User, :patch
    # delete  "/users/:user_id",  Handlers.V1.User, :delete
    #
    # options "/users",           "HEAD,GET,POST"
    # options "/users/:_user_id", "HEAD,GET,PUT,PATCH,DELETE"
  end

  # An updated version of the AP
  version "2" do
    get  "/",               Handlers.V2.Pages,  :index
    post "/pages",          Handlers.V2.Pages,  :create
    get  "/pages/:page_id", Handlers.V2.Pages,  :show
    put  "/pages/:page_id", Handlers.V2.Pages,  :update

    raw :trace, "/trace",   Handlers.V2.Tracer, :trace

    resource :users,        Handlers.V2.User
    resource :groups,       Handlers.V2.Group
  end
end