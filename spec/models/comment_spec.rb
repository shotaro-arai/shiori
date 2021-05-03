require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント投稿機能' do
    it '1文字以上、140文字以内なら投稿できる' do
      expect(@comment).to be_valid
    end

    it '140文字以上だと投稿できない' do
      @comment.text = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' # 141文字
      @comment.valid?
      expect(@comment.errors.full_messages).to include('コメントは140文字以内で入力してください')
    end

    it 'textの値が空だと投稿できない' do
      @comment.text = ''
      @comment.valid?
      expect(@comment.errors.full_messages).to include('コメントを入力してください')
    end

    it 'userが紐付いていないと投稿できない' do
      @comment.user = nil
      @comment.valid?
      expect(@comment.errors.full_messages).to include('Userを入力してください')
    end

    it 'bookが紐付いていないと投稿できない' do
      @comment.book = nil
      @comment.valid?
      expect(@comment.errors.full_messages).to include('Bookを入力してください')
    end
  end
end
