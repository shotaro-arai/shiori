require 'rails_helper'

RSpec.describe Profile, type: :model do
  before do
    @profile = FactoryBot.build(:profile)
  end

  describe 'ユーザー新規登録 _ウィザード２' do
    context "登録できる" do
      it 'jobはなくても新規登録できる' do
        @profile.job = ""
        expect(@profile).to be_valid
      end

      it 'imageはなくても登録できる' do
        @profile.image = nil
        expect(@profile).to be_valid
      end
    end

    context "登録できない" do
      it 'text(自己紹介文)がないと新規登録できない' do
        @profile.text = ""
        @profile.valid?
        expect(@profile.errors.full_messages).to include("自己紹介を入力してください")
      end

      it '年齢を選択しないと新規登録できない' do
        @profile.age = ""
        @profile.valid?
        expect(@profile.errors.full_messages).to include("年齢を入力してください")
      end

      it '性別を選択しないと新規登録できない' do
        @profile.sex = ""
        @profile.valid?
        expect(@profile.errors.full_messages).to include("性別を入力してください")
      end
    end
  end
end
