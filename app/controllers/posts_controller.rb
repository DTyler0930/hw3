class PostsController < ApplicationController
    def show
        @post = Post.find_by({ "id" => params["id"] })
        @place = Place.find_by({ "id" => @post["place_id"] })
      end
    
      def new
        @post = Post.new
        @place = Place.find_by({ "id" => params["place_id"] })
        @place["place_id"] = @place["id"]
      end
    
      def create
        @place = Place.new
        @place["title"] = params["post"]["title"]
        @place["description"] = params["post"]["description"]
        @place["posted_on"] = params["post"]["posted_on"]
        @place["place_id"] = params["contact"]["place_id"]
        @place.save
        redirect_to "/places/#{@place["place_id"]}"
      end
    
end
