require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe 'ユーザー新規登録 _ウィザード１' do
    it '全ての値を正しく入力すれば新規登録できる' do
      expect(@user).to be_valid
    end

    it 'nicknameがないと新規登録できない' do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("ニックネームを入力してください")
    end

    it '同じnicknameが登録済みだと新規登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.nickname = @user.nickname
      another_user.valid?
      expect(another_user.errors.full_messages).to include("ニックネームはすでに存在します")
    end

    it 'emailがないと新規登録できない' do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end

    it 'emailは@マークがないと新規登録できない' do
      @user.email = "email"
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールは不正な値です")
    end

    it '同じemailが登録済みだと新規登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
    end


    it 'passwordがないと新規登録できない' do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end

    it 'passwordは全角だと新規登録できない' do
      @user.password = "パスワード"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは英字か数字のみ使用できます")
    end

    it 'passwordは6文字以上でないと新規登録できない' do
      @user.password = "pass"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
    end
    
    it '確認用passwordがないと新規登録できない' do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end

    it 'passwordと確認用passwordが違う値だと新規登録できない' do
      @user.password = "123456"
      @user.password_confirmation = "123457"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end
  end
end
