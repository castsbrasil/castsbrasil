require 'rails_helper'

describe CategoriesController do
  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to be_success
    end

    it "assigns all categories" do
      create(:category)
      create(:category)

      get :index
      expect(assigns(:categories)).to eq(Category.all)
      expect(assigns(:categories).count).to eq(2)
    end
  end

  describe "GET show" do
    let(:category) { create(:category) }
    before(:each) do
      get :show, id: category
    end

    it "returns http success" do
      expect(response).to be_success
    end

    it "assigns category" do
      expect(assigns(:category)).to eq(category)
    end
  end

  describe "GET new" do
    context "unlogged user" do
      it "redirects to login page" do
        sign_in nil
        get :new
        expect(subject).to redirect_to(new_user_session_path)
      end
    end

    context "logged user" do
      before(:each) do
        sign_in
      end

      it "returns http success" do
        get :new
        expect(response).to be_success
      end

      it "assigns new category" do
        get :new
        expect(assigns(:category)).to be_a_new(Category)
      end
    end
  end

  describe "POST create" do
    context "unlogged user" do
      it "redirects to login page" do
        sign_in nil
        post :create, category: attributes_for(:category)
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context "logged user" do
      before(:each) do
        sign_in
      end

      context "valid category" do
        it "returns http success" do
          post :create, category: attributes_for(:category)
          expect(response).to redirect_to(categories_path)
        end

        it "saves the category" do
          expect { post :create, category: attributes_for(:category) }.to change(Category, :count).by(1)
        end

        it "verifies category has same name" do
          category_attributes = attributes_for(:category)
          post :create, category: category_attributes
          expect(assigns(:category).name).to eq(category_attributes[:name])
        end
      end

      context "invalid category" do
        let(:category_attributes) { attributes_for(:category, name: "") }

        it "does not save category" do
          expect { post :create, category: category_attributes }.to_not change(Category, :count)
        end
      end
    end
  end

  describe "GET edit" do
    context "unlogged user" do
      let(:category) { create(:category) }

      it "redirects to login page" do
        sign_in nil
        get :edit, id: category
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context "logged user" do
      let(:category) { create(:category) }

      before(:each) do
        sign_in create(:user)
      end

      it "returns http success" do
        get :edit, id: category
        expect(response).to be_success
      end

      it "assigns existing category" do
        get :edit, id: category
        expect(assigns(:category)).to eq(category)
      end
    end
  end

  describe "PUT update" do
    context "unlogged user" do
      it "redirects to login page" do
        category = create(:category)
        sign_in nil
        put :update, id: category, category: attributes_for(:category)
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context "logged user" do
      let(:category) { build(:category) }

      before(:each) do
        sign_in create(:user)
        category.save!
      end

      context "category with right params" do
        it "returns http success" do
          put_update_category_with_name_easy
          expect(response).to redirect_to(categories_path)
        end

        it "updates the category" do
          expect{ put_update_category_with_name_easy }.to change(Category, :count).by(0)
        end

        it "changes attribute name" do
          put_update_category_with_name_easy
          expect(assigns(:category).name).to eq('Easy')
        end
      end
    end

    def put_update_category_with_name_easy
      put :update, id: category, category: attributes_for(:category, name: 'Easy')
    end

  end

  describe "DELETE destroy" do
    context "unlogged user" do
      let(:category) { create(:category) }

      it "redirects to login page" do
        sign_in nil
        delete :destroy, id: category
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context "logged user" do
      let(:category) { build(:category) }

      before(:each) do
        sign_in create(:user)
        category.save!
      end

      it "deletes the category" do
        expect { delete :destroy, id: category }.to change(Category, :count).by(-1)
      end

      it "redirects to index" do
        delete :destroy, id: category
        expect(response).to redirect_to(categories_path)
      end

    end
  end

end
