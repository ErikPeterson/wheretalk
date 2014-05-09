require 'spec_helper'

describe PagesController do
	describe "#index" do
		it "should render the root route" do
			get :index
			expect(response).to render_template("index")
		end
	end
end
