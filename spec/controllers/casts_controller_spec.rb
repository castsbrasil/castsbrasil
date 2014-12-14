require 'rails_helper'

describe CastsController do
  describe "POST create" do
    context "unlogged user" do
      it "redirects to login page" do
        sign_in nil
        post :create, cast: attributes_for(:cast)
        expect(subject).to redirect_to(new_user_session_path)
      end
    end

    context "logged user" do
      before(:each) do
        sign_in create(:user)
      end

      context "cast with right params" do
        it "returns http success" do
          post :create, cast: attributes_for(:cast)
          expect(response).to redirect_to(casts_path)
        end

        it "saves the cast" do
          expect { post :create, cast: attributes_for(:cast) }.to change(Cast, :count).by(1)
        end

        it "associates cast with current user" do
          post :create, cast: attributes_for(:cast)
          expect(assigns(:cast).user).to eq(subject.current_user)
        end
      end
    end
  end

  describe "GET edit" do
    context "unlogged user" do
      it "redirects to login page" do
        cast = create(:cast)
        sign_in nil
        get :edit, id: cast
        expect(subject).to redirect_to(new_user_session_path)
      end
    end

    context "logged user" do
      let(:user) { create(:user) }
      let(:cast) { build(:cast) }

      before(:each) do
        sign_in user
        cast.user = user
        cast.save!
      end

      it "returns http success" do
        get :edit, id: cast
        expect(response).to be_success
      end

      it "assigns new cast" do
        get :edit, id: cast
        expect(assigns(:cast)).to eq(cast)
      end
    end
  end

  describe "PUT update" do
    context "unlogged user" do
      it "redirects to login page" do
        cast = create(:cast)
        sign_in nil
        put :update, id: cast, cast: attributes_for(:cast)
        expect(subject).to redirect_to(new_user_session_path)
      end
    end

    context "logged user" do
      let(:user) { create(:user) }
      let(:cast) { build(:cast) }

      before(:each) do
        cast.user = user
        cast.save!
        sign_in user
      end

      context "cast with right params" do
        it "returns http success" do
          put :update, id: cast, cast: attributes_for(:cast, name: 'new name')
          expect(response).to redirect_to(casts_path)
        end

        it "updates the cast" do
          expect{put :update, id: cast, cast: attributes_for(:cast, name: 'new name')}.to change(Cast, :count).by(0)
          expect(assigns(:cast).name).to eq('new name')
        end
      end
    end
  end
end
