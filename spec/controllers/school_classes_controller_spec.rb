require 'rails_helper'

RSpec.describe SchoolClassesController, type: :controller do

  describe 'GET #index' do
    it 'populates an array of school classes' do
      school_class = FactoryGirl.create(:school_class)

      get :index

      expect(assigns(:school_classes)).to eq([school_class])
    end

    it 'renders the :index view' do
      get :index

      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    it 'assigns the requested school class to @school_class' do
      school_class = FactoryGirl.create(:school_class)

      get :show, id: school_class

      expect(assigns(:school_class)).to eq(school_class)
    end

    it 'renders the :show view' do
      get :show, id: FactoryGirl.create(:school_class)

      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    it 'renders the :new view' do
      get :new

      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new school class' do
        expect {
          post :create, school_class: FactoryGirl.attributes_for(:school_class)
        }.to change(SchoolClass, :count).by(1)
      end

      it 'redirects to the new school class' do
        post :create, school_class: FactoryGirl.attributes_for(:school_class)

        expect(response).to redirect_to SchoolClass.last
      end
    end

    context 'with invalid attributes' do
      it 'does not save a new school class' do
        expect {
          post :create, school_class: FactoryGirl.attributes_for(:invalid_school_class)
        }.to_not change(SchoolClass, :count)
      end

      it 're-renders the :new view' do
        post :create, school_class: FactoryGirl.attributes_for(:invalid_school_class)

        expect(response).to render_template :new
      end
    end
  end

  describe 'GET #edit' do
    it 'renders the :edit view' do
      school_class = FactoryGirl.create(:school_class)

      get :edit, id: school_class

      expect(response).to render_template :edit
    end
  end

  describe 'PUT #update' do
    before :each do
      @school_class = FactoryGirl.create(:school_class, grade: 1, letter: 'A')
    end

    context 'with valid attributes' do
      it 'changes the @school_class\'s attributes' do
        put :update, id: @school_class,
          school_class: FactoryGirl.attributes_for(:school_class,
            grade: 2, letter: 'B')

        @school_class.reload

        expect(@school_class.grade).to eq(2)
        expect(@school_class.letter).to eq('B')
      end

      it 'redirects to the updated school class' do
        put :update, id: @school_class,
          school_class: FactoryGirl.attributes_for(:school_class)

          expect(response).to redirect_to @school_class
      end
    end

    context 'with invalid attributes' do
      it 'does not change the @school_class\'s attributes' do
        put :update, id: @school_class,
          school_class: FactoryGirl.attributes_for(:school_class,
            grade: 2, letter: nil)

        @school_class.reload

        expect(@school_class.grade).to_not eq(2)
        expect(@school_class.letter).to eq('A')
      end

      it 're-renders the :edit view' do
        put :update, id: @school_class,
          school_class: FactoryGirl.attributes_for(:invalid_school_class)

        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      @school_class = FactoryGirl.create(:school_class)
    end

    it 'deletes school class' do
      expect {
        delete :destroy, id: @school_class
      }.to change(SchoolClass, :count).by(-1)
    end

    it 'redirects to :index view' do
      delete :destroy, id: @school_class

      expect(response).to redirect_to(school_classes_url)
    end
  end
end
