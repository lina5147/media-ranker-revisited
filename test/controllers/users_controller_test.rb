require "test_helper"

describe UsersController do
  describe "login" do

    it "logs in an existing user and redirects to the root route" do
      start_count = User.count
      user = users(:dan)

      perform_login(user)
      must_redirect_to root_path

      # Should *not* have created a new user
      expect(User.count).must_equal start_count
    end

    it "create an account for a new user and redirects to the root route" do

      user = User.new(provider: "github", uid: "483662642", name: "George Yu", username: "george123", email: "test@gmail.com")

      expect{
      perform_login(user)
      }.must_change "User.count", 1

      must_redirect_to root_path

    end



  end
end
