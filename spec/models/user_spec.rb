require 'rails_helper'

describe User do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        user = User.new(email: "r2d2@robot.com",
                           password: "robotworld")

        expect(user).to be_invalid
      end

      it "is invalid without an email" do
        user = User.new(name: "R2D2",
                           password: "robotworld")

        expect(user).to be_invalid
      end

      it "is invalid without a password" do
        user = User.new(name: "R2D2",
                           email: "r2d2@robot.com")

        expect(user).to be_invalid
      end

      it "is invalid if an email is not unique" do
        User.create(name: "R2D2",
                    email: "r2d2@robot.com",
                    password: "robotworld")
        user = User.new(name: "C-3PO",
                           email: "r2d2@robot.com",
                           password: "robotsrule")
        expect(user).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a name, email, and password" do
        user = User.new(name: "R2D2",
                           email: "email@robot.com",
                           password: "robotworld")

        expect(user).to be_valid
      end
    end
  end
end
